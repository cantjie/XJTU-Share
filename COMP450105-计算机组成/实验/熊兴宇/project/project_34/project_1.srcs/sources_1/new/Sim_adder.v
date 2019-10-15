`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/08 19:29:58
// Design Name: 
// Module Name: Sim_adder
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


module Sim_adder(

    );
    reg in_1,in_2,in_3;
    wire s,o;
    adder myadd(in_1,in_2,in_3,s,o);
    initial begin
        in_1<=0;
        in_2<=0;
        in_3<=0;
        #100
        in_1<=1;in_2<=1;in_3<=1;#50;
        in_1<=1;in_2<=1;in_3<=0;#50;
        in_1<=0;in_2<=1;in_3<=1;
    end
endmodule
