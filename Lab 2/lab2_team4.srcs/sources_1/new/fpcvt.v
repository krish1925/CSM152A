`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UCLA M152A
// Engineer1: Justin
// Engineer2: Krish
// 
// Create Date: 01/31/2024 12:19:28 PM
// Design Name: 
// Module Name: convert
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fpcvt(
    input wire [11:0] D,
    output wire [2:0] E,
    output wire [3:0] F,
    output wire S
);
    assign D = 12'b100110110111;

    reg [11:0] abs;
    reg [11:0] temp;
    reg [3:0] tempF;
    
    integer i = 0;
    integer j = 0;

    assign S = D[11];
    
    always @*
    begin
        //Get sign bit
        if (S == 1)
        begin
            assign abs = (D ^ 12'b111111111111) + 1;
        end
        else
        begin
            assign abs = D;
        end
        
        //Get exponent
        assign temp = abs;
        while(temp[11] != 1 && i < 8)
        begin
            i = i + 1;
            assign temp = temp << 1;
        end
        
        //Get significand
        assign tempF = temp[11:8];
        if (temp[7] == 1)
        begin
            if (tempF == 4'b1111)
            begin    
                i = i - 1;
                assign tempF = tempF >> 1;
            end
            assign tempF = tempF + 1;
        end
        if(i==0)
        begin
            i= i+1;
            assign tempF = 4'b1111;
        end
        
    end
    
    assign E = 8 - i;
    assign F = tempF;
   
endmodule
