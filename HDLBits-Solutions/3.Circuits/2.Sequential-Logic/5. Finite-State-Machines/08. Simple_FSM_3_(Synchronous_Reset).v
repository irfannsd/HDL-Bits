module top_module(
    input clk,
    input in,
    input reset,
    output out); //
    
    parameter A=2'b00,B=2'b01,C=2'b10,D=2'b11;
    reg [1:0] nxt,curr;
    

    // State transition logic
    always @(*)
        case(curr)
            A:nxt=in?B:A;
            B:nxt=in?B:C;
            C:nxt=in?D:A;
            D:nxt=in?B:C;
        endcase

    // State flip-flops with synchronous reset
    
    always @(posedge clk)
        begin
            if(reset)
                curr<=A;
            else
                curr<=nxt;
        end

    // Output logic
    assign out=(curr==D);

endmodule
