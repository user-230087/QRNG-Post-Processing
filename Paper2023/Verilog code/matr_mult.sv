`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.08.2026 15:21:03
// Design Name: 
// Module Name: matr_mult
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


module matr_mult #(parameter k = 80, m = 1024)(
input [k-1:0] raw_string, 
input [k-1:0] toep_string [m-1:0],
input valid,
output [m-1:0] ans
    );
    reg [k-1:0] temp;
    reg tempstr;
    reg [m-1:0] opstring;
    integer i; 
    always@(*) begin 
    for (i = 0; i < m; i = i + 1) begin 
        temp = raw_string & toep_string[i]; 
        opstring[m-i-1] = ^temp; 
    end
    end
    assign ans = (valid == 1) ? opstring : 0;
endmodule