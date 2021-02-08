////////////////////////////////////////CONTROL_PATH_MODULE///////////////////////////////////////////////////      
module control_path(input [6:0] opcode,
    input control_sel,
    output reg Branch, MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite,
    output reg [1:0] ALUop);
  
  always@(opcode) begin
    if (control_sel)
        {ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUop} <= 8'b00000000;
    else begin
        casex(opcode)
          7'b0000000: {ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUop} <= 8'b00000000; //nop from ISA
          7'b0000011: {ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUop} <= 8'b11110000; //lw
          7'b0100011: {ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUop} <= 8'b10001000; //sw
          7'b0110011: {ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUop} <= 8'b00100010; //R32-format
          7'b0010011: {ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUop} <= 8'b10100011; //Register32-Immediate Arithmetic Instructions
          7'b1100011: {ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUop} <= 8'b00000101; //branch instructions
        endcase
    end
  end

endmodule
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
