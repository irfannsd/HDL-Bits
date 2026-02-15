module top_module( 
    input [2:0] a, b,
    input cin,
    output reg [2:0] cout,
    output reg [2:0] sum );
    reg carry;
    
    integer i;
    always @(*)begin 
        carry = cin;
        for (i =0 ; i < $bits(a) ; i++)begin 
            sum[i]=a[i]^b[i]^carry;
            cout[i] = a[i]&b[i] | (a[i]^b[i])&carry; 
            carry=cout[i];
        end
    end 

endmodule
