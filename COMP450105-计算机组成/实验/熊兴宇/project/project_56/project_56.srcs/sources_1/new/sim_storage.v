`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/03 20:41:14
// Design Name: 
// Module Name: sim_storage
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


module sim_storage(

    );
    reg rd,wr,clk,rst;
    reg [4:0] addr;
    reg [7:0] in;
    wire [7:0] out;
    storage mystorage(rd,wr,clk,rst,addr,in,out);
    initial begin
        rd<=0;
        wr<=0;       
        rst<=0;
        addr<=4'b0;
        clk<=0;
        in<=0;
        
        addr[4]<=0;
        #40
        wr<=1;
        #20
        addr[3:0]<=4'b0000;
        in<=8'h11;
        #10
        addr[3:0]<=4'b0010;
        in<=8'h12;
        #10
        addr[3:0]=4'b0100;
        in<=8'h13;
        #10
        addr[3:0]<=4'b0110;
        in<=8'h14;
        #10
        addr[3:0]<=4'b1000;
        in<=8'h15;
        #40
        addr[3:0]<=4'b0;
        in<=8'b0;
        #40
        wr<=0;
        #40
        
        rd<=1;
        #20
        addr[3:0]<=4'b0000;
        #10
        addr[3:0]<=4'b0010;
        #10
        addr[3:0]<=4'b0100;
        #10
        addr[3:0]<=4'b0110;
        #10
        addr[3:0]<=4'b1000;
        #80
        addr[3:0]<=4'b0;
        #40
        rd<=0;
        #40
        
        wr<=1;
        addr[4]<=1;
        #20
        addr[3:0]<=4'b1001;
        in<=8'b11011010;
        #80
        addr[3:0]<=4'b0;
        in<=8'b0;
        #40
        wr<=0;
        
        #40
        rd<=1;
        #30
        addr[3:0]<=4'b1001;
        #20
        addr[3:0]<=4'b0000;
        #30
        rd<=0;
        
        #40
        rst<=1;
        #40
        rst<=0;
        #10
        rd<=1;
        #10
        addr[3:0]<=4'b1001;
        #30
        addr[3:0]<=4'b0;
        #10
        rd<=0;  
        #20
        addr[4]<=0;
        #10
        rd<=1;   
        #30
        addr[3:0]<=4'b1110;
        #50
        addr[3:0]<=4'b0;
        #10
        rd<=0;
        
    end
    always begin
        #1
        clk<=~clk;
    end
endmodule
