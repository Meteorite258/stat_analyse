module wb_conmax_arb(clk,  rst, req, gnt, next);
wire  [6:0] _00_;
wire  _01_;
wire  _02_;
wire  [6:0] _03_;
wire  _04_;
wire  _05_;
wire  [7:0] _06_;
wire  _07_;
wire  _08_;
wire  _09_;
wire  _10_;
wire  _11_;
wire  _12_;
wire  _13_;
wire  _14_;
wire  _15_;
wire  _16_;
wire  _17_;
wire  _18_;
wire  _19_;
wire  _20_;
wire  [5:0] _21_;
wire  [2:0] _22_;
wire  [5:0] _23_;
wire  [5:0] _24_;
wire  [5:0] _25_;
wire  [1:0] _26_;
wire  [5:0] _27_;
wire  [5:0] _28_;
wire  [1:0] _29_;
wire  [5:0] _30_;
input  clk;
wire  clk;
output  [2:0] gnt;
wire  [2:0] gnt;
input  next;
wire  next;
wire  [2:0] next_state;
input  [7:0] req;
wire  [7:0] req;
input  rst;
wire  rst;
wire  [2:0] state;
LUT6  #(
    .INIT(64'h0000000b00000000)
  ) _31_ (
    .I0(_24_[0]),
    .I1(_21_[2]),
    .I2(_24_[2]),
    .I3(_24_[3]),
    .I4(_24_[4]),
    .I5(_24_[5]),
    .O(_20_)
  );
LUT5  #(
    .INIT(32'd45104)
  ) _32_ (
    .I0(_00_[1]),
    .I1(_00_[2]),
    .I2(_00_[3]),
    .I3(_00_[4]),
    .I4(req[7]),
    .O(_01_)
  );
LUT6  #(
    .INIT(64'h00000000efa00f00)
  ) _33_ (
    .I0(_00_[0]),
    .I1(_00_[1]),
    .I2(_00_[2]),
    .I3(_00_[3]),
    .I4(_00_[4]),
    .I5(req[7]),
    .O(_02_)
  );
MUXF7  _34_ (
    .I0(_01_),
    .I1(_02_),
    .O(_24_[3]),
    .S(_00_[6])
  );
LUT4  #(
    .INIT(16'h0001)
  ) _35_ (
    .I0(req[1]),
    .I1(req[2]),
    .I2(req[0]),
    .I3(req[3]),
    .O(_00_[3])
  );
LUT6  #(
    .INIT(64'hfefcfafeffffffff)
  ) _36_ (
    .I0(req[5]),
    .I1(req[6]),
    .I2(req[4]),
    .I3(state[1]),
    .I4(state[0]),
    .I5(state[2]),
    .O(_00_[2])
  );
LUT2  #(
    .INIT(4'h1)
  ) _37_ (
    .I0(req[5]),
    .I1(req[6]),
    .O(_00_[4])
  );
LUT3  #(
    .INIT(8'h10)
  ) _38_ (
    .I0(state[1]),
    .I1(state[0]),
    .I2(state[2]),
    .O(_00_[1])
  );
LUT4  #(
    .INIT(16'h0001)
  ) _39_ (
    .I0(req[0]),
    .I1(req[1]),
    .I2(req[4]),
    .I3(req[2]),
    .O(_00_[0])
  );
LUT6  #(
    .INIT(64'h00f4000000440000)
  ) _40_ (
    .I0(next),
    .I1(req[0]),
    .I2(_21_[2]),
    .I3(state[2]),
    .I4(_21_[4]),
    .I5(_21_[5]),
    .O(_24_[4])
  );
LUT2  #(
    .INIT(4'h1)
  ) _41_ (
    .I0(state[1]),
    .I1(state[0]),
    .O(_21_[4])
  );
LUT5  #(
    .INIT(32'd1)
  ) _42_ (
    .I0(req[7]),
    .I1(req[3]),
    .I2(req[4]),
    .I3(req[5]),
    .I4(req[6]),
    .O(_21_[2])
  );
LUT3  #(
    .INIT(8'h80)
  ) _43_ (
    .I0(_22_[0]),
    .I1(_22_[1]),
    .I2(_22_[2]),
    .O(_24_[5])
  );
LUT6  #(
    .INIT(64'hfffffff5fff3ffff)
  ) _44_ (
    .I0(req[1]),
    .I1(req[2]),
    .I2(state[2]),
    .I3(next),
    .I4(state[1]),
    .I5(state[0]),
    .O(_22_[0])
  );
LUT6  #(
    .INIT(64'hfff3fff5ffffffff)
  ) _45_ (
    .I0(req[4]),
    .I1(req[6]),
    .I2(state[0]),
    .I3(next),
    .I4(state[1]),
    .I5(state[2]),
    .O(_22_[1])
  );
LUT6  #(
    .INIT(64'hfff5f3ffffffffff)
  ) _46_ (
    .I0(req[5]),
    .I1(req[3]),
    .I2(next),
    .I3(state[1]),
    .I4(state[2]),
    .I5(state[0]),
    .O(_22_[2])
  );
LUT6  #(
    .INIT(64'hff40000000000000)
  ) _47_ (
    .I0(req[6]),
    .I1(_00_[3]),
    .I2(_23_[2]),
    .I3(_23_[3]),
    .I4(state[2]),
    .I5(_00_[6]),
    .O(_24_[2])
  );
LUT2  #(
    .INIT(4'h1)
  ) _48_ (
    .I0(req[4]),
    .I1(req[5]),
    .O(_23_[2])
  );
LUT2  #(
    .INIT(4'h8)
  ) _49_ (
    .I0(state[1]),
    .I1(state[0]),
    .O(_00_[6])
  );
LUT2  #(
    .INIT(4'h4)
  ) _50_ (
    .I0(next),
    .I1(req[7]),
    .O(_23_[3])
  );
LUT6  #(
    .INIT(64'hfffefffcfffafffe)
  ) _51_ (
    .I0(req[1]),
    .I1(req[2]),
    .I2(state[2]),
    .I3(req[0]),
    .I4(state[1]),
    .I5(state[0]),
    .O(_24_[0])
  );
LUT6  #(
    .INIT(64'hfffffffff0f0f040)
  ) _52_ (
    .I0(_27_[0]),
    .I1(_21_[4]),
    .I2(state[2]),
    .I3(_27_[3]),
    .I4(_27_[4]),
    .I5(_27_[5]),
    .O(next_state[0])
  );
LUT6  #(
    .INIT(64'h000000ababab0000)
  ) _53_ (
    .I0(req[7]),
    .I1(_25_[1]),
    .I2(req[0]),
    .I3(req[6]),
    .I4(state[1]),
    .I5(state[0]),
    .O(_27_[4])
  );
LUT5  #(
    .INIT(32'd16711691)
  ) _54_ (
    .I0(req[4]),
    .I1(state[1]),
    .I2(req[3]),
    .I3(req[1]),
    .I4(req[2]),
    .O(_25_[1])
  );
LUT2  #(
    .INIT(4'h4)
  ) _55_ (
    .I0(_26_[0]),
    .I1(_00_[6]),
    .O(_27_[3])
  );
LUT6  #(
    .INIT(64'hffffffff00ff000b)
  ) _56_ (
    .I0(req[4]),
    .I1(req[5]),
    .I2(req[3]),
    .I3(req[1]),
    .I4(req[2]),
    .I5(req[0]),
    .O(_26_[0])
  );
LUT6  #(
    .INIT(64'hff00ff55ff33ff0f)
  ) _57_ (
    .I0(_03_[0]),
    .I1(_03_[1]),
    .I2(_03_[2]),
    .I3(_03_[3]),
    .I4(state[1]),
    .I5(state[0]),
    .O(_04_)
  );
MUXF7  _58_ (
    .I0(_04_),
    .I1(1'h0),
    .O(_27_[5]),
    .S(state[2])
  );
LUT6  #(
    .INIT(64'h00000000ff00fff4)
  ) _59_ (
    .I0(req[5]),
    .I1(req[6]),
    .I2(req[4]),
    .I3(req[2]),
    .I4(req[3]),
    .I5(req[1]),
    .O(_03_[2])
  );
LUT6  #(
    .INIT(64'h00000000ff00fff4)
  ) _60_ (
    .I0(req[0]),
    .I1(req[1]),
    .I2(req[7]),
    .I3(req[5]),
    .I4(req[6]),
    .I5(req[4]),
    .O(_05_)
  );
MUXF7  _61_ (
    .I0(1'h0),
    .I1(_05_),
    .O(_03_[3]),
    .S(state[1])
  );
LUT6  #(
    .INIT(64'h00000000ff00fff4)
  ) _62_ (
    .I0(req[7]),
    .I1(req[0]),
    .I2(req[6]),
    .I3(req[4]),
    .I4(req[5]),
    .I5(req[3]),
    .O(_03_[1])
  );
LUT6  #(
    .INIT(64'hffffffff00ff000b)
  ) _63_ (
    .I0(req[6]),
    .I1(req[7]),
    .I2(req[5]),
    .I3(req[3]),
    .I4(req[4]),
    .I5(req[2]),
    .O(_03_[0])
  );
LUT6  #(
    .INIT(64'h00000000ff00fff4)
  ) _64_ (
    .I0(req[1]),
    .I1(req[2]),
    .I2(req[0]),
    .I3(req[6]),
    .I4(req[7]),
    .I5(req[5]),
    .O(_27_[0])
  );
LUT2  #(
    .INIT(4'h1)
  ) _65_ (
    .I0(_29_[0]),
    .I1(_29_[1]),
    .O(next_state[1])
  );
LUT6  #(
    .INIT(64'h0c0d333f00000000)
  ) _66_ (
    .I0(req[6]),
    .I1(state[1]),
    .I2(_06_[2]),
    .I3(req[7]),
    .I4(state[0]),
    .I5(state[2]),
    .O(_09_)
  );
LUT6  #(
    .INIT(64'h0c0d000c00000000)
  ) _67_ (
    .I0(req[6]),
    .I1(state[1]),
    .I2(_06_[2]),
    .I3(req[7]),
    .I4(state[0]),
    .I5(state[2]),
    .O(_10_)
  );
MUXF7  _68_ (
    .I0(_09_),
    .I1(_10_),
    .O(_07_),
    .S(_06_[6])
  );
LUT6  #(
    .INIT(64'h0c0d333f00000000)
  ) _69_ (
    .I0(req[6]),
    .I1(state[1]),
    .I2(_06_[2]),
    .I3(req[7]),
    .I4(state[0]),
    .I5(state[2]),
    .O(_11_)
  );
LUT6  #(
    .INIT(64'h0001000c00000000)
  ) _70_ (
    .I0(req[6]),
    .I1(state[1]),
    .I2(_06_[2]),
    .I3(req[7]),
    .I4(state[0]),
    .I5(state[2]),
    .O(_12_)
  );
MUXF7  _71_ (
    .I0(_11_),
    .I1(_12_),
    .O(_08_),
    .S(_06_[6])
  );
MUXF8  _72_ (
    .I0(_07_),
    .I1(_08_),
    .O(_29_[0]),
    .S(_00_[0])
  );
LUT4  #(
    .INIT(16'h000e)
  ) _73_ (
    .I0(req[3]),
    .I1(req[2]),
    .I2(req[0]),
    .I3(req[1]),
    .O(_06_[2])
  );
LUT6  #(
    .INIT(64'h000000bf00000000)
  ) _74_ (
    .I0(req[4]),
    .I1(_06_[6]),
    .I2(_00_[6]),
    .I3(_28_[3]),
    .I4(state[2]),
    .I5(_28_[5]),
    .O(_29_[1])
  );
LUT5  #(
    .INIT(32'd65521)
  ) _75_ (
    .I0(req[0]),
    .I1(req[1]),
    .I2(req[6]),
    .I3(req[7]),
    .I4(req[5]),
    .O(_06_[6])
  );
LUT5  #(
    .INIT(32'd1431655681)
  ) _76_ (
    .I0(req[3]),
    .I1(req[7]),
    .I2(req[6]),
    .I3(req[4]),
    .I4(req[5]),
    .O(_15_)
  );
MUXF7  _77_ (
    .I0(1'h1),
    .I1(_15_),
    .O(_13_),
    .S(state[1])
  );
LUT6  #(
    .INIT(64'h1111111111110001)
  ) _78_ (
    .I0(req[2]),
    .I1(req[3]),
    .I2(req[7]),
    .I3(req[6]),
    .I4(req[4]),
    .I5(req[5]),
    .O(_16_)
  );
MUXF7  _79_ (
    .I0(_16_),
    .I1(1'h1),
    .O(_14_),
    .S(state[1])
  );
MUXF8  _80_ (
    .I0(_13_),
    .I1(_14_),
    .O(_28_[5]),
    .S(state[0])
  );
LUT6  #(
    .INIT(64'h000000000000fff1)
  ) _81_ (
    .I0(req[4]),
    .I1(req[5]),
    .I2(req[3]),
    .I3(req[2]),
    .I4(state[0]),
    .I5(req[1]),
    .O(_17_)
  );
MUXF7  _82_ (
    .I0(_17_),
    .I1(1'h0),
    .O(_28_[3]),
    .S(state[1])
  );
LUT6  #(
    .INIT(64'hfffffffffeff0000)
  ) _83_ (
    .I0(_21_[4]),
    .I1(req[7]),
    .I2(req[6]),
    .I3(_23_[2]),
    .I4(_21_[5]),
    .I5(_30_[5]),
    .O(next_state[2])
  );
LUT6  #(
    .INIT(64'hcccccccccc00c8c8)
  ) _84_ (
    .I0(req[5]),
    .I1(state[2]),
    .I2(req[6]),
    .I3(_00_[3]),
    .I4(state[1]),
    .I5(req[7]),
    .O(_18_)
  );
LUT5  #(
    .INIT(32'd2695536808)
  ) _85_ (
    .I0(state[2]),
    .I1(req[6]),
    .I2(_00_[3]),
    .I3(state[1]),
    .I4(req[7]),
    .O(_19_)
  );
MUXF7  _86_ (
    .I0(_18_),
    .I1(_19_),
    .O(_30_[5]),
    .S(state[0])
  );
LUT6  #(
    .INIT(64'h00000000c0c0ccfd)
  ) _87_ (
    .I0(req[1]),
    .I1(state[1]),
    .I2(state[0]),
    .I3(req[2]),
    .I4(req[3]),
    .I5(state[2]),
    .O(_21_[5])
  );
FDCE  #(
    .INIT(1'hx)
  ) _88_ (
    .C(clk),
    .CE(_20_),
    .CLR(rst),
    .D(next_state[0]),
    .Q(state[0])
  );
FDCE  #(
    .INIT(1'hx)
  ) _89_ (
    .C(clk),
    .CE(_20_),
    .CLR(rst),
    .D(next_state[1]),
    .Q(state[1])
  );
FDCE  #(
    .INIT(1'hx)
  ) _90_ (
    .C(clk),
    .CE(_20_),
    .CLR(rst),
    .D(next_state[2]),
    .Q(state[2])
  );
assign  _26_[1] = _00_[6];
assign  _30_[4:0] = { _21_[5], _23_[2], req[6], req[7], _21_[4] };
assign  _00_[5] = req[7];
assign  _03_[6:4] = { state[2], state[0], state[1] };
assign  { _06_[7], _06_[5:3], _06_[1:0] } = { _00_[0], state[2], state[0], req[7], state[1], req[6] };
assign  { _25_[5:2], _25_[0] } = { state[0], state[1], req[6], req[0], req[7] };
assign  { _23_[5:4], _23_[1:0] } = { _00_[6], state[2], _00_[3], req[6] };
assign  { _21_[3], _21_[1:0] } = { state[2], req[0], next };
assign  _27_[2:1] = { state[2], _21_[4] };
assign  _24_[1] = _21_[2];
assign  { _28_[4], _28_[2:0] } = { state[2], _00_[6], _06_[6], req[4] };
assign  gnt = state;
endmodule
