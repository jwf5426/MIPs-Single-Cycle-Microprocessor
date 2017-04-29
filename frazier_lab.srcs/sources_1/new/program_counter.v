`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Penn State Univeristy 
// Engineer: James W. Frazier
// 
// Create Date: 11/09/2016 06:18:02 PM
// Design Name: 
// Module Name: program_counter
// 
//////////////////////////////////////////////////////////////////////////////////

module program_counter(
    input [31:0] update,
    // input [31:0] update_by,
    // input branch,
    // input [15:0] branch_offset,
    input clk,
    input rst,
    output reg [31:0] pc
    );
    
    // parameter INCREMENT_AMOUNT = 32'd4;
    
    initial begin
        pc = 32'd0;
    end
    
    always @(posedge clk or posedge rst)
    begin
        if (rst)
            pc <= 0;
        else /*if (update)
            if (branch)
                pc <= pc + {16'd0,branch_offset};
            else*/
                pc <= update/*_byINCREMENT_AMOUNT*/;
    end
endmodule
