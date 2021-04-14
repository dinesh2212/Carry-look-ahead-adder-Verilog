module adder(
    input [3:0] a,
    input [3:0] b,
    input clk,
    output cout,
    output [3:0] s
);

wire a0, a1, a2, a3;
wire b0, b1, b2, b3;
wire p0, p1, p2, p3;
wire g0, g1, g2, g3;
wire c1, c2, c3, c4;
wire s0, s1, s2, s3;

//D flip flops for a and b
dflipflop da0(a[0],clk,a0);
dflipflop da1(a[1],clk,a1);
dflipflop da2(a[2],clk,a2);
dflipflop da3(a[3],clk,a3);
dflipflop db0(b[0],clk,b0);
dflipflop db1(b[1],clk,b1);
dflipflop db2(b[2],clk,b2);
dflipflop db3(b[3],clk,b3);

//propagate and generate
assign p0 = a0 ^ b0;
assign p1 = a1 ^ b1;
assign p2 = a2 ^ b2;
assign p3 = a3 ^ b3;
assign g0 = a0 & b0;
assign g1 = a1 & b1;
assign g2 = a2 & b2;
assign g3 = a3 & b3;

//carry look ahead
assign c1 = g0;
assign c2 = (p1 & g0) | g1;
assign c3 = (p2 & ((p1 & g0) | g1)) | g2;
assign c4 = (p3 & ((p2 & ((p1 & g0) | g1)) | g2)) | g3;

//getting sum bits
assign s0 = p0;
assign s1 = p1 ^ c1;
assign s2 = p2 ^ c2;
assign s3 = p3 ^ c3;

//flip flops for sum and carry
dflipflop ds0(s0,clk,s[0]);
dflipflop ds1(s1,clk,s[1]);
dflipflop ds2(s2,clk,s[2]);
dflipflop ds3(s3,clk,s[3]);
dflipflop dcout(c4,clk,cout);

endmodule