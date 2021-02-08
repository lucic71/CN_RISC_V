`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/03/2021 02:22:35 PM
// Design Name: 
// Module Name: MEM_WB_REG
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


module MEM_WB_REG(
    output reg MemtoReg_WB,
    output reg RegWrite_WB,
    output reg [31:0] READ_DATA_WB,
    output reg [31:0] ALU_RESULT_WB,
    output reg [4:0] RD_WB,
    
    input MemtoReg_MEM,
    input RegWrite_MEM,
    input [31:0] READ_DATA_MEM,
    input [31:0] ALU_RESULT_MEM,
    input [4:0] RD_MEM,
    
    input clk,
    input reset
);
    always @(posedge clk) begin
        if (reset)
            {MemtoReg_WB, RegWrite_WB, READ_DATA_WB, ALU_RESULT_WB, RD_WB} = 71'b0;
        else begin
                MemtoReg_WB = MemtoReg_MEM;
                RegWrite_WB = RegWrite_MEM;
                READ_DATA_WB = READ_DATA_MEM;
                ALU_RESULT_WB = ALU_RESULT_MEM;
                RD_WB = RD_MEM;
        end
    end
endmodule
