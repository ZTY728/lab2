module runninglight
#(parameter cnt_max=25'd24_999_999)
(
input wire sys_rst_n,
input wire sys_clk,

output wire [3:0]led_out
);
reg[24:0] cnt;
reg cnt_flag;
reg[3:0] led_out_reg;

always@(posedge sys_clk or negedge sys_rst_n)
if(!sys_rst_n)
cnt<=25'd0;
else if(cnt==cnt_max)
cnt<=25'd0;
else
cnt<=cnt+25'd1;

always@(posedge sys_clk or negedge sys_rst_n)
if(!sys_rst_n)
cnt_flag<=1'b0;
else if(cnt==(cnt_max-25'd1))
cnt_flag<=1'b1;
else 
cnt_flag<=1'b0;

always@(posedge sys_clk or negedge sys_rst_n)
if(!sys_rst_n)
led_out_reg<=4'b0001;
else if((led_out_reg==4'b1000)&&(cnt_flag==1'b1))
led_out_reg<=4'b0001;
else if(cnt_flag==1'b1)
led_out_reg<=led_out_reg<<1;
else
led_out_reg<=led_out_reg;

assign led_out=~led_out_reg;

endmodule