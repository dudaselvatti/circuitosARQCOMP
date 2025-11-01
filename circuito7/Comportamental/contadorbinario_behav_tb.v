`include "contadorbinario_behav.v"
`timescale 1ns/100ps

module contadorbinario_behav_tb;

    reg clk_tb;
    reg rst_tb;
    wire [3:0] q_tb;

    contadorbinario_behav uut (
        .clk(clk_tb),
        .rst(rst_tb),
        .q(q_tb)
    );

    initial begin
        clk_tb = 0;
        forever #5 clk_tb = ~clk_tb;
    end

    initial begin
        $dumpfile("contadorbinario_behav.vcd");
        $dumpvars(0, contadorbinario_behav_tb);
        
        $monitor("Tempo=%0t | rst=%b, clk=%b | count=%b (%d)",
                 $time, rst_tb, clk_tb, q_tb, q_tb);

        rst_tb = 1;
        #15; 

        rst_tb = 0;

        #200; 

        rst_tb = 1;
        #20;
        rst_tb = 0;
        #20;

        $finish; 
    end

endmodule