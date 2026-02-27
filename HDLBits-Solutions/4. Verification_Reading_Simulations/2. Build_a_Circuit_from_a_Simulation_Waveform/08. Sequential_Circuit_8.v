module top_module (
    input clock,
    input a,
    output reg p,
    output reg q );
	
    always@(*)
        begin
            if(clock == 1'b1)
            	p = a;
            else
                p = p;
        end
		
    always@(negedge clock)
        begin
            q = a;
        end
		
endmodule