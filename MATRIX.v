`include "counter.v"
`include "add.v"
`include "sub.v"
`include "mul.v"
`include "rotation.v"
`include "deter.v"
module MATRIX(	
	CLK, 
	RESET, 
	IN_VALID, 
	IN, 
	OUT_VALID, 
	OUT
);


input           	  CLK;
input           	  RESET;
input           	  IN_VALID;
input 	signed[3:0]   IN;

output        reg  	  OUT_VALID;
output  signed[15:0]  OUT;


reg    signed[143:0] a_out2;
reg    signed[143:0] s_out2;
reg    signed[143:0] m_out2;
reg    signed[15:0] d_out2;


wire    signed ago;
wire    signed bgo;
wire    signed cgo;
wire    signed dgo;
reg    signed[35:0] a;
wire   signed[35:0] a1;
reg    signed[35:0] b;
wire    signed[35:0] b1;
wire    signed[143:0] a_out;
wire    signed[143:0] s_out;
wire    signed[143:0] m_out;
wire    signed[15:0] d_out;
reg temp;
reg     [19:0] num;
reg    [4:0] count;
reg     [4:0] count1;
reg     [4:0] count2;
reg     [4:0] count3;
reg     signed[15:0]  OUT;






always @(posedge CLK) begin
if(RESET)begin
count=0;
end
if(IN_VALID)begin
if(count>=18 && count<23)begin
    num <={num[15:0],IN};
count=count+1;
end
 if(count>=9 && count<18)begin
    b <={b[31:0],IN};
    count=count+1;
end
 if(count>= 0 && count<9)begin
    a <= {a[31:0], IN};
    count=count+1;
    end
end
if(count2==8)
count=0;
end





rotation rot_a(a,num[19:16],num[15:12],a1,CLK);
rotation rot_b(b,num[11:8],num[7:4],b1,CLK);
mul multi(a1,b1,m_out);
sub sub(a1,b1,s_out);
add add(a1,b1,a_out);
deter det1(a1,d_out);


always @(negedge CLK)begin
if(RESET)begin
count1=0;
OUT_VALID=0;
count2=0;
count3=0;
end
if(count==23)
if(count2<=5)
count2=count2+1;
if(count2>=5 && count2<14)begin
OUT_VALID=1;
count2=count2+1;
end
if(count2==14)begin
OUT_VALID=0;
count2=0;
end
if(OUT_VALID==1)begin

if(count1==0)begin
a_out2=a_out;
s_out2=s_out;
m_out2=m_out;
d_out2=d_out;
count1=count1+1;
end

case(num[3:0])
4'b0000:OUT<=a_out2[143:128];
4'b0001:OUT<=s_out2[143:128];
4'b0010:OUT<=m_out2[143:128];
4'b0011:OUT<=d_out2[15:0];
endcase
a_out2<={a_out2[127:0],16'b0000000000000000};
s_out2<={s_out2[127:0],16'b0000000000000000};
m_out2<={m_out2[127:0],16'b0000000000000000};


end
end




endmodule
