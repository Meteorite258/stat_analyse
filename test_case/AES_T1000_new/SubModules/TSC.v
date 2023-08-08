module TSC(rst,  clk, Tj_Trig, key, data, load);
wire  [63:0] _00_;
input  Tj_Trig;
input  clk;
wire  [19:0] counter;
input  [127:0] data;
input  [127:0] key;
output  [63:0] load;
input  rst;
LUT2  #(
    .INIT(4'h6)
  ) _01_ (
    .I0(key[0]),
    .I1(counter[0]),
    .O(_00_[7])
  );
LUT2  #(
    .INIT(4'h6)
  ) _02_ (
    .I0(key[1]),
    .I1(counter[1]),
    .O(_00_[15])
  );
LUT2  #(
    .INIT(4'h6)
  ) _03_ (
    .I0(key[2]),
    .I1(counter[2]),
    .O(_00_[23])
  );
LUT2  #(
    .INIT(4'h6)
  ) _04_ (
    .I0(key[3]),
    .I1(counter[3]),
    .O(_00_[31])
  );
LUT2  #(
    .INIT(4'h6)
  ) _05_ (
    .I0(key[4]),
    .I1(counter[4]),
    .O(_00_[39])
  );
LUT2  #(
    .INIT(4'h6)
  ) _06_ (
    .I0(key[5]),
    .I1(counter[5]),
    .O(_00_[47])
  );
LUT2  #(
    .INIT(4'h6)
  ) _07_ (
    .I0(key[6]),
    .I1(counter[6]),
    .O(_00_[55])
  );
LUT2  #(
    .INIT(4'h6)
  ) _08_ (
    .I0(key[7]),
    .I1(counter[7]),
    .O(_00_[63])
  );
FDRE  #(
    .INIT(1'hx)
  ) _09_ (
    .C(clk),
    .CE(1'h1),
    .D(_00_[7]),
    .Q(load[7]),
    .R(1'h0)
  );
FDRE  #(
    .INIT(1'hx)
  ) _10_ (
    .C(clk),
    .CE(1'h1),
    .D(_00_[15]),
    .Q(load[15]),
    .R(1'h0)
  );
FDRE  #(
    .INIT(1'hx)
  ) _11_ (
    .C(clk),
    .CE(1'h1),
    .D(_00_[23]),
    .Q(load[23]),
    .R(1'h0)
  );
FDRE  #(
    .INIT(1'hx)
  ) _12_ (
    .C(clk),
    .CE(1'h1),
    .D(_00_[31]),
    .Q(load[31]),
    .R(1'h0)
  );
FDRE  #(
    .INIT(1'hx)
  ) _13_ (
    .C(clk),
    .CE(1'h1),
    .D(_00_[39]),
    .Q(load[39]),
    .R(1'h0)
  );
FDRE  #(
    .INIT(1'hx)
  ) _14_ (
    .C(clk),
    .CE(1'h1),
    .D(_00_[47]),
    .Q(load[47]),
    .R(1'h0)
  );
FDRE  #(
    .INIT(1'hx)
  ) _15_ (
    .C(clk),
    .CE(1'h1),
    .D(_00_[55]),
    .Q(load[55]),
    .R(1'h0)
  );
FDRE  #(
    .INIT(1'hx)
  ) _16_ (
    .C(clk),
    .CE(1'h1),
    .D(_00_[63]),
    .Q(load[56]),
    .R(1'h0)
  );
lfsr_counter  lfsr (
    .Tj_Trig(Tj_Trig),
    .clk(clk),
    .data(data),
    .lfsr(counter),
    .rst(rst)
  );
assign  { _00_[62:56], _00_[54:48], _00_[46:40], _00_[38:32], _00_[30:24], _00_[22:16], _00_[14:8], _00_[6:0] } = { _00_[63], _00_[63], _00_[63], _00_[63], _00_[63], _00_[63], _00_[63], _00_[55], _00_[55], _00_[55], _00_[55], _00_[55], _00_[55], _00_[55], _00_[47], _00_[47], _00_[47], _00_[47], _00_[47], _00_[47], _00_[47], _00_[39], _00_[39], _00_[39], _00_[39], _00_[39], _00_[39], _00_[39], _00_[31], _00_[31], _00_[31], _00_[31], _00_[31], _00_[31], _00_[31], _00_[23], _00_[23], _00_[23], _00_[23], _00_[23], _00_[23], _00_[23], _00_[15], _00_[15], _00_[15], _00_[15], _00_[15], _00_[15], _00_[15], _00_[7], _00_[7], _00_[7], _00_[7], _00_[7], _00_[7], _00_[7] };
assign  { load[63:57], load[54:48], load[46:40], load[38:32], load[30:24], load[22:16], load[14:8], load[6:0] } = { load[56], load[56], load[56], load[56], load[56], load[56], load[56:55], load[55], load[55], load[55], load[55], load[55], load[55], load[47], load[47], load[47], load[47], load[47], load[47], load[47], load[39], load[39], load[39], load[39], load[39], load[39], load[39], load[31], load[31], load[31], load[31], load[31], load[31], load[31], load[23], load[23], load[23], load[23], load[23], load[23], load[23], load[15], load[15], load[15], load[15], load[15], load[15], load[15], load[7], load[7], load[7], load[7], load[7], load[7], load[7] };
endmodule
