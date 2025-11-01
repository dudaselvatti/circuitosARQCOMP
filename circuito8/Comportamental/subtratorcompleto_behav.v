module subtratorcompleto_behav (
    input wire a,
    input wire b,
    input wire borrow_in,
    output wire diff,
    output wire borrow_out
);

    assign diff = a ^ b ^ borrow_in;

    assign borrow_out = (~a & b) | (~a & borrow_in) | (b & borrow_in);

endmodule