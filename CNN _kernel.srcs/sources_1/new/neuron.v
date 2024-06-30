`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/30 18:23:58
// Design Name: 
// Module Name: neuron
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module neuron #(
    parameter   LAYER_NO = 0,
    parameter   NEURON_NO = 0,
    parameter   NUM_WEIGHT = 784,
    parameter   DATA_WIDTH = 16,
    parameter   WEIGHT_INT_WIDTH = 1,
    parameter   ACT_TYPE = "Relu",
    parameter   BIAS_FILE = "",
    parameter   WEIGHT_FILE = ""
    )(

        input                       clk,
        input                       rst_n,
        input [DATA_WIDTH-1:0]      input_data,
        input                       input_valid,
        input                       weight_valid,
        input                       bias_valid,
        input [31:0]                weight_value,
        input [31:0]                bias_value,
        input [31:0]                config_layer_num,
        input [31:0]                config_neuron_num,
        output [DATA_WIDTH-1:0]     output_data,
        output reg                  output_valid
    );

    parameter ADDRESS_WIDTH = $clog2(NUM_WEIGHT);
    
    reg                                 w_en;
    wire                                r_en;
    reg         [ADDRESS_WIDTH-1:0]     w_address;
    reg         [ADDRESS_WIDTH:0]       r_address;//read address has to reach until NUM_WEIGHT hence width is 1 bit more
    reg         [DATA_WIDTH-1:0]        w_input;
    wire        [DATA_WIDTH-1:0]        w_output;
    reg         [2*DATA_WIDTH-1:0]      mul; 
    reg         [2*DATA_WIDTH-1:0]      sum;
    reg         [2*DATA_WIDTH-1:0]      bias;
    reg         [2*DATA_WIDTH-1:0]      biasReg[0:0];
    reg                                 weight_valid_reg;
    reg                                 mult_valid;
    wire                                mux_valid;
    reg                                 sigValid; 
    wire        [2*DATA_WIDTH:0]        comboAdd;
    wire        [2*DATA_WIDTH:0]        BiasAdd;
    reg         [DATA_WIDTH-1:0]        input_data_reg;
    reg                                 muxValid_d;
    reg                                 muxValid_f;
    reg                                 addr=0;
   //Loading weight values into the memory
    always @(posedge clk or negedge rst_n)
    begin
        if(!rst_n)
        begin
            w_address <= {ADDRESS_WIDTH{1'b1}};
            w_en <=0;
        end
        else if(weight_valid & (config_layer_num==LAYER_NO) & (config_neuron_num==NEURON_NO))
        begin
            w_input <= weight_value;
            w_address <= w_address + 1;
            w_en <= 1;
        end
        else
            w_en <= 0;
    end

    assign mux_valid = mult_valid;
    assign comboAdd = mul + sum;
    assign BiasAdd = bias + sum;
    assign r_en = input_valid;
    
    `ifdef pretrained
        initial
        begin
            $readmemb(biasFile,biasReg);
        end
        always @(posedge clk)
        begin
            bias <= {biasReg[addr][DATA_WIDTH-1:0],{DATA_WIDTH{1'b0}}};
        end
    `else
        always @(posedge clk)
        begin
            if(bias_valid & (config_layer_num==LAYER_NO) & (config_neuron_num==NEURON_NO))
            begin
                bias <= {bias_value[DATA_WIDTH-1:0],{DATA_WIDTH{1'b0}}};
            end
        end
    `endif
    
    
    always @(posedge clk or negedge rst_n)
    begin
        if(!rst_n|output_valid)
            r_address <= 0;
        else if(input_valid)
            r_address <= r_address + 1'b1;
    end
    
    always @(posedge clk)
    begin
        mul  <= $signed(input_data_reg) * $signed(w_output);
    end
    
    
    always @(posedge clk or negedge rst_n)
    begin
        if(!rst_n|output_valid)
            sum <= 0;
        else if((r_address == NUM_WEIGHT) & muxValid_f)
        begin
            if(!bias[2*DATA_WIDTH-1] &!sum[2*DATA_WIDTH-1] & BiasAdd[2*DATA_WIDTH-1]) //If bias and sum are positive and after adding bias to sum, if sign bit becomes 1, saturate
            begin
                sum[2*DATA_WIDTH-1] <= 1'b0;
                sum[2*DATA_WIDTH-2:0] <= {2*DATA_WIDTH-1{1'b1}};
            end
            else if(bias[2*DATA_WIDTH-1] & sum[2*DATA_WIDTH-1] &  !BiasAdd[2*DATA_WIDTH-1]) //If bias and sum are negative and after addition if sign bit is 0, saturate
            begin
                sum[2*DATA_WIDTH-1] <= 1'b1;
                sum[2*DATA_WIDTH-2:0] <= {2*DATA_WIDTH-1{1'b0}};
            end
            else
                sum <= BiasAdd; 
        end
        else if(mux_valid)
        begin
            if(!mul[2*DATA_WIDTH-1] & !sum[2*DATA_WIDTH-1] & comboAdd[2*DATA_WIDTH-1])
            begin
                sum[2*DATA_WIDTH-1] <= 1'b0;
                sum[2*DATA_WIDTH-2:0] <= {2*DATA_WIDTH-1{1'b1}};
            end
            else if(mul[2*DATA_WIDTH-1] & sum[2*DATA_WIDTH-1] & !comboAdd[2*DATA_WIDTH-1])
            begin
                sum[2*DATA_WIDTH-1] <= 1'b1;
                sum[2*DATA_WIDTH-2:0] <= {2*DATA_WIDTH-1{1'b0}};
            end
            else
                sum <= comboAdd; 
        end
    end
    
    always @(posedge clk)
    begin
        input_data_reg <= input_data;
        weight_valid_reg <= input_valid;
        mult_valid <= weight_valid_reg;
        sigValid <= ((r_address == NUM_WEIGHT) & muxValid_f) ? 1'b1 : 1'b0;
        output_valid <= sigValid;
        muxValid_d <= mux_valid;
        muxValid_f <= !mux_valid & muxValid_d;
    end

    Relu#(.DATA_WIDTH(DATA_WIDTH),.WEIGHT_INT_WIDTH(WEIGHT_INT_WIDTH))
    (
        .x(sum),
        .y(output_data)
    );

    weight_memory #(
            .NUM_WEIGHT(NUM_WEIGHT)                     ,
            .NEURON_NO(NEURON_NO)                       ,
            .LAYER_NO(LAYER_NO)                         ,
            .ADDRESS_WIDTH(ADDRESS_WIDTH)               ,
            .DATA_WIDTH(DATA_WIDTH)                     ,
            .WEIGHT_FILE(WEIGHT_FILE)     
        ) WM(
        .clk(clk),
        .w_en(w_en),
        .r_en(r_en),
        .w_address(w_address),
        .r_address(r_address),
        .w_input(w_input),
        .w_output(w_output)
    );
    
endmodule
