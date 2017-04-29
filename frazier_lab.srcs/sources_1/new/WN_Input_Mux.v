`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Penn State Univeristy 
// Engineer: James W. Frazier
// 
// Create Date: 11/09/2016 06:18:02 PM
// Design Name: 
// Module Name: WN_Input_Mux
// 
//////////////////////////////////////////////////////////////////////////////////


module WN_Input_Mux(
    input [4:0] rd,
    input [4:0] rt,
    input [1:0] switch,
    output reg [4:0] wn
    );
    
    always @(*)
        case(switch)
            2'b1x: wn = 5'd31;
            2'b00: wn = rd;
            2'b01: wn = rt;
        endcase 
endmodule
