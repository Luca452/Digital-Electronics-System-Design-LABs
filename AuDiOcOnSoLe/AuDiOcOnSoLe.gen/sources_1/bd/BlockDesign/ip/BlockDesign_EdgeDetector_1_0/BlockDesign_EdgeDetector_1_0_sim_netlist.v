// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Mon May 22 00:06:43 2023
// Host        : DESKTOP-JKUPK39 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {c:/Users/daido/Desktop/Polimi/Anno
//               4/DESD/Git/KittCarPWM/AuDiOcOnSoLe/AuDiOcOnSoLe.gen/sources_1/bd/BlockDesign/ip/BlockDesign_EdgeDetector_1_0/BlockDesign_EdgeDetector_1_0_sim_netlist.v}
// Design      : BlockDesign_EdgeDetector_1_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "BlockDesign_EdgeDetector_1_0,EdgeDetector,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "EdgeDetector,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module BlockDesign_EdgeDetector_1_0
   (clk,
    rst,
    input_signal,
    output_signal);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0" *) input clk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 rst RST" *) (* x_interface_parameter = "XIL_INTERFACENAME rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input rst;
  input input_signal;
  output output_signal;

  wire clk;
  wire input_signal;
  wire output_signal;
  wire rst;

  BlockDesign_EdgeDetector_1_0_EdgeDetector U0
       (.clk(clk),
        .input_signal(input_signal),
        .output_signal(output_signal),
        .rst(rst));
endmodule

(* ORIG_REF_NAME = "EdgeDetector" *) 
module BlockDesign_EdgeDetector_1_0_EdgeDetector
   (output_signal,
    input_signal,
    clk,
    rst);
  output output_signal;
  input input_signal;
  input clk;
  input rst;

  wire clk;
  wire input_signal;
  wire input_signal_prec;
  wire output_signal;
  wire output_signal_i_1_n_0;
  wire output_signal_reg__0;
  wire output_signal_reg_i_1_n_0;
  wire rst;

  FDCE input_signal_prec_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(input_signal),
        .Q(input_signal_prec));
  LUT4 #(
    .INIT(16'hFB08)) 
    output_signal_i_1
       (.I0(output_signal_reg__0),
        .I1(input_signal),
        .I2(input_signal_prec),
        .I3(output_signal),
        .O(output_signal_i_1_n_0));
  FDCE output_signal_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(output_signal_i_1_n_0),
        .Q(output_signal));
  LUT4 #(
    .INIT(16'hFB04)) 
    output_signal_reg_i_1
       (.I0(rst),
        .I1(input_signal),
        .I2(input_signal_prec),
        .I3(output_signal_reg__0),
        .O(output_signal_reg_i_1_n_0));
  FDRE #(
    .INIT(1'b1)) 
    output_signal_reg_reg
       (.C(clk),
        .CE(1'b1),
        .D(output_signal_reg_i_1_n_0),
        .Q(output_signal_reg__0),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
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
    reg GRESTORE_int;

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
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

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

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
