// mux2x1_tb.v
`include "mux2x1.v"
`timescale 1ns/100ps // define unidade e precisão de tempo
module mux2x1_tb;
 reg a0, b0, sel0; // sinais de entrada para o módulo
 wire y0; // saída do módulo
 // instanciação do DUT (Device Under Test)
 mux2x1 uut (
 .a(a0),
 .b(b0),
 .sel(sel0),
 .y(y0)
 );

initial begin
 // cria arquivo para waveform (para GTKWave)
 $dumpfile("mux2x1.vcd"); // Arquivo onde serão salvas os dados para simulação
 $dumpvars(0, mux2x1_tb); // Salva as variáveis do simulador
 // Estímulos (Tabela verdade com todas as condições possíveis)
 a0 = 0; b0 = 0; sel0 = 0;
 #10 a0 = 0; b0 = 1; sel0 = 0; // Após 10ns depois muda os valores
 #10 a0 = 0; b0 = 1; sel0 = 1;
 #10 a0 = 1; b0 = 0; sel0 = 0;
 #10 a0 = 1; b0 = 0; sel0 = 1;
 #10 a0 = 1; b0 = 1; sel0 = 0;
 #10 a0 = 1; b0 = 1; sel0 = 1;
 #20 $finish; // Após 20ns finaliza a simulação
 end
 // monitor para imprimir no console
 initial begin
 $monitor("Tempo=%0t | a0=%b b0=%b sel0=%b => y0=%b", $time, a0, b0, sel0, y0);
 end
endmodule