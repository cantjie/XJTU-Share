`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/08 20:02:37
// Design Name: 
// Module Name: Sim_Reg_group
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


module Sim_Reg_group(

    );
    reg rd,wr,cl,rs;
    reg [3:0] addr;
    reg [3:0] in;
    wire [3:0] out;
    reg_group myregs(cl,rd,wr,rs,addr,in,out);
    initial begin
            rs<=0;
            rd<=0;
            wr<=0;
            addr<=4'b0;
            cl<=0;
            in<=0;
            #100
            
            #40
            wr<=1;            
            addr<=4'b1001;#20
            in<=7;#30
            wr<=0;#40
            
            rd<=1;#10
            addr<=4'b1001;#30
            rd<=0;#10
            
           rs<=1;#20
            rs<=0;#10
            
            rd<=1;#10
            addr<=9;#20
            rd<=0;
    end
    always begin
        #5
        cl<=~cl;
    end
endmodule
