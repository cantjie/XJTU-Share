`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/03 20:46:25
// Design Name: 
// Module Name: coder
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


module coder(
    );
    wire a=0,b=1;
    wire d0,d1,d2,d3;
    LogicAndNot g0(~a,~b,d0);
    LogicAndNot g1(a,~b,d1);
    LogicAndNot g2(~a,b,d2);
    LogicAndNot g3(a,b,d3);
endmodule
