###############################################################################
# Created by write_sdc
# Mon Dec  5 10:59:23 2022
###############################################################################
current_design serv_1
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name __VIRTUAL_CLK__ -period 50.0000 
set_clock_uncertainty 0.2500 __VIRTUAL_CLK__
set_input_delay 10.0000 -clock [get_clocks {__VIRTUAL_CLK__}] -add_delay [get_ports {io_in[0]}]
set_input_delay 10.0000 -clock [get_clocks {__VIRTUAL_CLK__}] -add_delay [get_ports {io_in[1]}]
set_input_delay 10.0000 -clock [get_clocks {__VIRTUAL_CLK__}] -add_delay [get_ports {io_in[2]}]
set_input_delay 10.0000 -clock [get_clocks {__VIRTUAL_CLK__}] -add_delay [get_ports {io_in[3]}]
set_input_delay 10.0000 -clock [get_clocks {__VIRTUAL_CLK__}] -add_delay [get_ports {io_in[4]}]
set_output_delay 10.0000 -clock [get_clocks {__VIRTUAL_CLK__}] -add_delay [get_ports {io_oeb[0]}]
set_output_delay 10.0000 -clock [get_clocks {__VIRTUAL_CLK__}] -add_delay [get_ports {io_oeb[1]}]
set_output_delay 10.0000 -clock [get_clocks {__VIRTUAL_CLK__}] -add_delay [get_ports {io_oeb[2]}]
set_output_delay 10.0000 -clock [get_clocks {__VIRTUAL_CLK__}] -add_delay [get_ports {io_oeb[3]}]
set_output_delay 10.0000 -clock [get_clocks {__VIRTUAL_CLK__}] -add_delay [get_ports {io_oeb[4]}]
set_output_delay 10.0000 -clock [get_clocks {__VIRTUAL_CLK__}] -add_delay [get_ports {io_out[0]}]
set_output_delay 10.0000 -clock [get_clocks {__VIRTUAL_CLK__}] -add_delay [get_ports {io_out[1]}]
set_output_delay 10.0000 -clock [get_clocks {__VIRTUAL_CLK__}] -add_delay [get_ports {io_out[2]}]
set_output_delay 10.0000 -clock [get_clocks {__VIRTUAL_CLK__}] -add_delay [get_ports {io_out[3]}]
set_output_delay 10.0000 -clock [get_clocks {__VIRTUAL_CLK__}] -add_delay [get_ports {io_out[4]}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0729 [get_ports {io_oeb[4]}]
set_load -pin_load 0.0729 [get_ports {io_oeb[3]}]
set_load -pin_load 0.0729 [get_ports {io_oeb[2]}]
set_load -pin_load 0.0729 [get_ports {io_oeb[1]}]
set_load -pin_load 0.0729 [get_ports {io_oeb[0]}]
set_load -pin_load 0.0729 [get_ports {io_out[4]}]
set_load -pin_load 0.0729 [get_ports {io_out[3]}]
set_load -pin_load 0.0729 [get_ports {io_out[2]}]
set_load -pin_load 0.0729 [get_ports {io_out[1]}]
set_load -pin_load 0.0729 [get_ports {io_out[0]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_in[4]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_in[3]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_in[2]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_in[1]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_in[0]}]
set_timing_derate -early 0.9500
set_timing_derate -late 1.0500
###############################################################################
# Design Rules
###############################################################################
set_max_fanout 5.0000 [current_design]
