`default_nettype none

module scanchain_local #(
    parameter SCAN_LENGTH = 2)
  (
    input wire clk_in,
    input wire data_in,
    input wire scan_select_in,
    output wire clk_out,
    output wire data_out,
    output wire scan_select_out,

    // io, names from point of view of the user module
    input wire [SCAN_LENGTH-1:0] module_data_out,
    output wire [SCAN_LENGTH-1:0] module_data_in
  );

  // input buffers
  // Looking at results from multiple projects the buffering is a bit
  // inconsistent. So instead, we ensure at least clk buf
  wire clk;
  assign clk = clk_in;

  // output buffers
  // Same as for input, to try and be more consistent, we make our own
  wire data_out_i;

  assign clk_out = clk;
  assign data_out = data_out_i;
  assign scan_select_out = scan_select_in;


  // wires needed
  wire [SCAN_LENGTH-1:0] scan_data_out;   // output of the each scan chain flop
  wire [SCAN_LENGTH-1:0] scan_data_in;    // input of each scan chain flop

  // scan chain - link all the flops, with data coming from data_in
  assign scan_data_in = {scan_data_out[SCAN_LENGTH-2:0], data_in};

  // end of the chain is a negedge FF to increase hold margin between blocks
  always @(negedge clk) begin
    data_out_i <= scan_data_out[SCAN_LENGTH-1];
  end

  // scan flops have a mux on their inputs to choose either data from the user module or the previous flop's output
  always @(posedge clk) begin
    if(scan_select_in)
      scan_data_out <= module_data_out;
    else
      scan_data_out <= scan_data_in;
  end
  
  /* Because we control the clock into serv, we can avoid the extra latches here */
  assign module_data_in = scan_data_out;

endmodule
