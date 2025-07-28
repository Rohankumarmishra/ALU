module alu_8bit (
    input [7:0] A,           // First operand
    input [7:0] B,           // Second operand
    input [2:0] opcode,      // Operation code
    output reg [7:0] result, // Result
    output reg carry       // Carry output (for add/sub)
    
);

    always @(*)
     begin
        carry = 0;
        case (opcode)
            3'b000: begin       // Add
                {carry, result} = A + B;
            end
            3'b001: begin       // Sub
                {carry, result} = A - B;
            end
            3'b010: begin       // And
                result = A & B;
            end
            3'b011: begin       // Or
                result = A | B;
            end
            3'b100: begin       // Xor
                result = A ^ B;
            end
            3'b101: begin       // Not A
                result = ~A;
            end
            default: result = 8'b00000000;
        endcase

       
    end

endmodule
