module T(clk,  in, out);
input  clk;
input  [7:0] in;
output  [31:0] out;
LUT2  #(
    .INIT(4'h6)
  ) _0_ (
    .I0(out[24]),
    .I1(out[0]),
    .O(out[8])
  );
LUT2  #(
    .INIT(4'h6)
  ) _1_ (
    .I0(out[25]),
    .I1(out[1]),
    .O(out[9])
  );
LUT2  #(
    .INIT(4'h6)
  ) _2_ (
    .I0(out[26]),
    .I1(out[2]),
    .O(out[10])
  );
LUT2  #(
    .INIT(4'h6)
  ) _3_ (
    .I0(out[27]),
    .I1(out[3]),
    .O(out[11])
  );
LUT2  #(
    .INIT(4'h6)
  ) _4_ (
    .I0(out[28]),
    .I1(out[4]),
    .O(out[12])
  );
LUT2  #(
    .INIT(4'h6)
  ) _5_ (
    .I0(out[29]),
    .I1(out[5]),
    .O(out[13])
  );
LUT2  #(
    .INIT(4'h6)
  ) _6_ (
    .I0(out[30]),
    .I1(out[6]),
    .O(out[14])
  );
LUT2  #(
    .INIT(4'h6)
  ) _7_ (
    .I0(out[31]),
    .I1(out[7]),
    .O(out[15])
  );
S  s0 (
    .clk(clk),
    .in(in),
    .out(out[31:24])
  );
xS  s4 (
    .clk(clk),
    .in(in),
    .out(out[7:0])
  );
assign  out[23:16] = out[31:24];
endmodule
