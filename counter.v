module counter(count,input_valid,clk,max);
output [4:0] count;
input clk,input_valid;
input [4:0]max;
reg [4:0] count;

always @(posedge clk)
begin
if(input_valid)
count=0;
else if(count==max)
count=0;
else
count=count+1;
end
endmodule