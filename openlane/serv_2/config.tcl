# SPDX-FileCopyrightText: 2020 Efabless Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# SPDX-License-Identifier: Apache-2.0

set script_dir [file dirname [file normalize [info script]/../../]]

set ::env(DESIGN_NAME) serv_2
set ::env(DESIGN_IS_CORE) 0

set ::env(PDK) "gf180mcuC"
set ::env(STD_CELL_LIBRARY) "gf180mcu_fd_sc_mcu7t5v0"
set ::env(RT_MAX_LAYER) {Metal4}

#set ::env(RUN_KLAYOUT) 		0
set ::env(CLOCK_TREE_SYNTH) 1
set ::env(CLOCK_PORT) ""
set ::env(CLOCK_NET) {clk serv_clk}
set ::env(CLOCK_PERIOD) 	50
set ::env(SYNTH_MAX_FANOUT) 5
set ::env(SYNTH_SIZING) 1
set ::env(CLOCK_BUFFER_FANOUT) 20

set ::env(FP_IO_HLENGTH) 2
set ::env(FP_IO_VLENGTH) 2

## Floorplan
set ::env(FP_SIZING) absolute
set ::env(DIE_AREA) "0 0 700 600"

## Placement
set ::env(PL_BASIC_PLACEMENT) 0
set ::env(PL_TARGET_DENSITY) 0.55

# Enable all optimizations
set ::env(PL_RESIZER_DESIGN_OPTIMIZATIONS) 1
set ::env(PL_RESIZER_TIMING_OPTIMIZATIONS) 1
set ::env(GLB_RESIZER_TIMING_OPTIMIZATIONS) 1

# Diode insertion strategy number 4 for gf-180mcu
set ::env(DIODE_INSERTION_STRATEGY) 4

set ::env(VDD_NETS) [list {vdd}]
set ::env(GND_NETS) [list {vss}]

set ::env(FP_PIN_ORDER_CFG) $::env(DESIGN_DIR)/pin_order.cfg

set ::env(DESIGN_DIR) $script_dir/../../verilog 
    
set ::env(VERILOG_FILES) "\
    $::env(DESIGN_DIR)/rtl/defines.v \
	$::env(DESIGN_DIR)/rtl/serv_2.v \
    $::env(DESIGN_DIR)/rtl/scanchain.v \
    $::env(DESIGN_DIR)/blocks/serv/rtl/serv_top.v \
    $::env(DESIGN_DIR)/blocks/serv/rtl/serv_synth_wrapper.v \
    $::env(DESIGN_DIR)/blocks/serv/rtl/serv_mem_if.v \
    $::env(DESIGN_DIR)/blocks/serv/rtl/serv_rf_if.v \
    $::env(DESIGN_DIR)/blocks/serv/rtl/serv_rf_top.v \
    $::env(DESIGN_DIR)/blocks/serv/rtl/serv_rf_ram.v \
    $::env(DESIGN_DIR)/blocks/serv/rtl/serv_rf_ram_if.v \
    $::env(DESIGN_DIR)/blocks/serv/rtl/serv_alu.v \
    $::env(DESIGN_DIR)/blocks/serv/rtl/serv_ctrl.v \
    $::env(DESIGN_DIR)/blocks/serv/rtl/serv_bufreg2.v \
    $::env(DESIGN_DIR)/blocks/serv/rtl/serv_bufreg.v \
    $::env(DESIGN_DIR)/blocks/serv/rtl/serv_immdec.v \
    $::env(DESIGN_DIR)/blocks/serv/rtl/serv_decode.v \
    $::env(DESIGN_DIR)/blocks/serv/rtl/serv_compdec.v \
    $::env(DESIGN_DIR)/blocks/serv/rtl/serv_aligner.v \
    $::env(DESIGN_DIR)/blocks/serv/rtl/serv_state.v \
    $::env(DESIGN_DIR)/blocks/serv/rtl/serv_csr.v \
    $::env(DESIGN_DIR)/blocks/serv/servant/servant_arbiter.v \
    $::env(DESIGN_DIR)/blocks/serv/servant/servant_mux.v"

set ::env(VERILOG_FILES_BLACKBOX) "\
    $::env(DESIGN_DIR)/rtl/bb/gf180mcu_fd_sc_mcu7t5v0.v"

set ::env(RUN_CVC) 1
