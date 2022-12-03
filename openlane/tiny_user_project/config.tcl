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

set ::env(DESIGN_NAME) tiny_user_project
set ::env(DESIGN_IS_CORE) 0

set ::env(PDK) "gf180mcuC"
set ::env(STD_CELL_LIBRARY) "gf180mcu_fd_sc_mcu7t5v0"

set ::env(RUN_KLAYOUT) 		0
set ::env(CLOCK_TREE_SYNTH) 0
set ::env(CLOCK_PORT) 		{io_in[8]}
#set ::env(CLOCK_NET) ""
set ::env(CLOCK_PERIOD) 	"45"

set ::env(FP_IO_HLENGTH) 2
set ::env(FP_IO_VLENGTH) 2

## Floorplan
set ::env(FP_SIZING) absolute
set ::env(DIE_AREA) "0 0 700 500"


## Placement
set ::env(PL_BASIC_PLACEMENT) 0
set ::env(PL_TARGET_DENSITY) 0.55

set ::env(PL_RESIZER_DESIGN_OPTIMIZATIONS) 1
set ::env(PL_RESIZER_TIMING_OPTIMIZATIONS) 1

## Diode Insertion
set ::env(DIODE_INSERTION_STRATEGY) 		4

# connect to first digital rails
set ::env(VDD_NETS) [list {VDD}]
set ::env(GND_NETS) [list {VSS}]


# save some time
set ::env(RUN_KLAYOUT_XOR) 0
set ::env(RUN_KLAYOUT_DRC) 0

# don't put clock buffers on the outputs
set ::env(PL_RESIZER_BUFFER_OUTPUT_PORTS) 0
    
## Internal Macros
set ::env(MACRO_PLACEMENT_CFG) $script_dir/macro.cfg

set ::env(DESIGN_DIR) $script_dir/../../verilog 
    
    #$::env(DESIGN_DIR)/blocks/serv/rtl/serv_rf_ram.v \

set ::env(VERILOG_FILES) "\
    $::env(DESIGN_DIR)/rtl/defines.v \
	$::env(DESIGN_DIR)/rtl/top.v \
	$::env(DESIGN_DIR)/rtl/serv_rf_ram_gf180.v \
    $::env(DESIGN_DIR)/rtl/scanchain_gf180.v \
    $::env(DESIGN_DIR)/rtl/tiny_user_project.v \
    $::env(DESIGN_DIR)/blocks/serv/rtl/serv_top.v \
    $::env(DESIGN_DIR)/blocks/serv/rtl/serv_synth_wrapper.v \
    $::env(DESIGN_DIR)/blocks/serv/rtl/serv_mem_if.v \
    $::env(DESIGN_DIR)/blocks/serv/rtl/serv_rf_if.v \
    $::env(DESIGN_DIR)/blocks/serv/rtl/serv_rf_top.v \
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
    $::env(DESIGN_DIR)/blocks/serv/servant/servant_mux.v \
    $::env(DESIGN_DIR)/blocks/serv/servant/servant_gpio.v"

set ::env(VERILOG_FILES_BLACKBOX) "\
	$::env(DESIGN_DIR)/rtl/gf180mcu_fd_sc_mcu7t5v0_bb.v \
	$::env(PDK_ROOT)/$::env(PDK)/libs.ref/gf180mcu_fd_ip_sram/verilog/gf180mcu_fd_ip_sram__sram256x8m8wm1.v"

set ::env(EXTRA_LEFS) "\
	$::env(PDK_ROOT)/$::env(PDK)/libs.ref/gf180mcu_fd_ip_sram/lef/gf180mcu_fd_ip_sram__sram256x8m8wm1.lef"
set ::env(EXTRA_GDS_FILES) "\
    $::env(PDK_ROOT)/$::env(PDK)/libs.ref/gf180mcu_fd_ip_sram/gds/gf180mcu_fd_ip_sram__sram256x8m8wm1.gds"
set ::env(EXTRA_LIBS) "\
    $::env(PDK_ROOT)/$::env(PDK)/libs.ref/gf180mcu_fd_ip_sram/liberty/gf180mcu_fd_ip_sram__sram256x8m8wm1__tt_025C_1v80.lib"

set ::env(FP_PDN_MACRO_HOOKS) "\
  u_cpu.rf_ram.RAM0 VDD VSS VDD VSS
  "

#set ::env(PDN_CFG) $script_dir/pdn.tcl
set ::env(FP_PDN_ENABLE_GLOBAL_CONNECTIONS) 1

## LVS
set ::env(MAGIC_DRC_USE_GDS) 0
set ::env(RUN_MAGIC_DRC) 0
set ::env(QUIT_ON_MAGIC_DRC) 0

set ::env(QUIT_ON_LVS_ERROR) 0