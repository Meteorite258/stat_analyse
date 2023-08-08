module lfsr_counter(rst,  clk, Tj_Trig, data, lfsr);
wire  [19:0] _00_;
wire  _01_;
wire  _02_;
wire  _03_;
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
wire  _15_;
wire  _16_;
wire  _17_;
wire  _18_;
wire  _19_;
wire  _20_;
input  Tj_Trig;
input  clk;
input  [127:0] data;
output  [19:0] lfsr;
wire  [19:0] lfsr_stream;
input  rst;
LUT2  #(
    .INIT(4'he)
  ) _21_ (
    .I0(rst),
    .I1(Tj_Trig),
    .O(_01_)
  );
LUT6  #(
    .INIT(64'haaaaaaaa3cc3c33c)
  ) _22_ (
    .I0(data[19]),
    .I1(lfsr_stream[7]),
    .I2(lfsr_stream[11]),
    .I3(lfsr_stream[15]),
    .I4(lfsr_stream[0]),
    .I5(rst),
    .O(_00_[19])
  );
FDRE  #(
    .INIT(1'hx)
  ) _23_ (
    .C(clk),
    .CE(1'h1),
    .D(_02_),
    .Q(lfsr_stream[0]),
    .R(1'h0)
  );
FDRE  #(
    .INIT(1'hx)
  ) _24_ (
    .C(clk),
    .CE(1'h1),
    .D(_03_),
    .Q(lfsr_stream[1]),
    .R(1'h0)
  );
FDRE  #(
    .INIT(1'hx)
  ) _25_ (
    .C(clk),
    .CE(1'h1),
    .D(_04_),
    .Q(lfsr_stream[2]),
    .R(1'h0)
  );
FDRE  #(
    .INIT(1'hx)
  ) _26_ (
    .C(clk),
    .CE(1'h1),
    .D(_05_),
    .Q(lfsr_stream[3]),
    .R(1'h0)
  );
FDRE  #(
    .INIT(1'hx)
  ) _27_ (
    .C(clk),
    .CE(1'h1),
    .D(_06_),
    .Q(lfsr_stream[4]),
    .R(1'h0)
  );
FDRE  #(
    .INIT(1'hx)
  ) _28_ (
    .C(clk),
    .CE(1'h1),
    .D(_07_),
    .Q(lfsr_stream[5]),
    .R(1'h0)
  );
FDRE  #(
    .INIT(1'hx)
  ) _29_ (
    .C(clk),
    .CE(1'h1),
    .D(_08_),
    .Q(lfsr_stream[6]),
    .R(1'h0)
  );
FDRE  #(
    .INIT(1'hx)
  ) _30_ (
    .C(clk),
    .CE(1'h1),
    .D(_09_),
    .Q(lfsr_stream[7]),
    .R(1'h0)
  );
FDRE  #(
    .INIT(1'hx)
  ) _31_ (
    .C(clk),
    .CE(1'h1),
    .D(_10_),
    .Q(lfsr_stream[8]),
    .R(1'h0)
  );
FDRE  #(
    .INIT(1'hx)
  ) _32_ (
    .C(clk),
    .CE(1'h1),
    .D(_11_),
    .Q(lfsr_stream[9]),
    .R(1'h0)
  );
FDRE  #(
    .INIT(1'hx)
  ) _33_ (
    .C(clk),
    .CE(1'h1),
    .D(_12_),
    .Q(lfsr_stream[10]),
    .R(1'h0)
  );
FDRE  #(
    .INIT(1'hx)
  ) _34_ (
    .C(clk),
    .CE(1'h1),
    .D(_13_),
    .Q(lfsr_stream[11]),
    .R(1'h0)
  );
FDRE  #(
    .INIT(1'hx)
  ) _35_ (
    .C(clk),
    .CE(1'h1),
    .D(_14_),
    .Q(lfsr_stream[12]),
    .R(1'h0)
  );
FDRE  #(
    .INIT(1'hx)
  ) _36_ (
    .C(clk),
    .CE(1'h1),
    .D(_15_),
    .Q(lfsr_stream[13]),
    .R(1'h0)
  );
FDRE  #(
    .INIT(1'hx)
  ) _37_ (
    .C(clk),
    .CE(1'h1),
    .D(_16_),
    .Q(lfsr_stream[14]),
    .R(1'h0)
  );
FDRE  #(
    .INIT(1'hx)
  ) _38_ (
    .C(clk),
    .CE(1'h1),
    .D(_17_),
    .Q(lfsr_stream[15]),
    .R(1'h0)
  );
FDRE  #(
    .INIT(1'hx)
  ) _39_ (
    .C(clk),
    .CE(1'h1),
    .D(_18_),
    .Q(lfsr_stream[16]),
    .R(1'h0)
  );
FDRE  #(
    .INIT(1'hx)
  ) _40_ (
    .C(clk),
    .CE(1'h1),
    .D(_19_),
    .Q(lfsr_stream[17]),
    .R(1'h0)
  );
FDRE  #(
    .INIT(1'hx)
  ) _41_ (
    .C(clk),
    .CE(1'h1),
    .D(_20_),
    .Q(lfsr_stream[18]),
    .R(1'h0)
  );
FDRE  #(
    .INIT(1'hx)
  ) _42_ (
    .C(clk),
    .CE(_01_),
    .D(_00_[19]),
    .Q(lfsr_stream[19]),
    .R(1'h0)
  );
LUT5  #(
    .INIT(32'd4278248162)
  ) _43_ (
    .I0(lfsr_stream[0]),
    .I1(Tj_Trig),
    .I2(lfsr_stream[1]),
    .I3(data[0]),
    .I4(rst),
    .O(_02_)
  );
LUT5  #(
    .INIT(32'd4278248162)
  ) _44_ (
    .I0(lfsr_stream[1]),
    .I1(Tj_Trig),
    .I2(lfsr_stream[2]),
    .I3(data[1]),
    .I4(rst),
    .O(_03_)
  );
LUT5  #(
    .INIT(32'd4278248162)
  ) _45_ (
    .I0(lfsr_stream[2]),
    .I1(Tj_Trig),
    .I2(lfsr_stream[3]),
    .I3(data[2]),
    .I4(rst),
    .O(_04_)
  );
LUT5  #(
    .INIT(32'd4278248162)
  ) _46_ (
    .I0(lfsr_stream[3]),
    .I1(Tj_Trig),
    .I2(lfsr_stream[4]),
    .I3(data[3]),
    .I4(rst),
    .O(_05_)
  );
LUT5  #(
    .INIT(32'd4278248162)
  ) _47_ (
    .I0(lfsr_stream[4]),
    .I1(Tj_Trig),
    .I2(lfsr_stream[5]),
    .I3(data[4]),
    .I4(rst),
    .O(_06_)
  );
LUT5  #(
    .INIT(32'd4278248162)
  ) _48_ (
    .I0(lfsr_stream[5]),
    .I1(Tj_Trig),
    .I2(lfsr_stream[6]),
    .I3(data[5]),
    .I4(rst),
    .O(_07_)
  );
LUT5  #(
    .INIT(32'd4278248162)
  ) _49_ (
    .I0(lfsr_stream[6]),
    .I1(Tj_Trig),
    .I2(lfsr_stream[7]),
    .I3(data[6]),
    .I4(rst),
    .O(_08_)
  );
LUT5  #(
    .INIT(32'd4278248162)
  ) _50_ (
    .I0(lfsr_stream[7]),
    .I1(Tj_Trig),
    .I2(lfsr_stream[8]),
    .I3(data[7]),
    .I4(rst),
    .O(_09_)
  );
LUT5  #(
    .INIT(32'd4278248162)
  ) _51_ (
    .I0(lfsr_stream[8]),
    .I1(Tj_Trig),
    .I2(lfsr_stream[9]),
    .I3(data[8]),
    .I4(rst),
    .O(_10_)
  );
LUT5  #(
    .INIT(32'd4278248162)
  ) _52_ (
    .I0(lfsr_stream[9]),
    .I1(Tj_Trig),
    .I2(lfsr_stream[10]),
    .I3(data[9]),
    .I4(rst),
    .O(_11_)
  );
LUT5  #(
    .INIT(32'd4278248162)
  ) _53_ (
    .I0(lfsr_stream[10]),
    .I1(Tj_Trig),
    .I2(lfsr_stream[11]),
    .I3(data[10]),
    .I4(rst),
    .O(_12_)
  );
LUT5  #(
    .INIT(32'd4278248162)
  ) _54_ (
    .I0(lfsr_stream[11]),
    .I1(Tj_Trig),
    .I2(lfsr_stream[12]),
    .I3(data[11]),
    .I4(rst),
    .O(_13_)
  );
LUT5  #(
    .INIT(32'd4278248162)
  ) _55_ (
    .I0(lfsr_stream[12]),
    .I1(Tj_Trig),
    .I2(lfsr_stream[13]),
    .I3(data[12]),
    .I4(rst),
    .O(_14_)
  );
LUT5  #(
    .INIT(32'd4278248162)
  ) _56_ (
    .I0(lfsr_stream[13]),
    .I1(Tj_Trig),
    .I2(lfsr_stream[14]),
    .I3(data[13]),
    .I4(rst),
    .O(_15_)
  );
LUT5  #(
    .INIT(32'd4278248162)
  ) _57_ (
    .I0(lfsr_stream[14]),
    .I1(Tj_Trig),
    .I2(lfsr_stream[15]),
    .I3(data[14]),
    .I4(rst),
    .O(_16_)
  );
LUT5  #(
    .INIT(32'd4278248162)
  ) _58_ (
    .I0(lfsr_stream[15]),
    .I1(Tj_Trig),
    .I2(lfsr_stream[16]),
    .I3(data[15]),
    .I4(rst),
    .O(_17_)
  );
LUT5  #(
    .INIT(32'd4278248162)
  ) _59_ (
    .I0(lfsr_stream[16]),
    .I1(Tj_Trig),
    .I2(lfsr_stream[17]),
    .I3(data[16]),
    .I4(rst),
    .O(_18_)
  );
LUT5  #(
    .INIT(32'd4278248162)
  ) _60_ (
    .I0(lfsr_stream[17]),
    .I1(Tj_Trig),
    .I2(lfsr_stream[18]),
    .I3(data[17]),
    .I4(rst),
    .O(_19_)
  );
LUT5  #(
    .INIT(32'd4278248162)
  ) _61_ (
    .I0(lfsr_stream[18]),
    .I1(Tj_Trig),
    .I2(lfsr_stream[19]),
    .I3(data[18]),
    .I4(rst),
    .O(_20_)
  );
assign  lfsr = lfsr_stream;
endmodule
