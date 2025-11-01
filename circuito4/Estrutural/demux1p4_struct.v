module demux1p4_struct(
  input data_in,      
  input [1:0] sel,    
  output [3:0] out    
);
  
  wire not_sel1, not_sel0;
  
  not U1_not (not_sel1, sel[1]);
  not U2_not (not_sel0, sel[0]); 
  and U3_and0 (out[0], data_in, not_sel1, not_sel0);
  and U4_and1 (out[1], data_in, not_sel1, sel[0]);
  and U5_and2 (out[2], data_in, sel[1], not_sel0);
  and U6_and3 (out[3], data_in, sel[1], sel[0]);

endmodule