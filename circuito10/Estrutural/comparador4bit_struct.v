module comparador4bit_struct (
    input wire [3:0] a,
    input wire [3:0] b,
    output wire maior, // a > b
    output wire menor, // a < b
    output wire igual  // a == b
);

    wire eq_3_w, eq_2_w, eq_1_w, eq_0_w;
    wire xor_3_w, xor_2_w, xor_1_w, xor_0_w;

    xor U_xor3 (xor_3_w, a[3], b[3]);
    xor U_xor2 (xor_2_w, a[2], b[2]);
    xor U_xor1 (xor_1_w, a[1], b[1]);
    xor U_xor0 (xor_0_w, a[0], b[0]);

    not U_not3 (eq_3_w, xor_3_w); 
    not U_not2 (eq_2_w, xor_2_w); 
    not U_not1 (eq_1_w, xor_1_w); 
    not U_not0 (eq_0_w, xor_0_w); 

    and U_and_eq (igual, eq_3_w, eq_2_w, eq_1_w, eq_0_w);

    wire gt_3_w, gt_2_w, gt_1_w, gt_0_w;
    wire b3_n, b2_n, b1_n, b0_n;
    wire t3, t2_i, t2, t1_i1, t1_i2, t1, t0_i1, t0_i2, t0_i3, t0;

    not U_not_b3(b3_n, b[3]);
    not U_not_b2(b2_n, b[2]);
    not U_not_b1(b1_n, b[1]);
    not U_not_b0(b0_n, b[0]);

    and U_gt3 (gt_3_w, a[3], b3_n); // a[3] > b[3]
    and U_gt2 (gt_2_w, a[2], b2_n); // a[2] > b[2]
    and U_gt1 (gt_1_w, a[1], b1_n); // a[1] > b[1]
    and U_gt0 (gt_0_w, a[0], b0_n); // a[0] > b[0]

    assign t3 = gt_3_w;
    and U_and_t2 (t2_i, eq_3_w, gt_2_w);
    assign t2 = t2_i;
    and U_and_t1a (t1_i1, eq_3_w, eq_2_w);
    and U_and_t1b (t1_i2, t1_i1, gt_1_w);
    assign t1 = t1_i2;
    and U_and_t0a (t0_i1, eq_3_w, eq_2_w);
    and U_and_t0b (t0_i2, t0_i1, eq_1_w);
    and U_and_t0c (t0_i3, t0_i2, gt_0_w);
    assign t0 = t0_i3;

    or U_or_maior (maior, t3, t2, t1, t0);

    not U_not_maior (maior_n, maior);
    not U_not_igual (igual_n, igual);
    and U_and_menor (menor, maior_n, igual_n);

endmodule