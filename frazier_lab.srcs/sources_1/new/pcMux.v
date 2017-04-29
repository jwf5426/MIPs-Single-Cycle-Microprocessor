`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Penn State Univeristy 
// Engineer: James W. Frazier
// 
// Create Date: 11/09/2016 06:18:02 PM
// Design Name: 
// Module Name: pcMux
// 
//////////////////////////////////////////////////////////////////////////////////


module pcMux(
    input [1:0] switch,
    input [31:0] PcPlusFour,
    input [31:0] BranchAddr,
    input [31:0] RegAddr,
    input [31:0] JumpAddr,
    output reg [31:0] pcMuxOut
    );
    
    always @(*) 
        if(switch == 2'd1)
            pcMuxOut = BranchAddr;
        else if(switch == 2'd2)
            pcMuxOut = RegAddr;
        else if(switch == 2'd3)
            pcMuxOut = JumpAddr;
        else
            pcMuxOut = PcPlusFour;  
endmodule
