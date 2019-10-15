`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/23 23:23:00
// Design Name: 
// Module Name: Sim_cpu
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


module Sim_cpu(

    );
    reg clk;
    reg [31:0]pcin=0;
    wire[5:0] opCode;
    wire[31:0] Out1, Out2, curPC, Result,Memout;
    top cpu(clk,pcin,opCode,Out1,Out2,curPC,Result,Memout);
    always
    #10
    clk<=~clk;
endmodule
