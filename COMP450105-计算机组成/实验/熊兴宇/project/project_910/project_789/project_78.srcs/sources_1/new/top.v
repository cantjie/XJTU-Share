`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/20 09:35:05
// Design Name: 
// Module Name: top
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
`define LW 6'b100011
`define SW 6'b101011

`define ADD 6'b100000
`define SUB 6'b100010
`define ADDU 6'b100001
`define AND 6'b100100
`define OR 6'b100101
`define SLT 6'b101010

`define BEQ 6'b000100
`define J 6'b000010
`define R 6'b000000

`define HALT 6'b111111

module top(
    );
    reg clk=0;
    
    wire [31:0]pcin;//PC
    wire [31:0]pcout;
    
    wire [5:0]opcode;//CU
    wire [4:0]rs;
    wire [4:0]rt;
    wire [4:0]rd;
    wire [25:0]addr26;
    wire [15:0]imm16;
    
    wire [31:0]add1out;//add1
    
    wire RegWr;//IM
    wire Jump;
    wire RegDst;
    wire Branch;
    wire MemtoReg;
    wire MemRd;
    wire MemWr;
    wire ALUSrc;
    
    wire [31:0]rdata1;//RF
    wire [31:0]rdata2;
    
    wire [2:0]aluop;//ALU
    wire [31:0]imm32;
    wire [31:0]aluout;
    wire z;
    
    wire [31:0]dmout;//DM
    
    wire [31:0]add2out;//add2
    
    //wire [31:0]mux1out;//mux1
    
    wire [27:0]shlout;//shl2
    //以上是单指令CPU部分各个部件
    
    wire [31:0]npc1;
    wire [25:0]IR1;
    wire [5:0]opcode_2;
    wire RegWr_2,Jump_2,RegDst_2,Branch_2,MemtoReg_2,MemRd_2,MemWr_2,ALUSrc_2;
    ControlUnit CU(opcode,RegWr,Jump,RegDst,Branch,MemtoReg,MemRd,MemWr,ALUSrc);
    ProgramCounter PC(clk,pcin,pcout);
    Add1 ADD1(4,pcout,add1out); 
    InstructionMemory IM(clk,pcout,opcode/*,rs,rt,rd*/,addr26/*,imm16*/);
    RegFI FI_ID(clk,add1out,addr26,RegWr,Jump,RegDst,Branch,MemtoReg,MemRd,MemWr,ALUSrc,opcode,
    npc1,IR1,RegWr_2,Jump_2,RegDst_2,Branch_2,MemtoReg_2,MemRd_2,MemWr_2,ALUSrc_2,opcode_2);//FI级
   
    wire [31:0]IR;
    wire [31:0]npc1_2;
    wire [31:0]rs_2;
    wire [31:0]rt_2;
    wire [31:0]imm32_2;
    wire [31:0]IR_2;
    wire [4:0]w_reg;
    wire [31:0]w_data;
    wire [5:0]opcode_3;
    wire Jump_3,RegDst_3,Branch_3,MemtoReg_3,MemRd_3,MemWr_3,ALUSrc_3;
    assign rs=IR1[25:21];
    assign rt=IR1[20:16];
    assign rd=IR1[15:11];
    assign IR={opcode,IR1};   
    assign imm16=IR1[15:0]; 
    RegisterFile RF(clk,RegWr_2,w_data,rs,rt,w_reg,rdata1,rdata2);
    SignalExtension SigExt(imm16,imm32);
    RegID ID_EX(clk,npc1,rdata1,rdata2,imm32,IR,Jump_2,RegDst_2,Branch_2,MemtoReg_2,MemRd_2,MemWr_2,ALUSrc_2,opcode_2,
    npc1_2,rs_2,rt_2,imm32_2,IR_2,Jump_3,RegDst_3,Branch_3,MemtoReg_3,MemRd_3,MemWr_3,ALUSrc_3,opcode_3);//ID级
    
    wire [25:0]addr26_2;
    wire [31:0]npc3;
    wire [31:0]npc2;
    wire flag;
    wire [31:0]aluout_2;
    wire [31:0]rt_3;
    wire [31:0]IR_3;
    wire Jump_4,RegDst_4,Branch_4,MemtoReg_4,MemRd_4,MemWr_4;
    assign addr26_2=IR_2[25:0];
    assign opcode_2=IR_2[31:26];
    ALUControl ALUCU(opcode_3,aluop);
    ALU2 alu(rs_2,(ALUSrc_3?imm32_2:rt_2),aluop,z,aluout);
    Add1 ADD2(npc1_2,(imm32_2<<2),add2out);
    //Multiplexer MUX1((Branch&&z),add2out,add1out,mux1out);
    ShiftUnit SHL(addr26_2,shlout);
    RegEX EX_MA(clk,{npc1_2[31:28],shlout},add2out,z,aluout,rt_2,IR_2,Jump_3,RegDst_3,Branch_3,MemtoReg_3,MemRd_3,MemWr_3,
    npc3,npc2,flag,aluout_2,rt_3,IR_3,Jump_4,RegDst_4,Branch_4,MemtoReg_4,MemRd_4,MemWr_4);//EX级
    
    wire [31:0]aluout_3;
    wire [31:0]dmout_2;
    wire [31:0]IR_4;
    wire [31:0]pcin_2;

    wire RegDst_5,MemtoReg_5;
    reg PCSrc; //为了第一条指令不为X
    Multiplexer4 MUX_4((flag&&Branch_4),Jump_4,npc3,npc2,pcin_2);
    //assign pcin=PCSrc?pcin_2:add1out;
    Multiplexer MUX3(PCSrc,pcin_2,add1out,pcin);
    //Multiplexer MUX2(Jump,{add1out[31:28],shlout},mux1out,pcin);
    DataMemory DM(MemRd_4,MemWr_4,aluout_2,rt_3,dmout);
    RegMA MA_WB(clk,aluout_2,dmout,IR_3,RegDst_4,MemtoReg_4,
    aluout_3,dmout_2,IR_4,RegDst_5,MemtoReg_5);//MA级
    
    wire [4:0]rt_4;
    wire [4:0]rd_4;
    assign rt_4=IR_4[20:16];
    assign rd_4=IR_4[15:11];//WB级
    assign w_reg=RegDst_5?rd_4:rt_4;
    assign w_data=MemtoReg_5?dmout_2:aluout_3;

    
    always@(*)begin
        PCSrc=(flag&&Branch_4)||Jump;
        #10
        clk<=~clk;       
    end
endmodule
