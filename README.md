# CN_RISC_V

Source code form RISC V pipelined processor written in Verilog. This is part of my Computer Architecture class.
It has 5 stages:
  * fetch
  * decode
  * execute
  * memory
  * write-back
  
 Furthermore it has a control unit that sends control signals to different stages in processor. It also has a
 hazard detection unit that can spot data hazards and solve them using a forwarding tehnique. 
 
 It supports only a reduced set of instructions like: add, beq, addi, ori, etc. I should add the rest too.
 It uses no cache memory, its main memory is an Verilog array of 32-bit words. 
 
 Branches are computed in Execute stage so 3 instructions will be killed when a branch instruction comes in the
 pipeline because there is no predictor.
 
