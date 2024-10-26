`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/04 11:16:35
// Design Name: 
// Module Name: test2
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


module test2(
    input clk,
    input rst_n,
    input pic_start,
    output out_valid,
    output [16 * 16 - 1:0] out
    );
    image_input image_input(
    .clk                (clk)  ,
    .rst_n              (rst_n)  ,
    .pic_start          (pic_start)  ,
    .pic_out_valid      (pic_out_valid)  ,
    .pic_out            (pic_out)  
    );
    Layer1 Layer1(
    .clk                (clk)                ,
    .rst_n              (rst_n)                ,
    .input_valid        (pic_out_valid)                ,
    .input_data         (pic_out)                ,
    .out_valid          (layer1_out_valid)                ,
    .out_data           (layer1_out)
);
    Layer2 Layer2(
    .clk                (clk)                ,
    .rst_n              (rst_n)                ,
    .input_valid        (layer1_out_valid)                ,
    .input_data         (layer1_out)                ,
    .out_valid          (layer2_out_valid)                ,
    .out_data           (layer2_out)
);
    Layer3 Layer3(
    .clk                (clk)                ,
    .rst_n              (rst_n)                ,
    .input_valid        (layer2_out_valid)                ,
    .input_data         (layer2_out)                ,
    .out_valid          (layer3_out_valid)                ,
    .out_data           (layer3_out)
    );
    Layer4 Layer4(
    .clk                (clk)                ,
    .rst_n              (rst_n)                ,
    .input_valid        (layer3_out_valid)                ,
    .input_data         (layer3_out)                ,
    .out_valid          (out_valid)                ,
    .out_data           (out)
    );
    

endmodule 
