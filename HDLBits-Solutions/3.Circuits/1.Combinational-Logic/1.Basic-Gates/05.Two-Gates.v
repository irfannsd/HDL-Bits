module top_module (
    input in1,
    input in2,
    input in3,
    output out);
    wire ot;
    
    xnor(ot,in1,in2);
    xor(out,ot,in3);

endmodule
