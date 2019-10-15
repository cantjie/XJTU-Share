`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/22 19:32:11
// Design Name: 
// Module Name: SimpleALU
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


module SimpleALU(
    input [3:0]a,
    input [3:0]b,
    input [2:0]op,
    output reg[3:0]y
    );
    always@(a or b or op)begin
        case(op)
        3'b000:y=a+b;
        3'b001:y=a-b;
        3'b010:y=a*b;
        3'b011:y=a/b;
        3'b100:y=a&b;
        3'b101:y=a|b;
        3'b110:y=~a;
        3'b111:y=a^b;
        endcase
    end    
endmodule
