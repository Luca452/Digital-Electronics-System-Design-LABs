// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Mon May 22 00:07:48 2023
// Host        : DESKTOP-JKUPK39 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ BlockDesign_Debouncer_0_0_sim_netlist.v
// Design      : BlockDesign_Debouncer_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "BlockDesign_Debouncer_0_0,Debouncer,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "Debouncer,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clk,
    reset,
    input_signal,
    debounced);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, ASSOCIATED_RESET reset, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0" *) input clk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 reset RST" *) (* x_interface_parameter = "XIL_INTERFACENAME reset, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input reset;
  input input_signal;
  output debounced;

  wire clk;
  wire debounced;
  wire input_signal;
  wire reset;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_Debouncer U0
       (.clk(clk),
        .debounced(debounced),
        .input_signal(input_signal),
        .reset(reset));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_Debouncer
   (debounced,
    clk,
    reset,
    input_signal);
  output debounced;
  input clk;
  input reset;
  input input_signal;

  wire clk;
  wire [16:0]counter;
  wire counter0_carry__0_i_1_n_0;
  wire counter0_carry__0_i_2_n_0;
  wire counter0_carry__0_i_3_n_0;
  wire counter0_carry__0_i_4_n_0;
  wire counter0_carry__0_n_0;
  wire counter0_carry__0_n_1;
  wire counter0_carry__0_n_2;
  wire counter0_carry__0_n_3;
  wire counter0_carry__1_i_1_n_0;
  wire counter0_carry__1_i_2_n_0;
  wire counter0_carry__1_i_3_n_0;
  wire counter0_carry__1_i_4_n_0;
  wire counter0_carry__1_n_0;
  wire counter0_carry__1_n_1;
  wire counter0_carry__1_n_2;
  wire counter0_carry__1_n_3;
  wire counter0_carry__2_i_1_n_0;
  wire counter0_carry__2_i_2_n_0;
  wire counter0_carry__2_i_3_n_0;
  wire counter0_carry__2_i_4_n_0;
  wire counter0_carry__2_n_1;
  wire counter0_carry__2_n_2;
  wire counter0_carry__2_n_3;
  wire counter0_carry_i_1_n_0;
  wire counter0_carry_i_2_n_0;
  wire counter0_carry_i_3_n_0;
  wire counter0_carry_i_4_n_0;
  wire counter0_carry_n_0;
  wire counter0_carry_n_1;
  wire counter0_carry_n_2;
  wire counter0_carry_n_3;
  wire \counter[0]_i_1_n_0 ;
  wire \counter[10]_i_1_n_0 ;
  wire \counter[11]_i_1_n_0 ;
  wire \counter[12]_i_1_n_0 ;
  wire \counter[13]_i_1_n_0 ;
  wire \counter[14]_i_1_n_0 ;
  wire \counter[15]_i_1_n_0 ;
  wire \counter[16]_i_2_n_0 ;
  wire \counter[16]_i_3_n_0 ;
  wire \counter[16]_i_4_n_0 ;
  wire \counter[16]_i_5_n_0 ;
  wire \counter[16]_i_6_n_0 ;
  wire \counter[16]_i_7_n_0 ;
  wire \counter[1]_i_1_n_0 ;
  wire \counter[2]_i_1_n_0 ;
  wire \counter[3]_i_1_n_0 ;
  wire \counter[4]_i_1_n_0 ;
  wire \counter[5]_i_1_n_0 ;
  wire \counter[6]_i_1_n_0 ;
  wire \counter[7]_i_1_n_0 ;
  wire \counter[8]_i_1_n_0 ;
  wire \counter[9]_i_1_n_0 ;
  wire counter_0;
  wire [16:1]data0;
  wire debounced;
  wire debounced_int_C_i_1_n_0;
  wire debounced_int_reg_C_n_0;
  wire debounced_int_reg_LDC_i_1_n_0;
  wire debounced_int_reg_LDC_i_2_n_0;
  wire debounced_int_reg_LDC_n_0;
  wire debounced_int_reg_P_n_0;
  wire input_signal;
  wire reset;
  wire [3:3]NLW_counter0_carry__2_CO_UNCONNECTED;

  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter0_carry
       (.CI(1'b0),
        .CO({counter0_carry_n_0,counter0_carry_n_1,counter0_carry_n_2,counter0_carry_n_3}),
        .CYINIT(counter[0]),
        .DI(counter[4:1]),
        .O(data0[4:1]),
        .S({counter0_carry_i_1_n_0,counter0_carry_i_2_n_0,counter0_carry_i_3_n_0,counter0_carry_i_4_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter0_carry__0
       (.CI(counter0_carry_n_0),
        .CO({counter0_carry__0_n_0,counter0_carry__0_n_1,counter0_carry__0_n_2,counter0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI(counter[8:5]),
        .O(data0[8:5]),
        .S({counter0_carry__0_i_1_n_0,counter0_carry__0_i_2_n_0,counter0_carry__0_i_3_n_0,counter0_carry__0_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    counter0_carry__0_i_1
       (.I0(counter[8]),
        .O(counter0_carry__0_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    counter0_carry__0_i_2
       (.I0(counter[7]),
        .O(counter0_carry__0_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    counter0_carry__0_i_3
       (.I0(counter[6]),
        .O(counter0_carry__0_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    counter0_carry__0_i_4
       (.I0(counter[5]),
        .O(counter0_carry__0_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter0_carry__1
       (.CI(counter0_carry__0_n_0),
        .CO({counter0_carry__1_n_0,counter0_carry__1_n_1,counter0_carry__1_n_2,counter0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI(counter[12:9]),
        .O(data0[12:9]),
        .S({counter0_carry__1_i_1_n_0,counter0_carry__1_i_2_n_0,counter0_carry__1_i_3_n_0,counter0_carry__1_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    counter0_carry__1_i_1
       (.I0(counter[12]),
        .O(counter0_carry__1_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    counter0_carry__1_i_2
       (.I0(counter[11]),
        .O(counter0_carry__1_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    counter0_carry__1_i_3
       (.I0(counter[10]),
        .O(counter0_carry__1_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    counter0_carry__1_i_4
       (.I0(counter[9]),
        .O(counter0_carry__1_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter0_carry__2
       (.CI(counter0_carry__1_n_0),
        .CO({NLW_counter0_carry__2_CO_UNCONNECTED[3],counter0_carry__2_n_1,counter0_carry__2_n_2,counter0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,counter[15:13]}),
        .O(data0[16:13]),
        .S({counter0_carry__2_i_1_n_0,counter0_carry__2_i_2_n_0,counter0_carry__2_i_3_n_0,counter0_carry__2_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    counter0_carry__2_i_1
       (.I0(counter[16]),
        .O(counter0_carry__2_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    counter0_carry__2_i_2
       (.I0(counter[15]),
        .O(counter0_carry__2_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    counter0_carry__2_i_3
       (.I0(counter[14]),
        .O(counter0_carry__2_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    counter0_carry__2_i_4
       (.I0(counter[13]),
        .O(counter0_carry__2_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    counter0_carry_i_1
       (.I0(counter[4]),
        .O(counter0_carry_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    counter0_carry_i_2
       (.I0(counter[3]),
        .O(counter0_carry_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    counter0_carry_i_3
       (.I0(counter[2]),
        .O(counter0_carry_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    counter0_carry_i_4
       (.I0(counter[1]),
        .O(counter0_carry_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \counter[0]_i_1 
       (.I0(counter[0]),
        .O(\counter[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \counter[10]_i_1 
       (.I0(data0[10]),
        .I1(\counter[16]_i_3_n_0 ),
        .O(\counter[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \counter[11]_i_1 
       (.I0(\counter[16]_i_3_n_0 ),
        .I1(data0[11]),
        .O(\counter[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \counter[12]_i_1 
       (.I0(\counter[16]_i_3_n_0 ),
        .I1(data0[12]),
        .O(\counter[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \counter[13]_i_1 
       (.I0(\counter[16]_i_3_n_0 ),
        .I1(data0[13]),
        .O(\counter[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \counter[14]_i_1 
       (.I0(\counter[16]_i_3_n_0 ),
        .I1(data0[14]),
        .O(\counter[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \counter[15]_i_1 
       (.I0(data0[15]),
        .I1(\counter[16]_i_3_n_0 ),
        .O(\counter[15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF656A)) 
    \counter[16]_i_1 
       (.I0(input_signal),
        .I1(debounced_int_reg_P_n_0),
        .I2(debounced_int_reg_LDC_n_0),
        .I3(debounced_int_reg_C_n_0),
        .I4(\counter[16]_i_3_n_0 ),
        .O(counter_0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \counter[16]_i_2 
       (.I0(data0[16]),
        .I1(\counter[16]_i_3_n_0 ),
        .O(\counter[16]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \counter[16]_i_3 
       (.I0(\counter[16]_i_4_n_0 ),
        .I1(\counter[16]_i_5_n_0 ),
        .I2(\counter[16]_i_6_n_0 ),
        .I3(\counter[16]_i_7_n_0 ),
        .O(\counter[16]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \counter[16]_i_4 
       (.I0(counter[4]),
        .I1(counter[3]),
        .I2(counter[6]),
        .I3(counter[5]),
        .O(\counter[16]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \counter[16]_i_5 
       (.I0(counter[0]),
        .I1(counter[15]),
        .I2(counter[16]),
        .I3(counter[2]),
        .I4(counter[1]),
        .O(\counter[16]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \counter[16]_i_6 
       (.I0(counter[12]),
        .I1(counter[11]),
        .I2(counter[14]),
        .I3(counter[13]),
        .O(\counter[16]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \counter[16]_i_7 
       (.I0(counter[8]),
        .I1(counter[7]),
        .I2(counter[10]),
        .I3(counter[9]),
        .O(\counter[16]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \counter[1]_i_1 
       (.I0(data0[1]),
        .I1(\counter[16]_i_3_n_0 ),
        .O(\counter[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \counter[2]_i_1 
       (.I0(data0[2]),
        .I1(\counter[16]_i_3_n_0 ),
        .O(\counter[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \counter[3]_i_1 
       (.I0(data0[3]),
        .I1(\counter[16]_i_3_n_0 ),
        .O(\counter[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \counter[4]_i_1 
       (.I0(data0[4]),
        .I1(\counter[16]_i_3_n_0 ),
        .O(\counter[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \counter[5]_i_1 
       (.I0(\counter[16]_i_3_n_0 ),
        .I1(data0[5]),
        .O(\counter[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \counter[6]_i_1 
       (.I0(\counter[16]_i_3_n_0 ),
        .I1(data0[6]),
        .O(\counter[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \counter[7]_i_1 
       (.I0(data0[7]),
        .I1(\counter[16]_i_3_n_0 ),
        .O(\counter[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \counter[8]_i_1 
       (.I0(\counter[16]_i_3_n_0 ),
        .I1(data0[8]),
        .O(\counter[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \counter[9]_i_1 
       (.I0(data0[9]),
        .I1(\counter[16]_i_3_n_0 ),
        .O(\counter[9]_i_1_n_0 ));
  FDCE \counter_reg[0] 
       (.C(clk),
        .CE(counter_0),
        .CLR(reset),
        .D(\counter[0]_i_1_n_0 ),
        .Q(counter[0]));
  FDCE \counter_reg[10] 
       (.C(clk),
        .CE(counter_0),
        .CLR(reset),
        .D(\counter[10]_i_1_n_0 ),
        .Q(counter[10]));
  FDCE \counter_reg[11] 
       (.C(clk),
        .CE(counter_0),
        .CLR(reset),
        .D(\counter[11]_i_1_n_0 ),
        .Q(counter[11]));
  FDCE \counter_reg[12] 
       (.C(clk),
        .CE(counter_0),
        .CLR(reset),
        .D(\counter[12]_i_1_n_0 ),
        .Q(counter[12]));
  FDCE \counter_reg[13] 
       (.C(clk),
        .CE(counter_0),
        .CLR(reset),
        .D(\counter[13]_i_1_n_0 ),
        .Q(counter[13]));
  FDCE \counter_reg[14] 
       (.C(clk),
        .CE(counter_0),
        .CLR(reset),
        .D(\counter[14]_i_1_n_0 ),
        .Q(counter[14]));
  FDCE \counter_reg[15] 
       (.C(clk),
        .CE(counter_0),
        .CLR(reset),
        .D(\counter[15]_i_1_n_0 ),
        .Q(counter[15]));
  FDCE \counter_reg[16] 
       (.C(clk),
        .CE(counter_0),
        .CLR(reset),
        .D(\counter[16]_i_2_n_0 ),
        .Q(counter[16]));
  FDCE \counter_reg[1] 
       (.C(clk),
        .CE(counter_0),
        .CLR(reset),
        .D(\counter[1]_i_1_n_0 ),
        .Q(counter[1]));
  FDCE \counter_reg[2] 
       (.C(clk),
        .CE(counter_0),
        .CLR(reset),
        .D(\counter[2]_i_1_n_0 ),
        .Q(counter[2]));
  FDCE \counter_reg[3] 
       (.C(clk),
        .CE(counter_0),
        .CLR(reset),
        .D(\counter[3]_i_1_n_0 ),
        .Q(counter[3]));
  FDCE \counter_reg[4] 
       (.C(clk),
        .CE(counter_0),
        .CLR(reset),
        .D(\counter[4]_i_1_n_0 ),
        .Q(counter[4]));
  FDCE \counter_reg[5] 
       (.C(clk),
        .CE(counter_0),
        .CLR(reset),
        .D(\counter[5]_i_1_n_0 ),
        .Q(counter[5]));
  FDCE \counter_reg[6] 
       (.C(clk),
        .CE(counter_0),
        .CLR(reset),
        .D(\counter[6]_i_1_n_0 ),
        .Q(counter[6]));
  FDCE \counter_reg[7] 
       (.C(clk),
        .CE(counter_0),
        .CLR(reset),
        .D(\counter[7]_i_1_n_0 ),
        .Q(counter[7]));
  FDCE \counter_reg[8] 
       (.C(clk),
        .CE(counter_0),
        .CLR(reset),
        .D(\counter[8]_i_1_n_0 ),
        .Q(counter[8]));
  FDCE \counter_reg[9] 
       (.C(clk),
        .CE(counter_0),
        .CLR(reset),
        .D(\counter[9]_i_1_n_0 ),
        .Q(counter[9]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    debounced_INST_0
       (.I0(debounced_int_reg_P_n_0),
        .I1(debounced_int_reg_LDC_n_0),
        .I2(debounced_int_reg_C_n_0),
        .O(debounced));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    debounced_int_C_i_1
       (.I0(debounced_int_reg_P_n_0),
        .I1(debounced_int_reg_LDC_n_0),
        .I2(debounced_int_reg_C_n_0),
        .I3(\counter[16]_i_3_n_0 ),
        .I4(input_signal),
        .O(debounced_int_C_i_1_n_0));
  FDCE debounced_int_reg_C
       (.C(clk),
        .CE(1'b1),
        .CLR(debounced_int_reg_LDC_i_2_n_0),
        .D(debounced_int_C_i_1_n_0),
        .Q(debounced_int_reg_C_n_0));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    debounced_int_reg_LDC
       (.CLR(debounced_int_reg_LDC_i_2_n_0),
        .D(1'b1),
        .G(debounced_int_reg_LDC_i_1_n_0),
        .GE(1'b1),
        .Q(debounced_int_reg_LDC_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    debounced_int_reg_LDC_i_1
       (.I0(reset),
        .I1(input_signal),
        .O(debounced_int_reg_LDC_i_1_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    debounced_int_reg_LDC_i_2
       (.I0(reset),
        .I1(input_signal),
        .O(debounced_int_reg_LDC_i_2_n_0));
  FDPE debounced_int_reg_P
       (.C(clk),
        .CE(1'b1),
        .D(debounced_int_C_i_1_n_0),
        .PRE(debounced_int_reg_LDC_i_1_n_0),
        .Q(debounced_int_reg_P_n_0));
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
