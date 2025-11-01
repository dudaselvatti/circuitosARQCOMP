module decoder_struct(
  input [1:0] in,
  output [3:0] out 
);
  
  wire not_in1, not_in0;
  

  not U1_not (not_in1, in[1]); 
  not U2_not (not_in0, in[0]); 
  and U3_and0 (out[0], not_in1, not_in0);
  and U4_and1 (out[1], not_in1, in[0]);
  and U5_and2 (out[2], in[1], not_in0);
  and U6_and3 (out[3], in[1], in[0]);

endmodule