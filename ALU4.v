module alu_4bit (
    input  wire [3:0] a,
    input  wire [3:0] b,
    input  wire [1:0] op,         // 00:ADD 01:SUB 10:AND 11:OR
    output wire [3:0] result,
    output wire cout
);
    wire [3:0] internal_carries; 
    wire cin_start = (op == 2'b01);    // SUB starts with cin=1

    
    alu_1bit cell0 (.a(a[0]), .b(b[0]), .carry_in_add(cin_start),    .op_code(op), .result_bit(result[0]), .carry_out(internal_carries[0]));
    alu_1bit cell1 (.a(a[1]), .b(b[1]), .carry_in_add(internal_carries[0]), .op_code(op), .result_bit(result[1]), .carry_out(internal_carries[1]));
    alu_1bit cell2 (.a(a[2]), .b(b[2]), .carry_in_add(internal_carries[1]), .op_code(op), .result_bit(result[2]), .carry_out(internal_carries[2]));
    alu_1bit cell3 (.a(a[3]), .b(b[3]), .carry_in_add(internal_carries[2]), .op_code(op), .result_bit(result[3]), .carry_out(cout));

endmodule