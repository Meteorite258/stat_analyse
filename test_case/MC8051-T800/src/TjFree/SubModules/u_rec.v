module u_rec(sys_rst_l,  sys_clk, uart_dataH, rec_dataH, rec_readyH);
wire  [3:0] _000_;
wire  [3:0] _001_;
wire  _002_;
wire  _003_;
wire  _004_;
wire  _005_;
wire  _006_;
wire  _007_;
wire  _008_;
wire  _009_;
wire  _010_;
wire  _011_;
wire  _012_;
wire  _013_;
wire  _014_;
wire  _015_;
wire  _016_;
wire  _017_;
wire  _018_;
wire  _019_;
wire  _020_;
wire  _021_;
wire  _022_;
wire  _023_;
wire  _024_;
wire  [3:0] _025_;
wire  [3:0] _026_;
wire  [3:0] _027_;
wire  [3:0] _028_;
wire  [3:0] _029_;
wire  [3:0] _030_;
wire  [5:0] _031_;
wire  [2:0] _032_;
wire  [5:0] _033_;
wire  [1:0] _034_;
wire  [3:0] bitCell_cntrH;
wire  [2:0] next_state;
wire  [7:0] par_dataH;
wire  rec_datH;
wire  rec_datSyncH;
output  [7:0] rec_dataH;
wire  [7:0] rec_dataH;
output  rec_readyH;
wire  rec_readyH;
wire  rec_readyInH;
wire  [3:0] recd_bitCntrH;
wire  [2:0] state;
input  sys_clk;
wire  sys_clk;
input  sys_rst_l;
wire  sys_rst_l;
input  uart_dataH;
wire  uart_dataH;
LUT3  #(
    .INIT(8'hc5)
  ) _035_ (
    .I0(state[0]),
    .I1(state[2]),
    .I2(state[1]),
    .O(_034_[0])
  );
LUT4  #(
    .INIT(16'hf03b)
  ) _036_ (
    .I0(rec_datH),
    .I1(state[0]),
    .I2(state[2]),
    .I3(state[1]),
    .O(_002_)
  );
LUT2  #(
    .INIT(4'h8)
  ) _037_ (
    .I0(_034_[0]),
    .I1(_027_[0]),
    .O(_001_[0])
  );
LUT2  #(
    .INIT(4'h8)
  ) _038_ (
    .I0(_034_[0]),
    .I1(_027_[1]),
    .O(_001_[1])
  );
LUT2  #(
    .INIT(4'h8)
  ) _039_ (
    .I0(_034_[0]),
    .I1(_027_[2]),
    .O(_001_[2])
  );
LUT2  #(
    .INIT(4'h8)
  ) _040_ (
    .I0(_034_[0]),
    .I1(_027_[3]),
    .O(_001_[3])
  );
LUT6  #(
    .INIT(64'h3030503300000000)
  ) _041_ (
    .I0(_031_[1]),
    .I1(_031_[0]),
    .I2(state[1]),
    .I3(state[0]),
    .I4(state[2]),
    .I5(_030_[0]),
    .O(_000_[0])
  );
LUT4  #(
    .INIT(16'h4000)
  ) _042_ (
    .I0(bitCell_cntrH[0]),
    .I1(bitCell_cntrH[3]),
    .I2(bitCell_cntrH[1]),
    .I3(bitCell_cntrH[2]),
    .O(_031_[1])
  );
LUT4  #(
    .INIT(16'h0100)
  ) _043_ (
    .I0(bitCell_cntrH[3]),
    .I1(bitCell_cntrH[0]),
    .I2(bitCell_cntrH[1]),
    .I3(bitCell_cntrH[2]),
    .O(_031_[0])
  );
LUT6  #(
    .INIT(64'h3030503300000000)
  ) _044_ (
    .I0(_031_[1]),
    .I1(_031_[0]),
    .I2(state[1]),
    .I3(state[0]),
    .I4(state[2]),
    .I5(_030_[1]),
    .O(_000_[1])
  );
LUT6  #(
    .INIT(64'h3030503300000000)
  ) _045_ (
    .I0(_031_[1]),
    .I1(_031_[0]),
    .I2(state[1]),
    .I3(state[0]),
    .I4(state[2]),
    .I5(_030_[2]),
    .O(_000_[2])
  );
LUT6  #(
    .INIT(64'h3030503300000000)
  ) _046_ (
    .I0(_031_[1]),
    .I1(_031_[0]),
    .I2(state[1]),
    .I3(state[0]),
    .I4(state[2]),
    .I5(_030_[3]),
    .O(_000_[3])
  );
LUT6  #(
    .INIT(64'hffffffffffffffb0)
  ) _047_ (
    .I0(_033_[0]),
    .I1(_031_[1]),
    .I2(_032_[2]),
    .I3(_033_[3]),
    .I4(state[2]),
    .I5(rec_readyInH),
    .O(next_state[0])
  );
LUT2  #(
    .INIT(4'h8)
  ) _048_ (
    .I0(state[1]),
    .I1(state[0]),
    .O(_032_[2])
  );
LUT4  #(
    .INIT(16'h0100)
  ) _049_ (
    .I0(recd_bitCntrH[0]),
    .I1(recd_bitCntrH[1]),
    .I2(recd_bitCntrH[2]),
    .I3(recd_bitCntrH[3]),
    .O(_033_[0])
  );
LUT5  #(
    .INIT(32'd16777216)
  ) _050_ (
    .I0(bitCell_cntrH[3]),
    .I1(bitCell_cntrH[0]),
    .I2(bitCell_cntrH[1]),
    .I3(state[1]),
    .I4(bitCell_cntrH[2]),
    .O(_033_[3])
  );
LUT6  #(
    .INIT(64'h0000ffff303f50ff)
  ) _051_ (
    .I0(_031_[0]),
    .I1(_031_[1]),
    .I2(state[1]),
    .I3(rec_datH),
    .I4(state[0]),
    .I5(state[2]),
    .O(next_state[1])
  );
LUT3  #(
    .INIT(8'h40)
  ) _052_ (
    .I0(state[2]),
    .I1(_031_[1]),
    .I2(_032_[2]),
    .O(next_state[2])
  );
LUT4  #(
    .INIT(16'hca0c)
  ) _053_ (
    .I0(state[0]),
    .I1(rec_datH),
    .I2(state[1]),
    .I3(state[2]),
    .O(rec_readyInH)
  );
INV  _054_ (
    .I(sys_rst_l),
    .O(_003_)
  );
INV  _055_ (
    .I(recd_bitCntrH[0]),
    .O(_026_[0])
  );
INV  _056_ (
    .I(bitCell_cntrH[0]),
    .O(_029_[0])
  );
INV  _057_ (
    .I(sys_rst_l),
    .O(_004_)
  );
INV  _058_ (
    .I(sys_rst_l),
    .O(_005_)
  );
INV  _059_ (
    .I(sys_rst_l),
    .O(_006_)
  );
INV  _060_ (
    .I(sys_rst_l),
    .O(_007_)
  );
INV  _061_ (
    .I(sys_rst_l),
    .O(_008_)
  );
INV  _062_ (
    .I(sys_rst_l),
    .O(_009_)
  );
INV  _063_ (
    .I(sys_rst_l),
    .O(_010_)
  );
INV  _064_ (
    .I(sys_rst_l),
    .O(_011_)
  );
INV  _065_ (
    .I(sys_rst_l),
    .O(_012_)
  );
INV  _066_ (
    .I(sys_rst_l),
    .O(_013_)
  );
INV  _067_ (
    .I(sys_rst_l),
    .O(_014_)
  );
INV  _068_ (
    .I(sys_rst_l),
    .O(_015_)
  );
INV  _069_ (
    .I(sys_rst_l),
    .O(_016_)
  );
INV  _070_ (
    .I(sys_rst_l),
    .O(_017_)
  );
INV  _071_ (
    .I(sys_rst_l),
    .O(_018_)
  );
INV  _072_ (
    .I(sys_rst_l),
    .O(_019_)
  );
INV  _073_ (
    .I(sys_rst_l),
    .O(_020_)
  );
INV  _074_ (
    .I(sys_rst_l),
    .O(_021_)
  );
INV  _075_ (
    .I(sys_rst_l),
    .O(_022_)
  );
INV  _076_ (
    .I(sys_rst_l),
    .O(_023_)
  );
INV  _077_ (
    .I(sys_rst_l),
    .O(_024_)
  );
CARRY4  _078_ (
    .CI(1'h0),
    .CO(_025_),
    .CYINIT(1'h0),
    .DI(4'h1),
    .O(_027_),
    .S({ recd_bitCntrH[3:1], _026_[0] })
  );
CARRY4  _079_ (
    .CI(1'h0),
    .CO(_028_),
    .CYINIT(1'h0),
    .DI(4'h1),
    .O(_030_),
    .S({ bitCell_cntrH[3:1], _029_[0] })
  );
FDCE  #(
    .INIT(1'hx)
  ) _080_ (
    .C(sys_clk),
    .CE(1'h1),
    .CLR(_003_),
    .D(rec_readyInH),
    .Q(rec_readyH)
  );
FDPE  #(
    .INIT(1'hx)
  ) _081_ (
    .C(sys_clk),
    .CE(1'h1),
    .D(next_state[0]),
    .PRE(_004_),
    .Q(state[0])
  );
FDCE  #(
    .INIT(1'hx)
  ) _082_ (
    .C(sys_clk),
    .CE(1'h1),
    .CLR(_005_),
    .D(next_state[1]),
    .Q(state[1])
  );
FDCE  #(
    .INIT(1'hx)
  ) _083_ (
    .C(sys_clk),
    .CE(1'h1),
    .CLR(_006_),
    .D(next_state[2]),
    .Q(state[2])
  );
FDCE  #(
    .INIT(1'hx)
  ) _084_ (
    .C(sys_clk),
    .CE(_002_),
    .CLR(_007_),
    .D(_001_[0]),
    .Q(recd_bitCntrH[0])
  );
FDCE  #(
    .INIT(1'hx)
  ) _085_ (
    .C(sys_clk),
    .CE(_002_),
    .CLR(_008_),
    .D(_001_[1]),
    .Q(recd_bitCntrH[1])
  );
FDCE  #(
    .INIT(1'hx)
  ) _086_ (
    .C(sys_clk),
    .CE(_002_),
    .CLR(_009_),
    .D(_001_[2]),
    .Q(recd_bitCntrH[2])
  );
FDCE  #(
    .INIT(1'hx)
  ) _087_ (
    .C(sys_clk),
    .CE(_002_),
    .CLR(_010_),
    .D(_001_[3]),
    .Q(recd_bitCntrH[3])
  );
FDCE  #(
    .INIT(1'hx)
  ) _088_ (
    .C(sys_clk),
    .CE(1'h1),
    .CLR(_011_),
    .D(_000_[0]),
    .Q(bitCell_cntrH[0])
  );
FDCE  #(
    .INIT(1'hx)
  ) _089_ (
    .C(sys_clk),
    .CE(1'h1),
    .CLR(_012_),
    .D(_000_[1]),
    .Q(bitCell_cntrH[1])
  );
FDCE  #(
    .INIT(1'hx)
  ) _090_ (
    .C(sys_clk),
    .CE(1'h1),
    .CLR(_013_),
    .D(_000_[2]),
    .Q(bitCell_cntrH[2])
  );
FDCE  #(
    .INIT(1'hx)
  ) _091_ (
    .C(sys_clk),
    .CE(1'h1),
    .CLR(_014_),
    .D(_000_[3]),
    .Q(bitCell_cntrH[3])
  );
FDPE  #(
    .INIT(1'hx)
  ) _092_ (
    .C(sys_clk),
    .CE(1'h1),
    .D(rec_datSyncH),
    .PRE(_015_),
    .Q(rec_datH)
  );
FDPE  #(
    .INIT(1'hx)
  ) _093_ (
    .C(sys_clk),
    .CE(1'h1),
    .D(uart_dataH),
    .PRE(_016_),
    .Q(rec_datSyncH)
  );
FDCE  #(
    .INIT(1'hx)
  ) _094_ (
    .C(sys_clk),
    .CE(_034_[0]),
    .CLR(_017_),
    .D(par_dataH[1]),
    .Q(par_dataH[0])
  );
FDCE  #(
    .INIT(1'hx)
  ) _095_ (
    .C(sys_clk),
    .CE(_034_[0]),
    .CLR(_018_),
    .D(par_dataH[2]),
    .Q(par_dataH[1])
  );
FDCE  #(
    .INIT(1'hx)
  ) _096_ (
    .C(sys_clk),
    .CE(_034_[0]),
    .CLR(_019_),
    .D(par_dataH[3]),
    .Q(par_dataH[2])
  );
FDCE  #(
    .INIT(1'hx)
  ) _097_ (
    .C(sys_clk),
    .CE(_034_[0]),
    .CLR(_020_),
    .D(par_dataH[4]),
    .Q(par_dataH[3])
  );
FDCE  #(
    .INIT(1'hx)
  ) _098_ (
    .C(sys_clk),
    .CE(_034_[0]),
    .CLR(_021_),
    .D(par_dataH[5]),
    .Q(par_dataH[4])
  );
FDCE  #(
    .INIT(1'hx)
  ) _099_ (
    .C(sys_clk),
    .CE(_034_[0]),
    .CLR(_022_),
    .D(par_dataH[6]),
    .Q(par_dataH[5])
  );
FDCE  #(
    .INIT(1'hx)
  ) _100_ (
    .C(sys_clk),
    .CE(_034_[0]),
    .CLR(_023_),
    .D(par_dataH[7]),
    .Q(par_dataH[6])
  );
FDCE  #(
    .INIT(1'hx)
  ) _101_ (
    .C(sys_clk),
    .CE(_034_[0]),
    .CLR(_024_),
    .D(rec_datH),
    .Q(par_dataH[7])
  );
assign  _031_[5:2] = { state[2], state[0], rec_datH, state[1] };
assign  _034_[1] = _027_[3];
assign  { _033_[5:4], _033_[2:1] } = { rec_readyInH, state[2], _032_[2], _031_[1] };
assign  _032_[1:0] = { _031_[1], state[2] };
assign  _026_[3:1] = recd_bitCntrH[3:1];
assign  _029_[3:1] = bitCell_cntrH[3:1];
assign  rec_dataH = par_dataH;
endmodule
