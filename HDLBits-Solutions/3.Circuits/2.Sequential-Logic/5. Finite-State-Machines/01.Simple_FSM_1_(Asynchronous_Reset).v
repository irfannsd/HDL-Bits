// In a proper FSM:
// 1. State encoding
// 2. State register (sequential)
// 3. Next-state logic (combinational)
// 4. Output logic





module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

    // State encoding
    parameter A=1'b0, B=1'b1; 
    reg state, next_state;

    always @(*) begin    // This is a combinational always block
        // State transition logic
        case(state)
            A:next_state=in?A:B;
            B:next_state=in?B:A;
        endcase
    end

    always @(posedge clk, posedge areset) begin    // This is a sequential always block
        // State flip-flops with asynchronous reset
        if(areset)
            state<=B;
        else
            state<=next_state;
    end

    // Output logic
            assign out = (state == B);

endmodule
