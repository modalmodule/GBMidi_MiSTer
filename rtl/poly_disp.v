module poly_disp
(
    input  sq1_no_in,
	input	 sq2_no_in,
    input[6:0]  sq1_n_in,
	input[6:0]	 sq2_n_in,
    input[7:0] ii_in,
	input[255:0] pd_in,
	output[255:0] pd_out
);
assign pd_out = pd_in + (sq2_no_in<<((16*(ii_in+ii_in+1))+9)) + ((sq2_n_in-36)<<(16*(ii_in+ii_in+1))) + (sq1_no_in<<((16*(ii_in+ii_in))+9)) + ((sq1_n_in-36)<<(16*(ii_in+ii_in)));
//assign ac_r_out = ac_r_in + aa_r_in;
endmodule