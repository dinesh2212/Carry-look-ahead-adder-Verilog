module dflipflop(
    input d,
    input en,
    output res
);

/*
wire s_out, r_out, q, q_bar;

assign s_out = ~(d & en);
assign r_out = ~(~d & en);
assign q_bar = ~(q & r_out);
assign q = ~(q_bar & s_out);

assign res = q;
*/

reg resreg;

always @(posedge en) begin    
    if(en)
        resreg <= d;
end

assign res = resreg;

endmodule