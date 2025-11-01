//flip flop D based pra usar no contador binário estrutural
module dff_module (
    input wire clk,
    input wire rst,
    input wire d,
    output reg q   
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 1'b0;
        else
            q <= d;
    end
endmodule