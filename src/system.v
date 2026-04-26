module system(
    input clk,
    input reset,
    input up_down, // 0 = soma | 1 = subtrai
    output [2:0] q
);

wire [2:0] current;
wire [2:0] next;
wire [2:0] operand;
wire cout;

// Define +1 ou -1 (complemento de 2)
assign operand = (up_down == 0) ? 3'b001 : 3'b111;

// Somador
adder_3bit adder(
    .a(current),
    .b(operand),
    .cin(1'b0),
    .sum(next),
    .cout(cout)
);

// Registrador
register_3bit reg1(
    .clk(clk),
    .reset(reset),
    .d(next),
    .q(current)
);

assign q = current;

endmodule