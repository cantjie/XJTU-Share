`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/18 21:05:50
// Design Name: 
// Module Name: Sim_Counter
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


module Sim_Counter(
    );
    reg c,re;
    wire [15:0]low;
    Counter count(c,re,high,low);
    initial begin
        c<=0;
        re<=0;
        
        #100
        re<=1;
        #40
        re<=0;
    end
    always begin
        #1
        c<=~c;
    end
endmodule
