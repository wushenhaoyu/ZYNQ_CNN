// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Sun Jun 30 09:59:17 2024
// Host        : wushen running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ average_pooling_kernel_line_sim_netlist.v
// Design      : average_pooling_kernel_line
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "average_pooling_kernel_line,c_shift_ram_v12_0_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_shift_ram_v12_0_12,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_shift_ram_v12_0_12 U0
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
(* C_XDEVICEFAMILY = "zynq" *) (* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_shift_ram_v12_0_12
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_shift_ram_v12_0_12_viv i_synth
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
LGlFEpYJqoHPCsKHaoKJBvA+ovtT1x+oxmwVNwGNFUuTh+Nmpm/+peoAgs5QhmQZu5nj8jLZvAId
CqVSxxIH3CERjNEh2W3sUFkSIaopw/WDIyHV+EPZt78XF82KhPFHvAbO3WFq5IUYx2nhxMwty84N
4Tt28V5RjuNtRhIzY9iyWIgGb3xtCheC/K1y68VxTBg7l77JO5qSNEsZoTIpwMNe804jndZNmLer
UEGy4KKaX0c/I4MeWZfXBpSJrfbTVnf24XU7zt2JIvpe1tkI6iP71lW3S1yhjKca2COWuJOElN9s
uS2pZauXm4r43GspdZDOUu+XtO2ejnzYoZB9Qw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
wQCkXA/vtlLEt5PjN0453/+S69zA5g8ITV88yFF/HK4UTQI546vnMJseu/GrtLk5dRtcPETuQlf1
OELO06Uu/7Nnh1uFGkspCxiwh9xCT9ZD4H3pTHnszMaaArcYCs356D8ROzrM5KRIL7nc9uKdz91X
hJrb1jr1c/T4CGhXHZBKR36s2U512UjxlUKPC7axMskH6I0EUJYqZ0WOArKZzUazbqDYqURU7T5g
hf/WH+LK7BvdTh41SlRvPxJTkHkJX+2HkTsMNy0b+1hZi+pIBwxFSFnDIGTcZONUz8yd+L7Jkj3z
+TpWn4TkmjoTKpcHv91WngNN7X6dw+KfdSTATw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 32912)
`pragma protect data_block
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
zXJxMxuOJBbFN7piDtaEwHj7jeEULDE=
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
