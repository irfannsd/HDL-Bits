module top_module (
    input  [15:0] a,
    input  [15:0] b,
    input         cin,
    output        cout,
    output [15:0] sum
);

    wire [3:0] c;   // internal carry wires
    genvar i;

    generate
        for (i = 0; i < 4; i = i + 1) begin : adders
            if (i == 0) begin
                bcd_fadd adder (
                    .a   (a[i*4 +: 4]),
                    .b   (b[i*4 +: 4]),
                    .cin (cin),
                    .cout(c[i]),
                    .sum (sum[i*4 +: 4])
                );
            end else begin
                bcd_fadd adder (
                    .a   (a[i*4 +: 4]),
                    .b   (b[i*4 +: 4]),
                    .cin (c[i-1]),
                    .cout(c[i]),
                    .sum (sum[i*4 +: 4])
                );
            end
        end
    endgenerate

    assign cout = c[3];

endmodule
