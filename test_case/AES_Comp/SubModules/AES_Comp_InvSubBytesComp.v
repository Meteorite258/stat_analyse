module AES_Comp_InvSubBytesComp(x,  y);
input  [31:0] x;
wire  [31:0] x;
output  [31:0] y;
wire  [31:0] y;
AES_Comp_InvSboxComp  Sbox0 (
    .x(x[7:0]),
    .y(y[7:0])
  );
AES_Comp_InvSboxComp  Sbox1 (
    .x(x[15:8]),
    .y(y[15:8])
  );
AES_Comp_InvSboxComp  Sbox2 (
    .x(x[23:16]),
    .y(y[23:16])
  );
AES_Comp_InvSboxComp  Sbox3 (
    .x(x[31:24]),
    .y(y[31:24])
  );
endmodule
