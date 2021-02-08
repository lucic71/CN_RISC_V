`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/03/2021 02:45:33 PM
// Design Name: 
// Module Name: RISC_V_FINAL
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

module RISC_V_FINAL(
              input clk,
              input reset,
              
              output [31:0] PC_EX,
              output [31:0] ALU_OUT_EX,
              output [31:0] PC_MEM,
              output PCSrc,
              output [31:0] DATA_MEMORY_MEM,
              output [31:0] ALU_DATA_WB,
              output [1:0] forwardA, forwardB,
              output pipeline_stall
             );
             
    wire IF_ID_write;
    wire PC_write;
    
    wire [31:0] PC_ID;
    wire [31:0] INSTRUCTION_ID;
    wire [31:0] IMM_ID;
    wire [31:0] REG_DATA1_ID;
    wire [31:0] REG_DATA2_ID;
    wire [2:0] FUNCT3_ID;  
    wire [6:0] FUNCT7_ID;  
    wire [6:0] OPCODE_ID;     
    wire [4:0] RD_ID;      
    wire [4:0] RS1_ID;      
    wire [4:0] RS2_ID;
    
    wire RegWrite_ID;  
    wire MemtoReg_ID;  
    wire MemRead_ID;   
    wire MemWrite_ID;  
    wire [1:0] ALUop_ID; 
    wire ALUSrc_ID;      
    wire Branch_ID;   
    
    wire [31:0] IMM_EX;
    wire [31:0] REG_DATA1_EX;
    wire [31:0] REG_DATA2_EX;
    wire [2:0] FUNCT3_EX;  
    wire [6:0] FUNCT7_EX;  
    wire [6:0] OPCODE_EX;     
    wire [4:0] RD_EX;      
    wire [4:0] RS1_EX;      
    wire [4:0] RS2_EX;
    
    wire RegWrite_EX;  
    wire MemtoReg_EX;  
    wire MemRead_EX;   
    wire MemWrite_EX;  
    wire [1:0] ALUop_EX; 
    wire ALUSrc_EX;      
    wire Branch_EX;  
    
    wire ZERO_EX;
    wire [31:0] PC_Branch_EX;
    wire [31:0] REG_DATA2_EX_FINAL;
    
    wire [4:0] RD_MEM;          
    wire RegWrite_MEM;  
    wire MemtoReg_MEM;  
    wire MemRead_MEM;   
    wire MemWrite_MEM;
    wire Branch_MEM;  
    
    wire ZERO_MEM;
    wire [31:0] ALU_OUT_MEM;
    wire [31:0] PC_Branch_MEM;
    wire [31:0] REG_DATA2_MEM_FINAL;
    
    wire [4:0] RD_WB;          
    wire RegWrite_WB;  
    wire MemtoReg_WB;
    wire [31:0] ALU_OUT_WB;
    wire [31:0] DATA_MEMORY_WB;

    RISC_V_IF_ID if_id(
        clk, reset, pipeline_stall,
        IF_ID_write, PCSrc, PC_write,
        PC_MEM, RegWrite_WB, ALU_DATA_WB, RD_WB,
        
        PC_ID, INSTRUCTION_ID, IMM_ID,
        REG_DATA1_ID, REG_DATA2_ID,
        
        FUNCT3_ID, FUNCT7_ID, OPCODE_ID,
        RD_ID, RS1_ID, RS2_ID,
        
        RegWrite_ID,
        MemtoReg_ID,
        MemRead_ID,
        MemWrite_ID,
        ALUop_ID,
        ALUSrc_ID,
        Branch_ID
    );
    
    hazard_detection hazard(RD_EX, RS1_ID, RS2_ID, MemRead_EX, PC_write, IF_ID_write, pipeline_stall);      
    
    ID_EX_REG id_ex_reg(
      PC_EX, IMM_EX, REG_DATA1_EX,
      REG_DATA2_EX, FUNCT3_EX, FUNCT7_EX,
      OPCODE_EX, RD_EX, RS1_EX, RS2_EX,
      
      RegWrite_EX, MemtoReg_EX,
      MemRead_EX, MemWrite_EX, ALUop_EX,
      ALUSrc_EX, Branch_EX,
    
      PC_ID, IMM_ID, REG_DATA1_ID,
      REG_DATA2_ID, FUNCT3_ID, FUNCT7_ID,
      OPCODE_ID, RD_ID, RS1_ID, RS2_ID,
      
      RegWrite_ID, MemtoReg_ID,
      MemRead_ID, MemWrite_ID, ALUop_ID,
      ALUSrc_ID, Branch_ID,
    
      clk, reset
    );
    
    forwarding forward(
        RS1_EX,
        RS2_EX,
        RD_MEM,
        RD_WB,
        RegWrite_MEM,
        RegWrite_WB,
        forwardA, forwardB
    );
    
    EX ex(
        IMM_EX, REG_DATA1_EX, REG_DATA2_EX,
        PC_EX, FUNCT3_EX, FUNCT7_EX,
        RD_EX, RS1_EX, RS2_EX,
        
        RegWrite_EX, MemtoReg_EX, MemRead_EX,
        MemWrite_EX, ALUop_EX, ALUSrc_EX,
        Branch_EX,
        
        forwardA, forwardB,
        
        ALU_DATA_WB,
        ALU_OUT_MEM,
        
        ZERO_EX,
        ALU_OUT_EX,
        PC_Branch_EX,
        REG_DATA2_EX_FINAL
     );
     
    EX_MEM_REG ex_mem_reg(
        RD_MEM, RegWrite_MEM, MemtoReg_MEM,
        MemRead_MEM, MemWrite_MEM, Branch_MEM,
        
        ZERO_MEM, ALU_OUT_MEM, PC_Branch_MEM,
        REG_DATA2_MEM_FINAL,
        
        RD_EX, RegWrite_EX, MemtoReg_EX,
        MemRead_EX, MemWrite_EX, Branch_EX,
        
        ZERO_EX, ALU_OUT_EX, PC_Branch_EX,
        REG_DATA2_EX_FINAL,
        
        clk, reset
    );
    
    MEM mem(clk,
        RD_MEM, RegWrite_MEM, MemtoReg_MEM,
        MemRead_MEM, MemWrite_MEM, Branch_MEM,
        
        ZERO_MEM, ALU_OUT_MEM, PC_Branch_MEM,
        REG_DATA2_MEM_FINAL,
        
        PCSrc, PC_MEM,
        
        DATA_MEMORY_MEM
    );
    
    MEM_WB_REG mem_wb_reg(
        MemtoReg_WB, RegWrite_WB, DATA_MEMORY_WB,
        ALU_OUT_WB, RD_WB,
        
        MemtoReg_MEM, RegWrite_MEM, DATA_MEMORY_MEM,
        ALU_OUT_MEM, RD_MEM,
        
        clk, reset
    );
    
    WB wb(
        MemtoReg_WB, DATA_MEMORY_WB,
        ALU_OUT_WB,      
          
        ALU_DATA_WB
    );
endmodule             
