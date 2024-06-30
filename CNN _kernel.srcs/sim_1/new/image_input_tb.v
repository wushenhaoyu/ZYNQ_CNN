`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/29 10:58:23
// Design Name: 
// Module Name: image_input_tb
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


module image_input_tb();
reg clk;
reg rst_n;
reg pic_start;
wire pic_out_vaild;
wire [15:0] pic_data;
image_input image_input(
    clk             ,
    rst_n           ,
    pic_start       ,
    pic_out_vaild   ,
    pic_data         
    );

always #20 clk = ~clk;

initial begin
    clk = 1'b0;
    rst_n = 1'b0;
    #100 rst_n = 1'b1;
    #100 pic_start = 1'b1;
    #40 pic_start = 1'b0;
end
endmodule
