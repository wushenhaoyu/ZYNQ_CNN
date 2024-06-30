`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/29 15:53:45
// Design Name: 
// Module Name: test_tb
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


module test_tb();
reg clk;
reg rst_n;
reg pic_start;
wire out_valid;
wire [15:0] out;
test test(
    clk,
    rst_n,
    pic_start,
    out_valid,
    out
    );

always #10 clk=~clk;
initial begin
    rst_n = 1'b1;
    clk=1'b0;
    #201;
    rst_n=1'b0;
    #201;
    rst_n=1'b1;
    #40;
    pic_start=1'b1;
    #40;
    pic_start=1'b0;
    #100000000 $finish;
end
endmodule
