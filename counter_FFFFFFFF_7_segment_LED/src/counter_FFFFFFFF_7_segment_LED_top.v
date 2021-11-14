`timescale 1ns/1ns

//////////////////////////////////////////////////////////////////////////////////
// Company:  RUAS
// Engineer: Dileep Nethrapalli
// 
// Create Date: 26.09.2021 15:00:05
// Design Name: 
// Module Name: counter_FFFFFFFF_7_segment_LED_top
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

module counter_FFFFFFFF_7_segment_LED_top(    
      output AN7, AN6, AN5, AN4, AN3, AN2, AN1, AN0,
      output CA, CB, CC, CD, CE, CF, CG, DP,         
 	 input  Enable, Up_down, Load, Clear_n, Clock_100MHz);
 		
	 wire [31:0] count, data;
 	 wire clock_1Hz; 	
 	   		
 clock_divider_100MHz_to_1Hz clk_div_100MHz_to_1Hz_DUT(
      .Clock_1Hz(clock_1Hz), .Enable(Enable), 
      .Clock_100MHz(Clock_100MHz), .Clear_n(Clear_n));
 	 
 counter_FFFFFFFF counter_DUT(
        .Count(count), .Data(data), .Enable(Enable), 
        .Up_down(Up_down), .Load(Load), .Clear_n(Clear_n), 
        .Clock_1Hz(clock_1Hz));
	
 BCH_to_7_segment_LED_Decoder bch_to_7_seg_LED_DUT(
    .DP(DP),
    .Cathodes({CA,CB,CC,CD,CE,CF,CG}), 
    .Anodes({AN7,AN6,AN5,AN4,AN3,AN2,AN1,AN0}),                  
    .Clock_100MHz(Clock_100MHz), .Enable(Enable),
    .Clear_n(Clear_n), .In(count));
    
 vio_counter_FFFFFFF vio_ip(
    .clk(Clock_100MHz),  // input wire clk
    .probe_out0(data));  // output wire [31 : 0] probe_out0
                            

endmodule     