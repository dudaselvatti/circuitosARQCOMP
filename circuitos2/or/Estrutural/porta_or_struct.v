module porta_or_struct(a, b, y);
  input a, b;
  output y;
  wire or_a, or_b;

  or U1 (or_a, a); 
  or U2 (or_b, b);
  or U3 (y, or_a, or_b);
  
endmodule