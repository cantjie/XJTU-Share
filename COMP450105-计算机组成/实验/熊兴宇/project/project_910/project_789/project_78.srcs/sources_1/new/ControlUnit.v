`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/20 08:19:41
// Design Name: 
// Module Name: ControlUnit
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
 
`define HALT 6'b111111

module ControlUnit(
    //input clk,//为了实现指令的暂存
    input [5:0]opcode,
    output RegWr,
    output Jump,
    output RegDst,
    output Branch,
    output MemtoReg,
    output MemRd,
    output MemWr,
    output ALUSrc
    );
    /*reg [5:0]opcode[4:0];
    always@(posedge clk)begin
        opcode[4]=opcode[3];
        opcode[3]=opcode[2];
        opcode[2]=opcode[1];
        opcode[1]=opcode[0];
        opcode[0]=Opcode;
    end*/
    assign RegWr=(opcode==`LW)?1:0;
    assign Jump=(opcode==`J)?1:0;
    assign RegDst=(opcode==`ADD||opcode==`SUB||opcode==`ADDU||opcode==`AND||opcode==`OR||opcode==`SLT)?1:0;
    assign Branch=(opcode==`BEQ)?1:0;
    assign MemtoReg=(opcode==`LW)?1:0;
    assign MemRd=(opcode==`LW)?1:0;
    assign MemWr=(opcode==`SW)?1:0;
    assign ALUSrc=(opcode==`LW||opcode==`SW)?1:0;
endmodule
