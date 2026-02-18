module top_module(
    input        clk,
    input  [7:0] in,
    output reg [7:0] pedge
);

    reg [7:0] w;

    always @(posedge clk) begin
        pedge <= in & ~w;  // detect 0 → 1 transition
        w     <= in;       // store previous input
    end

endmodule
