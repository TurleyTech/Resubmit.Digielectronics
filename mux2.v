module mux2 (
    input  wire data_A,
    input  wire data_B,
    input  wire select_in,
    output wire output_Y
);
    
    assign output_Y = select_in ? data_B : data_A;
endmodule