module subtratorcompleto_struct (
    input wire a,
    input wire b,
    input wire borrow_in,
    output wire diff,
    output wire borrow_out
);

    wire w_xor1;
    wire w_a_n;
    wire w_and1;
    wire w_and2;
    wire w_and3;

    xor U1_xor (w_xor1, a, b);
    xor U2_xor (diff, w_xor1, borrow_in);

    not U3_not (w_a_n, a);
    and U4_and (w_and1, w_a_n, b);
    and U5_and (w_and2, w_a_n, borrow_in);
    and U6_and (w_and3, b, borrow_in);
    or  U7_or  (borrow_out, w_and1, w_and2, w_and3);

endmodule