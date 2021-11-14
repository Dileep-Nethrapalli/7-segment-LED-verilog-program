create_clock -name clk_100MHz -period 10.0 -waveform {0.0 5.0} [get_ports Clock_100MHz]

create_generated_clock -name gen_clk_8KHz \
      -source [get_ports Clock_100MHz] \
      -edges [list 1 12501 25001] \
      [get_pins bch_to_7_seg_LED_DUT/clock_8KHz_reg/Q] 

create_generated_clock -name gen_clk_1Hz \ 
      -source [get_ports Clock_100MHz] \ 
      -edges [list 1 100000001 200000001] \
      [get_pins clk_div_100MHz_to_1Hz_DUT/Clock_1Hz_reg/Q]


set_clock_groups -name async_clks_100MHz_1Hz -asynchronous -group [get_clocks clk_100MHz] -group [get_clocks gen_clk_1Hz] 

set_clock_groups -name async_clks_100MHz_8KHz -asynchronous -group [get_clocks clk_100MHz] -group [get_clocks gen_clk_8KHz] 

set_clock_groups -name async_clks_1Hz_8KHz -asynchronous \ 
   -group [get_clocks gen_clk_1Hz] \
   -group [get_clocks gen_clk_8KHz] 

set_false_path -from [get_ports Clear_n]


set_input_delay -clock [get_clocks gen_clk_1Hz] 1.0 \     [get_ports {Enable Up_down Load Clear_n}]

set_output_delay -clock [get_clocks gen_clk_1Hz] 1.0 [get_ports {AN7 AN6 AN5 AN4 AN3 AN2 AN1 AN0 CA CB CC CD CE CF CG DP}]