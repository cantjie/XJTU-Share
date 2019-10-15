`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/08 19:40:38
// Design Name: 
// Module Name: reg_group
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


module reg_group(   
    input clk,
    input rd,
    input wr,
    input rst,
    input [3:0] addr,
    input [3:0] in,
    output [3:0] out
    );
    reg[3:0] bram [9:0];
    reg[3:0] dataout=4'bz;
    integer i;
    always @(posedge clk or posedge rst)
    begin
        if(rst)begin
            for(i=0;i<16;i=i+1)
                bram[i]<=4'b0;
        end
        else if(wr)begin
            bram[addr]<=in;
        end
        else if(rd)begin
            dataout<=bram[addr];
        end   
        else begin
            dataout<=4'bz;
        end    
   end 
   assign out=rd?dataout:4'bz;
endmodule
