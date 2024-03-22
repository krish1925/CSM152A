module model_uart(
   // Outputs
   TX,
   // Inputs
   RX
);

   output TX;
   input  RX;

   parameter baud    = 115200;
   parameter bittime = 1000000000/baud;
   parameter name    = "UART0";

   reg [7:0] rxData;
   event     evBit;
   event     evByte;
   event     evTxBit;
   event     evTxByte;
   reg       TX;
   reg       lastRX; // To keep track of the previous RX value

   initial
     begin
        TX = 1'b1;
        lastRX = 1'b1; // Initialize lastRX to 1 to avoid triggering on startup
     end

   always @ (negedge RX)
     begin
        rxData[7:0] = 8'h0;
        #(0.5*bittime);
        repeat (8)
          begin
             #bittime ->evBit;
             rxData[7:0] = {RX, rxData[7:1]};
          end
        ->evByte;

        // Check if a carriage-return character is received
        if (rxData == 8'h0D && lastRX != 8'h0D) begin
          // Print the received line with a line feed character
          $display ("%d %s Received line: %s", $stime, name, rxData);
        end

        lastRX = rxData; // Update lastRX with the current received byte
     end

   task tskRxData;
      output [7:0] data;
      begin
         @(evByte);
         data = rxData;
      end
   endtask

   task tskTxData;
      input [7:0] data;
      reg [9:0]   tmp;
      integer     i;
      begin
         tmp = {1'b1, data[7:0], 1'b0};
         for (i=0;i<10;i=i+1)
           begin
              TX = tmp[i];
              #bittime;
              ->evTxBit;
           end
         ->evTxByte;
      end
   endtask

endmodule
