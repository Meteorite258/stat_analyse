module wb_conmax_arb(clk,  rst, req, gnt, next);
wire  [6:0] _00_;
wire  _01_;
wire  _02_;
wire  [6:0] _03_;
wire  _04_;
wire  _05_;
wire  _06_;
wire  _07_;
wire  _08_;
wire  _09_;
wire  _10_;
wire  _11_;
wire  _12_;
wire  _13_;
wire  _14_;
wire  [4:0] _15_;
wire  [2:0] _16_;
wire  [2:0] _17_;
wire  [5:0] _18_;
wire  [5:0] _19_;
wire  [5:0] _20_;
wire  [3:0] _21_;
wire  [5:0] _22_;
wire  [5:0] _23_;
wire  [5:0] _24_;
wire  [1:0] _25_;
wire  [5:0] _26_;
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
    .INIT(64'h0000000100000000)
  ) _27_ (
    .I0(_18_[0]),
    .I1(_18_[1]),
    .I2(_18_[2]),
    .I3(_18_[3]),
    .I4(_18_[4]),
    .I5(_18_[5]),
    .O(_14_)
  );
LUT5  #(
    .INIT(32'd3489660928)
  ) _28_ (
    .I0(state[0]),
    .I1(_15_[1]),
    .I2(_15_[2]),
    .I3(_15_[3]),
    .I4(_15_[4]),
    .O(_18_[0])
  );
LUT5  #(
    .INIT(32'd31)
  ) _29_ (
    .I0(req[1]),
    .I1(req[0]),
    .I2(state[1]),
    .I3(req[4]),
    .I4(state[2]),
    .O(_15_[3])
  );
LUT3  #(
    .INIT(8'h01)
  ) _30_ (
    .I0(req[7]),
    .I1(req[5]),
    .I2(req[6]),
    .O(_15_[2])
  );
LUT2  #(
    .INIT(4'h1)
  ) _31_ (
    .I0(req[2]),
    .I1(req[0]),
    .O(_15_[1])
  );
LUT3  #(
    .INIT(8'h01)
  ) _32_ (
    .I0(_16_[0]),
    .I1(state[2]),
    .I2(next),
    .O(_18_[1])
  );
LUT6  #(
    .INIT(64'h00ff33330f0f5555)
  ) _33_ (
    .I0(req[0]),
    .I1(req[1]),
    .I2(req[2]),
    .I3(req[3]),
    .I4(state[1]),
    .I5(state[0]),
    .O(_16_[0])
  );
LUT6  #(
    .INIT(64'hd000000000000000)
  ) _34_ (
    .I0(req[7]),
    .I1(state[0]),
    .I2(state[1]),
    .I3(_00_[3]),
    .I4(state[2]),
    .I5(_00_[5]),
    .O(_01_)
  );
LUT6  #(
    .INIT(64'h1000000000000000)
  ) _35_ (
    .I0(req[7]),
    .I1(state[0]),
    .I2(state[1]),
    .I3(_00_[3]),
    .I4(state[2]),
    .I5(_00_[5]),
    .O(_02_)
  );
MUXF7  _36_ (
    .I0(_01_),
    .I1(_02_),
    .O(_18_[2]),
    .S(req[6])
  );
LUT2  #(
    .INIT(4'h1)
  ) _37_ (
    .I0(req[4]),
    .I1(req[5]),
    .O(_00_[3])
  );
LUT4  #(
    .INIT(16'h0001)
  ) _38_ (
    .I0(req[1]),
    .I1(req[2]),
    .I2(req[0]),
    .I3(req[3]),
    .O(_00_[5])
  );
LUT3  #(
    .INIT(8'h10)
  ) _39_ (
    .I0(_17_[0]),
    .I1(req[7]),
    .I2(_00_[5]),
    .O(_18_[3])
  );
LUT6  #(
    .INIT(64'hfffcfffaffffffff)
  ) _40_ (
    .I0(req[5]),
    .I1(req[4]),
    .I2(state[1]),
    .I3(req[6]),
    .I4(state[0]),
    .I5(state[2]),
    .O(_17_[0])
  );
LUT6  #(
    .INIT(64'h000c000a00000000)
  ) _41_ (
    .I0(req[4]),
    .I1(req[6]),
    .I2(state[0]),
    .I3(next),
    .I4(state[1]),
    .I5(state[2]),
    .O(_18_[4])
  );
LUT6  #(
    .INIT(64'hf3f5ffffffffffff)
  ) _42_ (
    .I0(req[5]),
    .I1(req[7]),
    .I2(next),
    .I3(state[1]),
    .I4(state[0]),
    .I5(state[2]),
    .O(_18_[5])
  );
LUT4  #(
    .INIT(16'hffb0)
  ) _43_ (
    .I0(_21_[0]),
    .I1(_21_[1]),
    .I2(state[2]),
    .I3(_21_[3]),
    .O(next_state[0])
  );
LUT6  #(
    .INIT(64'h000000ababab0000)
  ) _44_ (
    .I0(req[7]),
    .I1(_19_[1]),
    .I2(req[0]),
    .I3(req[6]),
    .I4(state[1]),
    .I5(state[0]),
    .O(_21_[0])
  );
LUT5  #(
    .INIT(32'd16711691)
  ) _45_ (
    .I0(req[4]),
    .I1(state[1]),
    .I2(req[3]),
    .I3(req[1]),
    .I4(req[2]),
    .O(_19_[1])
  );
LUT6  #(
    .INIT(64'h00bbfffffffff0f0)
  ) _46_ (
    .I0(_20_[0]),
    .I1(_15_[1]),
    .I2(_20_[2]),
    .I3(_20_[3]),
    .I4(state[1]),
    .I5(state[0]),
    .O(_21_[1])
  );
LUT2  #(
    .INIT(4'h4)
  ) _47_ (
    .I0(req[0]),
    .I1(req[1]),
    .O(_20_[3])
  );
LUT6  #(
    .INIT(64'h00000000ff00fff4)
  ) _48_ (
    .I0(req[1]),
    .I1(req[2]),
    .I2(req[0]),
    .I3(req[6]),
    .I4(req[7]),
    .I5(req[5]),
    .O(_20_[2])
  );
LUT3  #(
    .INIT(8'h0d)
  ) _49_ (
    .I0(req[5]),
    .I1(req[4]),
    .I2(req[3]),
    .O(_20_[0])
  );
LUT6  #(
    .INIT(64'hff00ff55ff33ff0f)
  ) _50_ (
    .I0(_03_[0]),
    .I1(_03_[1]),
    .I2(_03_[2]),
    .I3(_03_[3]),
    .I4(state[1]),
    .I5(state[0]),
    .O(_04_)
  );
MUXF7  _51_ (
    .I0(_04_),
    .I1(1'h0),
    .O(_21_[3]),
    .S(state[2])
  );
LUT6  #(
    .INIT(64'h00000000ff00fff4)
  ) _52_ (
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
  ) _53_ (
    .I0(req[0]),
    .I1(req[1]),
    .I2(req[7]),
    .I3(req[5]),
    .I4(req[6]),
    .I5(req[4]),
    .O(_05_)
  );
MUXF7  _54_ (
    .I0(1'h0),
    .I1(_05_),
    .O(_03_[3]),
    .S(state[1])
  );
LUT6  #(
    .INIT(64'h00000000ff00fff4)
  ) _55_ (
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
  ) _56_ (
    .I0(req[6]),
    .I1(req[7]),
    .I2(req[5]),
    .I3(req[3]),
    .I4(req[4]),
    .I5(req[2]),
    .O(_03_[0])
  );
LUT6  #(
    .INIT(64'h0000000010ffffff)
  ) _57_ (
    .I0(state[1]),
    .I1(state[0]),
    .I2(_23_[1]),
    .I3(state[2]),
    .I4(_24_[4]),
    .I5(_24_[5]),
    .O(next_state[1])
  );
LUT6  #(
    .INIT(64'h00000000cccd333f)
  ) _58_ (
    .I0(req[6]),
    .I1(state[1]),
    .I2(_22_[2]),
    .I3(req[7]),
    .I4(state[0]),
    .I5(_22_[5]),
    .O(_24_[4])
  );
MUXF7  _59_ (
    .I0(1'h0),
    .I1(1'h0),
    .O(_06_),
    .S(state[0])
  );
LUT6  #(
    .INIT(64'h000000000000fff1)
  ) _60_ (
    .I0(req[4]),
    .I1(req[5]),
    .I2(req[3]),
    .I3(req[2]),
    .I4(req[0]),
    .I5(req[1]),
    .O(_08_)
  );
MUXF7  _61_ (
    .I0(1'h0),
    .I1(_08_),
    .O(_07_),
    .S(state[0])
  );
MUXF8  _62_ (
    .I0(_06_),
    .I1(_07_),
    .O(_22_[5]),
    .S(state[1])
  );
LUT4  #(
    .INIT(16'h000e)
  ) _63_ (
    .I0(req[3]),
    .I1(req[2]),
    .I2(req[0]),
    .I3(req[1]),
    .O(_22_[2])
  );
LUT6  #(
    .INIT(64'h000000bf00000000)
  ) _64_ (
    .I0(req[4]),
    .I1(_23_[1]),
    .I2(_23_[2]),
    .I3(_23_[3]),
    .I4(state[2]),
    .I5(_23_[5]),
    .O(_24_[5])
  );
LUT2  #(
    .INIT(4'h8)
  ) _65_ (
    .I0(state[1]),
    .I1(state[0]),
    .O(_23_[2])
  );
LUT5  #(
    .INIT(32'd65521)
  ) _66_ (
    .I0(req[0]),
    .I1(req[1]),
    .I2(req[6]),
    .I3(req[7]),
    .I4(req[5]),
    .O(_23_[1])
  );
LUT5  #(
    .INIT(32'd1431655681)
  ) _67_ (
    .I0(req[3]),
    .I1(req[7]),
    .I2(req[6]),
    .I3(req[4]),
    .I4(req[5]),
    .O(_11_)
  );
MUXF7  _68_ (
    .I0(1'h1),
    .I1(_11_),
    .O(_09_),
    .S(state[1])
  );
LUT6  #(
    .INIT(64'h1111111111110001)
  ) _69_ (
    .I0(req[2]),
    .I1(req[3]),
    .I2(req[7]),
    .I3(req[6]),
    .I4(req[4]),
    .I5(req[5]),
    .O(_12_)
  );
MUXF7  _70_ (
    .I0(_12_),
    .I1(1'h1),
    .O(_10_),
    .S(state[1])
  );
MUXF8  _71_ (
    .I0(_09_),
    .I1(_10_),
    .O(_23_[5]),
    .S(state[0])
  );
LUT6  #(
    .INIT(64'h000000000000fff1)
  ) _72_ (
    .I0(req[4]),
    .I1(req[5]),
    .I2(req[3]),
    .I3(req[2]),
    .I4(req[1]),
    .I5(state[0]),
    .O(_13_)
  );
MUXF7  _73_ (
    .I0(_13_),
    .I1(1'h0),
    .O(_23_[3]),
    .S(state[1])
  );
LUT6  #(
    .INIT(64'hffffffff0000ef00)
  ) _74_ (
    .I0(state[1]),
    .I1(state[0]),
    .I2(_15_[2]),
    .I3(state[2]),
    .I4(_26_[4]),
    .I5(_26_[5]),
    .O(next_state[2])
  );
LUT2  #(
    .INIT(4'h4)
  ) _75_ (
    .I0(_25_[0]),
    .I1(_15_[4]),
    .O(_26_[5])
  );
LUT6  #(
    .INIT(64'h000000000000000e)
  ) _76_ (
    .I0(state[0]),
    .I1(state[1]),
    .I2(req[7]),
    .I3(req[4]),
    .I4(req[5]),
    .I5(req[6]),
    .O(_25_[0])
  );
LUT6  #(
    .INIT(64'h00000000c0c0ccfd)
  ) _77_ (
    .I0(req[1]),
    .I1(state[1]),
    .I2(state[0]),
    .I3(req[2]),
    .I4(req[3]),
    .I5(state[2]),
    .O(_15_[4])
  );
LUT5  #(
    .INIT(32'd52492)
  ) _78_ (
    .I0(req[6]),
    .I1(state[1]),
    .I2(req[7]),
    .I3(state[0]),
    .I4(_00_[5]),
    .O(_26_[4])
  );
FDCE  #(
    .INIT(1'hx)
  ) _79_ (
    .C(clk),
    .CE(_14_),
    .CLR(rst),
    .D(next_state[0]),
    .Q(state[0])
  );
FDCE  #(
    .INIT(1'hx)
  ) _80_ (
    .C(clk),
    .CE(_14_),
    .CLR(rst),
    .D(next_state[1]),
    .Q(state[1])
  );
FDCE  #(
    .INIT(1'hx)
  ) _81_ (
    .C(clk),
    .CE(_14_),
    .CLR(rst),
    .D(next_state[2]),
    .Q(state[2])
  );
assign  _25_[1] = _15_[4];
assign  { _19_[5:2], _19_[0] } = { state[0], state[1], req[6], req[0], req[7] };
assign  _26_[3:0] = { state[2], _15_[2], state[0], state[1] };
assign  _03_[6:4] = { state[2], state[0], state[1] };
assign  _15_[0] = state[0];
assign  { _22_[4:3], _22_[1:0] } = { state[0], req[7], state[1], req[6] };
assign  _17_[2:1] = { _00_[5], req[7] };
assign  _21_[2] = state[2];
assign  { _00_[6], _00_[4], _00_[2:0] } = { req[6], state, req[7] };
assign  { _20_[5:4], _20_[1] } = { state[0], state[1], _15_[1] };
assign  { _23_[4], _23_[0] } = { state[2], req[4] };
assign  _16_[2:1] = { next, state[2] };
assign  _24_[3:0] = { state[2], _23_[1], state[0], state[1] };
assign  gnt = state;
endmodule
