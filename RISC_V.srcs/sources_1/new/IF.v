`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2020 02:02:33 PM
// Design Name: 
// Module Name: IF
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module IF(input clk, reset,
     input PCSrc, PC_write,
     input [31:0] PC_Branch,
     output [31:0] PC_IF, INSTRUCTION_IF);

    wire [31:0] PC_4;
    wire [31:0] PC_MUX;
    
    PC pc0(clk, reset, PC_write, PC_MUX, PC_IF);   
    instruction_memory instr_mem0(PC_IF[11:2], INSTRUCTION_IF);  
    adder adder0(PC_IF, 32'b0100, PC_4); 
    mux2_1 mux0(PC_4, PC_Branch, PCSrc, PC_MUX);

endmodule
