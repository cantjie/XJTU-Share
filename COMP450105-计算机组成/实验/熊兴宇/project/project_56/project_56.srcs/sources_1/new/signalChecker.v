`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2018 09:09:15 PM
// Design Name: 
// Module Name: signalChecker
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


module signalChecker(
    input clk_i,
    input signal,
    input re_i,
    output inc
    );
    reg t0, t1, t2;
    reg flag = 0;
    always @(posedge clk_i or posedge re_i)
    begin    
        if(re_i)
        begin
            t0<=1'bz;
            t1<=1'bz;
            t2<=1'bz;           
        end
        else if(t2&&~t1&&t0)
        begin
            flag <= 1;
            t0=1'bz;
            t1=1'bz;
            t2=1'bz;
        end
        t2=t1;
        t1=t0;
        t0=signal;                
    end
    assign inc = (flag)?1:0;
endmodule
