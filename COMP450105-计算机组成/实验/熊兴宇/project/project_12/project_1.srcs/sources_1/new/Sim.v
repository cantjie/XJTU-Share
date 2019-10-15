`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/18 18:49:18
// Design Name: 
// Module Name: LogicOr
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


module Sim(
    );
    wire a=1,b=0,d=0,e=1,f=0;
    wire c,g,k,out;
    LogicOr b1(a,b,c);
    LogicOr b2(c,d,g);
    LogicAnd a1(g,e,k);
    LogicAnd a2(k,f,out);
endmodule
