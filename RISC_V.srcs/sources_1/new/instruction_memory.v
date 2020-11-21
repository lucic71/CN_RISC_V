`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2020 12:42:24 PM
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory(input [9:0] address,
    output reg [31:0] instruction);
    
    reg [31:0] memory[0:6];
    
    initial $readmemh("code.mem", memory);
    
    always @(address)
        instruction <= memory[address];
    
endmodule
