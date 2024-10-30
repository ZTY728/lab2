module counter
#(parameter cnt_max=25'd24_999_999)
(
input wire sys_clk,
input wire sys_rst_n,

output reg led_out
);

reg [24:0] cnt;
always@(posedge sys_clk or negedge sys_rst_n)
if(!sys_rst_n)
cnt<=25'd0;
else if(cnt==cnt_max)
cnt<=25'd0;
else
cnt<=cnt+25'd1;

always@(posedge sys_clk or negedge sys_rst_n)
if(!sys_rst_n)
led_out<=1'b0;
else if(cnt==cnt_max)
led_out<=~led_out;
else
led_out<=led_out;

endmodule