module soma1bit_behav (
    input wire a,
    input wire b,
    output wire sum,
    output wire carry
);
    assign sum = a ^ b;

    assign carry = a & b;

endmodule