-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Sun Jun 30 09:59:17 2024
-- Host        : wushen running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub {D:/data/data/24/ZYNQ/CNN _kernel/CNN
--               _kernel.srcs/sources_1/ip/average_pooling_kernel_line/average_pooling_kernel_line_stub.vhdl}
-- Design      : average_pooling_kernel_line
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity average_pooling_kernel_line is
  Port ( 
    D : in STD_LOGIC_VECTOR ( 32 downto 0 );
    CLK : in STD_LOGIC;
    CE : in STD_LOGIC;
    SCLR : in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 32 downto 0 )
  );

end average_pooling_kernel_line;

architecture stub of average_pooling_kernel_line is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "D[32:0],CLK,CE,SCLR,Q[32:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "c_shift_ram_v12_0_12,Vivado 2018.3";
begin
end;
