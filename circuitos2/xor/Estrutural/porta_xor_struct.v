module porta_xor_struct(
  input a, b,
  output y
);
  
  wire not_a;
  wire not_b;
  wire and_1;
  wire and_2; 
  
  not U1_not (not_a, a);
  not U2_not (not_b, b);
  and U3_and (and_1, a, not_b);
  and U4_and (and_2, not_a, b);
  or U5_or (y, and_1, and_2);
  
endmodule