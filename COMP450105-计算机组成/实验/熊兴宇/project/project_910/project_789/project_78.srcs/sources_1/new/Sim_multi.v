`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/23 22:24:25
// Design Name: 
// Module Name: Sim_multi
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


module Sim_multi(

    );
    reg e=0;
    reg [31:0]a=1;
    reg [31:0]b=2;
    wire [31:0]c;
    Multiplexer test(e,a,b,c);
endmodule
