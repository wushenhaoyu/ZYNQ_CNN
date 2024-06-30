`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/29 10:50:19
// Design Name: 
// Module Name: conv
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


module conv#(
    parameter INPUT_SIZE = 8'd32        ,
    parameter WINDOW_SIZE = 8'd5   ,

    parameter conv_w_0_0 = 16'd2     ,
    parameter conv_w_0_1 = 16'd4     ,
    parameter conv_w_0_2 = 16'd3     ,
    parameter conv_w_0_3 = 16'd1     ,
    parameter conv_w_0_4 = 16'd5     ,
     
    parameter conv_w_1_0 = 16'd7     ,
    parameter conv_w_1_1 = 16'd4     ,
    parameter conv_w_1_2 = 16'd1     ,
    parameter conv_w_1_3 = 16'd1     ,
    parameter conv_w_1_4 = 16'd6     ,
     
    parameter conv_w_2_0 = 16'd4     ,
    parameter conv_w_2_1 = 16'd5     ,
    parameter conv_w_2_2 = 16'd7     ,
    parameter conv_w_2_3 = 16'd3     ,
    parameter conv_w_2_4 = 16'd1     ,
     
    parameter conv_w_3_0 = 16'd2     ,
    parameter conv_w_3_1 = 16'd5     ,
    parameter conv_w_3_2 = 16'd5     ,
    parameter conv_w_3_3 = 16'd6     ,
    parameter conv_w_3_4 = 16'd0     ,
     
    parameter conv_w_4_0 = 16'd1     ,
    parameter conv_w_4_1 = 16'd7     ,
    parameter conv_w_4_2 = 16'd7     ,
    parameter conv_w_4_3 = 16'd8     ,
    parameter conv_w_4_4 = 16'd5     ,
    parameter conv_b     = 16'd3     

)
(
    input clk,
    input rst_n,
    input input_valid,
    input signed [15:0] input_data,
    output reg out_valid,
    output reg  signed [32:0]     out_data
);

    wire signed  [15:0] row1_out;
    wire signed  [15:0] row2_out;
    wire signed  [15:0] row3_out;
    wire signed  [15:0] row4_out;
    wire  signed [32:0]     out_data_reg            ;
    wire  signed [23:0]     out_reg       [24:0]    ;
    reg   signed [15:0]     windows_conv      [24:0]    ;
    reg [16:0] cnt;
    wire   work_en_conv;
    reg [10:0] cnt_conv; 
    reg out_valid_flag;
    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        cnt <= 1'b0;
    else if(cnt == INPUT_SIZE * INPUT_SIZE)
        cnt <= 16'd0;
    else if(work_en_conv)
        cnt <= cnt + 1'b1;
    else
        cnt <= cnt;

    assign work_en_conv = input_valid;
   /* always@(posedge clk or negedge rst_n)
    if(!rst_n)
        work_en_conv <= 0;
    else if(cnt == INPUT_SIZE * INPUT_SIZE)
        work_en_conv <= 1'b0;
    else if (input_valid)
        work_en_conv <= 1'b1;
    else
        work_en_conv <= work_en_conv;*/

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        cnt_conv <= 6'd0;
    else if(cnt_conv == INPUT_SIZE && work_en_conv && cnt >= (WINDOW_SIZE - 1) * INPUT_SIZE && cnt <= INPUT_SIZE * INPUT_SIZE - 1 )
        cnt_conv <= 6'd1;
    else if (work_en_conv && cnt >= (WINDOW_SIZE - 1) * INPUT_SIZE   && cnt <= INPUT_SIZE * INPUT_SIZE - 1 )
        cnt_conv <= cnt_conv + 1'b1;
    else
        cnt_conv <= 6'd0;
    
    always @(posedge clk or negedge rst_n)
    if(!rst_n)
        begin
        windows_conv[ 0] <= 16'd0;
        windows_conv[ 1] <= 16'd0;
        windows_conv[ 2] <= 16'd0;
        windows_conv[ 3] <= 16'd0;
        windows_conv[ 4] <= 16'd0;

        windows_conv[ 5] <= 16'd0;
        windows_conv[ 6] <= 16'd0;
        windows_conv[ 7] <= 16'd0;
        windows_conv[ 8] <= 16'd0;
        windows_conv[ 9] <= 16'd0;

        windows_conv[10] <= 16'd0;
        windows_conv[11] <= 16'd0;
        windows_conv[12] <= 16'd0;
        windows_conv[13] <= 16'd0;
        windows_conv[14] <= 16'd0;

        windows_conv[15] <= 16'd0;
        windows_conv[16] <= 16'd0;
        windows_conv[17] <= 16'd0;
        windows_conv[18] <= 16'd0;
        windows_conv[19] <= 16'd0;

        windows_conv[20] <= 16'd0;
        windows_conv[21] <= 16'd0;
        windows_conv[22] <= 16'd0;
        windows_conv[23] <= 16'd0;
        windows_conv[24] <= 16'd0;
    end
    else if (cnt >= INPUT_SIZE * (WINDOW_SIZE - 1'b1) && cnt <= INPUT_SIZE * INPUT_SIZE - 1'b1)begin
        windows_conv[ 0] <= row4_out;
        windows_conv[ 1] <= row3_out;
        windows_conv[ 2] <= row2_out;
        windows_conv[ 3] <= row1_out;
        windows_conv[ 4] <= input_data;

        windows_conv[ 5] <= windows_conv[ 0];
        windows_conv[ 6] <= windows_conv[ 1];
        windows_conv[ 7] <= windows_conv[ 2];
        windows_conv[ 8] <= windows_conv[ 3];
        windows_conv[ 9] <= windows_conv[ 4];

        windows_conv[10] <= windows_conv[ 5];
        windows_conv[11] <= windows_conv[ 6];
        windows_conv[12] <= windows_conv[ 7];
        windows_conv[13] <= windows_conv[ 8];
        windows_conv[14] <= windows_conv[ 9];

        windows_conv[15] <= windows_conv[10];
        windows_conv[16] <= windows_conv[11];
        windows_conv[17] <= windows_conv[12];
        windows_conv[18] <= windows_conv[13];
        windows_conv[19] <= windows_conv[14];

        windows_conv[20] <= windows_conv[15];
        windows_conv[21] <= windows_conv[16];
        windows_conv[22] <= windows_conv[17];
        windows_conv[23] <= windows_conv[18];
        windows_conv[24] <= windows_conv[19];
    end
    else begin
        windows_conv[ 0] <= windows_conv[ 0];
        windows_conv[ 1] <= windows_conv[ 1];
        windows_conv[ 2] <= windows_conv[ 2];
        windows_conv[ 3] <= windows_conv[ 3];
        windows_conv[ 4] <= windows_conv[ 4];

        windows_conv[ 5] <= windows_conv[ 5];
        windows_conv[ 6] <= windows_conv[ 6];
        windows_conv[ 7] <= windows_conv[ 7];
        windows_conv[ 8] <= windows_conv[ 8];
        windows_conv[ 9] <= windows_conv[ 9];

        windows_conv[10] <= windows_conv[10];
        windows_conv[11] <= windows_conv[11];
        windows_conv[12] <= windows_conv[12];
        windows_conv[13] <= windows_conv[13];
        windows_conv[14] <= windows_conv[14];

        windows_conv[15] <= windows_conv[15];
        windows_conv[16] <= windows_conv[16];
        windows_conv[17] <= windows_conv[17];
        windows_conv[18] <= windows_conv[18];
        windows_conv[19] <= windows_conv[19];

        windows_conv[20] <= windows_conv[20];
        windows_conv[21] <= windows_conv[21];
        windows_conv[22] <= windows_conv[22];
        windows_conv[23] <= windows_conv[23];
        windows_conv[24] <= windows_conv[24];
    end
always@(posedge clk or negedge rst_n)
    if(!rst_n)
        out_data <= 33'd0;
    else if(out_valid_flag)
        out_data<= out_data_reg;
    else
        out_data <= 33'b0;

always@(posedge clk or negedge rst_n)
    if(!rst_n)
        out_valid <= 1'b0;
    else if(out_valid_flag)
        out_valid <= 1'b1;
    else if(out_valid)
        out_valid <= 1'b0;

always @ (posedge clk or negedge rst_n)begin
    if (!rst_n)
        out_valid_flag <= 1'b0;
    else if (cnt >= INPUT_SIZE * (WINDOW_SIZE - 1'b1) && cnt_conv >= WINDOW_SIZE  && cnt_conv <= INPUT_SIZE)
        out_valid_flag <= 1'b1;
    else
        out_valid_flag <= 1'b0;
end

assign out_data_reg = out_reg[0] + out_reg[1] + out_reg[2] + out_reg[3] + out_reg[4] + out_reg[5] + out_reg[6] + out_reg[7] + out_reg[8] + out_reg[9] + out_reg[10] + out_reg[11] + out_reg[12] + out_reg[13] + out_reg[14] + out_reg[15] + out_reg[16] + out_reg[17] + out_reg[18] + out_reg[19] + out_reg[20] + out_reg[21] + out_reg[22] + out_reg[23] + out_reg[24] + conv_b;




conv_kernel_line conv_kernel_line1 (
  .D(input_data),        // input wire [15 : 0] D
  .CLK(clk),    // input wire CLK
  .CE(input_valid),      // input wire CE
  .SCLR(~rst_n),  // input wire SCLR
  .Q(row1_out)        // output wire [15 : 0] Q
);

conv_kernel_line conv_kernel_line2 (
  .D(row1_out),        // input wire [15 : 0] D
  .CLK(clk),    // input wire CLK
  .CE(input_valid),      // input wire CE
  .SCLR(~rst_n),  // input wire SCLR
  .Q(row2_out)        // output wire [15 : 0] Q
);

conv_kernel_line conv_kernel_line3 (
  .D(row2_out),        // input wire [15 : 0] D
  .CLK(clk),    // input wire CLK
  .CE(input_valid),      // input wire CE
  .SCLR(~rst_n),  // input wire SCLR
  .Q(row3_out)        // output wire [15 : 0] Q
);

conv_kernel_line conv_kernel_line4 (
  .D(row3_out),        // input wire [15 : 0] D
  .CLK(clk),    // input wire CLK
  .CE(input_valid),      // input wire CE
  .SCLR(~rst_n),  // input wire SCLR
  .Q(row4_out)        // output wire [15 : 0] Q
);

//column 0
mult_conv mult0_4(
    .CLK    (clk            ),
    .A      (conv_w_0_4     ),
    .B      (windows_conv[ 0]   ),
    .P      (out_reg[ 0]    )
);

mult_conv mult1_4(
    .CLK    (clk            ),
    .A      (conv_w_1_4     ),
    .B      (windows_conv[ 1]   ),
    .P      (out_reg[ 1]    )
);

mult_conv mult2_4(
    .CLK    (clk            ),
    .A      (conv_w_2_4     ),
    .B      (windows_conv[ 2]   ),
    .P      (out_reg[ 2]    )
);

mult_conv mult3_4(
    .CLK    (clk            ),
    .A      (conv_w_3_4     ),
    .B      (windows_conv[ 3]   ),
    .P      (out_reg[ 3]    )
);

mult_conv mult4_4(
    .CLK    (clk            ),
    .A      (conv_w_4_4     ),
    .B      (windows_conv[ 4]   ),
    .P      (out_reg[ 4]    )
);

// column 1
mult_conv mult0_3(
    .CLK    (clk            ),
    .A      (conv_w_0_3     ),
    .B      (windows_conv[ 5]   ),
    .P      (out_reg[ 5]    )
);

mult_conv mult1_3(
    .CLK    (clk            ),
    .A      (conv_w_1_3     ),
    .B      (windows_conv[ 6]   ),
    .P      (out_reg[ 6]    )
);

mult_conv mult2_3(
    .CLK    (clk            ),
    .A      (conv_w_2_3     ),
    .B      (windows_conv[ 7]   ),
    .P      (out_reg[ 7]    )
);

mult_conv mult3_3(
    .CLK    (clk            ),
    .A      (conv_w_3_3     ),
    .B      (windows_conv[ 8]   ),
    .P      (out_reg[ 8]    )
);

mult_conv mult4_3(
    .CLK    (clk            ),
    .A      (conv_w_4_3     ),
    .B      (windows_conv[ 9]   ),
    .P      (out_reg[ 9]    )
);

//column 2
mult_conv mult0_2(
    .CLK    (clk            ),
    .A      (conv_w_0_2     ),
    .B      (windows_conv[10]   ),
    .P      (out_reg[10]    )
);

mult_conv mult1_2(
    .CLK    (clk            ),
    .A      (conv_w_1_2     ),
    .B      (windows_conv[11]   ),
    .P      (out_reg[11]    )
);

mult_conv mult2_2(
    .CLK    (clk            ),
    .A      (conv_w_2_2     ),
    .B      (windows_conv[12]   ),
    .P      (out_reg[12]    )
);

mult_conv mult3_2(
    .CLK    (clk            ),
    .A      (conv_w_3_2     ),
    .B      (windows_conv[13]   ),
    .P      (out_reg[13]    )
);

mult_conv mult4_2(
    .CLK    (clk            ),
    .A      (conv_w_4_2     ),
    .B      (windows_conv[14]   ),
    .P      (out_reg[14]    )
);

// column 3
mult_conv mult0_1(
    .CLK    (clk            ),
    .A      (conv_w_0_1     ),
    .B      (windows_conv[15]   ),
    .P      (out_reg[15]    )
);

mult_conv mult1_1(
    .CLK    (clk            ),
    .A      (conv_w_1_1     ),
    .B      (windows_conv[16]   ),
    .P      (out_reg[16]    )
);

mult_conv mult2_1(
    .CLK    (clk            ),
    .A      (conv_w_2_1     ),
    .B      (windows_conv[17]   ),
    .P      (out_reg[17]    )
);

mult_conv mult3_1(
    .CLK    (clk            ),
    .A      (conv_w_3_1     ),
    .B      (windows_conv[18]   ),
    .P      (out_reg[18]    )
);

mult_conv mult4_1(
    .CLK    (clk            ),
    .A      (conv_w_4_1     ),
    .B      (windows_conv[19]   ),
    .P      (out_reg[19]    )
);

// column 4
mult_conv mult0_0(
    .CLK    (clk            ),
    .A      (conv_w_0_0     ),
    .B      (windows_conv[20]   ),
    .P      (out_reg[20]    )
);

mult_conv mult1_0(
    .CLK    (clk            ),
    .A      (conv_w_1_0     ),
    .B      (windows_conv[21]   ),
    .P      (out_reg[21]    )
);

mult_conv mult2_0(
    .CLK    (clk            ),
    .A      (conv_w_2_0     ),
    .B      (windows_conv[22]   ),
    .P      (out_reg[22]    )
);

mult_conv mult3_0(
    .CLK    (clk            ),
    .A      (conv_w_3_0     ),
    .B      (windows_conv[23]   ),
    .P      (out_reg[23]    )
);

mult_conv mult4_0(
    .CLK    (clk            ),
    .A      (conv_w_4_0     ),
    .B      (windows_conv[24]   ),
    .P      (out_reg[24]    )
);
endmodule