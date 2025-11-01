module soma1bit_struct (
    input wire a,
    input wire b,
    output wire sum,
    output wire carry
);

    xor U1_xor (sum, a, b);
    
    and U2_and (carry, a, b);

endmodule