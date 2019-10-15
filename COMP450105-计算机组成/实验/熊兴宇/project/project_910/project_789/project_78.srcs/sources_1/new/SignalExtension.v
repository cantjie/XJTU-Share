`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/20 08:34:44
// Design Name: 
// Module Name: SignalExtension
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


module SignalExtension(
    input [15:0]imm16,
    output [31:0]alua
    );
    reg [15:0]zero=0;
    assign alua={zero,imm16};
endmodule
