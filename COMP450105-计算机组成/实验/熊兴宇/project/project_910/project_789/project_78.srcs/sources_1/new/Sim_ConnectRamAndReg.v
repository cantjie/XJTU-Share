`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/27 00:42:24
// Design Name: 
// Module Name: Sim_ConnectRamAndReg
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


module Sim_ConnectRamAndReg(

    );
    reg clk,en;
    reg [2:0]op;
    reg [3:0]addr1;
    reg [3:0]addr2;
    reg [3:0]in;
    wire [3:0]out;
    ConnectRamAndReg con(clk,en,op,addr1,addr2,in,out);
    initial begin
        en<=0;
        op<=2'b0;
        clk<=0;
        addr1<=3'b0;
        addr2<=3'b0;
        in<=3'b0;
        
        #10
        en<=1;
        addr1<=4'b0010;
        in<= 4'b1010;
        op<=3'b010;//write ram
        #20
        op<=3'b000;//read ram
        #20
        op<=3'b110;//reset ram
        #20
        op<=3'b000;//read ram
        #20
        op<=3'b010;
        in<=4'b0101;
        #20
        op<=3'b100;//from ram write into reg
        addr2<=4'b0011;
        addr1<=4'b0010;
        #20
        op<=3'b001;//read reg
        addr1<=4'b0011;
    end
    always@(*)begin
        #5
        clk<=~clk;
    end
    
endmodule
