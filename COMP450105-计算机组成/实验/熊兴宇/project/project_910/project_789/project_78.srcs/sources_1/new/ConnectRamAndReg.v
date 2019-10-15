`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/08 21:59:24
// Design Name: 
// Module Name: ConnectRamAndReg
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


module ConnectRamAndReg(
    input clk,
    input en,
    input [2:0]op,
    input [3:0]addr,
    input [3:0]addr2,//if connect ram with reg,use addr as write address
    input [3:0]in,
    output [3:0]out
    );
    reg rd,wr,c,ramrs;
    reg [3:0] ramaddr,ramin;
    wire [3:0] ramout;
    ram myram(rd,wr,clk,ramrs,c,ramaddr,ramin,ramout);
    reg regrs,read,write;
    reg [3:0] regaddr;
    reg [3:0] regin;
    wire [3:0] regout;
    reg_group myreg(clk,read,write,regrs,regaddr,regin,regout);
    
    reg [3:0]dataout=4'bz;
    reg [3:0]temp=4'bz;
    
    always@(*)
    begin
        c<=0;
        ramrs<=0;
        rd<=0;
        wr<=0;
        read<=0;
        write<=0;
        regrs<=0;
        dataout=4'bz;
        if(en)
        case(op)
            3'b000:begin//read from ram
                c<=1;
                rd<=1;
                ramaddr[3:0]<=addr[3:0];
                dataout[3:0]<=ramout[3:0];
                end
            3'b001:begin//read from reg
                read<=1;
                regaddr[3:0]<=addr[3:0];
                dataout[3:0]<=regout[3:0];
                end
            3'b010:begin//write into ram
                c<=1;
                wr<=1;
                ramaddr[3:0]<=addr[3:0];
                ramin[3:0]<=in[3:0];
                end
            3'b011:begin//write into reg
                write<=1;
                regaddr[3:0]<=addr[3:0];
                regin[3:0]<=in[3:0];
                end
            3'b100:begin//from ram write into reg
                c<=1;
                rd<=1;
                ramaddr[3:0]<=addr[3:0];
                temp[3:0]<=ramout[3:0];
                write<=1;
                regaddr[3:0]<=addr2[3:0];
                regin[3:0]<=temp[3:0];
                end
            3'b101:begin//from reg write into ram
                c=1;
                wr=1;
                regaddr[3:0]=addr[3:0];
                temp[3:0]=regout[3:0];
                read=1;
                ramaddr[3:0]=addr2[3:0];
                ramin[3:0]=temp[3:0];
                end
            3'b110:begin//reset ram
                c<=1;
                ramrs<=1;
                end        
            3'b111:begin//reset reg
                regrs<=1;
                end
        endcase
    end
    
    assign out[3:0]=dataout[3:0];
    
endmodule
