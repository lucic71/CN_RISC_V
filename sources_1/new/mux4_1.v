`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2020 01:25:06 PM
// Design Name: 
// Module Name: mux4_1
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


module mux4_1(input [31:0] a, b, c, d,
              input [1:0] sel,
              output reg [31:0] out);
              
    always @(a or b or c or d or sel) begin
        case (sel)
            2'b00: out <= a;
            2'b01: out <= b;
            2'b10: out <= c;
            2'b11: out <= d;
        endcase
    end     

endmodule
