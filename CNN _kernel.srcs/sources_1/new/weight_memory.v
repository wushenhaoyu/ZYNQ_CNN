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
    input                                               w_en                    ,
    input                                               r_en                    ,
    input         [ADDRESS_WIDTH - 1 : 0]               w_address               ,
    input         [ADDRESS_WIDTH - 1 : 0]               r_address               ,
    input         [DATA_WIDTH - 1 : 0]                  w_input                 ,
    output reg    [DATA_WIDTH - 1 : 0]                  w_output
    );

    reg [DATA_WIDTH - 1 : 0] memory [NUM_WEIGHT - 1 : 0];

    `ifdef pretrained
        initial
		begin
	        $readmemb(WEIGHT_FILE, memory);
	    end
	`else
		always @(posedge clk)
		begin
			if (w_en)
			begin
				memory[w_address] <= w_input;
			end
		end 
    `endif

    always @(posedge clk)
    begin
        if(r_en)
        begin
            w_output <= memory[r_address];
        end
    end

endmodule
