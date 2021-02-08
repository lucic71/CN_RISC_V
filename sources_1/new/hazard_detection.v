`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2020 02:40:31 PM
// Design Name: 
// Module Name: hazard_detection
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


module hazard_detection(input [4:0] rd,
                        input [4:0] rs1,
                        input [4:0] rs2,
                        input MemRead,
                        output reg PCwrite,
                        output reg IF_IDwrite,
                        output reg control_sel);

    always @(rd or rs1 or rs2 or MemRead) begin
        if (MemRead && (rd == rs1 || rd == rs2))
            {PCwrite, IF_IDwrite, control_sel} <= 3'b001;
        else
            {PCwrite, IF_IDwrite, control_sel} <= 3'b110;
    end

endmodule
