module mux4 (
    input  wire in0, in1, in2, in3,
    input  wire select0, select1,
    output wire final_output
);
    
    wire [1:0] sel_code = {select1, select0};

    assign final_output = (sel_code == 2'b00) ? in0 :
                       (sel_code == 2'b01) ? in1 :
                       (sel_code == 2'b10) ? in2 :
                                               in3;
endmodule