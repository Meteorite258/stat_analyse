module AES_Comp_MixColumns(x,  y);
wire  _00_;
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
wire  _21_;
wire  _22_;
wire  _23_;
wire  [7:0] a0;
wire  [7:0] a1;
wire  [7:0] a2;
wire  [7:0] a3;
input  [31:0] x;
wire  [31:0] x;
output  [31:0] y;
wire  [31:0] y;
LUT5  #(
    .INIT(32'd2523490710)
  ) _24_ (
    .I0(x[24]),
    .I1(x[16]),
    .I2(x[31]),
    .I3(x[8]),
    .I4(x[7]),
    .O(y[0])
  );
LUT6  #(
    .INIT(64'h6996966996696996)
  ) _25_ (
    .I0(x[24]),
    .I1(x[25]),
    .I2(x[17]),
    .I3(x[31]),
    .I4(x[9]),
    .I5(x[0]),
    .O(_00_)
  );
LUT6  #(
    .INIT(64'h9669699669969669)
  ) _26_ (
    .I0(x[24]),
    .I1(x[25]),
    .I2(x[17]),
    .I3(x[31]),
    .I4(x[9]),
    .I5(x[0]),
    .O(_01_)
  );
MUXF7  _27_ (
    .I0(_00_),
    .I1(_01_),
    .O(y[1]),
    .S(x[7])
  );
LUT5  #(
    .INIT(32'd2523490710)
  ) _28_ (
    .I0(x[25]),
    .I1(x[26]),
    .I2(x[18]),
    .I3(x[10]),
    .I4(x[1]),
    .O(y[2])
  );
LUT6  #(
    .INIT(64'h6996966996696996)
  ) _29_ (
    .I0(x[26]),
    .I1(x[27]),
    .I2(x[19]),
    .I3(x[31]),
    .I4(x[11]),
    .I5(x[2]),
    .O(_02_)
  );
LUT6  #(
    .INIT(64'h9669699669969669)
  ) _30_ (
    .I0(x[26]),
    .I1(x[27]),
    .I2(x[19]),
    .I3(x[31]),
    .I4(x[11]),
    .I5(x[2]),
    .O(_03_)
  );
MUXF7  _31_ (
    .I0(_02_),
    .I1(_03_),
    .O(y[3]),
    .S(x[7])
  );
LUT6  #(
    .INIT(64'h6996966996696996)
  ) _32_ (
    .I0(x[27]),
    .I1(x[28]),
    .I2(x[20]),
    .I3(x[31]),
    .I4(x[12]),
    .I5(x[3]),
    .O(_04_)
  );
LUT6  #(
    .INIT(64'h9669699669969669)
  ) _33_ (
    .I0(x[27]),
    .I1(x[28]),
    .I2(x[20]),
    .I3(x[31]),
    .I4(x[12]),
    .I5(x[3]),
    .O(_05_)
  );
MUXF7  _34_ (
    .I0(_04_),
    .I1(_05_),
    .O(y[4]),
    .S(x[7])
  );
LUT5  #(
    .INIT(32'd2523490710)
  ) _35_ (
    .I0(x[28]),
    .I1(x[29]),
    .I2(x[21]),
    .I3(x[13]),
    .I4(x[4]),
    .O(y[5])
  );
LUT5  #(
    .INIT(32'd2523490710)
  ) _36_ (
    .I0(x[29]),
    .I1(x[30]),
    .I2(x[22]),
    .I3(x[14]),
    .I4(x[5]),
    .O(y[6])
  );
LUT5  #(
    .INIT(32'd2523490710)
  ) _37_ (
    .I0(x[30]),
    .I1(x[31]),
    .I2(x[23]),
    .I3(x[15]),
    .I4(x[6]),
    .O(y[7])
  );
LUT5  #(
    .INIT(32'd2523490710)
  ) _38_ (
    .I0(x[24]),
    .I1(x[16]),
    .I2(x[15]),
    .I3(x[0]),
    .I4(x[7]),
    .O(y[8])
  );
LUT6  #(
    .INIT(64'h6996966996696996)
  ) _39_ (
    .I0(x[25]),
    .I1(x[17]),
    .I2(x[8]),
    .I3(x[15]),
    .I4(x[0]),
    .I5(x[1]),
    .O(_06_)
  );
LUT6  #(
    .INIT(64'h9669699669969669)
  ) _40_ (
    .I0(x[25]),
    .I1(x[17]),
    .I2(x[8]),
    .I3(x[15]),
    .I4(x[0]),
    .I5(x[1]),
    .O(_07_)
  );
MUXF7  _41_ (
    .I0(_06_),
    .I1(_07_),
    .O(y[9]),
    .S(x[7])
  );
LUT5  #(
    .INIT(32'd2523490710)
  ) _42_ (
    .I0(x[26]),
    .I1(x[18]),
    .I2(x[9]),
    .I3(x[1]),
    .I4(x[2]),
    .O(y[10])
  );
LUT6  #(
    .INIT(64'h6996966996696996)
  ) _43_ (
    .I0(x[27]),
    .I1(x[19]),
    .I2(x[10]),
    .I3(x[15]),
    .I4(x[2]),
    .I5(x[3]),
    .O(_08_)
  );
LUT6  #(
    .INIT(64'h9669699669969669)
  ) _44_ (
    .I0(x[27]),
    .I1(x[19]),
    .I2(x[10]),
    .I3(x[15]),
    .I4(x[2]),
    .I5(x[3]),
    .O(_09_)
  );
MUXF7  _45_ (
    .I0(_08_),
    .I1(_09_),
    .O(y[11]),
    .S(x[7])
  );
LUT6  #(
    .INIT(64'h6996966996696996)
  ) _46_ (
    .I0(x[28]),
    .I1(x[20]),
    .I2(x[11]),
    .I3(x[15]),
    .I4(x[3]),
    .I5(x[4]),
    .O(_10_)
  );
LUT6  #(
    .INIT(64'h9669699669969669)
  ) _47_ (
    .I0(x[28]),
    .I1(x[20]),
    .I2(x[11]),
    .I3(x[15]),
    .I4(x[3]),
    .I5(x[4]),
    .O(_11_)
  );
MUXF7  _48_ (
    .I0(_10_),
    .I1(_11_),
    .O(y[12]),
    .S(x[7])
  );
LUT5  #(
    .INIT(32'd2523490710)
  ) _49_ (
    .I0(x[29]),
    .I1(x[21]),
    .I2(x[12]),
    .I3(x[4]),
    .I4(x[5]),
    .O(y[13])
  );
LUT5  #(
    .INIT(32'd2523490710)
  ) _50_ (
    .I0(x[30]),
    .I1(x[22]),
    .I2(x[13]),
    .I3(x[5]),
    .I4(x[6]),
    .O(y[14])
  );
LUT5  #(
    .INIT(32'd2523490710)
  ) _51_ (
    .I0(x[31]),
    .I1(x[23]),
    .I2(x[14]),
    .I3(x[6]),
    .I4(x[7]),
    .O(y[15])
  );
LUT5  #(
    .INIT(32'd2523490710)
  ) _52_ (
    .I0(x[24]),
    .I1(x[23]),
    .I2(x[8]),
    .I3(x[15]),
    .I4(x[0]),
    .O(y[16])
  );
LUT6  #(
    .INIT(64'h6996966996696996)
  ) _53_ (
    .I0(x[16]),
    .I1(x[25]),
    .I2(x[23]),
    .I3(x[8]),
    .I4(x[9]),
    .I5(x[15]),
    .O(_12_)
  );
LUT6  #(
    .INIT(64'h9669699669969669)
  ) _54_ (
    .I0(x[16]),
    .I1(x[25]),
    .I2(x[23]),
    .I3(x[8]),
    .I4(x[9]),
    .I5(x[15]),
    .O(_13_)
  );
MUXF7  _55_ (
    .I0(_12_),
    .I1(_13_),
    .O(y[17]),
    .S(x[1])
  );
LUT5  #(
    .INIT(32'd2523490710)
  ) _56_ (
    .I0(x[17]),
    .I1(x[26]),
    .I2(x[9]),
    .I3(x[10]),
    .I4(x[2]),
    .O(y[18])
  );
LUT6  #(
    .INIT(64'h6996966996696996)
  ) _57_ (
    .I0(x[18]),
    .I1(x[27]),
    .I2(x[23]),
    .I3(x[10]),
    .I4(x[11]),
    .I5(x[15]),
    .O(_14_)
  );
LUT6  #(
    .INIT(64'h9669699669969669)
  ) _58_ (
    .I0(x[18]),
    .I1(x[27]),
    .I2(x[23]),
    .I3(x[10]),
    .I4(x[11]),
    .I5(x[15]),
    .O(_15_)
  );
MUXF7  _59_ (
    .I0(_14_),
    .I1(_15_),
    .O(y[19]),
    .S(x[3])
  );
LUT6  #(
    .INIT(64'h6996966996696996)
  ) _60_ (
    .I0(x[19]),
    .I1(x[28]),
    .I2(x[23]),
    .I3(x[11]),
    .I4(x[12]),
    .I5(x[15]),
    .O(_16_)
  );
LUT6  #(
    .INIT(64'h9669699669969669)
  ) _61_ (
    .I0(x[19]),
    .I1(x[28]),
    .I2(x[23]),
    .I3(x[11]),
    .I4(x[12]),
    .I5(x[15]),
    .O(_17_)
  );
MUXF7  _62_ (
    .I0(_16_),
    .I1(_17_),
    .O(y[20]),
    .S(x[4])
  );
LUT5  #(
    .INIT(32'd2523490710)
  ) _63_ (
    .I0(x[20]),
    .I1(x[29]),
    .I2(x[12]),
    .I3(x[13]),
    .I4(x[5]),
    .O(y[21])
  );
LUT5  #(
    .INIT(32'd2523490710)
  ) _64_ (
    .I0(x[21]),
    .I1(x[30]),
    .I2(x[13]),
    .I3(x[14]),
    .I4(x[6]),
    .O(y[22])
  );
LUT5  #(
    .INIT(32'd2523490710)
  ) _65_ (
    .I0(x[22]),
    .I1(x[31]),
    .I2(x[14]),
    .I3(x[15]),
    .I4(x[7]),
    .O(y[23])
  );
LUT5  #(
    .INIT(32'd2523490710)
  ) _66_ (
    .I0(x[16]),
    .I1(x[31]),
    .I2(x[23]),
    .I3(x[8]),
    .I4(x[0]),
    .O(y[24])
  );
LUT6  #(
    .INIT(64'h6996966996696996)
  ) _67_ (
    .I0(x[24]),
    .I1(x[16]),
    .I2(x[17]),
    .I3(x[31]),
    .I4(x[23]),
    .I5(x[9]),
    .O(_18_)
  );
LUT6  #(
    .INIT(64'h9669699669969669)
  ) _68_ (
    .I0(x[24]),
    .I1(x[16]),
    .I2(x[17]),
    .I3(x[31]),
    .I4(x[23]),
    .I5(x[9]),
    .O(_19_)
  );
MUXF7  _69_ (
    .I0(_18_),
    .I1(_19_),
    .O(y[25]),
    .S(x[1])
  );
LUT5  #(
    .INIT(32'd2523490710)
  ) _70_ (
    .I0(x[25]),
    .I1(x[17]),
    .I2(x[18]),
    .I3(x[10]),
    .I4(x[2]),
    .O(y[26])
  );
LUT6  #(
    .INIT(64'h6996966996696996)
  ) _71_ (
    .I0(x[26]),
    .I1(x[18]),
    .I2(x[19]),
    .I3(x[31]),
    .I4(x[23]),
    .I5(x[11]),
    .O(_20_)
  );
LUT6  #(
    .INIT(64'h9669699669969669)
  ) _72_ (
    .I0(x[26]),
    .I1(x[18]),
    .I2(x[19]),
    .I3(x[31]),
    .I4(x[23]),
    .I5(x[11]),
    .O(_21_)
  );
MUXF7  _73_ (
    .I0(_20_),
    .I1(_21_),
    .O(y[27]),
    .S(x[3])
  );
LUT6  #(
    .INIT(64'h6996966996696996)
  ) _74_ (
    .I0(x[27]),
    .I1(x[19]),
    .I2(x[20]),
    .I3(x[31]),
    .I4(x[23]),
    .I5(x[12]),
    .O(_22_)
  );
LUT6  #(
    .INIT(64'h9669699669969669)
  ) _75_ (
    .I0(x[27]),
    .I1(x[19]),
    .I2(x[20]),
    .I3(x[31]),
    .I4(x[23]),
    .I5(x[12]),
    .O(_23_)
  );
MUXF7  _76_ (
    .I0(_22_),
    .I1(_23_),
    .O(y[28]),
    .S(x[4])
  );
LUT5  #(
    .INIT(32'd2523490710)
  ) _77_ (
    .I0(x[28]),
    .I1(x[20]),
    .I2(x[21]),
    .I3(x[13]),
    .I4(x[5]),
    .O(y[29])
  );
LUT5  #(
    .INIT(32'd2523490710)
  ) _78_ (
    .I0(x[29]),
    .I1(x[21]),
    .I2(x[22]),
    .I3(x[14]),
    .I4(x[6]),
    .O(y[30])
  );
LUT5  #(
    .INIT(32'd2523490710)
  ) _79_ (
    .I0(x[30]),
    .I1(x[22]),
    .I2(x[23]),
    .I3(x[15]),
    .I4(x[7]),
    .O(y[31])
  );
assign  a0 = x[7:0];
assign  a1 = x[15:8];
assign  a2 = x[23:16];
assign  a3 = x[31:24];
endmodule