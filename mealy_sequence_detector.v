`timescale 1ns / 1ps
module mealy_1011(input clk,reset,in,output reg out);
localparam A=3'b000;
localparam B=3'b001;
localparam C=3'b010;
localparam D=3'b011;
reg [2:0]current_state,next_state;

always @(posedge clk or posedge reset)
begin
if(reset)
current_state<=A;
else
current_state<=next_state;
end

// Combined next state and output logic (characteristic of Mealy FSM)
always @(in or current_state)
begin
case(current_state)
A : begin
    if(in==1) begin
        next_state=B;
        out=0;
    end
    else begin
        next_state=A;
        out=0;
    end
    end
B : begin
    if(in==1) begin
        next_state=B;
        out=0;
    end
    else begin
        next_state=C;
        out=0;
    end
    end 
C : begin
    if(in==1) begin
        next_state=D;
        out=0;
    end
    else begin
        next_state=A;
        out=0;
    end
    end 
D : begin
    if(in==1) begin
        next_state=B;
        out=1;  // Output 1 when sequence 1011 is completed
    end
    else begin
        next_state=C;
        out=0;
    end
    end      
endcase
end
endmodule