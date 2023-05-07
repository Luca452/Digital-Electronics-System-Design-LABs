-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Sun May  7 13:56:32 2023
-- Host        : DESKTOP-JKUPK39 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim {c:/Users/daido/Desktop/Polimi/Anno
--               4/DESD/Git/KittCarPWM/AuDiOcOnSoLe/AuDiOcOnSoLe.gen/sources_1/bd/BlockDesign/ip/BlockDesign_EdgeDetector_1_0/BlockDesign_EdgeDetector_1_0_sim_netlist.vhdl}
-- Design      : BlockDesign_EdgeDetector_1_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity BlockDesign_EdgeDetector_1_0_EdgeDetector is
  port (
    output_signal : out STD_LOGIC;
    input_signal : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of BlockDesign_EdgeDetector_1_0_EdgeDetector : entity is "EdgeDetector";
end BlockDesign_EdgeDetector_1_0_EdgeDetector;

architecture STRUCTURE of BlockDesign_EdgeDetector_1_0_EdgeDetector is
  signal input_signal_prec : STD_LOGIC;
  signal output_signal_i_1_n_0 : STD_LOGIC;
begin
input_signal_prec_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => input_signal,
      Q => input_signal_prec
    );
output_signal_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => input_signal,
      I1 => input_signal_prec,
      O => output_signal_i_1_n_0
    );
output_signal_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => output_signal_i_1_n_0,
      Q => output_signal
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity BlockDesign_EdgeDetector_1_0 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    input_signal : in STD_LOGIC;
    output_signal : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of BlockDesign_EdgeDetector_1_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of BlockDesign_EdgeDetector_1_0 : entity is "BlockDesign_EdgeDetector_1_0,EdgeDetector,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of BlockDesign_EdgeDetector_1_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of BlockDesign_EdgeDetector_1_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of BlockDesign_EdgeDetector_1_0 : entity is "EdgeDetector,Vivado 2020.2";
end BlockDesign_EdgeDetector_1_0;

architecture STRUCTURE of BlockDesign_EdgeDetector_1_0 is
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0";
  attribute x_interface_info of rst : signal is "xilinx.com:signal:reset:1.0 rst RST";
  attribute x_interface_parameter of rst : signal is "XIL_INTERFACENAME rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0";
begin
U0: entity work.BlockDesign_EdgeDetector_1_0_EdgeDetector
     port map (
      clk => clk,
      input_signal => input_signal,
      output_signal => output_signal,
      rst => rst
    );
end STRUCTURE;
