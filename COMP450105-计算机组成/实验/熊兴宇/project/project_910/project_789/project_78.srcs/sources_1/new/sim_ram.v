`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/26 22:36:01
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
    reg rd,wr,cl,rs,en;
    reg [3:0] addr;
    reg [3:0] in;
    wire [3:0] out;
    ram myram(rd,wr,cl,rs,en,addr,in,out);
    initial begin
        rd<=0;wr<=0;cl<=0;cl<=0;rs<=0;en<=0;
        addr<=4'b0;
        in<=4'b0;
        #10
        en<=1;wr<=1;addr<=4'b1001;
        in<=7;
        #20
        wr<=0;rd<=1;#20
        rs<=1;rd<=0;#20
        rd<=1;rs<=0;#20
        rd<=0;en<=0;
    end
    always@(*)begin
    #5
    cl<=~cl;
    end
endmodule
