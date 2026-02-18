module top_module(
    input clk,
    input j,
    input k,
    output reg Q
);
 
    always@(posedge clk)
        Q <= (~k)&Q | j&(~Q);
		
endmodule