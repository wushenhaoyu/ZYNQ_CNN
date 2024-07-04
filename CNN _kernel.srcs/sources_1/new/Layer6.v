`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/04 22:26:27
// Design Name: 
// Module Name: Layer6
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


module Layer6#(
        parameter NUM_WEIGHT = 120          ,
        parameter WEIGHT_INT_WIDTH = 1      ,
        parameter DATA_WIDTH = 16           ,
        parameter INPUT_WIDTH = 120         ,
        parameter OUTPUT_WIDTH = 84        
    )(
        input clk,
        input rst_n,
        input signed   [DATA_WIDTH  * INPUT_WIDTH - 1 :0]        input_data          ,
        input                                                    input_valid         ,
        output                                                   out_valid           ,
        output signed  [DATA_WIDTH  * OUTPUT_WIDTH - 1 :0]       out_data
    );
    wire [DATA_WIDTH  * OUTPUT_WIDTH - 1 :0] out_data_;
    
endmodule
