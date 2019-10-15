`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/20 08:20:19
// Design Name: 
// Module Name: InstructionMemory
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


module InstructionMemory(
    input clk,//额外接入一个时钟信号，为了第一个指令能够正确运行而不是直接到第二个，因为PC的值已经初始化为0了，第一个上升沿就会变成4
    input [31:0]pc,
    output [5:0]opcode,
    /*output [4:0]rs,
    output [4:0]rt,
    output [4:0]rd,*/
    output [25:0]addr26/*,
    output [15:0]imm16*/
    );
    reg [7:0] bram[127:0];//内容待定，因为是rom
    reg [31:0]in;//instruction
    reg [31:0]address;   
    reg [5:0]Opcode;
    reg haltflag=0;
    integer i;
    initial begin
        $readmemb("C:/Users/53194/Desktop/project_789/instruction.txt", bram); // 从文件中读取指令二进制代码
        in= 0; // 指令初始化
    end
   
    always@(posedge clk)begin
        address=pc[5:2]<<2;
        in = (bram[address]<<24) + (bram[address+1]<<16) + (bram[address+2]<<8) + bram[address+3];
        Opcode=in[31:26];
        if(Opcode==6'b111111)
            haltflag=1;
        if(haltflag)
            Opcode=6'b111111;       
    end
    assign opcode[5:0]=Opcode;
    /*assign rs[4:0]=in[25:21];
    assign rt[4:0]=in[20:16];
    assign rd[4:0]=in[15:11];*/
    assign addr26[25:0]=in[25:0];
    //assign imm16[15:0]=in[15:0];
endmodule
