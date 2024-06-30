`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/30 15:03:37
// Design Name: 
// Module Name: Relu
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


module Relu#(
    parameter DATA_WIDTH = 16,
    parameter WEIGHT_INT_WIDTH = 4
)(
    input       [2 * DATA_WIDTH-1:0]      x,
    output      [DATA_WIDTH-1:0]          y 
    );

assign y = ($signed(x) >= 0) ? x[2*DATA_WIDTH-1-WEIGHT_INT_WIDTH-:DATA_WIDTH] : 0;
/*always @(posedge clk)
begin
    if($signed(x) >= 0)
    begin
        if(|x[2*DATA_WIDTH-1-:WEIGHT_INT_WIDTH+1]) //over flow to sign bit of integer part
            y <= {1'b0,{(DATA_WIDTH-1){1'b1}}}; //positive saturate
        else
            y <= x[2*DATA_WIDTH-1-WEIGHT_INT_WIDTH-:DATA_WIDTH];
    end
    else 
        y <= 0;      
end*/
endmodule
