`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Penn State Univeristy 
// Engineer: James W. Frazier
// 
// Create Date: 11/09/2016 06:18:02 PM
// Design Name: 
// Module Name: data_memory
// 
//////////////////////////////////////////////////////////////////////////////////

module data_memory(
    input        wmem,
    input        clrn,
    input [31:0] address,
    input [31:0] write_data,
    output [31:0] read_data
    );
    reg    [7:0] data [0:100]; // 100 8-bit data
    
    assign read_data = {data[address], data[address + 1], data[address + 2], data[address + 3]}; 
    integer i;
    always @(address or clrn) begin
        if (clrn) 
            for(i = 0; i <= 70; i = i + 1) 
                data[i] <= 0;
        else
            if (wmem) begin
                data[address] <= write_data[31:24];
                data[address + 1] <= write_data[23:16];
                data[address + 2] <= write_data[15:8];
                data[address + 3] <= write_data[7:0];
                $display("Wrote %h at address %d", write_data, address);
            end
            
    end
endmodule
