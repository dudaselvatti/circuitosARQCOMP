module comparador1bit_struct (
    input wire a,
    input wire b,
    output wire maior, // a > b
    output wire menor, // a < b
    output wire igual  // a == b
);

    wire a_n, b_n;
    wire xor_out;

    not U1_not_a (a_n, a);
    not U2_not_b (b_n, b);

    // Lógica 'maior' (a > b) -> a AND (NOT b)
    and U3_and_maior (maior, a, b_n);
    
    // Lógica 'menor' (a < b) -> (NOT a) AND b
    and U4_and_menor (menor, a_n, b);
    
    // Lógica 'igual' (a == b) -> NOT (a XOR b)
    xor U5_xor (xor_out, a, b);
    not U6_not_igual (igual, xor_out);

endmodule