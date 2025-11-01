module comparador1bit_behav (
    input wire a,
    input wire b,
    output wire maior, // a > b
    output wire menor, // a < b
    output wire igual  // a == b
);

    assign maior = a & (~b);

    assign menor = (~a) & b;

    assign igual = ~(a ^ b);

endmodule