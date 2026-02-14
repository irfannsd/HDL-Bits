// Given an 8-bit input vector [7:0], reverse its bit ordering.


module top_module(
    input [7:0] in,
    output [7:0] out
  );
  assign out = {in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7]};

  //This can also be done with loops which are of 2 types

  // type1 >>> Using a generate block (scalable & synthesizable)

  //   genvar i;
  //   generate
  //     for (i = 0; i < $bits(out); i = i + 1)   //// $bits(out) is a system function that returns the width of a signal
  //     begin : REV
  //       assign out[i] = in[7 - i];
  //     end
  //   endgenerate


  // type2


  //   integer i;
  //   always @(*)
  //   begin
  // for (i = 0; i < $bits(out); i = i + 1)    //// $bits(out) is a system function that returns the width of a signal
  //       out[i] = in[7 - i];
  //   end




endmodule





