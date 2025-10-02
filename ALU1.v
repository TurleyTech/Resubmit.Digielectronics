module alu_1bit (
    input  wire a,
    input  wire b,
    input  wire carry_in_add,           // carry in for ADD/SUB chain
    input  wire [1:0] op_code,          // 00:ADD 01:SUB 10:AND 11:OR
    output wire result_bit,
    output wire carry_out
);
    wire B_inverted = (op_code == 2'b01);
    wire B_effective = B_inverted ? ~b : b;

    wire sum_adder, carry_adder;
    assign {carry_adder, sum_adder} = a + B_effective + carry_in_add;

    assign result_bit = (op_code == 2'b10) ? (a & b) :
                        (op_code == 2'b11) ? (a | b) :
                                             sum_adder;

    assign carry_out = (op_code[1] == 1'b1) ? 1'b0 : carry_adder; 
endmodule