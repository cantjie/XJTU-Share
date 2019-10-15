`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/23 20:13:01
// Design Name: 
// Module Name: ALU2
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
module ALU2(
    input [31:0]a,
    input [31:0]b,
    input [2:0]op,
    output z,
    output reg[31:0]y
    );
    always@(a or b or op)begin
        case(op)
        3'b000:y=a+b;
        3'b001:y=a-b;
        3'b010:y=a*b;
        3'b011:y=a<b?1:0;
        3'b100:y=a&b;
        3'b101:y=a|b;
        3'b110:y=~a;
        3'b111:y=a^b;
        default:y=0;
        endcase
    end    
    assign z=(y==0)?1:0;
endmodule
