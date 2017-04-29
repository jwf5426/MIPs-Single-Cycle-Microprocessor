`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Penn State Univeristy 
// Engineer: James W. Frazier
// 
// Create Date: 11/09/2016 06:18:02 PM
// Design Name: 
// Module Name: CPU
// 
//////////////////////////////////////////////////////////////////////////////////

module CPU(
    input clk,
    input rst,
    output reg bogus
    );
    
    wire [31:0] pc;
    wire [5:0] op;
    wire [4:0] rs_addressMSB;
    wire [4:0] rt_addressmiddleONE;
    wire [4:0] rd_addressmiddleTWO_immMSB;
    wire [4:0] sa_addressmiddleTHREE_immMIDDLE;
    wire [5:0] func_addressLSB_immLSB;
    wire [4:0] wn_in;
    
    wire z;
    wire [3:0] aluc;
    wire [1:0] prsrc;
    wire shift;
    wire wreg;
    wire sext;
    wire wmem;
    wire m2reg;
    wire aluim;
    wire regrt;
    wire branch;
    wire jal;
    
    wire [31:0] qa;
    wire [31:0] A;
    wire [31:0] qb;
    wire [31:0] B;
    wire [31:0] aluout; 
    wire [31:0] memout;
    wire [31:0] pcMuxOut;
    wire [31:0] dataMuxOut;
    
    wire [31:0] pcPlusFour;
    wire [31:0] branchAddr;  
    
    wire [31:0] imm_extend; 
    wire [31:0] imm_extend_shifted;
    wire [31:0] addr_shifted;
    
    
    dataMux myDataMux({jal, m2reg}, aluout, memout, pcPlusFour, dataMuxOut);
    data_memory myData_Memory(wmem, rst, aluout, qb, memout);
    shift_two_left mySecond_shift_two_left({6'b000000, rs_addressMSB, rt_addressmiddleONE, rd_addressmiddleTWO_immMSB, sa_addressmiddleTHREE_immMIDDLE, func_addressLSB_immLSB}, addr_shifted);
    adder mySecondAdder(pcPlusFour, imm_extend_shifted, branchAddr);
    shift_two_left myFirst_shift_two_left(imm_extend, imm_extend_shifted);
    ALU_A_Mux myALU_A_Mux(shift, qa, sa_addressmiddleTHREE_immMIDDLE, A);   
    ALU_B_Mux myALU_B_Mux(aluim, qb, imm_extend, B);
    sign_extend mySign_Extend(sext, {rd_addressmiddleTWO_immMSB, sa_addressmiddleTHREE_immMIDDLE, func_addressLSB_immLSB}, imm_extend);
    pcMux myPcMux(prsrc, pcPlusFour, branchAddr, qa, {pcPlusFour[31:28], addr_shifted[27:0]}, pcMuxOut);
    WN_Input_Mux myWN_Input_Mux(rd_addressmiddleTWO_immMSB, rt_addressmiddleONE, {jal, regrt}, wn_in);
    adder myFirstAdder(32'd4, pc, pcPlusFour);
    program_counter myPC(/*1, */pcMuxOut, /*0, 16'd0,*/ clk, rst, pc);
    instruction_memory myIM(pc, op, rs_addressMSB, rt_addressmiddleONE, rd_addressmiddleTWO_immMSB, sa_addressmiddleTHREE_immMIDDLE, func_addressLSB_immLSB);
    ALUControl myALUControl(op, func_addressLSB_immLSB, z, aluc, prsrc, shift, wreg, sext, wmem, m2reg, aluim, regrt, branch, jal); 
    regfile myRegFile(rs_addressMSB, rt_addressmiddleONE, dataMuxOut, wn_in, wreg, clk, rst, qa, qb);
    MIPSALU myMIPSALU(aluc, branch, A, B, aluout, z);
    
endmodule
