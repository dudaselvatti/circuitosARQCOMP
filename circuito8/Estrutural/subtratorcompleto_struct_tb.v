`include "subtratorcompleto_struct.v"
`timescale 1ns/100ps

module subtratorcompleto_struct_tb;

    reg a_tb;
    reg b_tb;
    reg bin_tb;
    wire diff_tb;
    wire bout_tb;

    subtratorcompleto_struct uut (
        .a(a_tb),
        .b(b_tb),
        .borrow_in(bin_tb),
        .diff(diff_tb),
        .borrow_out(bout_tb)
    );

    initial begin
        $dumpfile("subtratorcompleto_struct.vcd");
        $dumpvars(0, subtratorcompleto_struct_tb);
        
        $monitor("Tempo=%0t | a=%b, b=%b, bin=%b | diff=%b, bout=%b",
                 $time, a_tb, b_tb, bin_tb, diff_tb, bout_tb);

        a_tb = 0; b_tb = 0; bin_tb = 0; #10; // diff=0, bout=0
        a_tb = 0; b_tb = 0; bin_tb = 1; #10; // diff=1, bout=1
        a_tb = 0; b_tb = 1; bin_tb = 0; #10; // diff=1, bout=1
        a_tb = 0; b_tb = 1; bin_tb = 1; #10; // diff=0, bout=1
        a_tb = 1; b_tb = 0; bin_tb = 0; #10; // diff=1, bout=0
        a_tb = 1; b_tb = 0; bin_tb = 1; #10; // diff=0, bout=0
        a_tb = 1; b_tb = 1; bin_tb = 0; #10; // diff=0, bout=0
        a_tb = 1; b_tb = 1; bin_tb = 1; #10; // diff=1, bout=1
        
        #10 $finish; 
    end

endmodule