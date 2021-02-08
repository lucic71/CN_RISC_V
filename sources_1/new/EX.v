`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2020 01:02:51 PM
// Design Name: 
// Module Name: EX
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


module EX(input [31:0] IMM_EX, 
          input [31:0] REG_DATA1_EX, 
          input [31:0] REG_DATA2_EX, 
          input [31:0] PC_EX, 
          input [2:0] FUNCT3_EX, 
          input [6:0] FUNCT7_EX, 
          input [4:0] RD_EX, 
          input [4:0] RS1_EX, 
          input [4:0] RS2_EX, 
          input RegWrite_EX, 
          input MemtoReg_EX, 
          input MemRead_EX, 
          input MemWrite_EX, 
          input [1:0] ALUop_EX, 
          input ALUSrc_EX, 
          input Branch_EX, 
          input [1:0] forwardA,forwardB, 
          
          input [31:0] ALU_DATA_WB, 
          input [31:0] ALU_OUT_MEM, 
          
          output ZERO_EX, 
          output [31:0] ALU_OUT_EX, 
          output [31:0] PC_Branch_EX,  
          output [31:0] REG_DATA2_EX_FINAL 
          );
        
    wire [3:0] ALUinput;
    wire [31:0] ALU_OP_1, ALU_OP_2;

    mux4_1 mux0(REG_DATA1_EX, ALU_DATA_WB, ALU_OUT_MEM, 0, forwardA, ALU_OP_1);
    mux4_1 mux1(REG_DATA2_EX, ALU_DATA_WB, ALU_OUT_MEM, 0, forwardB, REG_DATA2_EX_FINAL);
    mux2_1 mux2(REG_DATA2_EX_FINAL, IMM_EX, ALUSrc_EX, ALU_OP_2);
        
    ALUcontrol control0(ALUop_EX, FUNCT7_EX, FUNCT3_EX, ALUinput);
    ALU alu0(ALUinput, ALU_OP_1, ALU_OP_2, ZERO_EX, ALU_OUT_EX);
    
    adder adder0(PC_EX, IMM_EX, PC_Branch_EX);
endmodule
