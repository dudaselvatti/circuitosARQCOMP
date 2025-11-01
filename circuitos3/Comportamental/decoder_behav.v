module decoder_behav (
    input  [1:0] in,   // 2-bit entrada
    output  [3:0] out    // 4-bit saída
);

  assign out[0] = (~in[1] & ~in[0]);
  assign out[1] = (~in[1] &  in[0]);
  assign out[2] = ( in[1] & ~in[0]);
  assign out[3] = ( in[1] &  in[0]);

endmodule