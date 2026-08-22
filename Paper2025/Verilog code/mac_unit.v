`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.08.2026 21:59:43
// Design Name: 
// Module Name: mac_unit
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


module mac_unit #(parameter bs = 76)(
input [bs - 1:0] block_str, 
input [bs - 1:0] toep_str, 
output os
    );
    wire [bs - 1: 0] intm; 
    assign intm = block_str & toep_str; 
    assign os = ^intm;
endmodule
