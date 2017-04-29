`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Penn State Univeristy 
// Engineer: James W. Frazier
// 
// Create Date: 11/09/2016 06:18:02 PM
// Design Name: 
// Module Name: sign_extend
// 
//////////////////////////////////////////////////////////////////////////////////


module sign_extend(
    input switch,
    input [15:0] imm,
    output reg [31:0] imm_output
    );
    
    always @(*)
        if(switch == 1'b1 && imm[15] == 1'b1)
            imm_output = {16'b1111111111111111, imm};
        else
            imm_output = {16'b0000000000000000, imm};
   
endmodule
