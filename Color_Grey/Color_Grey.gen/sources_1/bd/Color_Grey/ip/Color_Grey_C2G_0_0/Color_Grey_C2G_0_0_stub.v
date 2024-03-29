// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Wed Mar 29 23:30:31 2023
// Host        : DESKTOP-JKUPK39 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {c:/Users/daido/Desktop/Polimi/Anno
//               4/DESD/LAB2/Color_Grey/Color_Grey.gen/sources_1/bd/Color_Grey/ip/Color_Grey_C2G_0_0/Color_Grey_C2G_0_0_stub.v}
// Design      : Color_Grey_C2G_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "C2G,Vivado 2020.2" *)
module Color_Grey_C2G_0_0(clk, resetn, s_axis_tvalid, s_axis_tdata, 
  s_axis_tready, m_axis_tvalid, m_axis_tdata, m_axis_tready)
/* synthesis syn_black_box black_box_pad_pin="clk,resetn,s_axis_tvalid,s_axis_tdata[7:0],s_axis_tready,m_axis_tvalid,m_axis_tdata[7:0],m_axis_tready" */;
  input clk;
  input resetn;
  input s_axis_tvalid;
  input [7:0]s_axis_tdata;
  output s_axis_tready;
  output m_axis_tvalid;
  output [7:0]m_axis_tdata;
  input m_axis_tready;
endmodule
