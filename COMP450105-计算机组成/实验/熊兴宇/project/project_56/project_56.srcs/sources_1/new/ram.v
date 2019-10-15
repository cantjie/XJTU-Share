`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/03 18:38:45
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
    input rd_en_i,
    input wr_en_i,
    input clk_i,
    input rst_i,
    input cs,
    input [3:0] addr_i,
    input [3:0] data_in,
    output [3:0] data_out
    );
    reg [3:0] bram [15:0];
    reg [3:0] data;
    integer i;
    always @(posedge clk_i or posedge rst_i)
    begin
        if(cs)
        begin
            if(rst_i&&cs)
            begin
                for(i=0;i<16;i=i+1)
                    bram[i]<=4'b0;
            end
            else if(wr_en_i&&cs)
            begin 
                bram[addr_i]=data_in;
            end
            else if(rd_en_i&&cs)
            begin
                data<=bram[addr_i];
            end
            else
            begin
                data<=4'bz;
            end
       end
   end
   assign data_out=(rd_en_i&&cs)?data:4'bz;   
endmodule
