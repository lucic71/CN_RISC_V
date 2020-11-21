`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2020 09:49:56 PM
// Design Name: 
// Module Name: IF_ID_REG
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


module IF_ID_REG(input clk, reset, write,
    input [63:0] in,
    output reg [63:0] out);
    
    always @(posedge clk) begin
        if (write)
            out <= in;
        if (reset)
            out <= 0;
    end
endmodule
