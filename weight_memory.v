`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/30 18:25:25
// Design Name: 
// Module Name: weight_Memory
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


module weight_memory#(
    parameter NUM_WEIGHT                = 3                     ,
    parameter NEURON_NO                 = 5                     ,
    parameter LAYER_NO                  = 1                     ,
    parameter ADDRESS_WIDTH             = 10                    ,
    parameter DATA_WIDTH                = 16                    ,
    parameter WEIGHT_FILE               = "w_1_15.mif"
)(
    input                                               clk                     ,
    input         [ADDRESS_WIDTH - 1 : 0]               address                 ,
    output        [DATA_WIDTH - 1 : 0]                  output_data
    );

    reg [DATA_WIDTH - 1 : 0] memory [NUM_WEIGHT - 1 : 0];

    `ifdef pretrained
        initial
		begin
	        $readmemb(WEIGHT_FILE, memory);
	    end
	`else
		assign output_data = memory[address];
    `endif


endmodule
