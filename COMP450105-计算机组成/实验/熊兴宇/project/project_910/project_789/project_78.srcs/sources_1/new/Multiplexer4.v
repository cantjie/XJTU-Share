`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/24 04:38:47
// Design Name: 
// Module Name: Multiplexer4
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


module Multiplexer4(
    input j1,
    input j2,
    input [31:0]npc3,
    input [31:0]npc2,
    output [31:0]out
    );
    reg [31:0]dataout;
    always@(*)
        if(j1&&(~j2))
            dataout<=npc2;
        else if(j2&&(~j1))
            dataout<=npc3;
    assign out=dataout;            
endmodule
