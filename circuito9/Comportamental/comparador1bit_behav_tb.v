`include "comparador1bit_behav.v"
`timescale 1ns/100ps

module comparador1bit_behav_tb;

    reg a_tb;
    reg b_tb;
    wire maior_tb;
    wire menor_tb;
    wire igual_tb;

    comparador1bit_behav uut (
        .a(a_tb),
        .b(b_tb),
        .maior(maior_tb),
        .menor(menor_tb),
        .igual(igual_tb)
    );

    initial begin
        $dumpfile("comparador1bit_behav.vcd");
        $dumpvars(0, comparador1bit_behav_tb);
        
        $monitor("Tempo=%0t | a=%b, b=%b | maior=%b, menor=%b, igual=%b",
                 $time, a_tb, b_tb, maior_tb, menor_tb, igual_tb);

        a_tb = 0; b_tb = 0; #10; // maior=0, menor=0, igual=1
        a_tb = 0; b_tb = 1; #10; // maior=0, menor=1, igual=0
        a_tb = 1; b_tb = 0; #10; // maior=1, menor=0, igual=0
        a_tb = 1; b_tb = 1; #10; // maior=0, menor=0, igual=1
        
        #10 $finish; 
    end

endmodule