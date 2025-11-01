`include "soma1bit_behav.v"
`timescale 1ns/100ps

module soma1bit_behav_tb;

    reg a_tb;
    reg b_tb;
    wire sum_tb;
    wire carry_tb;
  
    soma1bit_behav uut (
        .a(a_tb),
        .b(b_tb),
        .sum(sum_tb),
        .carry(carry_tb)
    );

    initial begin
        $dumpfile("soma1bit_behav.vcd");
        $dumpvars(0, soma1bit_behav_tb);
        
        $monitor("Tempo=%0t | a=%b, b=%b | sum=%b, carry=%b",
                 $time, a_tb, b_tb, sum_tb, carry_tb);
        

        a_tb = 0; b_tb = 0; // sum=0, carry=0
        #10;
        
        a_tb = 0; b_tb = 1; // sum=1, carry=0
        #10;

        a_tb = 1; b_tb = 0; // sum=1, carry=0
        #10;

        a_tb = 1; b_tb = 1; // sum=0, carry=1
        #10;
        
        #10 $finish; 
    end

endmodule