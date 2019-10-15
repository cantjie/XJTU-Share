`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/08 20:42:58
// Design Name: 
// Module Name: adder4
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


module adder4(
    input a[3:0],
    input b[3:0],
    input c_0,
    output c[3:0],
    output c_4
    );
    reg c_1,c_2,c_3;
    adder myadder1(a[0],b[0],c_0,c[0],c_1);
    adder myadder2(a[1],b[1],c_1,c[1],c_2);
    adder myadder3(a[2],b[2],c_2,c[2],c_3);
    adder myadder4(a[3],b[3],c_3,c[3],c_4);
endmodule
