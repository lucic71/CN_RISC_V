`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2020 08:22:59 PM
// Design Name: 
// Module Name: ID
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


module ID(input clk,
    input [31:0] PC_ID, INSTRUCTION_ID, //
    input RegWrite_WB, //
    input [31:0] ALU_DATA_WB, //
    input [4:0] RD_WB, //
    output [31:0] IMM_ID, //
    output [31:0] REG_DATA1_ID, REG_DATA2_ID, //
    output reg [2:0] FUNCT3_ID, //
    output reg [6:0] FUNCT7_ID, //
    output reg [6:0] OPCODE_ID, //
    output reg [4:0] RD_ID, //
    output reg [4:0] RS1_ID, //
    output reg [4:0] RS2_ID); //
        
    always @(*) begin
        OPCODE_ID <= INSTRUCTION_ID[6:0];
        RD_ID <= INSTRUCTION_ID[11:7];
        FUNCT3_ID <= INSTRUCTION_ID[14:12];
        RS1_ID <= INSTRUCTION_ID[19:15];
        RS2_ID <= INSTRUCTION_ID[24:20];
        FUNCT7_ID <= INSTRUCTION_ID[31:25];
    end
    
    registers reg0(
        clk,
        RegWrite_WB,
        RS1_ID,
        RS2_ID,
        RD_WB,
        ALU_DATA_WB,
        REG_DATA1_ID,
        REG_DATA2_ID
    );
    imm_gen imm_gen0(INSTRUCTION_ID, IMM_ID);
endmodule
