module uart(sys_clk,  sys_rst_l, uart_clk, uart_XMIT_dataH, xmitH, xmit_dataH, xmit_doneH, uart_REC_dataH, rec_dataH, rec_readyH);
wire  _00_;
wire  _01_;
wire  [7:0] _02_;
wire  _03_;
wire  _04_;
wire  _05_;
wire  _06_;
wire  _07_;
wire  _08_;
wire  _09_;
wire  [7:0] _10_;
wire  _11_;
output  [7:0] rec_dataH;
wire  [7:0] rec_dataH;
output  rec_readyH;
wire  rec_readyH;
input  sys_clk;
wire  sys_clk;
input  sys_rst_l;
wire  sys_rst_l;
input  uart_REC_dataH;
wire  uart_REC_dataH;
output  uart_XMIT_dataH;
wire  uart_XMIT_dataH;
output  uart_clk;
wire  uart_clk;
input  xmitH;
wire  xmitH;
input  [7:0] xmit_dataH;
wire  [7:0] xmit_dataH;
output  xmit_doneH;
wire  xmit_doneH;
BUFG  _12_ (
    .I(_00_),
    .O(_04_)
  );
BUFG  _13_ (
    .I(_01_),
    .O(_08_)
  );
OBUF  _14_ (
    .I(_02_[0]),
    .O(rec_dataH[0])
  );
OBUF  _15_ (
    .I(_02_[1]),
    .O(rec_dataH[1])
  );
OBUF  _16_ (
    .I(_02_[2]),
    .O(rec_dataH[2])
  );
OBUF  _17_ (
    .I(_02_[3]),
    .O(rec_dataH[3])
  );
OBUF  _18_ (
    .I(_02_[4]),
    .O(rec_dataH[4])
  );
OBUF  _19_ (
    .I(_02_[5]),
    .O(rec_dataH[5])
  );
OBUF  _20_ (
    .I(_02_[6]),
    .O(rec_dataH[6])
  );
OBUF  _21_ (
    .I(_02_[7]),
    .O(rec_dataH[7])
  );
OBUF  _22_ (
    .I(_03_),
    .O(rec_readyH)
  );
IBUF  _23_ (
    .I(sys_clk),
    .O(_00_)
  );
IBUF  _24_ (
    .I(sys_rst_l),
    .O(_05_)
  );
IBUF  _25_ (
    .I(uart_REC_dataH),
    .O(_06_)
  );
OBUF  _26_ (
    .I(_07_),
    .O(uart_XMIT_dataH)
  );
OBUF  _27_ (
    .I(_08_),
    .O(uart_clk)
  );
IBUF  _28_ (
    .I(xmitH),
    .O(_09_)
  );
IBUF  _29_ (
    .I(xmit_dataH[0]),
    .O(_10_[0])
  );
IBUF  _30_ (
    .I(xmit_dataH[1]),
    .O(_10_[1])
  );
IBUF  _31_ (
    .I(xmit_dataH[2]),
    .O(_10_[2])
  );
IBUF  _32_ (
    .I(xmit_dataH[3]),
    .O(_10_[3])
  );
IBUF  _33_ (
    .I(xmit_dataH[4]),
    .O(_10_[4])
  );
IBUF  _34_ (
    .I(xmit_dataH[5]),
    .O(_10_[5])
  );
IBUF  _35_ (
    .I(xmit_dataH[6]),
    .O(_10_[6])
  );
IBUF  _36_ (
    .I(xmit_dataH[7]),
    .O(_10_[7])
  );
OBUF  _37_ (
    .I(_11_),
    .O(xmit_doneH)
  );
baud  iBAUD (
    .baud_clk(_01_),
    .sys_clk(_04_),
    .sys_rst_l(_05_)
  );
u_rec  iRECEIVER (
    .rec_dataH(_02_),
    .rec_readyH(_03_),
    .sys_clk(_08_),
    .sys_rst_l(_05_),
    .uart_dataH(_06_)
  );
u_xmit  iXMIT (
    .sys_clk(_08_),
    .sys_rst_l(_05_),
    .uart_xmitH(_07_),
    .xmitH(_09_),
    .xmit_dataH(_10_),
    .xmit_doneH(_11_)
  );
endmodule
