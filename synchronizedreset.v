module synchronizedreset
(
input wire sys_rst,
input wire key1,
input wire sys_clk,

output reg led_out
);

always@(negedge sys_clk)
if(!sys_rst)
led_out <=1'b1;
else
led_out<=key1;

endmodule