`timescale 1ns/1ns

//////////////////////////////////////////////////////////////////////////////////
// Company:  RUAS
// Engineer: Dileep Nethrapalli
// 
// Create Date: 26.09.2021 15:00:05
// Design Name: 
// Module Name: counter_99999999_7_segment_LED_top
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

module counter_99999999_7_segment_LED_top(             
         output AN7,AN6,AN5,AN4,AN3,AN2,AN1,AN0,
         output CA,CB,CC,CD,CE,CF,CG,DP,        
 	    input  Enable, Up_down, Load, Clear_n, Clock_100MHz); 		 
 	    wire clock_1hz;  
         wire [26:0] count, data; 
 		
   clock_divider_100MHz_to_1Hz clock_1hz_DUT(
        .Clock_1Hz(clock_1hz), .Enable(Enable),
        .Clock_100MHz(Clock_100MHz), .Clear_n(Clear_n));
                                              

   counter_99999999 counter_DUT(
          .Count(count), .Data(data), .Enable(Enable), 
          .Up_down(Up_down), .Load(Load), .Clear_n(Clear_n), 
          .Clock_1Hz(clock_1hz));	
                                  

   BCD_to_7_segment_LED_Decoder bcd_to_7_seg_LED_DUT (
      .DP(DP),
      .Cathodes({CA,CB,CC,CD,CE,CF,CG}), 
      .Anodes({AN7,AN6,AN5,AN4,AN3,AN2,AN1,AN0}),                                                       
      .Clock_100MHz(Clock_100MHz), .Clear_n(Clear_n),
      .Enable(Enable), .In(count));
                                                      
                                                      
   vio_counter_99999999 vio_ip(
      .clk(Clock_100MHz), // input wire clk
      .probe_out0(data));  // output wire [26 : 0] probe_out0                                 

 endmodule     
