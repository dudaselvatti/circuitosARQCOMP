`include "mux2x1.v"
`timescale 1ns/100ps

module mux2x1_struct_tb;
    reg a0, b0, sel0; // Entradas
    wire y0; // Saída

    mux2x1_struct uut (.a(a0), .b(b0), .sel(sel0), .y(y0));
    initial begin
       $dumpfile("mux2x1_struct.vcd");
       $dumpvars(0, mux2x1_struct_tb);
        a0 = 0; b0 = 0; sel0 = 0;
        #10 a0 = 0; b0 = 1; sel0 = 0; 
        #10 a0 = 0; b0 = 1; sel0 = 1;
        #10 a0 = 1; b0 = 0; sel0 = 0;
        #10 a0 = 1; b0 = 0; sel0 = 1;
        #10 a0 = 1; b0 = 1; sel0 = 0;
        #10 a0 = 1; b0 = 1; sel0 = 1;
        #20 $finish;
    end
    initial $monitor("Tempo=%0t | a=%b b=%b sel=%b => y=%b", $time, a0, b0, sel0, y0);
endmodule