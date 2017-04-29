`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Penn State Univeristy 
// Engineer: James W. Frazier
// 
// Create Date: 11/09/2016 06:18:02 PM
// Design Name: 
// Module Name: ALUControl
// 
//////////////////////////////////////////////////////////////////////////////////


  module ALUControl (
    input      [5:0] ALUOp,
    input      [5:0] FuncCode, 
    input            z,
    output reg [3:0] ALUCtl,
    output reg [1:0] prsrc,
    output reg       shift,
    output reg       wreg,
    output reg       sext,
    output reg       wmem,
    output reg       m2reg,
    output reg       aluimm,
    output reg       regrt,
    output reg       branch,
    output reg       jal
    );
    
    always @(*) begin
        if(ALUOp == 6'b000000) begin
            case (FuncCode)
                32: begin 
                    ALUCtl <= 4'bx000; // add
                    prsrc <= 2'b00;
                    shift <= 1'b0; 
                    wreg <= 1'b1;
                    sext <= 1'bx;
                    wmem <= 1'b0;
                    m2reg <= 1'b0;
                    aluimm <= 1'b0;
                    regrt <= 1'b0;
                    branch <= 1'b0;
                    jal <= 1'b0;
                    end
                34: begin 
                    ALUCtl <= 4'bx100;; // sub
                    prsrc <= 2'b00;
                    shift <= 1'b0;
                    wreg <= 1'b1;
                    sext <= 1'bx;
                    wmem <= 1'b0;
                    m2reg <= 1'b0;
                    aluimm <= 1'b0;
                    regrt <= 1'b0;
                    branch <= 1'b0;
                    jal <= 1'b0;
                    end
                36: begin       // and
                    ALUCtl <= 4'bx001; 
                    prsrc <= 2'b00;
                    shift <= 1'b0;
                    wreg <= 1'b1;
                    sext <= 1'bx;
                    wmem <= 1'b0; 
                    m2reg <= 1'b0;
                    aluimm <= 1'b0;
                    regrt <= 1'b0;
                    branch <= 1'b0;
                    jal <= 1'b0;
                    end
                37: begin       // or
                    ALUCtl <= 4'bx101; 
                    prsrc <= 2'b00;
                    shift <= 1'b0;
                    wreg <= 1'b1;
                    sext <= 1'bx;
                    wmem <= 1'b0; 
                    m2reg <= 1'b0;
                    aluimm <= 1'b0;
                    regrt <= 1'b0;
                    branch <= 1'b0;
                    jal <= 1'b0;
                    end
                38: begin 
                    ALUCtl <= 4'bx010; // xor
                    prsrc <= 2'b00;
                    shift <= 1'b0;
                    wreg <= 1'b1;
                    sext <= 1'bx;
                    wmem <= 1'b0; 
                    m2reg <= 1'b0;
                    aluimm <= 1'b0;
                    regrt <= 1'b0;
                    branch <= 1'b0;
                    jal <= 1'b0;
                    end 
                0: begin 
                    ALUCtl <= 4'b0011; // sll
                    prsrc <= 2'b00;
                    shift <= 1'b1;
                    wreg <= 1'b1;
                    sext <= 1'bx;
                    wmem <= 1'b0; 
                    m2reg <= 1'b0;
                    aluimm <= 1'b0;
                    regrt <= 1'b0;
                    branch <= 1'b0;
                    jal <= 1'b0;
                    end
                2: begin
                    ALUCtl <= 4'b0111; // srl
                    prsrc <= 2'b00;
                    shift <= 1'b1;
                    wreg <= 1'b1;
                    sext <= 1'bx;
                    wmem <= 1'b0; 
                    m2reg <= 1'b0;
                    aluimm <= 1'b0;
                    regrt <= 1'b0;
                    branch <= 1'b0;
                    jal <= 1'b0;
                    end
                /*3: begin
                    ALUCtl <= 4'b1111; // sra
                    prsrc <= 2'b00;
                    shift <= 1'b1;
                    wreg <= 1'b1;
                    sext <= 1'bx;
                    wmem <= 1'b0; 
                    m2reg <= 1'b0;
                    aluimm <= 1'b0;
                    regrt <= 1'b0;
                    end*/
                8: begin
                    ALUCtl <= 4'bxxxx; // jr
                    prsrc <= 2'b10;
                    shift <= 1'bx;
                    wreg <= 1'b0;
                    sext <= 1'bx;
                    wmem <= 1'b0; 
                    m2reg <= 1'bx;
                    aluimm <= 1'bx;
                    regrt <= 1'bx;
                    branch <= 1'b0;
                    jal <= 1'bx;
                    end
            default: begin
                    ALUCtl <= 4'dx; // should not happen.
                    prsrc <= 2'bxx;
                    shift <= 1'bx;
                    wreg <= 1'bx;
                    sext <= 1'bx;
                    wmem <= 1'bx; 
                    m2reg <= 1'bx;
                    aluimm <= 1'bx;    
                    regrt <= 1'bx; 
                    branch <= 1'bx; 
                    jal <= 1'b0;            
                    end
            endcase
        end
        else begin
            case (ALUOp) 
                8: begin 
                    ALUCtl <= 4'bx000; // addi
                    prsrc <= 2'b00;
                    shift <= 1'b0; 
                    wreg <= 1'b1;
                    sext <= 1'b1;
                    wmem <= 1'b0;
                    m2reg <= 1'b0; 
                    aluimm <= 1'b1;
                    regrt <= 1'b1;
                    branch <= 1'b0;
                    jal <= 1'b0;
                    end
                12: begin 
                    ALUCtl <= 4'bx001;; // andi
                    prsrc <= 2'b00;
                    shift <= 1'b0;
                    wreg <= 1'b1;
                    sext <= 1'b0;
                    wmem <= 1'b0;
                    m2reg <= 1'b0;
                    aluimm <= 1'b1; 
                    regrt <= 1'b1;
                    branch <= 1'b0;               
                    jal <= 1'b0;
                    end
                13: begin       // ori
                    ALUCtl <= 4'bx101; 
                    prsrc <= 2'b00;
                    shift <= 1'b0;
                    wreg <= 1'b1;
                    sext <= 1'b0;
                    wmem <= 1'b0; 
                    m2reg <= 1'b0; 
                    aluimm <= 1'b1;
                    regrt <= 1'b1;
                    branch <= 1'b0;
                    jal <= 1'b0;
                    end
                14: begin       // xori
                    ALUCtl <= 4'bx010; 
                    prsrc <= 2'b00;
                    shift <= 1'b0;
                    wreg <= 1'b1;
                    sext <= 1'b0;
                    wmem <= 1'b0; 
                    m2reg <= 1'b0; 
                    aluimm <= 1'b1;
                    regrt <= 1'b1;
                    branch <= 1'b0;
                    jal <= 1'b0;
                    end
                35: begin 
                    ALUCtl <= 4'bx000; // lw
                    prsrc <= 2'b00;
                    shift <= 1'b0;
                    wreg <= 1'b1;
                    sext <= 1'b1;
                    wmem <= 1'b0; 
                    m2reg <= 1'b1; 
                    aluimm <= 1'b1;
                    regrt <= 1'b1;
                    branch <= 1'b0;
                    jal <= 1'b0;
                    end 
                43: begin 
                    ALUCtl <= 4'bx000; // sw
                    prsrc <= 2'b00;
                    shift <= 1'b0;
                    wreg <= 1'b0;
                    sext <= 1'b1;
                    wmem <= 1'b1; 
                    m2reg <= 1'bx; 
                    aluimm <= 1'b1;
                    regrt <= 1'bx;
                    branch <= 1'b0;
                    jal <= 1'b0;
                    end
                4: begin
                    ALUCtl <= 4'bx010; // beq          
                    shift <= 1'b0;
                    wreg <= 1'b0;
                    sext <= 1'b1;
                    wmem <= 1'b0; 
                    m2reg <= 1'bx; 
                    aluimm <= 1'b0;
                    regrt <= 1'bx;
                    branch <= 1'b1;  
                    jal <= 1'b0;         
                    end
                15: begin
                    ALUCtl <= 4'bx110; // lui
                    prsrc <= 2'b00;
                    shift <= 1'bx;
                    wreg <= 1'b1;
                    sext <= 1'bx;
                    wmem <= 1'b0; 
                    m2reg <= 1'b0; 
                    aluimm <= 1'b1;
                    regrt <= 1'b1;
                    branch <= 1'b0;
                    jal <= 1'b0;
                    end
                2: begin
                    ALUCtl <= 4'bxxxx; // j
                    prsrc <= 2'b11;
                    shift <= 1'bx;
                    wreg <= 1'b0;
                    sext <= 1'bx;
                    wmem <= 1'b0;
                    m2reg <= 1'bx;  
                    aluimm <= 1'bx;
                    regrt <= 1'bx;
                    branch <= 1'b0;
                    jal <= 1'b0;
                    end
                5: begin
                    ALUCtl <= 4'bx010; // bne
                    shift <= 1'b0;
                    wreg <= 1'b0;
                    sext <= 1'b1;
                    wmem <= 1'b0;
                    m2reg <= 1'bx;  
                    aluimm <= 1'b0;
                    regrt <= 1'bx;
                    branch <= 1'b1;
                    jal <= 1'b0;
                    end
                3: begin
                    ALUCtl <= 4'bxxxx; // jal
                    prsrc <= 2'b11;
                    shift <= 1'bx;
                    wreg <= 1'b1;
                    sext <= 1'bx;
                    wmem <= 1'b0;
                    m2reg <= 1'bx;  
                    aluimm <= 1'bx;
                    regrt <= 1'bx;
                    branch <= 1'b0;
                    jal <= 1'b1;
                    end
            default: begin
                    ALUCtl <= 4'bxxxx; // should not happen
                    prsrc <= 2'bxx;
                    shift <= 1'bx;
                    wreg <= 1'bx;
                    sext <= 1'bx;
                    wmem <= 1'bx;
                    m2reg <= 1'bx;  
                    aluimm <= 1'bx;
                    regrt <= 1'bx;
                    branch <= 1'bx;               
                    jal <= 1'bx;
                    end
            endcase
        end 
    end
    
    always @(z) 
        if(ALUOp == 6'd4)
            case (z)
                1'b0: prsrc <= 2'b00;
                1'b1: prsrc <= 2'b01;
            endcase
        else if(ALUOp == 6'd5)
             case (z)
                1'b0: prsrc <= 2'b01;
                1'b1: prsrc <= 2'b00;
            endcase 
endmodule
