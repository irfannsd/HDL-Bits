// Create a module with one input and one output that behaves like a wire.

// Hint>>>>> A continuous assignment assigns the right side to the left side continuously, so any change to the RHS is immediately seen in the LHS.


module top_module( input in, output out );
    assign out=in;
endmodule
