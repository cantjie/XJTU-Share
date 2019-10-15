`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/08 18:35:29
// Design Name: 
// Module Name: Sim_halfadder
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


module Sim_halfadder(

    );
    reg in_1,in_2;
    wire s,o;
    halfadder myadd(in_1,in_2,s,o);
    initial begin
        in_1<=0;
        in_2<=0;
        #100
        in_1<=1;
        #50
        in_2<=1;
        #20
        in_1<=0;
    end
        
endmodule
