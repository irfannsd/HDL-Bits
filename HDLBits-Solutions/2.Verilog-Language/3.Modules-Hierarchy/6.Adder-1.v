// Connect the modules together as shown in the diagram below. The provided module add16 has the following declaration:

// module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );



module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire co1,co2;
    add16 s1(a[15:0],b[15:0],0,sum[15:0],co1);
    add16 s2(a[31:16],b[31:16],co1,sum[31:16]);
endmodule
