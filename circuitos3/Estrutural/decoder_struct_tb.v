`include "decoder_struct.v"
`timescale 1ns/100ps

module decoder_struct_tb;

  reg [1:0] in_tb;
  wire [3:0] out_tb;
  
  decoder_struct uut (
    .in(in_tb),
    .out(out_tb)
  );

  initial begin
    $dumpfile("decoder_struct.vcd");
    $dumpvars(0, decoder_struct_tb);
    
    $monitor("Tempo=%0t | in[1:0] = %b | out[3:0] = %b", 
             $time, in_tb, out_tb);
    
    in_tb = 2'b00;
    #10;           

    in_tb = 2'b01; 
    #10;

    in_tb = 2'b10; 
    #10;

    in_tb = 2'b11; 
    #10;
    
    #10 $finish; 
  end

endmodule