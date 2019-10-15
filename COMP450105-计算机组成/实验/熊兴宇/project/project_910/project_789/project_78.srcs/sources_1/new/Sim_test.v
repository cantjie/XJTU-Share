`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/01 22:36:39
// Design Name: 
// Module Name: Sim_test
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


module Sim_test(

    );
    reg [3:0]a;
    reg [3:0]b;
    wire [5:0]o;
    test mytest(a,b,o);
    initial begin
    #10
    a<=4;
    end
endmodule
