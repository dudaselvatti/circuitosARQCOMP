`include "comparador4bit_struct.v"
`timescale 1ns/100ps

module comparador4bit_struct_tb;

    reg [3:0] a_tb;
    reg [3:0] b_tb;
    wire maior_tb;
    wire menor_tb;
    wire igual_tb;

    comparador4bit_struct uut (
        .a(a_tb),
        .b(b_tb),
        .maior(maior_tb),
        .menor(menor_tb),
        .igual(igual_tb)
    );

    initial begin
        $dumpfile("comparador4bit_struct.vcd");
        $dumpvars(0, comparador4bit_struct_tb);
        
        $monitor("Tempo=%0t | a=%d, b=%d | maior=%b, menor=%b, igual=%b",
                 $time, a_tb, b_tb, maior_tb, menor_tb, igual_tb);

        a_tb = 4'd10; b_tb = 4'd10; #10;

        a_tb = 4'd5; b_tb = 4'd3; #10;

        a_tb = 4'd2; b_tb = 4'd12; #10;

        a_tb = 4'd15; b_tb = 4'd0; #10;

        a_tb = 4'd0; b_tb = 4'd15; #10;

        #10 $finish; 
    end

endmodule