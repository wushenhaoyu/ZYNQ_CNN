// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Sun Jun 30 09:59:17 2024
// Host        : wushen running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {D:/data/data/24/ZYNQ/CNN _kernel/CNN
//               _kernel.srcs/sources_1/ip/average_pooling_kernel_line/average_pooling_kernel_line_sim_netlist.v}
// Design      : average_pooling_kernel_line
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "average_pooling_kernel_line,c_shift_ram_v12_0_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_shift_ram_v12_0_12,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module average_pooling_kernel_line
   (D,
    CLK,
    CE,
    SCLR,
    Q);
  (* x_interface_info = "xilinx.com:signal:data:1.0 d_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME d_intf, LAYERED_METADATA undef" *) input [32:0]D;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:sinit_intf:sset_intf:d_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_LOW" *) input CE;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* x_interface_parameter = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA undef" *) output [32:0]Q;

  wire CE;
  wire CLK;
  wire [32:0]D;
  wire [32:0]Q;
  wire SCLR;

  (* C_AINIT_VAL = "000000000000000000000000000000000" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_SINIT_VAL = "000000000000000000000000000000000" *) 
  (* C_SYNC_ENABLE = "0" *) 
  (* C_SYNC_PRIORITY = "1" *) 
  (* C_WIDTH = "33" *) 
  (* c_addr_width = "4" *) 
  (* c_default_data = "000000000000000000000000000000000" *) 
  (* c_depth = "28" *) 
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
  average_pooling_kernel_line_c_shift_ram_v12_0_12 U0
       (.A({1'b0,1'b0,1'b0,1'b0}),
        .CE(CE),
        .CLK(CLK),
        .D(D),
        .Q(Q),
        .SCLR(SCLR),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_ADDR_WIDTH = "4" *) (* C_AINIT_VAL = "000000000000000000000000000000000" *) (* C_DEFAULT_DATA = "000000000000000000000000000000000" *) 
(* C_DEPTH = "28" *) (* C_ELABORATION_DIR = "./" *) (* C_HAS_A = "0" *) 
(* C_HAS_CE = "1" *) (* C_HAS_SCLR = "1" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_MEM_INIT_FILE = "no_coe_file_loaded" *) (* C_OPT_GOAL = "0" *) 
(* C_PARSER_TYPE = "0" *) (* C_READ_MIF = "0" *) (* C_REG_LAST_BIT = "1" *) 
(* C_SHIFT_TYPE = "0" *) (* C_SINIT_VAL = "000000000000000000000000000000000" *) (* C_SYNC_ENABLE = "0" *) 
(* C_SYNC_PRIORITY = "1" *) (* C_VERBOSITY = "0" *) (* C_WIDTH = "33" *) 
(* C_XDEVICEFAMILY = "zynq" *) (* ORIG_REF_NAME = "c_shift_ram_v12_0_12" *) (* downgradeipidentifiedwarnings = "yes" *) 
module average_pooling_kernel_line_c_shift_ram_v12_0_12
   (A,
    D,
    CLK,
    CE,
    SCLR,
    SSET,
    SINIT,
    Q);
  input [3:0]A;
  input [32:0]D;
  input CLK;
  input CE;
  input SCLR;
  input SSET;
  input SINIT;
  output [32:0]Q;

  wire CE;
  wire CLK;
  wire [32:0]D;
  wire [32:0]Q;
  wire SCLR;

  (* C_AINIT_VAL = "000000000000000000000000000000000" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_SINIT_VAL = "000000000000000000000000000000000" *) 
  (* C_SYNC_ENABLE = "0" *) 
  (* C_SYNC_PRIORITY = "1" *) 
  (* C_WIDTH = "33" *) 
  (* c_addr_width = "4" *) 
  (* c_default_data = "000000000000000000000000000000000" *) 
  (* c_depth = "28" *) 
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
  average_pooling_kernel_line_c_shift_ram_v12_0_12_viv i_synth
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
BlMYjGFpsPxZLgG5A79u1nqaNW7pST3fUrcHl4+vBnF7foBwUSlKG21z7Erl2fMbqWAgnP+aOc4d
EzlyRKRLg9LlsLm+xNjxNpRrhk8AhCY2AEJ1B8QeYCkyidnr+RQyMABZOe/iGvXM79hc4TbvAYJA
DWdzvqKbYpMLItwZc5PXaEPuhSm4uPCotyfU9+3HOEyHLckrmmzNB09E6QQsiAb9+JLpirETc/+T
r/gLaaOQ3OJK+RAjZCRMuyslANPm0D5UHUMi5jFbuKmraXZJAIBGldtMQkAFUm+FnmXVcwUDJJnI
WQbZY8fPmRD6FpCS5POsckrwNz9O6zp8NTQPRA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
zSb/CWg2yrQxk2+h+VGR0oH/QAVS0lhWdn4TOS3ObP9acgswmZljzESIo5Yv9/9856RCDbDiT9+l
0p4RuxZ5KAphkH1CqF62g+8kIguAiD3vAFE44SBjDW/kJ4aBh9cVlsW0IZp7dGKvEIWUuiv6yMxC
JPFvD9/AEHOtDIhhIsDxA4jySo5aOEewgM+2W6jfPb0p940O/ZArTfNVIrPRzMo3mbFhwY1H054k
6HJTFTerpcTMyoY08UIsP5/VaW6j2MRLxfZZ1QOb8RU/vdwp/FmlVeIBw7Tp2v4qK5pHNQkyA81F
4eyJjbP+PZqGictv73zuWLPqbfgwpSAyQzYwjQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 32992)
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
