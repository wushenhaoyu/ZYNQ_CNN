// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Sat Jun 29 13:05:27 2024
// Host        : wushen running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ conv_kernel_line_sim_netlist.v
// Design      : conv_kernel_line
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "conv_kernel_line,c_shift_ram_v12_0_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_shift_ram_v12_0_12,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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

(* C_ADDR_WIDTH = "4" *) (* C_AINIT_VAL = "0" *) (* C_DEFAULT_DATA = "0" *) 
(* C_DEPTH = "32" *) (* C_ELABORATION_DIR = "./" *) (* C_HAS_A = "0" *) 
(* C_HAS_CE = "1" *) (* C_HAS_SCLR = "1" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_MEM_INIT_FILE = "no_coe_file_loaded" *) (* C_OPT_GOAL = "0" *) 
(* C_PARSER_TYPE = "0" *) (* C_READ_MIF = "0" *) (* C_REG_LAST_BIT = "1" *) 
(* C_SHIFT_TYPE = "0" *) (* C_SINIT_VAL = "0000000000000000" *) (* C_SYNC_ENABLE = "0" *) 
(* C_SYNC_PRIORITY = "1" *) (* C_VERBOSITY = "0" *) (* C_WIDTH = "16" *) 
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
bCVjlPykiExCYy/fpA/0Q1gwbVe8LkqSXzz6j3EON3L7BoVGUVuH3CNfenmaElGYk4XQq2BrC4dI
UD9tB3y181UFf644vZEKzkyIljGmJ2hf06UvAANtwy/vgjiuzhmRZPSl/ogxQYjAowi/KdcMCKWd
DsY4jieKM9wiCRmeIyL7D+Z3WEEuFQXCx72jMbjvj64i4jX5Y6aLkP6GFMdTSTw8meAU7b0eRyNQ
/eqN+C9ltX7JutOF78+pWimTnhOewBrFjOoQrJezOemViAi1aZnC1AxyyQfh9oTe85vm7w/4/wWp
Q+fKcB7gTVmsq6jNdXdGWgJKBJak6aPu5+hizA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BvQ30lQZ4043bSpSOhQ2KmUK6EZYzXCM6HAuc33fpnWCSpmzww4DvURHlsbLOWrx53yrFgjRG8vg
RK4C3o1dmQHSZXAr2+kLjkwtuWp+q/UJW8hsXb0YmZtJH7+IynTRXZ/jtO0qRMzZP2Mqxe1TYhDL
wQQWahfAlOhg7EIa7Kn9BccRV49VIN71jv+U04lRbFZnXzk62wsrZRLo4fGUUMEARV6tQv2xonQx
bAxFuWsZ3C4JswILMUFSf/5FBGJ9MHM+osaDBeghW/oq/mU1uWJd+X3/4Rsd2ao8OhKwEiRm9iK/
PSO2886wb1tK1ShH6dci1IoaxyAWyU+oOi41ag==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 17968)
`pragma protect data_block
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
uzM0xxchuqkUpBVWPQ==
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
