`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/03 19:49:43
// Design Name: 
// Module Name: sim_ram
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


module sim_ram(

    );
    reg rd,wr,c,clk,rst;
    reg [3:0] addr,in;
    wire [3:0] out;
    ram myram(rd,wr,clk,rst,c,addr,in,out);
    initial begin
        rd<=0;
        wr<=0;
        c<=0;
        rst<=0;
        addr<=4'b0;
        clk<=0;
        in<=0;
        
        #40
        wr<=1;
        c<=1;
        #20
        addr<=4'b1001;
        in<=4'b1101;
        #80
        addr<=4'b0;
        in<=4'b0;
        #40
        wr<=0;
        
        #40
        rd<=1;
        #30
        addr<=4'b1001;
        #20
        addr<=4'b0000;
        #30
        rd<=0;
        
        #40
        rst<=1;
        #40
        rst<=0;
        #10
        rd<=1;
        #10
        addr<=4'b1001;
        #30
        addr<=4'b0;
        #20
        c<=0;
        
    end
    always begin
        #1
        clk<=~clk;
    end
endmodule
