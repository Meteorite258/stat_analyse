module \$paramod\wb_conmax_pri_enc\pri_sel=2'10  (valid, pri0, pri1, pri2, pri3, pri4, pri5, pri6, pri7, pri_out);
wire  _00_;
wire  _01_;
wire  _02_;
wire  _03_;
wire  _04_;
wire  _05_;
wire  [5:0] _06_;
input  [1:0] pri0;
wire  [1:0] pri0;
wire  [3:0] pri0_out;
input  [1:0] pri1;
wire  [1:0] pri1;
wire  [3:0] pri1_out;
input  [1:0] pri2;
wire  [1:0] pri2;
wire  [3:0] pri2_out;
input  [1:0] pri3;
wire  [1:0] pri3;
wire  [3:0] pri3_out;
input  [1:0] pri4;
wire  [1:0] pri4;
wire  [3:0] pri4_out;
input  [1:0] pri5;
wire  [1:0] pri5;
wire  [3:0] pri5_out;
input  [1:0] pri6;
wire  [1:0] pri6;
wire  [3:0] pri6_out;
input  [1:0] pri7;
wire  [1:0] pri7;
wire  [3:0] pri7_out;
output  [1:0] pri_out;
wire  [1:0] pri_out;
wire  [1:0] pri_out1;
input  [7:0] valid;
wire  [7:0] valid;
LUT6  #(
    .INIT(64'hefff0000ffffffff)
  ) _07_ (
    .I0(pri4_out[1]),
    .I1(pri5_out[1]),
    .I2(_06_[2]),
    .I3(_06_[3]),
    .I4(_06_[4]),
    .I5(_06_[5]),
    .O(pri_out[0])
  );
LUT6  #(
    .INIT(64'h0000000000000001)
  ) _08_ (
    .I0(pri0_out[3]),
    .I1(pri1_out[3]),
    .I2(pri2_out[3]),
    .I3(pri3_out[3]),
    .I4(pri4_out[3]),
    .I5(pri5_out[3]),
    .O(_02_)
  );
MUXF7  _09_ (
    .I0(_02_),
    .I1(1'h0),
    .O(_00_),
    .S(pri6_out[3])
  );
MUXF7  _10_ (
    .I0(1'h0),
    .I1(1'h0),
    .O(_01_),
    .S(pri6_out[3])
  );
MUXF8  _11_ (
    .I0(_00_),
    .I1(_01_),
    .O(_06_[5]),
    .S(pri7_out[3])
  );
LUT2  #(
    .INIT(4'h1)
  ) _12_ (
    .I0(pri6_out[1]),
    .I1(pri7_out[1]),
    .O(_06_[2])
  );
LUT4  #(
    .INIT(16'h0001)
  ) _13_ (
    .I0(pri0_out[1]),
    .I1(pri1_out[1]),
    .I2(pri2_out[1]),
    .I3(pri3_out[1]),
    .O(_06_[3])
  );
LUT6  #(
    .INIT(64'h0000000000000001)
  ) _14_ (
    .I0(pri0_out[2]),
    .I1(pri1_out[2]),
    .I2(pri2_out[2]),
    .I3(pri3_out[2]),
    .I4(pri4_out[2]),
    .I5(pri5_out[2]),
    .O(_05_)
  );
MUXF7  _15_ (
    .I0(_05_),
    .I1(1'h0),
    .O(_03_),
    .S(pri6_out[2])
  );
MUXF7  _16_ (
    .I0(1'h0),
    .I1(1'h0),
    .O(_04_),
    .S(pri6_out[2])
  );
MUXF8  _17_ (
    .I0(_03_),
    .I1(_04_),
    .O(_06_[4]),
    .S(pri7_out[2])
  );
LUT2  #(
    .INIT(4'h7)
  ) _18_ (
    .I0(_06_[5]),
    .I1(_06_[4]),
    .O(pri_out[1])
  );
\$paramod\wb_conmax_pri_dec\pri_sel=2'10   pd0 (
    .pri_in(pri0),
    .pri_out(pri0_out),
    .valid(valid[0])
  );
\$paramod\wb_conmax_pri_dec\pri_sel=2'10   pd1 (
    .pri_in(pri1),
    .pri_out(pri1_out),
    .valid(valid[1])
  );
\$paramod\wb_conmax_pri_dec\pri_sel=2'10   pd2 (
    .pri_in(pri2),
    .pri_out(pri2_out),
    .valid(valid[2])
  );
\$paramod\wb_conmax_pri_dec\pri_sel=2'10   pd3 (
    .pri_in(pri3),
    .pri_out(pri3_out),
    .valid(valid[3])
  );
\$paramod\wb_conmax_pri_dec\pri_sel=2'10   pd4 (
    .pri_in(pri4),
    .pri_out(pri4_out),
    .valid(valid[4])
  );
\$paramod\wb_conmax_pri_dec\pri_sel=2'10   pd5 (
    .pri_in(pri5),
    .pri_out(pri5_out),
    .valid(valid[5])
  );
\$paramod\wb_conmax_pri_dec\pri_sel=2'10   pd6 (
    .pri_in(pri6),
    .pri_out(pri6_out),
    .valid(valid[6])
  );
\$paramod\wb_conmax_pri_dec\pri_sel=2'10   pd7 (
    .pri_in(pri7),
    .pri_out(pri7_out),
    .valid(valid[7])
  );
assign  _06_[1:0] = { pri5_out[1], pri4_out[1] };
assign  pri_out1 = pri_out;
endmodule
