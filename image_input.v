`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/29 00:12:56
// Design Name: 
// Module Name: image_input
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


module image_input(
    input                   clk             ,
    input                   rst_n           ,
    input                   pic_start       ,
    output                  pic_out_valid   ,
    output  [15:0]          pic_out         
    );
    parameter [10:0] pic_size = 10'd32; // 32*32

    reg pic_out_valid_r1;
    reg [10:0] address;
    reg pic_en;
    reg pic_out_valid_r;
    wire [15:0] pic_out_r;
image image_inst (
  .clka(clk),    // input wire clka
  .addra(address),  // input wire [10 : 0] addra
  .douta(pic_out_r)  // output wire [15 : 0] douta
);
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        address <= 10'd0;
    else
        begin
            if(pic_en)
                address <= address + 1'b1;
            else
                address <= 1'b0;
        end
end

always @(posedge clk or negedge rst_n)
    if(!rst_n)
        pic_en <= 1'b0;
    else if(pic_start)
        pic_en <= 1'b1;
    else if(address == pic_size * pic_size)
        pic_en <= 1'b0;
    else
        pic_en <= pic_en;

always@(posedge clk or negedge rst_n)
    if(!rst_n)
        pic_out_valid_r <= 1'b0;
    else if(pic_en && address == pic_size * pic_size)
        pic_out_valid_r <= 1'b0;
    else if(pic_en && address == 11'd0)
        pic_out_valid_r <= 1'b1;
    else   
        pic_out_valid_r <= pic_out_valid_r;

always@(posedge clk or negedge rst_n)
    if(!rst_n)
        pic_out_valid_r1 <= 1'b0;
    else
        pic_out_valid_r1 <= pic_out_valid_r;
    
assign pic_out_valid = pic_out_valid_r1;

assign pic_out = (pic_out_valid) ? pic_out_r : 16'd0; 
        
endmodule
