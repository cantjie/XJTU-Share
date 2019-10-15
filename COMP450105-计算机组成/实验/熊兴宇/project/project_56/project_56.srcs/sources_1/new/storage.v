`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/03 20:32:00
// Design Name: 
// Module Name: storage
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


module storage(
    input rd,
    input wr,
    input clk,
    input rst,
    input [5:0] addr,
    input [7:0] in,
    output [7:0] out
    );
    reg [3:0] bram [31:0];
    reg [3:0] data;
    integer i;
    ram r1(rd,wr,clk,rst,addr[4],addr[3:0],in[3:0],out[3:0]);
    ram r2(rd,wr,clk,rst,addr[4],addr[3:0],in[7:4],out[7:4]);
    ram r3(rd,wr,clk,rst,~addr[4],addr[3:0],in[3:0],out[3:0]);
    ram r4(rd,wr,clk,rst,~addr[4],addr[3:0],in[7:4],out[7:4]);
endmodule
