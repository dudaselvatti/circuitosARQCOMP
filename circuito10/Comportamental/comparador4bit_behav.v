module comparador4bit_behav (
    input wire [3:0] a,
    input wire [3:0] b,
    output wire maior, // a > b
    output wire menor, // a < b
    output wire igual  // a == b
);

    assign maior = (a > b);
    assign menor = (a < b);
    assign igual = (a == b);

endmodule