module deter(a,out);
input signed[35:0] a;
output signed[15:0]out;
wire signed[15:0]out;


assign out=($signed(a[35:32])*$signed(a[19:16])*$signed(a[3:0]))+($signed(a[31:28])*$signed(a[15:12])*$signed(a[7:4]))+($signed(a[23:20])*$signed(a[7:4])*$signed(a[31:28]))-($signed(a[27:24])*$signed(a[19:16])*$signed(a[11:8]))-($signed(a[31:28])*$signed(a[23:23])*$signed(a[7:4]))-($signed(a[15:12])*$signed(a[7:4])*$signed(a[23:20]));



endmodule