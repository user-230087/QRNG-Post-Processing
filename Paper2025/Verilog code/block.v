`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.08.2026 22:13:08
// Design Name: 
// Module Name: block
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


module block #(parameter m = 46, bs = 76, log2m = 6)(
input [bs - 1 : 0] bstring, 
input [bs + m - 2 : 0] toep_str, 
input val, clk, reset,
output [m - 1: 0 ] op
    );
    reg [bs - 1:0] inbs, intoep; 
    reg [bs + m - 2 : 0] dummystr;
    reg complete;
    wire opstring;
    reg [m - 1:0] opstr;
    reg [log2m - 1:0] ctr;
    reg [1:0] state, nextstate; 
    localparam START = 2'b00, COMP = 2'b01, FINISH = 2'b10;
    integer i = 0;
    
    mac_unit dut(inbs, intoep, opstring);
    
    always @(posedge clk, negedge reset) begin 
        if(!reset) begin 
            state <= START; 
        end
        else begin 
            state <= nextstate;
            if(state == 2'b01) ctr <= ctr + 1; 
            else ctr <= 0;
        end
    end
    
    always@(*) begin 
    case(state) 
        START: begin 
        nextstate = (val) ? COMP : START; complete = 0; inbs = bstring; dummystr = toep_str; end
        COMP: begin 
            if(ctr != 0) dummystr = toep_str>>ctr;
            else dummystr = toep_str;

            intoep = dummystr[bs - 1:0];
            opstr[m - ctr - 1] = opstring;
            
            if(ctr == m-1) nextstate = FINISH;
            else nextstate = COMP;
        end
        FINISH: begin complete = 1; nextstate = (val) ? START : FINISH; end
        default: begin  end
    endcase
    end
    
    assign op = (complete  == 1) ? opstr : 0;
endmodule
