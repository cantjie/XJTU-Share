`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/18 18:51:41
// Design Name: 
// Module Name: Trigger
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


module Trigger(
    input en,
    input clk,
    input reset,
    input d_in,
    output reg d_out
    );
    always @(posedge clk) begin
        if(reset==1'b1) begin
            d_out<=1'b0;
        end
        else if(en) begin
            d_out<=d_in;
        end        
    end   
endmodule
