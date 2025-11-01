`include "porta_not_behav.v" 
`timescale 1ns/100ps

module porta_not_behav_tb;
  reg a0;
  wire y0;

  porta_not_behav uut (.a(a0), .y(y0));

  initial begin
    $dumpfile("porta_not_behav.vcd");
    $dumpvars(0, porta_not_behav_tb);
    $monitor("Tempo=%0t | a0=%b => y0=%b", $time, a0, y0);
    
    a0 = 0; #10; //  0 e 0
    a0 = 1; #10; //  0 e 1

    #10 $finish;

    
  end

endmodule