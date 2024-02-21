module mixer
(
    input  [15:0] aa_l_in,
    input  [15:0] aa_r_in,
    input  [15:0] ac_l_in,
    input  [15:0] ac_r_in,
    output [15:0] ac_l_out,
    output [15:0] ac_r_out
);

assign ac_l_out = ac_l_in + aa_l_in;
assign ac_r_out = ac_r_in + aa_r_in;

endmodule