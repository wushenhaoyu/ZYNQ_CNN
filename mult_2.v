`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/04 10:31:15
// Design Name: 
// Module Name: mult_2
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


module mult_2#(
            parameter DATA_WIDTH = 16           ,
            parameter INPUT_NUM = 6             
    )(
        input clk,
        input [DATA_WIDTH * INPUT_NUM - 1 : 0]          input_data  ,
        input [DATA_WIDTH * INPUT_NUM - 1 : 0]          weight_data ,
        output  [DATA_WIDTH * INPUT_NUM * 2 - 1 : 0]    output_data
    );

    genvar i;
    generate
        for(i = 0; i < INPUT_NUM; i = i + 1) begin
            assign output_data[DATA_WIDTH * i * 2 +: DATA_WIDTH * 2] = input_data[DATA_WIDTH*i +: DATA_WIDTH] * weight_data[DATA_WIDTH*i +: DATA_WIDTH];
        end
    endgenerate
endmodule
