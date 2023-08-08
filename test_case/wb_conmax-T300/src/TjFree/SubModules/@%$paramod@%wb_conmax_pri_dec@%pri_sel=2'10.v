module \$paramod\wb_conmax_pri_dec\pri_sel=2'10  (valid, pri_in, pri_out);
input  [1:0] pri_in;
wire  [1:0] pri_in;
output  [3:0] pri_out;
wire  [3:0] pri_out;
wire  [3:0] pri_out_d1;
input  valid;
wire  valid;
LUT3  #(
    .INIT(8'h1f)
  ) _0_ (
    .I0(pri_in[1]),
    .I1(pri_in[0]),
    .I2(valid),
    .O(pri_out[0])
  );
LUT3  #(
    .INIT(8'h40)
  ) _1_ (
    .I0(pri_in[1]),
    .I1(pri_in[0]),
    .I2(valid),
    .O(pri_out[1])
  );
LUT3  #(
    .INIT(8'h40)
  ) _2_ (
    .I0(pri_in[0]),
    .I1(pri_in[1]),
    .I2(valid),
    .O(pri_out[2])
  );
LUT3  #(
    .INIT(8'h80)
  ) _3_ (
    .I0(pri_in[0]),
    .I1(pri_in[1]),
    .I2(valid),
    .O(pri_out[3])
  );
assign  pri_out_d1 = pri_out;
endmodule
