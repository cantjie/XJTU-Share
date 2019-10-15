`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2018 09:10:38 PM
// Design Name: 
// Module Name: sim_checker
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


module sim_checker(

    );
    reg clk_i,signal,re_i;
    wire inc;
    signalChecker checker(clk_i,signal,re_i,inc);
    initial begin
        clk_i<=0;
        signal<=0;
        re_i<=0;
        
        #20
        signal<=1;
        #20
        signal<=0;
        #20
        signal<=1;
        #20
        signal<=0;
        #20
        signal<=1;
        
        #100
        re_i<=1;
        #20
        re_i=0;
        signal=1;
        #20
        signal<=0;
        #20
        signal<=1;
        #20
        signal<=1;
        #20
        signal<=0;
        #20
        signal<=1;
    end
    
    always begin
    #10
    clk_i=~clk_i;
    end
endmodule
