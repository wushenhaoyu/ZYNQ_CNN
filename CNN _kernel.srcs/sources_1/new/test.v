`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/29 15:46:59
// Design Name: 
// Module Name: test
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


module test(
    input clk,
    input rst_n,
    input pic_start,
    output out_valid,
    output [32:0] out
    );
wire pic_out_valid;
wire [15:0] pic_out;
wire conv_out_valid;
wire [32:0] conv_out;
image_input image_input(
    .clk                (clk)  ,
    .rst_n              (rst_n)  ,
    .pic_start          (pic_start)  ,
    .pic_out_valid      (pic_out_valid)  ,
    .pic_out            (pic_out)  
    );
conv conv1(
    .clk                (clk)                ,
    .rst_n              (rst_n)                ,
    .input_valid        (pic_out_valid)                ,
    .input_data         (pic_out)                ,
    .out_valid          (conv_out_valid)                ,
    .out_data           (conv_out)
);
average_pooling pooling1(
    .clk                (clk)                ,
    .rst_n              (rst_n)                ,
    .input_valid        (conv_out_valid)                ,
    .input_data          (conv_out)                ,
    .out_valid          (out_valid)                ,
    .out_data           (out)
);  
endmodule
