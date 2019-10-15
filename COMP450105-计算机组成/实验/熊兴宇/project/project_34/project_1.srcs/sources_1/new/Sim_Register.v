`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/18 19:55:01
// Design Name: 
// Module Name: Sim_Register
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


module Sim_Register(
    );
    reg c,re,e,wr,sh,ser;
    reg [7:0] in;
    wire [7:0] out;
    Register Reg(
        .en(e),
        .clk(c),
        .reset(re),
        .din(in),
        .dout(out),
        .write(wr),
        .shl(sh),
        .serial(ser)
    );
    initial begin
        e<=0;
        c<=0;
        in<=8'h00;        
        re<=0;
        wr<=0;
        sh<=0;
        ser<=0;
        
        #10
        in<=8'h5a;
        #20
        wr<=2'b1;
        #10
        in<=8'h88;
        #10
        wr<=0;
        e<=1;
        #20;
        sh<=1;
        #70
        sh<=0;
        #50
        re<=1;
        #20
        re<=0;
        wr<=1; 
        #10
        in<=8'hd3;
             
        #100
        ser<=1;
        re<=1;
        #50
        re=0;
        in=8'h00;
        in[0]=1'b0;
        #20
        in[0]=1'b1;
        #20
        in[0]=1'b0;
        #20
        in[0]=1'b1;
        #10
        wr<=0;
    end
    always begin
        #20
        c<=~c;
    end
endmodule
