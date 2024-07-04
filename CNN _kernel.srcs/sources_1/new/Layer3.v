`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/03 22:17:57
// Design Name: 
// Module Name: Layer3
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


module Layer3#(
    parameter LAYER_NO = 3              ,
    parameter INPUT_NUM = 1             ,
    parameter OUTPUT_NUM = 16            ,
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
        input signed   [DATA_WIDTH  * INPUT_NUM - 1 :0]    input_data          ,
        input                                               input_valid         ,
        output                                              out_valid           ,
        output signed  [DATA_WIDTH  * OUTPUT_NUM - 1 :0]    out_data            
    );


    
endmodule

