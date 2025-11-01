module somacompleto_struct (
    input wire a,
    input wire b,
    input wire carry_in,
    output wire sum,
    output wire carry_out
);

    wire w_sum_ha1;
    wire w_carry_ha1;
    wire w_carry_ha2;  

    xor U1_xor_ha1 (w_sum_ha1, a, b);
    and U2_and_ha1 (w_carry_ha1, a, b);

    xor U3_xor_ha2 (sum, w_sum_ha1, carry_in);
    and U4_and_ha2 (w_carry_ha2, w_sum_ha1, carry_in);

    or  U5_or_cout (carry_out, w_carry_ha1, w_carry_ha2);

endmodule