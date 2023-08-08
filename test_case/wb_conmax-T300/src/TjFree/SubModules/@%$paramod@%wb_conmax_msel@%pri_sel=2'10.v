module \$paramod\wb_conmax_msel\pri_sel=2'10  (clk_i, rst_i, conf, req, sel, next);
input  clk_i;
wire  clk_i;
input  [15:0] conf;
wire  [15:0] conf;
wire  [2:0] gnt_p0;
wire  [2:0] gnt_p1;
wire  [2:0] gnt_p2;
wire  [2:0] gnt_p3;
input  next;
wire  next;
wire  [1:0] pri0;
wire  [1:0] pri1;
wire  [1:0] pri2;
wire  [1:0] pri3;
wire  [1:0] pri4;
wire  [1:0] pri5;
wire  [1:0] pri6;
wire  [1:0] pri7;
wire  [1:0] pri_out;
wire  [1:0] pri_out_d;
input  [7:0] req;
wire  [7:0] req;
wire  [7:0] req_p0;
wire  [7:0] req_p1;
wire  [7:0] req_p2;
wire  [7:0] req_p3;
input  rst_i;
wire  rst_i;
output  [2:0] sel;
wire  [2:0] sel;
wire  [2:0] sel2;
LUT6  #(
    .INIT(64'hccccaaaaf0f0ff00)
  ) _00_ (
    .I0(gnt_p2[0]),
    .I1(gnt_p3[0]),
    .I2(gnt_p1[0]),
    .I3(gnt_p0[0]),
    .I4(pri_out[0]),
    .I5(pri_out[1]),
    .O(sel[0])
  );
LUT6  #(
    .INIT(64'hf0f0aaaaff00cccc)
  ) _01_ (
    .I0(gnt_p2[1]),
    .I1(gnt_p0[1]),
    .I2(gnt_p3[1]),
    .I3(gnt_p1[1]),
    .I4(pri_out[0]),
    .I5(pri_out[1]),
    .O(sel[1])
  );
LUT6  #(
    .INIT(64'hf0f0aaaaff00cccc)
  ) _02_ (
    .I0(gnt_p2[2]),
    .I1(gnt_p0[2]),
    .I2(gnt_p3[2]),
    .I3(gnt_p1[2]),
    .I4(pri_out[0]),
    .I5(pri_out[1]),
    .O(sel[2])
  );
LUT3  #(
    .INIT(8'h10)
  ) _03_ (
    .I0(conf[1]),
    .I1(conf[0]),
    .I2(req[0]),
    .O(req_p0[0])
  );
LUT3  #(
    .INIT(8'h10)
  ) _04_ (
    .I0(conf[3]),
    .I1(conf[2]),
    .I2(req[1]),
    .O(req_p0[1])
  );
LUT3  #(
    .INIT(8'h10)
  ) _05_ (
    .I0(conf[4]),
    .I1(conf[5]),
    .I2(req[2]),
    .O(req_p0[2])
  );
LUT3  #(
    .INIT(8'h10)
  ) _06_ (
    .I0(conf[6]),
    .I1(conf[7]),
    .I2(req[3]),
    .O(req_p0[3])
  );
LUT3  #(
    .INIT(8'h10)
  ) _07_ (
    .I0(conf[9]),
    .I1(conf[8]),
    .I2(req[4]),
    .O(req_p0[4])
  );
LUT3  #(
    .INIT(8'h10)
  ) _08_ (
    .I0(conf[11]),
    .I1(conf[10]),
    .I2(req[5]),
    .O(req_p0[5])
  );
LUT3  #(
    .INIT(8'h10)
  ) _09_ (
    .I0(conf[13]),
    .I1(conf[12]),
    .I2(req[6]),
    .O(req_p0[6])
  );
LUT3  #(
    .INIT(8'h10)
  ) _10_ (
    .I0(conf[15]),
    .I1(conf[14]),
    .I2(req[7]),
    .O(req_p0[7])
  );
LUT3  #(
    .INIT(8'h40)
  ) _11_ (
    .I0(conf[1]),
    .I1(conf[0]),
    .I2(req[0]),
    .O(req_p1[0])
  );
LUT3  #(
    .INIT(8'h40)
  ) _12_ (
    .I0(conf[3]),
    .I1(conf[2]),
    .I2(req[1]),
    .O(req_p1[1])
  );
LUT3  #(
    .INIT(8'h40)
  ) _13_ (
    .I0(conf[5]),
    .I1(conf[4]),
    .I2(req[2]),
    .O(req_p1[2])
  );
LUT3  #(
    .INIT(8'h40)
  ) _14_ (
    .I0(conf[7]),
    .I1(conf[6]),
    .I2(req[3]),
    .O(req_p1[3])
  );
LUT3  #(
    .INIT(8'h40)
  ) _15_ (
    .I0(conf[9]),
    .I1(conf[8]),
    .I2(req[4]),
    .O(req_p1[4])
  );
LUT3  #(
    .INIT(8'h40)
  ) _16_ (
    .I0(conf[11]),
    .I1(conf[10]),
    .I2(req[5]),
    .O(req_p1[5])
  );
LUT3  #(
    .INIT(8'h40)
  ) _17_ (
    .I0(conf[13]),
    .I1(conf[12]),
    .I2(req[6]),
    .O(req_p1[6])
  );
LUT3  #(
    .INIT(8'h40)
  ) _18_ (
    .I0(conf[15]),
    .I1(conf[14]),
    .I2(req[7]),
    .O(req_p1[7])
  );
LUT3  #(
    .INIT(8'h40)
  ) _19_ (
    .I0(conf[0]),
    .I1(conf[1]),
    .I2(req[0]),
    .O(req_p2[0])
  );
LUT3  #(
    .INIT(8'h40)
  ) _20_ (
    .I0(conf[2]),
    .I1(conf[3]),
    .I2(req[1]),
    .O(req_p2[1])
  );
LUT3  #(
    .INIT(8'h40)
  ) _21_ (
    .I0(conf[4]),
    .I1(conf[5]),
    .I2(req[2]),
    .O(req_p2[2])
  );
LUT3  #(
    .INIT(8'h40)
  ) _22_ (
    .I0(conf[6]),
    .I1(conf[7]),
    .I2(req[3]),
    .O(req_p2[3])
  );
LUT3  #(
    .INIT(8'h40)
  ) _23_ (
    .I0(conf[8]),
    .I1(conf[9]),
    .I2(req[4]),
    .O(req_p2[4])
  );
LUT3  #(
    .INIT(8'h40)
  ) _24_ (
    .I0(conf[10]),
    .I1(conf[11]),
    .I2(req[5]),
    .O(req_p2[5])
  );
LUT3  #(
    .INIT(8'h40)
  ) _25_ (
    .I0(conf[12]),
    .I1(conf[13]),
    .I2(req[6]),
    .O(req_p2[6])
  );
LUT3  #(
    .INIT(8'h40)
  ) _26_ (
    .I0(conf[14]),
    .I1(conf[15]),
    .I2(req[7]),
    .O(req_p2[7])
  );
LUT3  #(
    .INIT(8'h80)
  ) _27_ (
    .I0(conf[1]),
    .I1(conf[0]),
    .I2(req[0]),
    .O(req_p3[0])
  );
LUT3  #(
    .INIT(8'h80)
  ) _28_ (
    .I0(conf[3]),
    .I1(conf[2]),
    .I2(req[1]),
    .O(req_p3[1])
  );
LUT3  #(
    .INIT(8'h80)
  ) _29_ (
    .I0(conf[4]),
    .I1(conf[5]),
    .I2(req[2]),
    .O(req_p3[2])
  );
LUT3  #(
    .INIT(8'h80)
  ) _30_ (
    .I0(conf[6]),
    .I1(conf[7]),
    .I2(req[3]),
    .O(req_p3[3])
  );
LUT3  #(
    .INIT(8'h80)
  ) _31_ (
    .I0(conf[9]),
    .I1(conf[8]),
    .I2(req[4]),
    .O(req_p3[4])
  );
LUT3  #(
    .INIT(8'h80)
  ) _32_ (
    .I0(conf[11]),
    .I1(conf[10]),
    .I2(req[5]),
    .O(req_p3[5])
  );
LUT3  #(
    .INIT(8'h80)
  ) _33_ (
    .I0(conf[13]),
    .I1(conf[12]),
    .I2(req[6]),
    .O(req_p3[6])
  );
LUT3  #(
    .INIT(8'h80)
  ) _34_ (
    .I0(conf[15]),
    .I1(conf[14]),
    .I2(req[7]),
    .O(req_p3[7])
  );
FDRE  #(
    .INIT(1'hx)
  ) _35_ (
    .C(clk_i),
    .CE(next),
    .D(pri_out_d[0]),
    .Q(pri_out[0]),
    .R(rst_i)
  );
FDRE  #(
    .INIT(1'hx)
  ) _36_ (
    .C(clk_i),
    .CE(next),
    .D(pri_out_d[1]),
    .Q(pri_out[1]),
    .R(rst_i)
  );
wb_conmax_arb  arb0 (
    .clk(clk_i),
    .gnt(gnt_p0),
    .next(1'h0),
    .req(req_p0),
    .rst(rst_i)
  );
wb_conmax_arb  arb1 (
    .clk(clk_i),
    .gnt(gnt_p1),
    .next(1'h0),
    .req(req_p1),
    .rst(rst_i)
  );
wb_conmax_arb  arb2 (
    .clk(clk_i),
    .gnt(gnt_p2),
    .next(1'h0),
    .req(req_p2),
    .rst(rst_i)
  );
wb_conmax_arb  arb3 (
    .clk(clk_i),
    .gnt(gnt_p3),
    .next(1'h0),
    .req(req_p3),
    .rst(rst_i)
  );
\$paramod\wb_conmax_pri_enc\pri_sel=2'10   pri_enc (
    .pri0(conf[1:0]),
    .pri1(conf[3:2]),
    .pri2(conf[5:4]),
    .pri3(conf[7:6]),
    .pri4(conf[9:8]),
    .pri5(conf[11:10]),
    .pri6(conf[13:12]),
    .pri7(conf[15:14]),
    .pri_out(pri_out_d),
    .valid(req)
  );
assign  pri0 = conf[1:0];
assign  pri1 = conf[3:2];
assign  pri2 = conf[5:4];
assign  pri3 = conf[7:6];
assign  pri4 = conf[9:8];
assign  pri5 = conf[11:10];
assign  pri6 = conf[13:12];
assign  pri7 = conf[15:14];
assign  sel2 = sel;
endmodule
