`timescale 1ns/1ps

module system_tb;

reg clk;
reg reset;
reg up_down;
wire [2:0] q;

// Instancia o sistema
system uut (
    .clk(clk),
    .reset(reset),
    .up_down(up_down),
    .q(q)
);

// Clock
always #5 clk = ~clk;

initial begin
    $dumpfile("wave/output.vcd");
    $dumpvars(0, system_tb);

    clk = 0;
    reset = 1;
    up_down = 0;

    #10 reset = 0;

    // Incrementa
    #60;

    // Decrementa
    up_down = 1;
    #60;

    // Incrementa de novo
    up_down = 0;
    #40;

    $finish;
end

endmodule