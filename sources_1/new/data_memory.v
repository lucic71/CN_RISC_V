`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2020 02:30:26 PM
// Design Name: 
// Module Name: data_memory
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


module data_memory(input clk,
                   input mem_read,
                   input mem_write,
                   input [31:0] address,
                   input [31:0] write_data,
                   output reg [31:0] read_data
                   );

    reg [31:0] RAM [0:1023];
    integer i;
    
    initial begin
        for (i = 0; i < 1024; i = i + 1)
            RAM[i] = i;
    end
    
    always @(posedge clk) begin
        if (mem_write)
            RAM[address] <= write_data;
    end
    
    always @* begin
        if (mem_read)
            read_data <= RAM[address];
    end
                  
endmodule
