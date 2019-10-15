`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/18 19:26:21
// Design Name: 
// Module Name: Register
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


module Register(
    en,clk,reset,shl,write,din,dout,serial
    );
    input en,clk,reset,shl,write,serial;
    input [7:0] din;
    output reg [7:0] dout=8'h00;
    reg temp;
    reg index=0;
    
    always @(posedge clk) begin
        if(reset==1'b1) begin
            dout<=8'h00;
            index=0;
        end
        else begin
            if(en&&write&&serial==0) begin
                dout<=din;
            end 
            if(en&&write&&serial==1) begin
                dout[index]<=din[0];
                index=(index+1)%8; 
            end 
            if(en&&shl) begin
                temp=dout[0];
                dout[0]=dout[1];
                dout[1]=dout[2];
                dout[2]=dout[3];
                dout[3]=dout[4];
                dout[4]=dout[5];
                dout[5]=dout[6];
                dout[6]=dout[7];
                dout[7]=temp;
            end
        end
    end       
endmodule
