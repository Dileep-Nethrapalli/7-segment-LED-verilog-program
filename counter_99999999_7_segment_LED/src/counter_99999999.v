`timescale 1ns / 1ns

//////////////////////////////////////////////////////////////////////////////////
// Company:  RUAS
// Engineer: Dileep Nethrapalli
// 
// Create Date: 04/17/2018 11:25:36 AM
// Design Name: 
// Module Name: counter_99999999
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

module counter_99999999(
        output reg [26:0] Count,
 	    input  [26:0] Data,
 	    input  Enable, Up_down, Load, Clear_n, Clock_1Hz);	   

      always@(posedge Clock_1Hz, negedge Clear_n)
 	     if(!Clear_n) 
            Count <= {(27){1'b0}};
         else if(Load)   
            Count <= Data;
         else if(Enable) 
            if((!Up_down) && (Count == 0))   
                Count <= 99999999;
            else if(Up_down && (Count == 99999999))
                Count <= {(27){1'b0}};
            else if(Up_down) 
                Count <= Count + 1'b1;
            else 
                Count <= Count - 1'b1;
 			
endmodule
