module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
);

    // Load when reset is high OR when count reaches 12 while enabled
    assign c_load = reset | (enable & (Q == 4'd12));

    // Always load the value 1
    assign c_d = 4'd1;

    // Enable counting only when not loading
    assign c_enable = enable & ~c_load;

    // Instantiate the provided counter
    count4 the_counter (
        .clk(clk),
        .enable(c_enable),
        .load(c_load),
        .d(c_d),
        .Q(Q)
    );

endmodule
