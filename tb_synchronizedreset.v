`timescale 1ns/1ns
module tb_synchronizedreset();
reg sys_reset;
reg key1;
reg sys_clk;

wire led_out;

initial sys_reset=1'b0;
initial key1=1'b0;
initial sys_clk=1'b1;

always #10 key1<={$random}%2;
always #10 sys_reset<={$random}%2;
always #10 sys_clk<=!sys_clk;

synchronizedreset synchronizedreset_inst
(
.sys_rst(sys_reset),
.key1(key1),
.sys_clk(sys_clk),

.led_out(led_out)
);
endmodule