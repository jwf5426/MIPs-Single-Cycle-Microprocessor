`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Penn State Univeristy 
// Engineer: James W. Frazier
// 
// Create Date: 11/09/2016 06:18:02 PM
// Design Name: 
// Module Name: ALU_B_Mux
// 
//////////////////////////////////////////////////////////////////////////////////

module ALU_B_Mux(
    input switch,
    input [31:0] qb,
    input [31:0] imm_exten,
    output reg [31:0] B
    );
    
    always @(*)
            if(switch == 1'b1)
                B = imm_exten;
            else
                B = qb;
    
endmodule
