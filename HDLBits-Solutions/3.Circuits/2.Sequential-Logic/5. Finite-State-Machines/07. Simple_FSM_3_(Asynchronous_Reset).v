module top_module(
    input clk,
    input in,
    input areset,
    output out
);

    parameter A=2'd0, B=2'd1, C=2'd2, D=2'd3;

    reg [1:0] curr, nxt;

    // Next-state logic (COMBINATIONAL)
    always @(*) begin
        case(curr)
            A: nxt = in ? B : A;
            B: nxt = in ? B : C;
            C: nxt = in ? D : A;
            D: nxt = in ? B : C;
            default: nxt = A;
        endcase
    end

    // State register with asynchronous reset
    always @(posedge clk or posedge areset) begin
        if (areset)
            curr <= A;
        else
            curr <= nxt;
    end

    // Moore output logic
    assign out = (curr == D);

endmodule