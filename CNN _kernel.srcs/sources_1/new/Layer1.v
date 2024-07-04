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
        input signed   [DATA_WIDTH * INPUT_NUM - 1:0]       input_data          ,
        input                                               input_valid         ,
        output                                              out_valid           ,
        output signed  [DATA_WIDTH  * OUTPUT_NUM - 1 :0]    out_data            
    );

    wire [DATA_WIDTH  * OUTPUT_NUM - 1 :0] out_data_;
    
    genvar i;
    generate
        for(i=0;i<OUTPUT_NUM;i=i+1)begin
            conv_2#(
            .LAYER_NO             (LAYER_NO         )     ,
            .INPUT_NUM            (INPUT_NUM        )     ,
            .NUM_WEIGHT           (NUM_WEIGHT       )     ,
            .WEIGHT_INT_WIDTH     (WEIGHT_INT_WIDTH )     ,
            .DATA_WIDTH           (DATA_WIDTH       )     ,
            .INPUT_WIDTH          (INPUT_WIDTH      )     ,
            .WINDOW_WIDTH         (WINDOW_WIDTH     )     ,
            .STRIDE               (STRIDE           )     ,
            .ACT_TYPE             (ACT_TYPE         )     

        )
        (
            .clk                (clk                )           ,
            .rst_n              (rst_n              )           ,
            .input_valid        (input_valid        )           ,
            .input_data         (input_data         )           ,
            .out_valid          (out_valid          )           ,
            .out_data           (out_data_[DATA_WIDTH * i   +: DATA_WIDTH]         )
        );
        end
    endgenerate
    genvar j;
    generate
        for (j = 0; j < OUTPUT_NUM; j = j + 1) begin
            Relu#(.DATA_WIDTH(DATA_WIDTH),.WEIGHT_INT_WIDTH(WEIGHT_INT_WIDTH))
            (
                .x(out_data_[DATA_WIDTH*j +: DATA_WIDTH]),
                .y(out_data[DATA_WIDTH*j +: DATA_WIDTH])
            );
        end
    endgenerate
    
endmodule
