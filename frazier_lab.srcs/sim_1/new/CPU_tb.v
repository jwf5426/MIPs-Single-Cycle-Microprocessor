`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Penn State Univeristy 
// Engineer: James W. Frazier
// 
// Create Date: 11/09/2016 06:18:02 PM
// Design Name: 
// Module Name: CPU_tb
// 
//////////////////////////////////////////////////////////////////////////////////

module CPU_tb();
    reg clk;
    reg rst;
    wire bogus;
    
    initial begin
        clk = 1'b0;
        rst = 1'b0;
    end
    
    always begin
        #5 clk = ~clk;
    end 
     
    CPU myCPU(clk, rst, bogus);
endmodule
