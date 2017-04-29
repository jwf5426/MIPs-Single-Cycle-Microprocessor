//////////////////////////////////////////////////////////////////////////////////
// Company: Penn State Univeristy 
// Engineer: James W. Frazier
// 
// Create Date: 11/09/2016 06:18:02 PM
// Design Name: 
// Module Name: shiftMux
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU_A_Mux(
    input shift,
    input [31:0] qa,
    input [4:0] sa,
    output reg [31:0] A
    );
    
    always @(*)
        if(shift == 1'b1)
            A = {27'd0, sa};
        else
            A = qa;
 
endmodule
