`timescale 1ns/1ps

module tb_vending_machine;
reg [1:0] coin;
reg clk, rst;
wire [1:0] change;
wire done;

vending_machine uut(
    .coin(coin), .clk(clk), .rst(rst), .change(change), .done(done));

initial begin 
    clk = 1'b0;
    rst = 1'b1;
    #15 rst = 1'b0;
end

always #5 clk = ~clk;

initial begin
$monitor("Time=%t | state=%b | coin=%b | done=%b | change=%b",
         $time, uut.pr_state, coin, done, change);
    #12 coin = 2'b01;
    #10 coin = 2'b01;
    #10 coin = 2'b10; //should return 5 rupees now
    #10 $finish;
end
endmodule
