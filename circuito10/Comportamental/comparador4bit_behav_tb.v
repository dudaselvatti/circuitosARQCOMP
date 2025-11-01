`include "comparador4bit_behav.v"
`timescale 1ns/100ps

module comparador4bit_behav_tb;

    reg [3:0] a_tb;
    reg [3:0] b_tb;
    wire maior_tb;
    wire menor_tb;
    wire igual_tb;

    comparador4bit_behav uut (
        .a(a_tb),
        .b(b_tb),
        .maior(maior_tb),
        .menor(menor_tb),
        .igual(igual_tb)
    );

    initial begin
        $dumpfile("comparador4bit_behav.vcd");
        $dumpvars(0, comparador4bit_behav_tb);
        
        $monitor("Tempo=%0t | a=%d, b=%d | maior=%b, menor=%b, igual=%b",
                 $time, a_tb, b_tb, maior_tb, menor_tb, igual_tb);
        
        // Caso 1: a == b 
        a_tb = 4'd10; b_tb = 4'd10; // 1010 == 1010
        #10; // maior=0, menor=0, igual=1
        
        // Caso 2: a > b
        a_tb = 4'd5; b_tb = 4'd3; // 0101 > 0011
        #10; // maior=1, menor=0, igual=0
        
        // Caso 3: a < b (Ex: 2 < 12)
        a_tb = 4'd2; b_tb = 4'd12; // 0010 < 1100
        #10; // maior=0, menor=1, igual=0
        
        // Caso 4: Limites (15 > 0)
        a_tb = 4'd15; b_tb = 4'd0; // 1111 > 0000
        #10; // maior=1, menor=0, igual=0
        
        // Caso 5: Limites (0 < 15)
        a_tb = 4'd0; b_tb = 4'd15; // 0000 < 1111
        #10; // maior=0, menor=1, igual=0

        #10 $finish; 
    end

endmodule