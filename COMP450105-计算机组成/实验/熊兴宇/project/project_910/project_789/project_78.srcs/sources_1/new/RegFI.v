`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/24 03:50:20
// Design Name: 
// Module Name: RegFI
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


module RegFI(
    input clk,
    input [31:0]in32,
    input [25:0]in26,
    input rwr,ju,dst,br,mtr,rd,wr,src,
    input [5:0]opcode,
    output [31:0]out32,
    output [25:0]out26,
    output Rwr,J,Dst,Br,Mtr,Rd,Wr,Src,
    output [5:0]opcode_2
    );
    reg [31:0]a;
    reg [25:0]b;
    reg c,d,e,f,g,h,i,j;
    reg [5:0]l;
    always@(posedge clk)begin
        a<=in32;
        b<=in26;
        c<=rwr;d<=ju;e<=dst;f<=br;g<=mtr;h<=rd;i<=wr;j<=src;
        l<=opcode;
    end
    assign Rwr=c;
    assign J=d;
    assign Dst=e;
    assign Br=f;
    assign Mtr=g;
    assign Rd=h;
    assign Wr=i;
    assign Src=j;
    assign out32=a;
    assign out26=b;
    assign opcode_2=l;
endmodule
