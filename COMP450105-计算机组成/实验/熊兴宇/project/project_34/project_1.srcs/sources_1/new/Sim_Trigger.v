`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/18 18:56:40
// Design Name: 
// Module Name: Sim_Trigger
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


module Sim_Trigger(
    );
    reg c,re,in,e;
    wire out;
    Trigger trigg(
        .en(e),
        .clk(c),
        .reset(re),
        .d_in(in),
        .d_out(out)
    );
    initial begin
        e<=0;
        c<=0;
        in<=0;        
        re<=0;
        #10
        in<=1;
        #20
        in<=0;
        #10
        e<=1;
        #20
        in<=1;
        #30
        in<=0;
        #50
        re<=1;
        #20
        re<=0;      
    end
    always begin
        #10
        c<=~c;
    end
endmodule
