`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/20 08:21:12
// Design Name: 
// Module Name: DataMemory
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


module DataMemory(
    input rd,
    input wr,
    input [4:0]addr,
    input [31:0]wdata,
    output [31:0]rdata
    );
    reg [31:0]bram [31:0];
    reg [31:0]dataout=32'bz;
    integer i;
    initial begin
        for(i=0;i<32;i=i+1)
            bram[i]=31-i;//初始化数据存储器
    end
    always @(*)begin
        dataout<=32'bz;          
        if(rd)
            dataout<=bram[addr];           
        else if(wr)
            bram[addr]<=wdata;   
    end 
    assign rdata=rd?dataout:32'bz;
endmodule
