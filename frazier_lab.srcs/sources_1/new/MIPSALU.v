`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Penn State Univeristy 
// Engineer: James W. Frazier
// 
// Create Date: 11/09/2016 06:18:02 PM
// Design Name: 
// Module Name: MIPSALU
// 
//////////////////////////////////////////////////////////////////////////////////

module MIPSALU (ALUctl, branch, A, B, ALUOut, Zero);
    input [3:0] ALUctl;
    input branch;
    input [31:0] A,B;
    output reg [31:0] ALUOut;
    output reg Zero;
    // assign Zero = (ALUOut==0); //Zero is true if ALUOut is 0
    always @(ALUctl, A, B)
        begin //reevaluate if these change
        case (ALUctl)
            4'bx000: begin // add addi lw sw
                ALUOut <= A + B;  
                Zero <= 1'bx;
            end
            4'bx100: begin // sub 
                ALUOut <= A - B;  
                Zero <= 1'bx;
            end
            4'bx001: begin // and andi 
                ALUOut <= A & B;
                Zero <= 1'bx;  
            end
            4'bx101: begin // or ori
                ALUOut <= A | B;  
                Zero <= 1'bx;
            end
            4'bx010: begin // xor xori beq bne
                ALUOut <= A ^ B;
                if(branch)
                    if((A ^ B) == 32'd0) 
                        Zero <= 1'b1;
                    else 
                        Zero <= 1'b0;
                else
                Zero <= 1'bx;
            end
            4'b0011: begin // sll
                ALUOut <= B << A; 
                Zero <= 1'bx;
            end
            4'b0111: begin // srl
                ALUOut <= B >> A; 
                Zero <= 1'bx;
            end
            4'bx110: begin // lui
                ALUOut <= B << 16;
                Zero <= 1'bx;
            end
            default: begin // jr j jal
                ALUOut <= 32'dx;
                Zero <= 1'bx;
            end
        endcase
    end
endmodule
