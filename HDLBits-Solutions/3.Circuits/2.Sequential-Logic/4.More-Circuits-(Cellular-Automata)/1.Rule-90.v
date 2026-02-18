module top_module(
    input clk,
    input load,
    input [511:0] data,
    output reg [511:0] q ); 
    
    
    
    //Rule-90 is the cocept of cellulat automata
    
    /*
    	q[7:0] = 10101101
        after applying Rule-90 of cellular automata
        q[7]=q[6]
        q[0]=q[1]
        q[6:1]=q[7:2]^q[5:0]
    */
    
    always @(posedge clk)
        begin 
            if(load)
                q<=data;
            else
                begin
                    q[511]<=q[510];  // q[510] XOR 0
                    q[0]<=q[1];     // 0 XOR q[1]
                    q[510:1]<=q[511:2]^q[509:0]; 
                end
        end

endmodule
