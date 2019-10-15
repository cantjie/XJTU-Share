`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/20 15:49:23
// Design Name: 
// Module Name: ALUControl
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
`define LW 6'b100011
`define SW 6'b101011

`define ADD 6'b100000
`define SUB 6'b100010
`define ADDU 6'b100001
`define AND 6'b100100
`define OR 6'b100101
`define SLT 6'b101010

`define BEQ 6'b000100
`define J 6'b000010
`define R 6'b000000

`define HALT 6'b111111

module ALUControl(
    input [5:0]opcode,
    output [2:0]aluop
    );
    reg [2:0]out;
    always@(*)
    case(opcode)
        `LW:out<=3'b000;
        `SW:out<=3'b000;
        `ADD:out<=3'b000;
        `SUB:out<=3'b001;
        `ADDU:out<=3'b000;
        `AND:out<=3'b100;
        `OR:out<=3'b101;
        `SLT:out<=3'b011;
        default:out<=3'b111;
    endcase
    assign aluop=out;
endmodule
