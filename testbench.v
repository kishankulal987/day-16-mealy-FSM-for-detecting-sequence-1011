
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2025 18:28:53
// Design Name: 
// Module Name: testbench
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


module testbench();
reg clk,reset,in;
wire out;
mealy_1011 fsm(clk,reset,in,out);
initial begin
clk=0;
forever #5 clk=~clk;
end

initial begin
reset=1;
#10 reset=0;
repeat(50)
begin
in=$random();
#10;
end
$finish;
end
endmodule
