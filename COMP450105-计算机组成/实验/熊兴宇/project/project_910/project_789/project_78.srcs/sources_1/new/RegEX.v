`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/24 03:55:24
// Design Name: 
// Module Name: RegEX
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


module RegEX(
    input clk,
    input [31:0]npc3,
    input [31:0]npc2,
    input z,
    input [31:0]aluout,
    input [31:0]rt,
    input [31:0]ir,
    input ju,dst,br,mtr,rd,wr,
    output [31:0]NPC3,
    output [31:0]NPC2,
    output flag,
    output [31:0]Aluout,
    output [31:0]Rt,
    output [31:0]IR,
    output J,Dst,Br,Mtr,Rd,Wr
    );
    reg [31:0]a;
    reg [31:0]b;
    reg c;
    reg [31:0]d;
    reg [5:0]e;
    reg [31:0]f;
    reg g,h,i,j,k,l;
    always@(posedge clk)begin
        a<=npc3;
        b<=npc2;
        c<=z;
        d<=aluout;
        e<=rt;
        f<=ir;
        k<=ju;l<=dst;g<=br;h<=mtr;i<=rd;j<=wr;
    end
    assign Dst=l;
    assign J=k;
    assign Br=g;
    assign Mtr=h;
    assign Rd=i;
    assign Wr=j;
    assign NPC3=a;
    assign NPC2=b;
    assign flag=c;
    assign Aluout=d;
    assign Rt=e;
    assign IR=f;
endmodule
