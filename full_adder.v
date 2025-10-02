module full_adder (
    input  wire bit_A,
    input  wire bit_B,
    input  wire c_in,
    output wire sum_out,
    output wire c_out
);
    
    assign sum_out = bit_A ^ bit_B ^ c_in;
    assign c_out   = (bit_A & bit_B) | (c_in & (bit_A ^ bit_B));
endmodule