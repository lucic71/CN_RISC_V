`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2020 12:38:23 PM
// Design Name: 
// Module Name: ALUcontrol
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


module ALUcontrol(input [1:0] ALUop,
                  input [6:0] funct7,
                  input [2:0] funct3,
                  output reg [3:0] ALUinput);

    always @(ALUop or funct7 or funct3) begin
        casex({ALUop, funct7, funct3})
            12'b00XXXXXXXXXX: ALUinput <= 4'b0010; // ld, sd
            12'b01XXXXXXXXXX: ALUinput <= 4'b0110; // beq
            12'b100000000000: ALUinput <= 4'b0010; // add
            12'b100100000000: ALUinput <= 4'b0110; // sub
            12'b100000000111: ALUinput <= 4'b0000; // and
            12'b100000000110: ALUinput <= 4'b0001; // or
            12'b11xxxxxxx000: ALUinput <= 4'b0010; // addi
            12'b11xxxxxxx110: ALUinput <= 4'b0001; // ori
            default: ALUinput <= 4'b1111;
        endcase
    end

endmodule
