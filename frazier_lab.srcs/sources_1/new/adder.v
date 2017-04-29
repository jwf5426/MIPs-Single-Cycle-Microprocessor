`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Penn State Univeristy 
// Engineer: James W. Frazier
// 
// Create Date: 11/09/2016 06:18:02 PM
// Design Name: 
// Module Name: adder
// 
//////////////////////////////////////////////////////////////////////////////////

module adder (
    input [31:0] A,
    input [31:0] B,
    output [31:0] sum);
    
    assign sum = A + B;
    
endmodule