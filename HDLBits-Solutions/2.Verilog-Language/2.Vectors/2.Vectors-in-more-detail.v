// Vectors are used to group related signals using one name to make it more convenient to manipulate. For example, wire [7:0] w; declares an 8-bit vector named w that is equivalent to having 8 separate wires.


// type [upper:lower] vector_name;
// reg [7:0] mem [255:0];   // 256 unpacked elements, each of which is a 8-bit packed vector of reg.
// reg mem2 [28:0];         // 29 unpacked elements, each of which is a 1-bit reg.



// What are implicit nets in Verilog?
// In Verilog, if you use a signal name without declaring it, the compiler will silently create it for you.
// That auto-created signal is called an implicit net. >>>>> Type: wire >> Width: 1 bit only




`default_nettype none     // Disable implicit nets. Reduces some types of bugs.
module top_module( 
    input wire [15:0] in,
    output wire [7:0] out_hi,
    output wire [7:0] out_lo );
    assign out_hi=in[15:8];
    assign out_lo= in[7:0];
endmodule
