`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/03 10:32:26
// Design Name: 
// Module Name: fully_connected
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


module fully_connected#(
        parameter NUM_WEIGHT = 25           ,
        parameter WEIGHT_INT_WIDTH = 1      ,
        parameter DATA_WIDTH = 16           ,
        parameter INPUT_WIDTH = 8'd32       ,
        parameter OUTPUT_WIDTH = 8'd32      ,
        parameter WEIGHT_WIDTH = 8'd8       ,
        parameter STRIDE = 3'd1             ,
        parameter ACT_TYPE = "Relu"         ,
        parameter BIAS_FILE = ""            ,
        parameter WEIGHT_FILE = ""          
    )
    (
        input                                           clk                         ,
        input                                           rst_n                       ,
        input                                           input_valid                 ,
        input  signed       [DATA_WIDTH * 2:0]          input_data                  ,
        output reg                                      out_valid                   ,
        output reg  signed  [DATA_WIDTH * 2:0]          out_data
    );

    parameter ADDRESS_WIDTH = $clog2(NUM_WEIGHT);
    wire                                                work_en_fully_connected     ;
    reg                                                 work_en_w                   ;
    reg                                                 work_en_b                   ;
    reg               [ADDRESS_WIDTH:0]                 address                     ;
    reg    signed     [DATA_WIDTH*2:0]                  out_data_reg                ;
    reg    signed     [DATA_WIDTH - 1:0]                out_data_reg_               ;
    wire   signed     [DATA_WIDTH*2:0]                  out_reg                     ;
    reg    signed     [2*DATA_WIDTH-1:0]                bias                        ;
    reg                                                 out_valid_flag              ;


    assign work_en_conv = input_valid;

    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            work_en_w <= 1'b0;
        else if(work_en_fully_connected)
            begin
                if(address == NUM_WEIGHT)
                    work_en_w <= 1'b0;
                else
                    work_en_w <= 1'b1;
            end
        else 
            work_en_w <= 1'b0;

    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            work_en_b <= 1'b0;
        else if(work_en_fully_connected && address == NUM_WEIGHT)
            work_en_b <= 1'b1;
        else
            work_en_b <= 1'b0;
    
    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            address <= 0;
        else if(work_en_w)
            address <= address + 1'b1;
        else
            address <= address;

    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            out_data_reg <= 0;
        else if(work_en_w)
            out_data_reg <= out_data_reg + out_data;
        else if(work_en_b)
            out_data_reg <= out_data_reg + bias;
        else if(out_valid)
            out_data_reg <= 0;
        else
            out_data_reg <= out_data_reg;


    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            out_valid_flag <= 1'b0;
        else if(work_en_b)
            out_valid_flag <= 1'b1;
        else 
            out_valid_flag <= 1'b0;
    
    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            out_valid <= 1'b0;
        else if(out_valid_flag)
            out_valid <= 1'b1;
        else if(out_valid)
            out_valid <= 1'b0;

    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            out_data <= 0;
        else if(out_valid_flag)
            out_data <= out_data_reg_;
        else 
            out_data <= 0;

    assign out_reg = output_w * input_data;

    `ifdef pretrained
    initial
    begin
        $readmemb(biasFile,biasReg);
    end
    always @(posedge clk)
    begin
        bias <= {biasReg[0][DATA_WIDTH-1:0],{DATA_WIDTH{1'b0}}};
    end
    `endif

    weight_memory weight_memory(
            .clk(clk)                     ,
            .address(address)                 ,
            .output_data(output_w)
    );

    
    Relu#(.DATA_WIDTH(DATA_WIDTH),.WEIGHT_INT_WIDTH(WEIGHT_INT_WIDTH))
    (
        .x(out_data_reg),
        .y(out_data_reg_)
    );
endmodule
