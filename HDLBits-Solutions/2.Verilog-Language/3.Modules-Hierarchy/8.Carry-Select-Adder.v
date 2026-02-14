module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire  co1,co2,co3;
    wire[15:0] su1,su2;
    add16 s1(a[15:0],b[15:0],1'b0,sum[15:0],co1);
    add16 s2(a[31:16],b[31:16],1'b0,su1,co2);
    add16 s3(a[31:16],b[31:16],1'b1,su2,co3);
    
    assign sum[31:16] = co1 ? su2 : su1 ;

endmodule
