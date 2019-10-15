`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/20 08:26:49
// Design Name: 
// Module Name: RegisterFile
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

module RegisterFile(
    input clk,
    input regwr,
    input [31:0]wdata,
    input [4:0]reg1,
    input [4:0]reg2,//rt¼´reg1£¬rd¼´reg2
    input [4:0]wreg,
    output [31:0]rdata1,
    output [31:0]rdata2
    );
    reg [31:0]bram[31:0];
    integer i;
    initial begin
        for(i=0;i<32;i=i+1)
            bram[i]=i;//³õÊ¼»¯¼Ä´æÆ÷¶Ñ
    end
    always@(posedge clk)begin
        if(regwr)
            bram[wreg]<=wdata;
    end
    assign rdata1=bram[reg1];
    assign rdata2=bram[reg2];
endmodule
