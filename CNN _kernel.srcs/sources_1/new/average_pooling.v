`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/29 17:47:30
// Design Name: 
// Module Name: average_pooling
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


module average_pooling#(
    parameter INPUT_WIDTH = 28,
    parameter WINDOW_SIZE = 2,
    parameter DATA_SIZE = 33,
    parameter STRIDE = 2,
    parameter WEIGHT_INT_WIDTH = 1      
)(
    input clk,
    input rst_n,
    input signed [DATA_SIZE - 1:0]  input_data,
    input input_valid,
    output reg out_valid,
    output  reg signed  [DATA_SIZE - 1:0]  out_data
    );
    wire signed [DATA_SIZE - 1:0] line_out1;
    wire work_en_pooling;
    reg [12:0] cnt;
    reg [16:0] cnt_pooling;
    reg signed [DATA_SIZE - 1:0] windows_pooling [WINDOW_SIZE * WINDOW_SIZE - 1:0];
    reg out_valid_flag;
    wire signed  [DATA_SIZE - 1:0]  out_data_reg;
    wire signed  [DATA_SIZE - 1:0]  out_data_reg_;
    reg [2:0] cnt_stride;
    wire stride_flag;
    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            cnt <= 16'd0;
        else if (cnt == INPUT_WIDTH * INPUT_WIDTH)
            cnt <= 16'd0;
        else if(work_en_pooling)
            cnt <= cnt + 1'b1;
        else
            cnt <= cnt;

     assign work_en_pooling = input_valid;

    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            cnt_pooling <= 13'd0;
        else if(cnt_pooling == INPUT_WIDTH && work_en_pooling && cnt >= (WINDOW_SIZE - 1) * INPUT_WIDTH && cnt <= INPUT_WIDTH * INPUT_WIDTH - 1 )
            cnt_pooling <= 13'd1;
        else if (work_en_pooling && cnt >= (WINDOW_SIZE - 1) * INPUT_WIDTH   && cnt <= INPUT_WIDTH * INPUT_WIDTH - 1 )
            cnt_pooling <= cnt_pooling + 1'b1;
        else
            cnt_pooling <= 13'd0;

    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            cnt_stride <= 3'd0;
        else if(STRIDE == 1'b1)
            cnt_stride = WINDOW_SIZE - 1'b1;
        else if (cnt_pooling == 1'b0)
            cnt_stride <= 3'b0;
        else if (work_en_pooling && cnt_stride == STRIDE - 1'b1)
            cnt_stride <= 3'd0;
        else if (work_en_pooling)
            cnt_stride <= cnt_stride + 1'b1;
        else
            cnt_stride <= cnt_stride;

assign stride_flag = (cnt_stride == WINDOW_SIZE - 1'b1);

    always @(posedge clk or negedge rst_n)
    if(!rst_n)
        begin
        windows_pooling[ 0] <= 16'd0;
        windows_pooling[ 1] <= 16'd0;
        windows_pooling[ 2] <= 16'd0;
        windows_pooling[ 3] <= 16'd0;
    end
    else if (work_en_pooling && cnt >= INPUT_WIDTH * (WINDOW_SIZE - 1'b1) && cnt <= INPUT_WIDTH * INPUT_WIDTH - 1'b1)begin
        windows_pooling[ 0] <= line_out1;
        windows_pooling[ 1] <= input_data;

        windows_pooling[ 2] <= windows_pooling[ 0];
        windows_pooling[ 3] <= windows_pooling[ 1];
    end
    else begin
        windows_pooling[ 0] <= windows_pooling[ 0];
        windows_pooling[ 1] <= windows_pooling[ 1];
        windows_pooling[ 2] <= windows_pooling[ 2];
        windows_pooling[ 3] <= windows_pooling[ 3];
    end


always@(posedge clk or negedge rst_n) begin
    if(!rst_n)
        out_valid <= 1'b0;
    else if(out_valid_flag && stride_flag)
        out_valid <= 1'b1;
    else if(out_valid)
        out_valid <= 1'b0;
end

always@(posedge clk or negedge rst_n)begin
    if(!rst_n)
        out_data <= 33'd0;
    else if(out_valid_flag && stride_flag)
        out_data<= out_data_reg_;
    else
        out_data <= 33'b0;
end

always @ (posedge clk or negedge rst_n)begin
    if (!rst_n)
        out_valid_flag <= 1'b0;
    else if (cnt >= INPUT_WIDTH * (WINDOW_SIZE - 1'b1) && cnt_pooling >= WINDOW_SIZE - 1'b1 && cnt_pooling <= INPUT_WIDTH - 1'b1)
        out_valid_flag <= 1'b1;
    else
        out_valid_flag <= 1'b0;
end



assign out_data_reg = (windows_pooling[0] + windows_pooling[1] + windows_pooling[2] + windows_pooling[3]) >> 2;

normailze #(
    .DATA_SIZE(DATA_SIZE),
    .WEIGHT_INT_WIDTH(WEIGHT_INT_WIDTH)
)normailze_inst(
    .x(out_data_reg),
    .y(out_data_reg_)
);


average_pooling_kernel_line line1 (
  .D(input_data),        // input wire [32 : 0] D
  .CLK(clk),    // input wire CLK
  .CE(work_en_pooling),      // input wire CE
  .SCLR(~rst_n),  // input wire SCLR
  .Q(line_out1)        // output wire [32 : 0] Q
);
endmodule
