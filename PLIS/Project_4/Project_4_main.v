// Copyright (C) 2018  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 18.0.0 Build 614 04/24/2018 SJ Standard Edition"
// CREATED		"Wed Jul 21 10:23:25 2021"

module Project_4_main(
	pin_name1
);


input wire	pin_name1;

wire	[10:0] m;
wire	[10:0] SYNTHESIZED_WIRE_0;





count3	b2v_inst(
	.clk(pin_name1),
	.m(m),
	.s(SYNTHESIZED_WIRE_0));


ROM_4	b2v_inst1(
	.clock(pin_name1),
	.address(SYNTHESIZED_WIRE_0)
	);


endmodule
