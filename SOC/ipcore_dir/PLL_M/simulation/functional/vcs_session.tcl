gui_open_window Wave
gui_sg_create PLL_M_group
gui_list_add_group -id Wave.1 {PLL_M_group}
gui_sg_addsignal -group PLL_M_group {PLL_M_tb.test_phase}
gui_set_radix -radix {ascii} -signals {PLL_M_tb.test_phase}
gui_sg_addsignal -group PLL_M_group {{Input_clocks}} -divider
gui_sg_addsignal -group PLL_M_group {PLL_M_tb.CLK_IN1}
gui_sg_addsignal -group PLL_M_group {{Output_clocks}} -divider
gui_sg_addsignal -group PLL_M_group {PLL_M_tb.dut.clk}
gui_list_expand -id Wave.1 PLL_M_tb.dut.clk
gui_sg_addsignal -group PLL_M_group {{Counters}} -divider
gui_sg_addsignal -group PLL_M_group {PLL_M_tb.COUNT}
gui_sg_addsignal -group PLL_M_group {PLL_M_tb.dut.counter}
gui_list_expand -id Wave.1 PLL_M_tb.dut.counter
gui_zoom -window Wave.1 -full
