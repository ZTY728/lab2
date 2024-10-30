module asynchronizedreset
(
input wire sys_rst,
input wire key1,
input wire sys_clk,

output reg led_out
);

always@(posedge sys_clk or negedge sys_rst)
if(!sys_rst)
led_out <=1'b1;
else
led_out <=key1;

endmodule