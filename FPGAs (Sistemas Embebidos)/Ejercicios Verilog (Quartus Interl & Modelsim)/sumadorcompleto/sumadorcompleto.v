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
// CREATED		"Fri Aug 21 16:28:54 2020"

module sumadorcompleto(
	B,
	A,
	Cin,
	s,
	Cout
);


input wire	B;
input wire	A;
input wire	Cin;
output wire	s;
output wire	Cout;

wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;




assign	SYNTHESIZED_WIRE_3 = SYNTHESIZED_WIRE_4 & Cin;

assign	SYNTHESIZED_WIRE_2 = A & B;

assign	SYNTHESIZED_WIRE_4 = A ^ B;

assign	s = SYNTHESIZED_WIRE_4 ^ Cin;

assign	Cout = SYNTHESIZED_WIRE_2 | SYNTHESIZED_WIRE_3;


endmodule
