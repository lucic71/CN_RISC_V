`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2020 12:54:36 PM
// Design Name: 
// Module Name: ALUop
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


module ALU(input [3:0] ALUop,
           input [31:0] ina,inb,
           output reg zero,
           output reg [31:0] out);

    always @(ina or inb or ALUop) begin
        case(ALUop)
            4'b0010: out <= ina + inb;
            4'b0110: out <= ina - inb;
            4'b0000: out <= ina & inb;
            4'b0001: out <= ina | inb;     
        endcase
        zero <= (out == 0);
    end
endmodule
