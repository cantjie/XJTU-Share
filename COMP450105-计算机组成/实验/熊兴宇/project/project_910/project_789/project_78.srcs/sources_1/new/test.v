`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/22 20:39:49
// Design Name: 
// Module Name: test
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


module test(
 
    );
    reg [7:0] bram[127:0];//内容待定，因为是rom

    initial begin
        $readmemb("C:/Users/53194/Desktop/project_789/instruction.txt", bram); // 从文件中读取指令二进制代码
    end
endmodule
