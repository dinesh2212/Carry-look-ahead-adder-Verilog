module test_bench;

reg clk;
reg [3:0] a, b;
wire [3:0] s;
wire cout;

adder runadd(
    .a(a),
    .b(b),
    .clk(clk),
    .cout(cout),
    .s(s)
);

initial clk = 0;

initial begin
    $dumpfile("adder.vcd");
    $dumpvars(0,test_bench);
    a = 4;
    b = 5;
    #1 clk = 1;
    #1 clk = 0;
    #1 clk = 1;
    #1 clk = 0;
end

endmodule