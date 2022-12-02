`default_nettype none

// Keep I/O fixed for TinyTapeout
module gregdavill_serv_top(
    input [7:0] io_in,
    output [7:0] io_out
  );

  wire clk =   io_in[0];
  wire reset = io_in[1];

  wire data =         io_in[2];
  wire scan_select =  io_in[3];
  wire serv_clk =     io_in[5];

  wire timer_irq;

  wire [31:0] 	wb_ibus_adr;
  wire [31:0] 	wb_ibus_rdt;
  wire 	wb_ibus_cyc;
  wire 	wb_ibus_ack;

  wire [31:0] 	wb_dbus_adr;
  wire [31:0] 	wb_dbus_dat;
  wire [3:0] 	wb_dbus_sel;
  wire [31:0] 	wb_dbus_rdt;
  wire 	wb_dbus_we;
  wire 	wb_dbus_cyc;
  wire 	wb_dbus_ack;

  wire [31:0] 	wb_dmem_adr;
  wire [31:0] 	wb_dmem_dat;
  wire [3:0] 	wb_dmem_sel;
  wire [31:0] 	wb_dmem_rdt;
  wire 	wb_dmem_we;
  wire 	wb_dmem_cyc;
  wire 	wb_dmem_ack;

  wire [31:0] 	wb_mem_adr;
  wire [31:0] 	wb_mem_dat;
  wire [3:0] 	wb_mem_sel;
  wire [31:0] 	wb_mem_rdt;
  wire 	wb_mem_we;
  wire 	wb_mem_cyc;
  wire 	wb_mem_ack;

  servant_arbiter u_arbiter (
    .i_wb_cpu_dbus_adr (wb_dbus_adr),
    .i_wb_cpu_dbus_dat (wb_dbus_dat),
    .i_wb_cpu_dbus_sel (wb_dbus_sel),
    .i_wb_cpu_dbus_we  (wb_dbus_we ),
    .i_wb_cpu_dbus_cyc (wb_dbus_cyc),
    .o_wb_cpu_dbus_rdt (wb_dbus_rdt),
    .o_wb_cpu_dbus_ack (wb_dbus_ack),

    .i_wb_cpu_ibus_adr (wb_ibus_adr),
    .i_wb_cpu_ibus_cyc (wb_ibus_cyc),
    .o_wb_cpu_ibus_rdt (wb_ibus_rdt),
    .o_wb_cpu_ibus_ack (wb_ibus_ack),

    .o_wb_cpu_adr (wb_mem_adr),
    .o_wb_cpu_dat (wb_mem_dat),
    .o_wb_cpu_sel (wb_mem_sel),
    .o_wb_cpu_we  (wb_mem_we ),
    .o_wb_cpu_cyc (wb_mem_cyc),
    .i_wb_cpu_rdt (wb_mem_rdt),
    .i_wb_cpu_ack (wb_mem_ack)
  );



module serv_rf_top
  #(.RESET_PC(32'd0),
    .COMPRESSED(1),
    .ALIGN(1),
    .MDU(0),
    .PRE_REGISTER(1),
    .RESET_STRATEGY = "MINI",
    .WITH_CSR(1),
    .RF_WIDTH(2),
	(
   input wire 	      serv_clk,
   input wire 	      i_rst,
   input wire 	      i_timer_irq,

   output wire [31:0] o_ibus_adr,
   output wire 	      o_ibus_cyc,
   input wire [31:0]  i_ibus_rdt,
   input wire 	      i_ibus_ack,
   output wire [31:0] o_dbus_adr,
   output wire [31:0] o_dbus_dat,
   output wire [3:0]  o_dbus_sel,
   output wire 	      o_dbus_we ,
   output wire 	      o_dbus_cyc,
   input wire [31:0]  i_dbus_rdt,
   input wire 	      i_dbus_ack,
   );


  scanchain_local #(
    .SCAN_LENGTH(70))
  u_scanchain_local
  (
    // Inputs from TinyTapeout scanchain to our internal scanchain
    .clk_in          (clk),
    .data_in         (data),
    .scan_select_in  (scan_select),

    // Pass all signals out from our internal scanchain, only really need data
    .clk_out         (io_out[0]),
    .data_out        (io_out[1]),
    .scan_select_out (),

    // data
    .module_data_out ({
      // Bus interface
      wb_mem_adr[31:0],   // 32
      wb_mem_dat,         // 32
      wb_mem_sel,         // 4
      wb_mem_we,          // 1
      wb_mem_cyc}),       // 1
     
    .module_data_in  ({
      // Bus interface
      wb_mem_rdt,         // 32
      wb_mem_ack,         // 1
      timer_irq})         // 1
  );

endmodule
