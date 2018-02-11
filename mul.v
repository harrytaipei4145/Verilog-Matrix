module mul(a,b,out);
input signed[35:0] a;
input signed[35:0] b;
output signed[143:0] out;
wire signed[143:0] out;

assign out[15:0]=$signed(a[11:8])*$signed(b[27:24])+$signed(a[7:4])*$signed(b[15:12])+$signed(a[3:0])*$signed(b[3:0]);
assign out[31:16]=$signed(a[11:8])*$signed(b[31:28])+$signed(a[7:4])*$signed(b[19:16])+$signed(a[3:0])*$signed(b[7:4]);
assign out[47:32]=$signed(a[11:8])*$signed(b[35:32])+$signed(a[7:4])*$signed(b[23:20])+$signed(a[3:0])*$signed(b[11:8]);
assign out[63:48]=$signed(a[23:20])*$signed(b[27:24])+$signed(a[19:16])*$signed(b[15:12])+$signed(a[15:12])*$signed(b[3:0]);
assign out[79:64]=$signed(a[23:20])*$signed(b[31:28])+$signed(a[19:16])*$signed(b[19:16])+$signed(a[15:12])*$signed(b[7:4]);
assign out[95:80]=$signed(a[23:20])*$signed(b[35:32])+$signed(a[19:16])*$signed(b[23:20])+$signed(a[15:12])*$signed(b[11:8]);
assign out[111:96]=$signed(a[35:32])*$signed(b[27:24])+$signed(a[31:28])*$signed(b[15:12])+$signed(a[27:24])*$signed(b[3:0]);
assign out[127:112]=$signed(a[35:32])*$signed(b[31:28])+$signed(a[31:28])*$signed(b[19:16])+$signed(a[27:24])*$signed(b[7:4]);
assign out[143:128]=$signed(a[35:32])*$signed(b[35:32])+$signed(a[31:28])*$signed(b[23:20])+$signed(a[27:24])*$signed(b[11:8]);




endmodule