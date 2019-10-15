`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/18 20:59:29
// Design Name: 
// Module Name: Counter
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


module Counter(
    input clk,reset,
    output reg [15:0] high=0,low=0
    );
    always @(posedge clk) begin
        low=low+1;
        if(reset==1) begin
            low<=0;
        end
        else if(low%16'h0100==8'h5e) begin
            low=low+16'h0100-8'h5e;
        end
    end
endmodule
