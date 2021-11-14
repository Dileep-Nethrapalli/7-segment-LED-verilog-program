`timescale 1ns/1ns

//////////////////////////////////////////////////////////////////////////////////
// Company:  RUAS
// Engineer: Dileep Nethrapalli
// 
// Create Date: 26.09.2021 15:00:05
// Design Name: 
// Module Name: module counter_99999999_7_seg_LED_tb
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

module counter_99999999_7_seg_LED_tb();

  wire AN7, AN6, AN5, AN4, AN3, AN2, AN1, AN0;
  wire CA, CB, CC, CD, CE, CF, CG, DP;
  reg  enable_tb, up_down_tb, load_tb, clear_n_tb, clock_tb;  

  wire clock_1Hertz_tb;
  wire [26:0] count_tb;
  reg  [26:0] data_tb;  
  
  integer fid;


counter_99999999_7_segment_LED_top counter_deci_DUT(
     AN7,AN6,AN5,AN4,AN3,AN2,AN1,AN0, CA,CB,CC,CD,CE,CF,CG,DP,
     enable_tb, up_down_tb, load_tb, clear_n_tb, clock_tb);
                                                          

 assign count_tb = counter_deci_DUT.counter_DUT.Count;
 assign counter_deci_DUT.counter_DUT.Data = data_tb;
assign clock_1Hertz_tb = counter_deci_DUT.clock_1hz_DUT.
Clock_1Hz;
 

 initial   clock_tb = 1'b1;
 always #5 clock_tb =~ clock_tb; 
 
  initial
    begin  

     $timeformat(-9, 2, " ns", 10);
     
     $dumpfile("F:/Dileep/7_segment_LED_Verilog_code/counter_99999999_7_segment_LED/results/counter_99999999.vcd");
     $dumpvars(0, counter_deci_DUT.counter_DUT);
     
   fid = $fopen("F:/Dileep/7_segment_LED_Verilog_code/counter_99999999_7_segment_LED/results/counter_99999999.out");
           
              clear_n_tb = 0;  
  #400000000  clear_n_tb = 1; load_tb = 1; data_tb = 99999999;   
  #1000000000 enable_tb = 1; load_tb = 0; up_down_tb = 1;
  #2000000000 up_down_tb = 0;
  #2000000000 $fclose(fid); $finish; 
 end 
 
always@(clear_n_tb, load_tb, up_down_tb, enable_tb, 
         data_tb, count_tb)
 $fmonitor(fid, "%t: \n", $realtime,
                "\t Count = %d, Data = %d, Enable = %b,\n",
                    count_tb, data_tb, enable_tb, 
                "\t Load = %b, Up_down = %b, Clear_n = %b.\n",
                    load_tb, up_down_tb, clear_n_tb);                     

endmodule