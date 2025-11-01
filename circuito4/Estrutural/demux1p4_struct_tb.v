`include "demux1p4_struct.v" 
`timescale 1ns/100ps

module demux1p4_struct_tb;

  reg data_in_tb;
  reg [1:0] sel_tb;
  wire [3:0] out_tb;
  
  demux1p4_struct uut (
    .data_in(data_in_tb),
    .sel(sel_tb),
    .out(out_tb)
  );
  
  initial begin
    $dumpfile("demux1p4_struct.vcd");
    $dumpvars(0, demux1p4_struct_tb);

    $monitor("Tempo=%0t | data_in=%b sel=%b | out[3:0]=%b",
             $time, data_in_tb, sel_tb, out_tb);
             
    data_in_tb = 1;
    sel_tb = 2'b00; #10; // out = 0001
    sel_tb = 2'b01; #10; // out = 0010
    sel_tb = 2'b10; #10; // out = 0100
    sel_tb = 2'b11; #10; // out = 1000
    
    #10; 
    
    data_in_tb = 0;
    sel_tb = 2'b00; #10; // out = 0000
    sel_tb = 2'b01; #10; // out = 0000
    sel_tb = 2'b10; #10; // out = 0000
    sel_tb = 2'b11; #10; // out = 0000
    
    #10 $finish;
  end
  
endmodule