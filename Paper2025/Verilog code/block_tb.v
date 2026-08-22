`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.08.2026 11:55:52
// Design Name: 
// Module Name: block_tb
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


module block_tb;
    
    reg clk, reset, valid; 
    wire [3:0] otp; 
    reg [7:0] bit_string;
    reg [10:0] toep_string;
    
    block dut(bit_string, toep_string, valid, clk, reset, otp); 
    
    always #5 clk = ~clk;
    initial begin 
    clk = 0; 
    reset = 1; 
    valid = 0; 
    #1 reset = 0; 
    #2 reset = 1; 
    #5 bit_string = 8'b11110100; toep_string = 11'b10011011001; valid = 1;
    #10 valid = 0;
    
    end
endmodule
