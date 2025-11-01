/* Primeiro exemplo Verilog */
// Multiplexador 2x1
module mux2x1_struct(a, b, sel, y);
 input a, b, sel; // Entradas
 output y; // Saída
 wire not_sel, and_a, and_b;

    not U1 (not_sel, sel); // Inversor
    and U2 (and_a, a, sel); // Porta AND para a
    and U3 (and_b, b, not_sel); // Porta AND para b
    or U4 (y, and_a, and_b); // Porta OR para saída
endmodule