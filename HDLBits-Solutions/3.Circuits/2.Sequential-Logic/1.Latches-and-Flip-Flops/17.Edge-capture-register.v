module top_module (
    input        clk,
    input        reset,      // synchronous reset
    input  [31:0] in,
    output reg [31:0] out
);

    reg [31:0] prev;

    always @(posedge clk) begin
        if (reset) begin
            out  <= 32'b0;        // reset has priority
            prev <= in;
        end else begin
            out  <= out | (~in & prev);  // capture falling edge
            prev <= in;                  // update previous input
        end
    end

endmodule
