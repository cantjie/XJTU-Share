`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/26 22:36:57
// Design Name: 
// Module Name: ram
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


module ram(
    input rd,
    input wr,
    input clk,
    input rst,
    input en,
    input [3:0] addr,
    input [3:0] in,
    output [3:0] out
    );
    reg[3:0] bram [15:0];
    reg [3:0]dataout=4'bz;
    integer i;
    always @(posedge clk or posedge rst)
    begin
            dataout<=4'bz; 
            if(en&&rst)
            begin            
                for(i=0;i<16;i=i+1)
                begin
                    bram[i]<=4'b0;
                end               
            end
            else if(en&&rd)
                dataout<=bram[addr];           
            else if(en&&wr)
                bram[addr]<=in;   
   end 
   assign out=(en&rd)?dataout:4'bz;
endmodule
