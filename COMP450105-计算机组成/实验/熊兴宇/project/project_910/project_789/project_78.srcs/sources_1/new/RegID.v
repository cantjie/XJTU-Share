`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/24 03:55:03
// Design Name: 
// Module Name: RegID
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


module RegID(
    input clk,
    input [31:0]npc,
    input [31:0]rs,
    input [31:0]rt,
    input [31:0]imm32,
    input [31:0]ir,
    input ju,dst,br,mtr,rd,wr,src,
    input [5:0]opcode,
    output [31:0]NPC,
    output [31:0]Rs,
    output [31:0]Rt,
    output [31:0]Imm32,
    output [31:0]IR,
    output J,Dst,Br,Mtr,Rd,Wr,Src,
    output [5:0]opcode_2
    );
    reg [31:0]e;
    reg [31:0]a;
    reg [31:0]b;
    reg [31:0]c;
    reg [31:0]d;
    reg f,g,h,i,j,k,l;
    reg [5:0]m;
    always@(posedge clk)begin
        e<=npc;
        a<=rs;
        b<=rt;
        c<=imm32;
        d<=ir;
        f<=ju;l<=dst;g<=br;h<=mtr;i<=rd;j<=wr;k<=src;
        m<=opcode;
    end
    assign Dst=l;
    assign J=f;
    assign Br=g;
    assign Mtr=h;
    assign Rd=i;
    assign Wr=j;
    assign Src=k;
    assign NPC=e;
    assign Rs=a;
    assign Rt=b;
    assign Imm32=c;
    assign IR=d;
    assign opcode_2=m;
endmodule
