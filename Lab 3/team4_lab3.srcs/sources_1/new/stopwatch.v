module stopwatch(
    an,
    seg,
    clk
    );
    
    output reg [3:0] an;
    output reg [6:0] seg;
    input clk;
    reg [3:0] LED_BCD;
     
    wire [20:0] clk_dv_inc;
    
       //reg [1:0]   arst_ff;
       reg [19:0]  clk_dv;
       reg         clk_en;
       reg         clk_en_d;
     
    // Cathode patterns of the 7-segment LED display 
    always @* begin
        case(LED_BCD)
            4'b0000: seg = 7'b0000001; // "0"  
            4'b0001: seg = 7'b1001111; // "1" 
            4'b0010: seg = 7'b0010010; // "2" 
            4'b0011: seg = 7'b0000110; // "3" 
            4'b0100: seg = 7'b1001100; // "4" 
            4'b0101: seg = 7'b0100100; // "5" 
            4'b0110: seg = 7'b0100000; // "6" 
            4'b0111: seg = 7'b0001111; // "7" 
            4'b1000: seg = 7'b0000000; // "8"  
            4'b1001: seg = 7'b0000100; // "9" 
            default: seg = 7'b0000001; // "0"
        endcase
        end
    
         
    assign clk_dv_inc = clk_dv + 1;
       
   always @ (posedge clk)
      begin
      clk_dv   <= clk_dv_inc[19:0];
      clk_en   <= clk_dv[19];
      clk_en_d <= clk_en;
      end
     
    always @* begin
        //        an[0] = 4'b1010;
        //        an[1] = 7'b1010111;
        //        an[2] = 7'b1010000;

        if (clk_en) begin
            an = 4'b0111;
            LED_BCD = 0;
//            an = 4'b1011;
//            LED_BCD = 0;
            
        end
        else begin
//            an = 4'b1011;
//            LED_BCD = 1;
            an = 4'b0111;
            LED_BCD = 8;
        end
    end
endmodule