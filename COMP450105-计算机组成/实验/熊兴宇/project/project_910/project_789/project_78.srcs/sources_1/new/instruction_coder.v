`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/22 20:16:57
// Design Name: 
// Module Name: instruction_coder
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


module instruction_coder(
    input clk,
    input [3:0]op,
    input [7:0]ins,//can be two operation numbers,one number one address,or two addresses
    output [3:0]out
    );
    reg [3:0]addr;
    reg [2:0]storageop;
    reg [3:0]addrread;
    reg [3:0]storagein;
    reg [3:0]storageout;
    ConnectRamAndReg storage(clk,1,storageop,addr,addrread,storagein,storageout);
    reg [3:0]number1;
    reg [3:0]number2;
    reg [2:0]calculationop;
    wire [3:0]calculationout;
    SimpleALU alu(number1,number2,calculationop,calculationout);
    
    reg [3:0]dataout=3'bz;
    always@(*)
    begin
        if(op[3]==0)
        begin
            storageop[2:0]<=op[2:0];
            addr<=ins[3:0];
            addrread<=ins[7:4];
            storagein<=ins[7:4];
            dataout[3:0]<=storageout[3:0];
        end
        else
        begin
            calculationop[2:0]<=op[2:0];
            number1<=ins[3:0];
            number2<=ins[7:4];
            dataout[3:0]<=calculationout[3:0];
        end
    end
endmodule
