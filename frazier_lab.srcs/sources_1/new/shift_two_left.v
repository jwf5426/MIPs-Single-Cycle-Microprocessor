`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Penn State Univeristy 
// Engineer: James W. Frazier
// 
// Create Date: 11/09/2016 06:18:02 PM
// Design Name: 
// Module Name: shift_two_left
// 
//////////////////////////////////////////////////////////////////////////////////


module shift_two_left(
    input [31:0] in,
    output [31:0] out_shifted
    );
    
    assign out_shifted = in << 2;
endmodule
