`include "somacompleto_struct.v"
`timescale 1ns/100ps

module somacompleto_struct_tb;

    reg a_tb;
    reg b_tb;
    reg cin_tb;
    wire sum_tb;
    wire cout_tb;

    somacompleto_struct uut (
        .a(a_tb),
        .b(b_tb),
        .carry_in(cin_tb),
        .sum(sum_tb),
        .carry_out(cout_tb)
    );

    initial begin
        $dumpfile("somacompleto_struct.vcd");
        $dumpvars(0, somacompleto_struct_tb);
        
        $monitor("Tempo=%0t | a=%b, b=%b, cin=%b | sum=%b, cout=%b",
                 $time, a_tb, b_tb, cin_tb, sum_tb, cout_tb);

        a_tb = 0; b_tb = 0; cin_tb = 0; #10; // sum=0, cout=0
        a_tb = 0; b_tb = 0; cin_tb = 1; #10; // sum=1, cout=0
        a_tb = 0; b_tb = 1; cin_tb = 0; #10; // sum=1, cout=0
        a_tb = 0; b_tb = 1; cin_tb = 1; #10; // sum=0, cout=1
        a_tb = 1; b_tb = 0; cin_tb = 0; #10; // sum=1, cout=0
        a_tb = 1; b_tb = 0; cin_tb = 1; #10; // sum=0, cout=1
        a_tb = 1; b_tb = 1; cin_tb = 0; #10; // sum=0, cout=1
        a_tb = 1; b_tb = 1; cin_tb = 1; #10; // sum=1, cout=1
        
        #10 $finish; 
    end

endmodule