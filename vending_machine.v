`timescale 1ns/1ps

module vending_machine ( //buying chocolate worth 15 rupees
    input [1:0] coin, //01 for 5 rupee and 10 for 10 rupee
    input clk, rst,
    output reg [1:0] change,
    output reg done
);
reg [1:0] pr_state, nxt_state;
parameter s0 = 2'b00, s1 = 2'b01, s2 = 2'b10;
parameter coin_0 = 2'b00, coin_5 = 2'b01, coin_10 = 2'b10;
//sequential logic
always@(posedge clk, posedge rst)
begin
    if(rst) pr_state <= s0;
    else pr_state <= nxt_state;
end

//next state logic
always@(coin, pr_state)
begin
    case(pr_state)
    s0 : 
    case(coin)
    coin_0 : nxt_state = s0;
    coin_5 : nxt_state = s1;
    coin_10 : nxt_state = s2;
    default : nxt_state = s0;
    endcase

    s1 : 
    case(coin)
    coin_0 : nxt_state = s0;
    coin_5 : nxt_state = s2;
    coin_10 : nxt_state = s0;
    default : nxt_state = s0;
    endcase
    
    s2 : 
    case(coin)
    coin_0 : nxt_state = s0;
    coin_5 : nxt_state = s0;
    coin_10 : nxt_state = s0;
    default : nxt_state = s0;
    endcase

    default: nxt_state = s0;

    endcase
end

//output logic
always@(posedge clk, posedge rst) // here non blocking is used because we first want to update output at the particular rising edge and then update the present state which is non blocking assignment, done only after all blocking assignment are done at a given time 
begin
    if(rst) begin done=0; change=coin_0; end
    else begin
    case(pr_state)
    s0 : 
    case(coin)
    coin_0 : 
        begin
            done = 0;
            change = coin_0;
        end
    coin_5 : 
        begin
            done = 0;
            change = coin_0;
        end
    coin_10 : 
        begin
            done = 0;
            change = coin_0;
        end
    default : 
        begin
            done = 0;
            change = coin_0;
        end
    endcase

    s1 : 
    case(coin)
    coin_0 : 
        begin
            done = 0;
            change = coin_5;
        end
    coin_5 : 
        begin
            done = 0;
            change = coin_0;
        end
    coin_10 : 
        begin
            done = 1;
            change = coin_0;
        end
    default :
        begin
            done = 0;
            change = coin_0;
        end
    endcase

    s2 : 
    case(coin)
    coin_0 : 
        begin
            done = 0;
            change = coin_10;
        end
    coin_5 : 
        begin
            done = 1;
            change = coin_0;
        end
    coin_10 : 
        begin
            done = 1;
            change = coin_5;
        end
    default :
        begin
            done = 0;
            change = coin_0;
        end
    endcase

    default: begin
    done = 0;
    change = coin_0;
    end
    endcase
    end
end
endmodule
