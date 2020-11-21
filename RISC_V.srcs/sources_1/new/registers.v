`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2020 02:10:45 PM
// Design Name: 
// Module Name: registers
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


module registers(input clk, reg_write,
    input [4:0] read_reg1, read_reg2, write_reg,
    input [31:0] write_data,
    output [31:0] read_data1, read_data2);
    
    reg [31:0] REG_FILE [0:31];
    integer i;
    
    initial begin
        for (i = 0; i < 32; i = i + 1) begin
            REG_FILE[i] <= i;
        end
    end
    
    always @(posedge clk) begin
        if (reg_write && write_reg)
            REG_FILE[write_reg] <= write_data;
    end
    
    assign read_data1 = REG_FILE[read_reg1];
    assign read_data2 = REG_FILE[read_reg2];
    
endmodule
