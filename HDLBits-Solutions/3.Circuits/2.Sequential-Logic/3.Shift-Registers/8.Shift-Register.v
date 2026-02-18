module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
	MUXDFF m0(KEY[0],KEY[1],KEY[2],KEY[3],SW[3],LEDR[3]);
    MUXDFF m1(KEY[0],KEY[1],KEY[2],LEDR[3],SW[2],LEDR[2]);
    MUXDFF m2(KEY[0],KEY[1],KEY[2],LEDR[2],SW[1],LEDR[1]);
    MUXDFF m3(KEY[0],KEY[1],KEY[2],LEDR[1],SW[0],LEDR[0]);
endmodule



module MUXDFF (input clk,E,L,W,r_in, output reg q);
    always @(posedge clk)
        begin
            case({E,L})
                2'b00:q<= q;
                2'b01:q<= r_in;
                2'b10:q<= W;
                2'b11:q<= r_in;
            endcase
        end
endmodule


