`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/08 20:23:54
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [3:0] A,
    input [3:0] B,
    input [3:0] S,
    input C_0,
    input M,
    output C_4,
    output [3:0] F
    );
    wire o;
    reg [3:0] X;
    reg [3:0] Y;
    reg [4:0] C;
    reg [3:0] out;
    integer i;   
    always@(*)begin
        C[0]=C_0;
        for(i=0;i<4;i=i+1)
        begin
            X[i]=~((S[2]&&A[i]&&(~B[i]))||(S[3]&&A[i]&&B[i]));
            Y[i]=~(A[i]||(S[0]&&B[i])||S[1]&&~(B[i]));
            out[i]=X[i]^Y[i]^(C[i]||M);
            C[i+1]=(X[i]&&Y[i])||(X[i]&&(C[i]||M))||(Y[i]&&(C[i]||M));         
        end       
    end    
    assign F=out;   
endmodule
