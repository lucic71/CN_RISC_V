`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/03/2021 01:51:54 PM
// Design Name: 
// Module Name: MEM
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


module MEM(
    input clk,
    input [4:0] RD_MEM, 
    input RegWrite_MEM, 
    input MemtoReg_MEM, 
    input MemRead_MEM, 
    input MemWrite_MEM, 
    input Branch_MEM, 
    
    input Zero_MEM, 
    input [31:0] ALU_OUT_MEM, 
    input [31:0] PC_Branch_MEM,
    input [31:0] REG_DATA2_MEM_FINAL, 
        
    output reg PCSrc_IF, 
    output reg [31:0] PC_Branch_IF, 
    
    output [31:0] READ_DATA
);

    data_memory data_memory0(
        clk,
        MemRead_MEM,
        MemWrite_MEM,
        ALU_OUT_MEM,
        REG_DATA2_MEM_FINAL,
        READ_DATA
    );

    always @(Zero_MEM or Branch_MEM or PC_Branch_MEM) begin
        PCSrc_IF = Zero_MEM & Branch_MEM;
        PC_Branch_IF = PC_Branch_MEM;
    end
    
endmodule
