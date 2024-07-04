`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/04 22:19:51
// Design Name: 
// Module Name: Layer4
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


module Layer4#(
    parameter LAYER_NO = 4              ,
    parameter INPUT_NUM = 16            ,
    parameter OUTPUT_NUM = 16           ,
    parameter DATA_WIDTH = 16           ,
    parameter INPUT_WIDTH = 8'd10       ,
    parameter WINDOW_WIDTH = 8'd2       ,
    parameter STRIDE = 3'd2                    
)(
        input clk,
        input rst_n,
        input signed   [DATA_WIDTH  * INPUT_NUM - 1 :0]     input_data          ,
        input                                               input_valid         ,
        output                                              out_valid           ,
        output signed  [DATA_WIDTH  * OUTPUT_NUM - 1 :0]    out_data            
    );
    

    average_pooling#(
    .INPUT_WIDTH      (INPUT_WIDTH) ,
    .WINDOW_SIZE      (WINDOW_WIDTH)             ,
    .DATA_SIZE        (DATA_WIDTH * INPUT_NUM)              ,
    .STRIDE           (STRIDE)                                              
    )average_pooling(
    .clk            (clk)                   ,
    .rst_n          (rst_n)                 ,    
    .input_data     (input_data)            ,
    .input_valid    (input_valid)           ,
    .out_valid      (out_valid)             ,
    .out_data       (out_data)
    );

endmodule