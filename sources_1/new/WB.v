module WB(
    input MemtoReg_WB, 
    input [31:0] READ_DATA_WB, 
    input [31:0] ALU_RESULT_WB,
    
    output [31:0] ALU_DATA_WB 
);

    mux2_1 mux0(ALU_RESULT_WB, READ_DATA_WB, MemtoReg_WB, ALU_DATA_WB);
    
endmodule
