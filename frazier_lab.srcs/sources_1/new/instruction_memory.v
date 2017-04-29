`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Penn State Univeristy 
// Engineer: James W. Frazier
// 
// Create Date: 11/09/2016 06:18:02 PM
// Design Name: 
// Module Name: instruction_memory
// 
//////////////////////////////////////////////////////////////////////////////////


module instruction_memory(
    input [31:0] read_address,
    output [5:0] op,
    output [4:0] rs_addressMSB,
    output [4:0] rt_addressmiddleONE,
    output [4:0] rd_addressmiddleTWO_immMSB,
    output [4:0] sa_addressmiddleTHREE_immMIDDLE,
    output [5:0] func_addressLSB_immLSB
    );
    reg    [31:0] instruction [0:2]; // 3 instructions
    reg    [31:0] current_instruction;
    
    initial begin  
        instruction[0] = 32'h0c000002;
        instruction[1] = 32'h14a00000;
        instruction[2] = 32'h03e00008;
    end
        assign op = instruction[read_address / 4][31:26];
        assign rs_addressMSB = instruction[read_address / 4][25:21];
        assign rt_addressmiddleONE = instruction[read_address / 4][20:16];
        assign rd_addressmiddleTWO_immMSB = instruction[read_address / 4][15:11];
        assign sa_addressmiddleTHREE_immMIDDLE = instruction[read_address / 4][10:6];
        assign func_addressLSB_immLSB = instruction[read_address / 4][5:0];
        
    always @(*)
        current_instruction = instruction[read_address / 4];
endmodule

//  reg    [7:0] bytes [0:11]; // 3 instructions * (4 bytes / instruction) = 12 bytes needed to accomodate

/*  32'h01244022 = 00000001 00100100 01000000 00100010 = sub t0, t1, a0
    // 32'h01493025 = 00000001 01001001 00110000 00100101 = or a2, t2, t1
    // 32'h000543c0 = 00000000 00000101 01000011 11000000 = sll t0, a1, 15
    bytes[0] = 8'b00100010;
    bytes[1] = 8'b01000000;
    bytes[2] = 8'b00100100;
    bytes[3] = 8'b00000001;
    bytes[4] = 8'b00100101;
    bytes[5] = 8'b00110000;
    bytes[6] = 8'b01001001;
    bytes[7] = 8'b00000001;
    bytes[8] = 8'b11000000;
    bytes[9] = 8'b01000011;
    bytes[10] = 8'b00000101;
    bytes[10] = 8'b00000000;*/

/*  assign op = bytes[read_address + 3][7:2];
    assign rs_addressMSB = {bytes[read_address + 3][2:0], bytes[read_address + 2][7:5]};
    assign rt_addressmiddleONE = bytes[read_address + 2][4:0];
    assign rd_addressmiddleTWO_immMSB = instruction[read_address / 4][15:11];
    assign sa_addressmiddleTHREE_immMIDDLE = instruction[read_address / 4][10:6];
    assign func_addressLSB_immLSB = instruction[read_address / 4][5:0];*/