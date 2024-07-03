`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/30 23:11:26
// Design Name: 
// Module Name: normailze
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


module normailze#(
    parameter DATA_WIDTH = 16,
    parameter WEIGHT_INT_WIDTH = 4
)(
    input       [DATA_WIDTH-1:0]      x,
    output      [DATA_WIDTH-1:0]          y 
    );

assign y = ($signed(x) >= 0) ? x[2*DATA_WIDTH-1-WEIGHT_INT_WIDTH-:DATA_WIDTH] : {1'b1 ,x[2*DATA_WIDTH-1-1-WEIGHT_INT_WIDTH-:DATA_WIDTH - 'b1]};
endmodule
