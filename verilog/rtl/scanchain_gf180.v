`default_nettype none

module scanchain_local #(
    parameter SCAN_LENGTH = 2)
  (
    input wire clk_in,
    input wire data_in,
    input wire scan_select_in,
    input wire latch_enable_in,
    output wire clk_out,
    output wire data_out,
    output wire scan_select_out,
    output wire latch_enable_out,

    // io, names from point of view of the user module
    input wire [SCAN_LENGTH-1:0] module_data_out,
    output wire [SCAN_LENGTH-1:0] module_data_in
  );

  // input buffers
  // Looking at results from multiple projects the buffering is a bit
  // inconsistent. So instead, we ensure at least clk buf
  wire clk;

  gf180mcu_fd_sc_mcu7t5v0__buf_2 input_buf_clk (
                              .I          (clk_in),
                              .Z          (clk),
                              .VDD        (1'b1),
                              .VSS        (1'b0)
                            );

  // output buffers
  // Same as for input, to try and be more consistent, we make our own
  wire data_out_i;

  gf180mcu_fd_sc_mcu7t5v0__buf_4 output_buffers[3:0] (
                           .I          ({clk,     data_out_i, scan_select_in,  latch_enable_in }),
                           .Z          ({clk_out, data_out,   scan_select_out, latch_enable_out }),
                           .VDD       (1'b1),
                           .VSS       (1'b0)
                         );

  // wires needed
  wire [SCAN_LENGTH-1:0] scan_data_out;   // output of the each scan chain flop
  wire [SCAN_LENGTH-1:0] scan_data_in;    // input of each scan chain flop

  // scan chain - link all the flops, with data coming from data_in
  assign scan_data_in = {scan_data_out[SCAN_LENGTH-2:0], data_in};

  // end of the chain is a negedge FF to increase hold margin between blocks
  gf180mcu_fd_sc_mcu7t5v0__dffnq_1 out_flop (
                             .CLKN       (clk),
                             .D          (scan_data_out[SCAN_LENGTH-1]),
                             .Q          (data_out_i),
                             .VDD        (1'b1),
                             .VSS        (1'b0)
                           );

  // scan flops have a mux on their inputs to choose either data from the user module or the previous flop's output
  // https://antmicro-skywater-pdk-docs.readthedocs.io/en/test-submodules-in-rtd/contents/libraries/sky130_fd_sc_ls/cells/sdfxtp/README.html
`ifndef FORMAL
`ifndef FORMAL_COMPAT
  gf180mcu_fd_sc_mcu7t5v0__sdffq_1 scan_flop [SCAN_LENGTH-1:0] (
                              .CLK        (clk),
                              .D          (scan_data_in),
                              .SI         (module_data_out),
                              .SE         (scan_select_in),
                              .Q          (scan_data_out),
                              .VDD        (1'b1),
                              .VSS        (1'b0)
                            );

  /* Because we control the clock into serv, we can avoid the extra latches here */
  assign module_data_in = scan_data_out;
`endif
    `endif

endmodule
