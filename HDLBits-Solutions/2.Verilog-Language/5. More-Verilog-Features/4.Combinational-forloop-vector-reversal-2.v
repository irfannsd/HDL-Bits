// Given a 100-bit input vector [99:0], reverse its bit ordering.


module top_module( 
    input [99:0] in,
    output [99:0] out
);
    
genvar i;
generate
    for (i = 0; i < $bits(out); i = i + 1) begin : REV
        assign out[i] = in[$bits(out)-1 - i];
    end
endgenerate

endmodule
