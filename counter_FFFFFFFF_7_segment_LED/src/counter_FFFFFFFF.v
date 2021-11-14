`timescale 1ns/1ns

//////////////////////////////////////////////////////////////////////////////////
// Company:  RUAS
// Engineer: Dileep Nethrapalli
// 
// Create Date: 26.09.2021 15:00:05
// Design Name: 
// Module Name: counter_FFFFFFFF
// Project Name: 
// Target Devices: Device Independent 
// Tool Versions: 
// Description: 
// 
// Dependencies: None
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module counter_FFFFFFFF(
         output reg [31:0] Count, 
 	     input  [31:0] Data, 
 	     input  Enable, Up_down, Load, Clear_n, Clock_1Hz);
 		
 	  always@(posedge Clock_1Hz, negedge Clear_n)
          if (!Clear_n)
        	     Count <= {(32){1'b0}};
          else if(Load) 
   		     Count <= Data;
   	     else if(Enable) 	
   		  if(Up_down) 
   		     Count <= Count + 1'b1;   
   		  else  
                Count <= Count - 1'b1;
   	
             		
endmodule
