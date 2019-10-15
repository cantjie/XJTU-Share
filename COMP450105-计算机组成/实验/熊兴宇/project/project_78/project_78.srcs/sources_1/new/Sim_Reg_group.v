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
    reg cl,rs,e;
    reg [3:0] waddr,raddr;
    reg [3:0] wdata;
    wire [3:0] out;
    reg_group myregs(cl,rs,e,waddr,wdata,raddr,out);
    initial begin
            rs<=0;
            e<=0;
            waddr<=4'b0;
            raddr<=4'b0;
            cl<=0;
            wdata<=4'b0;
            #100
            
            e<=1;#40            
            waddr<=9;#20
            wdata<=4'b0110;#30
            e<=0;#40
            raddr<=9;#30
            rs<=1;#20
            rs<=0;
    end
    always begin
        #1
        cl<=~cl;
    end
endmodule
