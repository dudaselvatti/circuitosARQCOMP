module porta_and_struct(a, b, y);
  input a, b;
  output y;
  wire and_a, and_b;

  and U1 (and_a, a); 
  and U2 (and_b, b);
  and U3 (y, and_a, and_b);
  
endmodule