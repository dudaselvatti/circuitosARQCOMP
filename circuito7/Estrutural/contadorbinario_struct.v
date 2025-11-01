`include "dff_module.v" 

module contadorbinario_struct (
    input wire clk,
    input wire rst,
    output wire [3:0] q
);


    wire [3:0] d;

    assign d = q + 1;
    

    dff_module U0_dff ( .clk(clk), .rst(rst), .d(d[0]), .q(q[0]) );
    dff_module U1_dff ( .clk(clk), .rst(rst), .d(d[1]), .q(q[1]) );
    dff_module U2_dff ( .clk(clk), .rst(rst), .d(d[2]), .q(q[2]) );
    dff_module U3_dff ( .clk(clk), .rst(rst), .d(d[3]), .q(q[3]) );

endmodule