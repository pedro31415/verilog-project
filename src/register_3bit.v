module register_3bit(
    input clk,
    input reset,
    input [2:0] d,
    output reg [2:0] q
);

always @(posedge clk or posedge reset) begin
    if (reset)
        q <= 3'b000;
    else
        q <= d;
end

endmodule