`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/03/2021 01:19:39 PM
// Design Name: 
// Module Name: EX_MEM_REG
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


module EX_MEM_REG(
    output reg [4:0] RD_MEM,
    output reg RegWrite_MEM,
    output reg MemtoReg_MEM,
    output reg MemRead_MEM,
    output reg MemWrite_MEM,
    output reg Branch_MEM,
    output reg Zero_MEM,
    output reg [31:0] ALU_OUT_MEM,
    output reg [31:0] PC_Branch_MEM,
    output reg [31:0] REG_DATA2_MEM_FINAL,
    
    input [4:0] RD_EX,
    input RegWrite_EX,
    input MemtoReg_EX,
    input MemRead_EX,
    input MemWrite_EX,
    input Branch_EX,
    input Zero_EX,
    input [31:0] ALU_OUT_EX,
    input [31:0] PC_Branch_EX,
    input [31:0] REG_DATA2_EX_FINAL,
    
    input clk,
    input reset
);
    
    always @(posedge clk) begin
        if (reset) begin
            {RD_MEM, RegWrite_MEM, MemtoReg_MEM, MemRead_MEM, MemWrite_MEM,
                Branch_MEM, Zero_MEM, ALU_OUT_MEM, PC_Branch_MEM, REG_DATA2_MEM_FINAL} = 107'b0;
        end
        else begin
                RD_MEM = RD_EX;
                RegWrite_MEM = RegWrite_EX;
                MemtoReg_MEM = MemtoReg_EX;
                MemRead_MEM = MemRead_EX;
                MemWrite_MEM = MemWrite_EX;
                Branch_MEM = Branch_EX;
                Zero_MEM = Zero_EX;
                ALU_OUT_MEM = ALU_OUT_EX;
                PC_Branch_MEM = PC_Branch_EX;
                REG_DATA2_MEM_FINAL = REG_DATA2_EX_FINAL;
        end
    end   
endmodule
