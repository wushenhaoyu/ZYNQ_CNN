// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Sat Jun 29 13:05:28 2024
// Host        : wushen running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {d:/data/data/24/ZYNQ/CNN _kernel/CNN
//               _kernel.srcs/sources_1/ip/conv_kernel_line/conv_kernel_line_stub.v}
// Design      : conv_kernel_line
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "c_shift_ram_v12_0_12,Vivado 2018.3" *)
module conv_kernel_line(D, CLK, CE, SCLR, Q)
/* synthesis syn_black_box black_box_pad_pin="D[15:0],CLK,CE,SCLR,Q[15:0]" */;
  input [15:0]D;
  input CLK;
  input CE;
  input SCLR;
  output [15:0]Q;
endmodule
