module AES_Comp_InvSboxComp(x,  y);
wire  [7:0] a;
wire  [7:0] b;
input  [7:0] x;
wire  [7:0] x;
output  [7:0] y;
wire  [7:0] y;
LUT3  #(
    .INIT(8'h69)
  ) _00_ (
    .I0(x[2]),
    .I1(x[6]),
    .I2(x[7]),
    .O(a[0])
  );
LUT3  #(
    .INIT(8'h96)
  ) _01_ (
    .I0(x[1]),
    .I1(x[5]),
    .I2(x[3]),
    .O(a[1])
  );
LUT5  #(
    .INIT(32'd1771476585)
  ) _02_ (
    .I0(x[2]),
    .I1(x[1]),
    .I2(x[5]),
    .I3(x[6]),
    .I4(x[7]),
    .O(a[2])
  );
LUT2  #(
    .INIT(4'h9)
  ) _03_ (
    .I0(x[5]),
    .I1(x[7]),
    .O(a[3])
  );
LUT3  #(
    .INIT(8'h69)
  ) _04_ (
    .I0(x[5]),
    .I1(x[3]),
    .I2(x[4]),
    .O(a[4])
  );
LUT4  #(
    .INIT(16'h9669)
  ) _05_ (
    .I0(x[5]),
    .I1(x[0]),
    .I2(x[6]),
    .I3(x[4]),
    .O(a[5])
  );
LUT6  #(
    .INIT(64'h9669699669969669)
  ) _06_ (
    .I0(x[2]),
    .I1(x[1]),
    .I2(x[3]),
    .I3(x[0]),
    .I4(x[6]),
    .I5(x[7]),
    .O(a[6])
  );
LUT4  #(
    .INIT(16'h6996)
  ) _07_ (
    .I0(x[2]),
    .I1(x[1]),
    .I2(x[6]),
    .I3(x[7]),
    .O(a[7])
  );
LUT5  #(
    .INIT(32'd2523490710)
  ) _08_ (
    .I0(b[0]),
    .I1(b[2]),
    .I2(b[4]),
    .I3(b[5]),
    .I4(b[6]),
    .O(y[0])
  );
LUT2  #(
    .INIT(4'h6)
  ) _09_ (
    .I0(b[4]),
    .I1(b[5]),
    .O(y[1])
  );
LUT5  #(
    .INIT(32'd2523490710)
  ) _10_ (
    .I0(b[2]),
    .I1(b[4]),
    .I2(b[7]),
    .I3(b[3]),
    .I4(b[1]),
    .O(y[2])
  );
LUT5  #(
    .INIT(32'd2523490710)
  ) _11_ (
    .I0(b[2]),
    .I1(b[4]),
    .I2(b[5]),
    .I3(b[3]),
    .I4(b[1]),
    .O(y[3])
  );
LUT5  #(
    .INIT(32'd2523490710)
  ) _12_ (
    .I0(b[2]),
    .I1(b[4]),
    .I2(b[5]),
    .I3(b[6]),
    .I4(b[1]),
    .O(y[4])
  );
LUT2  #(
    .INIT(4'h6)
  ) _13_ (
    .I0(b[2]),
    .I1(b[6]),
    .O(y[6])
  );
LUT3  #(
    .INIT(8'h96)
  ) _14_ (
    .I0(b[5]),
    .I1(b[6]),
    .I2(b[1]),
    .O(y[5])
  );
LUT4  #(
    .INIT(16'h6996)
  ) _15_ (
    .I0(b[5]),
    .I1(b[6]),
    .I2(b[7]),
    .I3(b[1]),
    .O(y[7])
  );
AES_Comp_GFinvComp  AES_Comp_GFinvComp (
    .x(a),
    .y(b)
  );
endmodule