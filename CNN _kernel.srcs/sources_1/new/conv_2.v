`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/04 10:23:44
// Design Name: 
// Module Name: conv_2
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


module conv_2#(
    parameter LAYER_NO = 0              ,
    parameter NEURON_NO = 0             ,
    parameter INPUT_NUM = 6             ,
    parameter OUTPUT_NUM = 1            ,
    parameter NUM_WEIGHT = 25           ,
    parameter WEIGHT_INT_WIDTH = 1      ,
    parameter DATA_WIDTH = 16           ,
    parameter INPUT_WIDTH = 8'd32       ,
    parameter WINDOW_WIDTH = 8'd5       ,
    parameter STRIDE = 3'd2             ,
    parameter ACT_TYPE = "Relu"         ,
    parameter BIAS_FILE = ""            ,
    parameter WEIGHT_FILE = ""          

)
(
    input                                                           clk                         ,
    input                                                           rst_n                       ,
    input                                                           input_valid                 ,
    input signed        [DATA_WIDTH * INPUT_NUM - 1:0]              input_data                  ,
    output                                                          out_valid                   ,
    output reg  signed  [DATA_WIDTH * OUTPUT_NUM - 1:0]             out_data
);

    wire  signed     [DATA_WIDTH * INPUT_NUM - 1:0]             row1_out                                                           ;
    wire  signed     [DATA_WIDTH * INPUT_NUM - 1:0]             row2_out                                                           ;
    wire  signed     [DATA_WIDTH * INPUT_NUM - 1:0]             row3_out                                                           ;
    wire  signed     [DATA_WIDTH * INPUT_NUM - 1:0]             row4_out                                                           ;
    wire  signed     [DATA_WIDTH * INPUT_NUM * 2 - 1:0]         out_data_reg                                                       ;
    wire  signed     [DATA_WIDTH * INPUT_NUM * 2 - 1:0]         out_reg           [WINDOW_WIDTH * WINDOW_WIDTH - 1 :0]             ;
    reg   signed     [DATA_WIDTH * INPUT_NUM - 1:0]             windows_conv      [ WINDOW_WIDTH * WINDOW_WIDTH - 1 :0]            ;
    reg              [16:0]                                     cnt                                                                ;
    wire                                                        work_en_conv                                                       ;
    reg              [10:0]                                     cnt_conv                                                           ; 
    reg                                                         out_valid_flag                                                     ;
    wire                                                        stride_flag                                                        ;   
    reg              [2:0]                                      cnt_stride                                                         ;
    reg              [DATA_WIDTH * INPUT_NUM * 2 - 1:0]         bias               [WINDOW_WIDTH * WINDOW_WIDTH - 1 :0]            ;
    reg                                                         addr=0                                                             ;
    reg                                                         out_valid_                                                         ;
    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        cnt <= 1'b0;
    else if(cnt == INPUT_WIDTH * INPUT_WIDTH)
        cnt <= 16'd0;
    else if(work_en_conv)
        cnt <= cnt + 1'b1;
    else
        cnt <= cnt;

    assign work_en_conv = input_valid;

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        cnt_conv <= 6'd0;
    else if(cnt_conv == INPUT_WIDTH && work_en_conv && cnt >= (WINDOW_WIDTH - 1) * INPUT_WIDTH && cnt <= INPUT_WIDTH * INPUT_WIDTH - 1 )
        cnt_conv <= 6'd1;
    else if (work_en_conv && cnt >= (WINDOW_WIDTH - 1) * INPUT_WIDTH   && cnt <= INPUT_WIDTH * INPUT_WIDTH - 1 )
        cnt_conv <= cnt_conv + 1'b1;
    else
        cnt_conv <= 6'd0;

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        cnt_stride <= 3'd0;
    else if(STRIDE == 1'b1)
        cnt_stride = WINDOW_WIDTH - 1'b1;
    else if (cnt_conv == 1'b0)
        cnt_stride <= 3'b0;
    else if (work_en_conv && cnt_stride == STRIDE - 1'b1)
        cnt_stride <= 3'd0;
    else if (work_en_conv)
        cnt_stride <= cnt_stride + 1'b1;
    else
        cnt_stride <= cnt_stride;

    assign stride_flag = (cnt_stride == WINDOW_WIDTH - 1'b1);

    
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
    else if (cnt >= INPUT_WIDTH * (WINDOW_WIDTH - 1'b1) && cnt <= INPUT_WIDTH * INPUT_WIDTH - 1'b1)begin
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
        out_valid_ <= 1'b0;
    else if(out_valid_flag)
        out_valid_ <= 1'b1;
    else if(out_valid_)
        out_valid_ <= 1'b0;

always @ (posedge clk or negedge rst_n)begin
    if (!rst_n)
        out_valid_flag <= 1'b0;
    else if (cnt >= INPUT_WIDTH * (WINDOW_WIDTH - 1'b1) && cnt_conv >= WINDOW_WIDTH  && cnt_conv <= INPUT_WIDTH)
        out_valid_flag <= 1'b1;
    else
        out_valid_flag <= 1'b0;
end

assign out_valid = out_valid_;
genvar i;
generate
    for(i = 0; i < INPUT_NUM; i = i + 1) begin
        assign out_data_reg[DATA_WIDTH * i * 2 +: DATA_WIDTH * 2] = out_reg[0][DATA_WIDTH * i * 2 +: DATA_WIDTH * 2] + out_reg[1][DATA_WIDTH * i * 2 +: DATA_WIDTH * 2] + out_reg[2][DATA_WIDTH * i * 2 +: DATA_WIDTH * 2] + out_reg[3][DATA_WIDTH * i * 2 +: DATA_WIDTH * 2] + out_reg[4][DATA_WIDTH * i * 2 +: DATA_WIDTH * 2] + out_reg[5][DATA_WIDTH * i * 2 +: DATA_WIDTH * 2] + out_reg[6][DATA_WIDTH * i * 2 +: DATA_WIDTH * 2] + out_reg[7][DATA_WIDTH * i * 2 +: DATA_WIDTH * 2] + out_reg[8][DATA_WIDTH * i * 2 +: DATA_WIDTH * 2] + out_reg[9][DATA_WIDTH * i * 2 +: DATA_WIDTH * 2] + out_reg[10][DATA_WIDTH * i * 2 +: DATA_WIDTH * 2] + out_reg[11][DATA_WIDTH * i * 2 +: DATA_WIDTH * 2] + out_reg[12][DATA_WIDTH * i * 2 +: DATA_WIDTH * 2] + out_reg[13][DATA_WIDTH * i * 2 +: DATA_WIDTH * 2] + out_reg[14][DATA_WIDTH * i * 2 +: DATA_WIDTH * 2] + out_reg[15][DATA_WIDTH * i * 2 +: DATA_WIDTH * 2] + out_reg[16][DATA_WIDTH * i * 2 +: DATA_WIDTH * 2] + out_reg[17][DATA_WIDTH * i * 2 +: DATA_WIDTH * 2] + out_reg[18][DATA_WIDTH * i * 2 +: DATA_WIDTH * 2] + out_reg[19][DATA_WIDTH * i * 2 +: DATA_WIDTH * 2] + out_reg[20][DATA_WIDTH * i * 2 +: DATA_WIDTH * 2] + out_reg[21][DATA_WIDTH * i * 2 +: DATA_WIDTH * 2] + out_reg[22][DATA_WIDTH * i * 2 +: DATA_WIDTH * 2] + out_reg[23][DATA_WIDTH * i * 2 +: DATA_WIDTH * 2] + out_reg[24][DATA_WIDTH * i * 2 +: DATA_WIDTH * 2] + bias[i];
    end
endgenerate//w1*a1 + ...... w25*a25 + b for 6 times


reg [DATA_WIDTH * INPUT_NUM - 1 : 0] memory [NUM_WEIGHT - 1 : 0];
/*`ifdef pretrained
    initial
	begin
        $readmemb(WEIGHT_FILE, memory);
    end
`endif

`ifdef pretrained
    initial
    begin
        $readmemb(biasFile,biasReg);
    end
    always @(posedge clk)
    begin
        bias <= {biasReg[addr][DATA_WIDTH-1:0],{DATA_WIDTH{1'b0}}};
    end
`endif
*/






conv_kernel_line conv_kernel_line1 (
  .D(input_data),        // input wire [15 : 0] D
  .CLK(clk),    // input wire clk
  .CE(input_valid),      // input wire CE
  .SCLR(~rst_n),  // input wire SCLR
  .Q(row1_out)        // output wire [15 : 0] Q
);

conv_kernel_line conv_kernel_line2 (
  .D(row1_out),        // input wire [15 : 0] D
  .CLK(clk),    // input wire clk
  .CE(input_valid),      // input wire CE
  .SCLR(~rst_n),  // input wire SCLR
  .Q(row2_out)        // output wire [15 : 0] Q
);

conv_kernel_line conv_kernel_line3 (
  .D(row2_out),        // input wire [15 : 0] D
  .CLK(clk),    // input wire clk
  .CE(input_valid),      // input wire CE
  .SCLR(~rst_n),  // input wire SCLR
  .Q(row3_out)        // output wire [15 : 0] Q
);

conv_kernel_line conv_kernel_line4 (
  .D(row3_out),        // input wire [15 : 0] D
  .CLK(clk),    // input wire clk
  .CE(input_valid),      // input wire CE
  .SCLR(~rst_n),  // input wire SCLR
  .Q(row4_out)        // output wire [15 : 0] Q
);

//column 0
mult_2 #(
    .DATA_WIDTH(DATA_WIDTH),
    .INPUT_NUM(INPUT_NUM)
)mult0_4(
    .clk            (clk                ),
    .input_data     (memory[4]          ),
    .weight_data    (windows_conv[ 0]   ),
    .output_data    (out_reg[ 0]        )
);


mult_2 #(
    .DATA_WIDTH(DATA_WIDTH),
    .INPUT_NUM(INPUT_NUM)
)mult1_4(
    .clk             (clk                ),
    .input_data      (memory[9]          ),
    .weight_data     (windows_conv[ 1]   ),
    .output_data     (out_reg[ 1]        )
);
mult_2 #(
    .DATA_WIDTH(DATA_WIDTH),
    .INPUT_NUM(INPUT_NUM)
)mult2_4(
    .clk            (clk                ),
    .input_data     (memory[14]         ),
    .weight_data    (windows_conv[ 2]   ),
    .output_data    (out_reg[ 2]        )
);

mult_2 #(
    .DATA_WIDTH(DATA_WIDTH),
    .INPUT_NUM(INPUT_NUM)
)mult3_4(
    .clk          (clk                ),
    .input_data   (memory[19]         ),
    .weight_data  (windows_conv[ 3]   ),
    .output_data  (out_reg[ 3]        )
);

mult_2 #(
    .DATA_WIDTH(DATA_WIDTH),
    .INPUT_NUM(INPUT_NUM)
)mult4_4(
    .clk           (clk                  ),
    .input_data    (memory[24]           ),
    .weight_data   (windows_conv[ 4]     ),
    .output_data   (out_reg[ 4]          )
);

// column 1
mult_2 #(
    .DATA_WIDTH(DATA_WIDTH),
    .INPUT_NUM(INPUT_NUM)
)mult0_3(
    .clk            (clk                ),
    .input_data     (memory[3]          ),
    .weight_data    (windows_conv[ 5]   ),
    .output_data    (out_reg[ 5]        )
);

mult_2 #(
    .DATA_WIDTH(DATA_WIDTH),
    .INPUT_NUM(INPUT_NUM)
)mult1_3(
    .clk    (clk            ),
    .input_data     (memory[8]     ),
    .weight_data    (windows_conv[ 6]   ),
    .output_data    (out_reg[ 6]    )
);

mult_2 #(
    .DATA_WIDTH(DATA_WIDTH),
    .INPUT_NUM(INPUT_NUM)
)mult2_3(
    .clk    (clk            ),
    .input_data     (memory[13]     ),
    .weight_data    (windows_conv[ 7]   ),
    .output_data    (out_reg[ 7]    )
);

mult_2 #(
    .DATA_WIDTH(DATA_WIDTH),
    .INPUT_NUM(INPUT_NUM)
)mult3_3(
    .clk    (clk            ),
    .input_data      (memory[18]     ),
    .weight_data     (windows_conv[ 8]   ),
    .output_data     (out_reg[ 8]    )
);

mult_2 #(
    .DATA_WIDTH(DATA_WIDTH),
    .INPUT_NUM(INPUT_NUM)
)mult4_3(
    .clk    (clk            ),
    .input_data     (memory[23]     ),
    .weight_data    (windows_conv[ 9]   ),
    .output_data    (out_reg[ 9]    )
);

//column 2
mult_2 #(
    .DATA_WIDTH(DATA_WIDTH),
    .INPUT_NUM(INPUT_NUM)
)mult0_2(
    .clk    (clk            ),
    .input_data     (memory[2]     ),
    .weight_data    (windows_conv[10]   ),
    .output_data    (out_reg[10]    )
);

mult_2 #(
    .DATA_WIDTH(DATA_WIDTH),
    .INPUT_NUM(INPUT_NUM)
)mult1_2(
    .clk    (clk            ),
    .input_data     (memory[7]     ),
    .weight_data    (windows_conv[11]   ),
    .output_data    (out_reg[11]    )
);

mult_2 #(
    .DATA_WIDTH(DATA_WIDTH),
    .INPUT_NUM(INPUT_NUM)
)mult2_2(
    .clk    (clk            ),
    .input_data      (memory[12]     ),
    .weight_data     (windows_conv[12]   ),
    .output_data     (out_reg[12]    )
);

mult_2 #(
    .DATA_WIDTH(DATA_WIDTH),
    .INPUT_NUM(INPUT_NUM)
)mult3_2(
    .clk    (clk            ),
    .input_data     (memory[17]    ),
    .weight_data    (windows_conv[13]   ),
    .output_data    (out_reg[13]    )
);

mult_2 #(
    .DATA_WIDTH(DATA_WIDTH),
    .INPUT_NUM(INPUT_NUM)
)mult4_2(
    .clk    (clk            ),
    .input_data     (memory[22]     ),
    .weight_data    (windows_conv[14]   ),
    .output_data    (out_reg[14]    )
);

// column 3
mult_2 #(
    .DATA_WIDTH(DATA_WIDTH),
    .INPUT_NUM(INPUT_NUM)
)mult0_1(
    .clk    (clk            ),
    .input_data      (memory[1]     ),
    .weight_data     (windows_conv[15]   ),
    .output_data     (out_reg[15]    )
);

mult_2 #(
    .DATA_WIDTH(DATA_WIDTH),
    .INPUT_NUM(INPUT_NUM)
)mult1_1(
    .clk    (clk            ),
    .input_data      (memory[6]     ),
    .weight_data     (windows_conv[16]   ),
    .output_data     (out_reg[16]    )
);

mult_2 #(
    .DATA_WIDTH(DATA_WIDTH),
    .INPUT_NUM(INPUT_NUM)
)mult2_1(
    .clk    (clk            ),
    .input_data      (memory[11]     ),
    .weight_data     (windows_conv[17]   ),
    .output_data     (out_reg[17]    )
);

mult_2 #(
    .DATA_WIDTH(DATA_WIDTH),
    .INPUT_NUM(INPUT_NUM)
)mult3_1(
    .clk    (clk            ),
    .input_data      (memory[16]     ),
    .weight_data     (windows_conv[18]   ),
    .output_data     (out_reg[18]    )
);

mult_2 #(
    .DATA_WIDTH(DATA_WIDTH),
    .INPUT_NUM(INPUT_NUM)
)mult4_1(
    .clk    (clk            ),
    .input_data     (memory[21]     ),
    .weight_data    (windows_conv[19]   ),
    .output_data    (out_reg[19]    )
);

// column 4
mult_2 #(
    .DATA_WIDTH(DATA_WIDTH),
    .INPUT_NUM(INPUT_NUM)
)mult0_0(
    .clk    (clk            ),
    .input_data     (memory[0]     ),
    .weight_data    (windows_conv[20]   ),
    .output_data    (out_reg[20]    )
);

mult_2 #(
    .DATA_WIDTH(DATA_WIDTH),
    .INPUT_NUM(INPUT_NUM)
)mult1_0(
    .clk    (clk            ),
    .input_data     (memory[5]     ),
    .weight_data    (windows_conv[21]   ),
    .output_data    (out_reg[21]    )
);

mult_2 #(
    .DATA_WIDTH(DATA_WIDTH),
    .INPUT_NUM(INPUT_NUM)
)mult2_0(
    .clk    (clk            ),
    .input_data     (memory[10]     ),
    .weight_data    (windows_conv[22]   ),
    .output_data    (out_reg[22]    )
);

mult_2 #(
    .DATA_WIDTH(DATA_WIDTH),
    .INPUT_NUM(INPUT_NUM)
)mult3_0(
    .clk    (clk            ),
    .input_data     (memory[15]     ),
    .weight_data    (windows_conv[23]   ),
    .output_data    (out_reg[23]    )
);

mult_2 #(
    .DATA_WIDTH(DATA_WIDTH),
    .INPUT_NUM(INPUT_NUM)
)mult4_0(
    .clk    (clk            ),
    .input_data      (memory[20]     ),
    .weight_data     (windows_conv[24]   ),
    .output_data     (out_reg[24]    )
);
endmodule
