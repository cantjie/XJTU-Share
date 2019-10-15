`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/08 21:59:24
// Design Name: 
// Module Name: ConnectRamAndReg
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


module ConnectRamAndReg(

    );
    reg rd,wr,c,clk,rst;
    reg [3:0] addr,in;
    wire [3:0] out;
    ram myram(rd,wr,clk,rst,c,addr,in,out);
    reg cl,rs,e;
    reg [3:0] waddr,raddr;
    reg [3:0] wdata;
    wire [3:0] out;
    reg_group myregs(cl,rs,e,waddr,wdata,raddr,out);
endmodule
