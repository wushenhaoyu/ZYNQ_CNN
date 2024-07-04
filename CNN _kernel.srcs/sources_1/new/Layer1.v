`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/03 11:39:15
// Design Name: 
// Module Name: Layer1
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


module Layer1#(
    parameter LAYER_NO = 1              ,
    parameter INPUT_NUM = 1             ,
    parameter OUTPUT_NUM = 6            ,
    parameter NUM_WEIGHT = 25           ,
    parameter WEIGHT_INT_WIDTH = 1      ,
    parameter DATA_WIDTH = 16           ,
    parameter INPUT_WIDTH = 8'd32       ,
    parameter WINDOW_WIDTH = 8'd5       ,
    parameter STRIDE = 3'd1             ,
    parameter ACT_TYPE = "Relu"         
)(
        input clk,
        input rst_n,
        input signed        [DATA_WIDTH - 1:0]              input_data          ,
        input                                               input_valid         ,
        output                                              out_valid           ,
        output signed  [DATA_WIDTH  * OUTPUT_NUM - 1 :0]    out_data            
    );

    wire [DATA_WIDTH  * OUTPUT_NUM - 1 :0] out_data_;
    conv #(
        .LAYER_NO                (LAYER_NO),
        .NUM_WEIGHT              (NUM_WEIGHT),
        .WEIGHT_INT_WIDTH        (WEIGHT_INT_WIDTH),
        .DATA_WIDTH              (DATA_WIDTH),
        .INPUT_WIDTH             (INPUT_WIDTH),
        .WINDOW_WIDTH            (WINDOW_WIDTH),
        .STRIDE                  (STRIDE),
        .ACT_TYPE                (ACT_TYPE),
        .WEIGHT_FILE             ("./weights/conv1_1_w.txt"),
        .BIAS_FILE               ("./bias/conv1_1_b.mem")
    ) conv_1 (
        .clk                    (clk),
        .rst_n                  (rst_n),
        .input_valid            (input_valid),       // 假设所有实例共享input_valid，根据设计调整
        .input_data             (input_data),        // 同上，根据实际数据流设计可能需要修改
        .out_valid              (out_valid),      // 分别为每个实例声明或连接out_valid
        .out_data               (out_data_[DATA_WIDTH - 1 : 0])
    );
    conv #(
        .LAYER_NO                (LAYER_NO),
        .NUM_WEIGHT              (NUM_WEIGHT),
        .WEIGHT_INT_WIDTH        (WEIGHT_INT_WIDTH),
        .DATA_WIDTH              (DATA_WIDTH),
        .INPUT_WIDTH             (INPUT_WIDTH),
        .WINDOW_WIDTH            (WINDOW_WIDTH),
        .STRIDE                  (STRIDE),
        .ACT_TYPE                (ACT_TYPE),
        .WEIGHT_FILE             ("./weights/conv1_2_w.txt"),
        .BIAS_FILE               ("./bias/conv1_2_b.mem")
    ) conv_2 (
        .clk                    (clk),
        .rst_n                  (rst_n),
        .input_valid            (input_valid),       // 假设所有实例共享input_valid，根据设计调整
        .input_data             (input_data),        // 同上，根据实际数据流设计可能需要修改
        .out_valid              (),      // 分别为每个实例声明或连接out_valid
        .out_data               (out_data_[DATA_WIDTH*1 +: DATA_WIDTH])
    );
    conv #(
        .LAYER_NO                (LAYER_NO),
        .NUM_WEIGHT              (NUM_WEIGHT),
        .WEIGHT_INT_WIDTH        (WEIGHT_INT_WIDTH),
        .DATA_WIDTH              (DATA_WIDTH),
        .INPUT_WIDTH             (INPUT_WIDTH),
        .WINDOW_WIDTH            (WINDOW_WIDTH),
        .STRIDE                  (STRIDE),
        .ACT_TYPE                (ACT_TYPE),
        .WEIGHT_FILE             ("./weights/conv1_3_w.txt"),
        .BIAS_FILE               ("./bias/conv1_3_b.mem")
    ) conv_3 (
        .clk                    (clk),
        .rst_n                  (rst_n),
        .input_valid            (input_valid),       // 假设所有实例共享input_valid，根据设计调整
        .input_data             (input_data),        // 同上，根据实际数据流设计可能需要修改
        .out_valid              (),      // 分别为每个实例声明或连接out_valid
        .out_data               (out_data_[DATA_WIDTH*2 +: DATA_WIDTH])
    );
    conv #(
        .LAYER_NO                (LAYER_NO),
        .NUM_WEIGHT              (NUM_WEIGHT),
        .WEIGHT_INT_WIDTH        (WEIGHT_INT_WIDTH),
        .DATA_WIDTH              (DATA_WIDTH),
        .INPUT_WIDTH             (INPUT_WIDTH),
        .WINDOW_WIDTH            (WINDOW_WIDTH),
        .STRIDE                  (STRIDE),
        .ACT_TYPE                (ACT_TYPE),
        .WEIGHT_FILE             ("./weights/conv1_4_w.txt"),
        .BIAS_FILE               ("./bias/conv1_4_b.mem")
    ) conv_4 (
        .clk                    (clk),
        .rst_n                  (rst_n),
        .input_valid            (input_valid),       // 假设所有实例共享input_valid，根据设计调整
        .input_data             (input_data),        // 同上，根据实际数据流设计可能需要修改
        .out_valid              (),      // 分别为每个实例声明或连接out_valid
        .out_data               (out_data_[DATA_WIDTH*3 +: DATA_WIDTH])
    );
    conv #(
        .LAYER_NO                (LAYER_NO),
        .NUM_WEIGHT              (NUM_WEIGHT),
        .WEIGHT_INT_WIDTH        (WEIGHT_INT_WIDTH),
        .DATA_WIDTH              (DATA_WIDTH),
        .INPUT_WIDTH             (INPUT_WIDTH),
        .WINDOW_WIDTH            (WINDOW_WIDTH),
        .STRIDE                  (STRIDE),
        .ACT_TYPE                (ACT_TYPE),
        .WEIGHT_FILE             ("./weights/conv1_5_w.txt"),
        .BIAS_FILE               ("./bias/conv1_5_b.mem")
    ) conv_5 (
        .clk                    (clk),
        .rst_n                  (rst_n),
        .input_valid            (input_valid),       // 假设所有实例共享input_valid，根据设计调整
        .input_data             (input_data),        // 同上，根据实际数据流设计可能需要修改
        .out_valid              (),      
        .out_data               (out_data_[DATA_WIDTH*4 +: DATA_WIDTH])
    );
    conv #(
        .LAYER_NO                (LAYER_NO),
        .NUM_WEIGHT              (NUM_WEIGHT),
        .WEIGHT_INT_WIDTH        (WEIGHT_INT_WIDTH),
        .DATA_WIDTH              (DATA_WIDTH),
        .INPUT_WIDTH             (INPUT_WIDTH),
        .WINDOW_WIDTH            (WINDOW_WIDTH),
        .STRIDE                  (STRIDE),
        .ACT_TYPE                (ACT_TYPE),
        .WEIGHT_FILE             ("./weights/conv1_6_w.txt"),
        .BIAS_FILE               ("./bias/conv1_6_b.mem")
    ) conv_6 (
        .clk                    (clk),
        .rst_n                  (rst_n),
        .input_valid            (input_valid),       // 假设所有实例共享input_valid，根据设计调整
        .input_data             (input_data),        // 同上，根据实际数据流设计可能需要修改
        .out_valid              (),      
        .out_data               (out_data_[DATA_WIDTH*5 +: DATA_WIDTH])
    );

    genvar i;
    generate
        for (i = 0; i < OUTPUT_NUM; i = i + 1) begin
            Relu#(.DATA_WIDTH(DATA_WIDTH),.WEIGHT_INT_WIDTH(WEIGHT_INT_WIDTH))
            (
                .x(out_data_[DATA_WIDTH*i +: DATA_WIDTH]),
                .y(out_data[DATA_WIDTH*i +: DATA_WIDTH])
            );
        end
    endgenerate
    
endmodule
