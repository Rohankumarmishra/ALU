include "alu.v"
timescale 1ns / 1ps
module alu_8bit_tb;
    reg [7:0] A, B;
    reg [2:0] opcode;
    wire [7:0] result;
    wire carry;

    alu_8bit uut (
        .A(A), .B(B), .opcode(opcode),
        .result(result), .carry(carry)
    );

    initial begin
        $dumpfile("alu8bit.vcd");
        $dumpvars;
        $monitor("A=%b B=%b opcode=%b : result=%b carry=%b", 
                 A, B, opcode, result, carry);

        A = 8'b11010111; B = 8'b01000001; opcode = 3'b000; #10;  // For ADD 

        A = 8'b00110111; B = 8'b00000001; opcode = 3'b001; #10;  // For SUB  

        A = 8'b01101101; B = 8'b01010001; opcode = 3'b010; #10;  // For Bitwise AND  

        opcode = 3'b011; #10;  // For Bitwise OR 

        opcode = 3'b100; #10;  // For Bitwise XOR 

        opcode = 3'b101; #10;  // For NOT A

        opcode = 3'b110; #10;  // For Increasing A by 1

        A = 8'b11001111; opcode = 3'b111; #10;  // For Right shift  A

        $finish;
    end
endmodule