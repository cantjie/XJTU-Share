`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/20 08:36:14
// Design Name: 
// Module Name: Multiplexer
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


module Multiplexer(
    input e,
    input [31:0]a,
    input [31:0]b,
    output [31:0]c
    );
    reg [31:0]d;
    always@(*)
        if(e==1)
            d<=a;
        else
            d<=b;
    assign c=d;
endmodule
