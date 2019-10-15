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
    input rst,
    input en,
    input [3:0] wr_addr,
    input [3:0] wr_data,
    input [3:0] rd_addr,
    input [1:0] connect,
    input [3:0] conin,
    output [3:0] conout,
    output [3:0] rd_data
    );
    reg[3:0] bram [4:0];
    integer i;
    initial begin
        for(i=0;i<16;i=i+1)
        begin
            bram[i]<=4'b0;
        end
    end
    always @(posedge clk or posedge rst)
    begin
            if(rst)
            begin
                for(i=0;i<16;i=i+1)
                begin
                    bram[i]<=4'b0;
                end
            end
            else if(en)
            begin 
                bram[wr_addr]=wr_data;
            end            
   end 
   assign rd_data=bram[rd_addr];
endmodule
