module demux1p4_behav (
  input data_in,      
  input [1:0] sel,    
  output reg [3:0] y
);

  always @(*) begin
    
    y = 4'b0000; 
    
    case (sel)
      2'b00: y[0] = data_in;
      2'b01: y[1] = data_in;
      2'b10: y[2] = data_in;
      2'b11: y[3] = data_in; 
    endcase
  end

endmodule