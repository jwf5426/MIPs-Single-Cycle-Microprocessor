`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Penn State Univeristy 
// Engineer: James W. Frazier
// 
// Create Date: 11/09/2016 06:18:02 PM
// Design Name: 
// Module Name: dataMux
// 
//////////////////////////////////////////////////////////////////////////////////

module dataMux(
    input [1:0]  switch,
    input [31:0] ALU_Result,
    input [31:0] MEM_Result,
    input [31:0] PCPlusFour_Result,
    output reg [31:0] dataMux_out
    );
    
    always @(*)
        case(switch)
            2'b00: dataMux_out = ALU_Result;
            2'b01: dataMux_out = MEM_Result;
            2'b1x: dataMux_out = PCPlusFour_Result;
        endcase         
endmodule
