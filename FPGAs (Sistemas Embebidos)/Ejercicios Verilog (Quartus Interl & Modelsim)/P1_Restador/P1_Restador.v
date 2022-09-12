// Copyright (C) 2020  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition"
// CREATED		"Wed Aug 26 17:10:43 2020"

module P1_Restador(
	X,
	Y,
	Po,
	R,
	P
);


input wire	X;
input wire	Y;
input wire	Po;
inout wire	R;
inout wire	P;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;




assign	SYNTHESIZED_WIRE_6 =  ~X;

assign	SYNTHESIZED_WIRE_0 = Y ^ X;

assign	R = SYNTHESIZED_WIRE_0 ^ Po;

assign	SYNTHESIZED_WIRE_5 = Y & SYNTHESIZED_WIRE_6;

assign	SYNTHESIZED_WIRE_3 = Po & SYNTHESIZED_WIRE_6;

assign	SYNTHESIZED_WIRE_4 = Po & Y;

assign	P = SYNTHESIZED_WIRE_3 | SYNTHESIZED_WIRE_4 | SYNTHESIZED_WIRE_5;


endmodule
