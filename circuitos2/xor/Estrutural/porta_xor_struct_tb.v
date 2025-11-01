`include "porta_xor_struct.v" 
`timescale 1ns/100ps

module porta_xor_struct_tb;
  reg a0, b0;
  wire y0;

  porta_xor_struct uut (.a(a0), .b(b0), .y(y0));

  initial begin
    $dumpfile("porta_xor_struct.vcd");
    $dumpvars(0, porta_xor_struct_tb);

    $monitor("Tempo=%0t | a0=%b b0=%b => y0=%b", $time, a0, b0, y0);

    a0 = 0; b0 = 0; #10; //  0 e 0
    a0 = 0; b0 = 1; #10; //  0 e 1
    a0 = 1; b0 = 0; #10; //  1 e 0
    a0 = 1; b0 = 1; #10; //  1 e 1
    #10 $finish;

    
  end

endmodule