// The circuits so far have been simple enough that the outputs are simple functions of the inputs. As circuits become more complex, you will need wires to connect internal components together. When you need to use a wire, you should declare it in the body of the module, somewhere before it is first used.






`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
	wire a1,a2,o1;
    assign a1=a&&b;
    assign a2=c&&d;
    assign o1= a1 || a2 ;
    assign out=o1;
    assign out_n=~o1;
endmodule
