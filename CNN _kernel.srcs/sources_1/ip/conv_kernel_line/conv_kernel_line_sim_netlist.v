// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Sat Jun 29 13:05:28 2024
// Host        : wushen running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {d:/data/data/24/ZYNQ/CNN _kernel/CNN
//               _kernel.srcs/sources_1/ip/conv_kernel_line/conv_kernel_line_sim_netlist.v}
// Design      : conv_kernel_line
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "conv_kernel_line,c_shift_ram_v12_0_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_shift_ram_v12_0_12,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module conv_kernel_line
   (D,
    CLK,
    CE,
    SCLR,
    Q);
  (* x_interface_info = "xilinx.com:signal:data:1.0 d_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME d_intf, LAYERED_METADATA undef" *) input [15:0]D;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:sinit_intf:sset_intf:d_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_LOW" *) input CE;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* x_interface_parameter = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA undef" *) output [15:0]Q;

  wire CE;
  wire CLK;
  wire [15:0]D;
  wire [15:0]Q;
  wire SCLR;

  (* C_AINIT_VAL = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_SINIT_VAL = "0000000000000000" *) 
  (* C_SYNC_ENABLE = "0" *) 
  (* C_SYNC_PRIORITY = "1" *) 
  (* C_WIDTH = "16" *) 
  (* c_addr_width = "4" *) 
  (* c_default_data = "0" *) 
  (* c_depth = "32" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_a = "0" *) 
  (* c_mem_init_file = "no_coe_file_loaded" *) 
  (* c_opt_goal = "0" *) 
  (* c_parser_type = "0" *) 
  (* c_read_mif = "0" *) 
  (* c_reg_last_bit = "1" *) 
  (* c_shift_type = "0" *) 
  (* c_verbosity = "0" *) 
  (* c_xdevicefamily = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  conv_kernel_line_c_shift_ram_v12_0_12 U0
       (.A({1'b0,1'b0,1'b0,1'b0}),
        .CE(CE),
        .CLK(CLK),
        .D(D),
        .Q(Q),
        .SCLR(SCLR),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_ADDR_WIDTH = "4" *) (* C_AINIT_VAL = "0" *) (* C_DEFAULT_DATA = "0" *) 
(* C_DEPTH = "32" *) (* C_ELABORATION_DIR = "./" *) (* C_HAS_A = "0" *) 
(* C_HAS_CE = "1" *) (* C_HAS_SCLR = "1" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_MEM_INIT_FILE = "no_coe_file_loaded" *) (* C_OPT_GOAL = "0" *) 
(* C_PARSER_TYPE = "0" *) (* C_READ_MIF = "0" *) (* C_REG_LAST_BIT = "1" *) 
(* C_SHIFT_TYPE = "0" *) (* C_SINIT_VAL = "0000000000000000" *) (* C_SYNC_ENABLE = "0" *) 
(* C_SYNC_PRIORITY = "1" *) (* C_VERBOSITY = "0" *) (* C_WIDTH = "16" *) 
(* C_XDEVICEFAMILY = "zynq" *) (* ORIG_REF_NAME = "c_shift_ram_v12_0_12" *) (* downgradeipidentifiedwarnings = "yes" *) 
module conv_kernel_line_c_shift_ram_v12_0_12
   (A,
    D,
    CLK,
    CE,
    SCLR,
    SSET,
    SINIT,
    Q);
  input [3:0]A;
  input [15:0]D;
  input CLK;
  input CE;
  input SCLR;
  input SSET;
  input SINIT;
  output [15:0]Q;

  wire CE;
  wire CLK;
  wire [15:0]D;
  wire [15:0]Q;
  wire SCLR;

  (* C_AINIT_VAL = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_SINIT_VAL = "0000000000000000" *) 
  (* C_SYNC_ENABLE = "0" *) 
  (* C_SYNC_PRIORITY = "1" *) 
  (* C_WIDTH = "16" *) 
  (* c_addr_width = "4" *) 
  (* c_default_data = "0" *) 
  (* c_depth = "32" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_a = "0" *) 
  (* c_mem_init_file = "no_coe_file_loaded" *) 
  (* c_opt_goal = "0" *) 
  (* c_parser_type = "0" *) 
  (* c_read_mif = "0" *) 
  (* c_reg_last_bit = "1" *) 
  (* c_shift_type = "0" *) 
  (* c_verbosity = "0" *) 
  (* c_xdevicefamily = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  conv_kernel_line_c_shift_ram_v12_0_12_viv i_synth
       (.A({1'b0,1'b0,1'b0,1'b0}),
        .CE(CE),
        .CLK(CLK),
        .D(D),
        .Q(Q),
        .SCLR(SCLR),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
PkyhyBb59EPgq8kANKUgNUvJSxwVgcYTKLlfXroHeM6zPnPHm+ATuJPY2OmCojZnDY2A6SHiMUmx
ylnsx6jVAA==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
XgKClVpS+h3z22aTgNZepCZW5Yffl4m6nNLRjY88G0b6Og6dF7wA3of30X3Vr2BKX5GVSe+jeu6a
q3D7Qa0T3sEnO1qnWdbom/P31G6nS7/pQCPaLh+suxznQX2imRfhfTkmY1B9wExxZtZBbss2GPfs
EFGX8a+efiUiZLAKaSE=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
LYMHL9qwz9VPPAbHAyLFK1YM6t0YBJUbhdak6y3IQta7KscLfLakFo9QXv7rXKj3R5WEjx6Vg+9K
QUgoa/uCYy+n2t004DDpVeDamNuGIrJU3WXV9mo6tEi21Rm+kIG+CFgVuqLY9JSjwI3dhmEqYYtS
wC2GIO6hKaV0keq1ldvsRFBu71kLY+jczboTe6EddpUktWp3UM/RqnrSfHPMlZWhHp1k3YC0SDq9
gvcPn9DB3vIjXgn+xRbyzZOt/j+s8RfjF446i2RalkF5p/den9o/OMG5jmv4rZKHj9S1V3Z2UuL1
c2fxe26sNIvZ7tpz8RHVWRMloPfcPVakam2zhg==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BACIRg239ZSAZHpsLobWk7IZyWSAM1rsaZq5LesIgnba07iijhvT5s8WIOIIgHZs1XEDKelSnU1J
+5cyEbU9WgPZsja6FQEw6J0GuN3L/1QyrvmNIJKsNXINx7R+xaY/n0uby2eFsFE9luplvdOyrCEw
eK82BghXwPdasTT1ZUgKiycyGYtNsp5ZaPIWXI9ezN9oHowcWp7Mn6v2jrdDl4lzJuoHgqRtkZvG
7GqevJFheGfXkRPuQGkNK2Pk6XN9woSB1a9C+FUsQBM5MlIE7zrBQAjONIQj/nd82Hlp1H4PRxBW
1mmFP7PskMeNR2hH5xwkvg4Q3IfYBlw8gdzneg==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2017_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
vUWbACu3JL9XeVH21XChN1bLnACIM0U/dLRQNf2LGaDFNW9CL0o3SY9pOtV226o71+9Eal6i7P4l
ht62RU2AHTweJsgWkXtQBI0/jHIw4/gxbBebNbqZM6m3qjEE5blPsuzJ1njoX2JWCJElO3p9FfRu
uHpC+4hYoccdFayGku3vk1gwz9lLJ4FcYG9mi1vLIY+tzs0o83THQ8dLrg50Rr/r2n0Xf4hxWe4U
tJ6iUOYBQUYjeOwNQOOxfjv5PKfLIgGA2WC8sJb2GFe9MkTDoMAo40nBLK0Y8+klDIJTyx079Bx0
wdRg2JxUF3+TGlXW98+2/iWy94H1CPEVRm18FQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VX8rVAT0l4oniSvb1X0sblwaqcWh2XE0oCAZbC0SVv8fCy8dLmmtqBzFq3w2V/7nyMmJzWKNP/yV
0GW7ICEfrGaBejU3VpwaHA69xE56Y/8NSHGlZOhr390/5/UqELcFOknZEPJXMLpeKjUn2ijACn/u
O0myDIvGFiUyRGWWYKM=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
dlKAt52rb1rebbUvCxUw/pmWR03F+be3vApC1VuekYTvk7BFt7xopdHrqsvoU8rgaCBc2wuCudx5
nUcu7bKEyHKFc6bcbp6J84c2uG0ZckyqBn/OHRMbmq4Vbar8C3ERI2YmcbL0Q0fBLzMosVarF9eM
+c6VfE9hA5lx9qpwFJhgk5v/yx6kjgu+kEnG+xsdWrpKrj8LIxxh6gkrPOn+jQtKQSX3o7q35Rcv
W3vWLRYdH+pHsfJqCdT0wL4oBTLa7ozdsufX9l6UDgT4ECxLf7R1TtNj7XA1jaaefThL0F1AUCjF
5WuhMqBOotpDZUmvB91yVtbXLMm0r85tK9b/iA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
putZsg5SITXoro/EYd1ghOSRAKSFWESL2WYYu8Bg1H3cyOg/m9GocY4Cg+ncR49lXZmcoHd8/b4X
qRPUK/56CGNO7CpoYG8LIzx7BV2mmXqWYvD+PhGo5uqE5jGVBTpUuwx2nvVXq4vPt675ynyVsRYW
rObDRYLVq8vE47AeK6y2GHhifYnhiwgecZd7kqujesAJ3yd5LnJ8QdYvRWfFBEPLtsrDrhtcCTjn
WUYH8oo2KFecuh4pqYSglKOUk+TzNx+Ccb7gYq7uP1cWHt8DypH4A5dD5OvMe+mnz+UUNxHJrB3Y
vRS/k9VvsH2x27NddU8j9P4gI11UnYv7uxRkRw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
x7aWDHDbDg66ybEniabpQF4fSyagCi3BEgg8A+h/hLWPmb2DFNlB+LRfrj1IjQPhXUux/rglBSXl
iegweyGXfK38llt9IRp8I05VYslJ5wbm4tzze23wqF82S2u3m1MhockiR4ZMzzkWUJc7BuXeUrPA
JFsYWRfbFx7gCqB3XIeHoE7J9w6obnROemY45IlUPFDYYHlD4ohYTwHHTGh2gr0u9X4KXMDmpmYS
7/ooLCNKZLxUGNS/EP8Val6KRtF370liG746/KSxsuiTKo2KtwBFCsx/tFCwdqqNHlq3Af51VMqn
M7OoLY8ddX3pV7zhCzSoV5h2Esp0uAkIynkwaA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 18000)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
