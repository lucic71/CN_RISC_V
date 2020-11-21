`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2020 02:32:52 PM
// Design Name: 
// Module Name: imm_gen
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


module imm_gen(input [31:0] in, output reg [31:0] out);

    always @(*) begin
        casex ({in[14:12], in[6:0]})
            10'bxxx0000011: out <= {{21{in[31]}}, in[30:20]}; // lw
            10'bxxx0010011: out <= {{21{in[31]}}, in[30:20]}; // addi, ori
            10'bxxx0100011: out <= {{21{in[31]}}, in[30:25], in[11:7]}; // sw
            10'bxxx1100011: out <= {{20{in[31]}}, in[7], in[30:25], in[11:8], 1'b0}; // beq
            default: out <= 32'b0;
        endcase
    end

endmodule
