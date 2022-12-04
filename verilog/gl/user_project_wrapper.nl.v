// This is the unpowered netlist.
module user_project_wrapper (user_clock2,
    wb_clk_i,
    wb_rst_i,
    wbs_ack_o,
    wbs_cyc_i,
    wbs_stb_i,
    wbs_we_i,
    io_in,
    io_oeb,
    io_out,
    la_data_in,
    la_data_out,
    la_oenb,
    user_irq,
    wbs_adr_i,
    wbs_dat_i,
    wbs_dat_o,
    wbs_sel_i);
 input user_clock2;
 input wb_clk_i;
 input wb_rst_i;
 output wbs_ack_o;
 input wbs_cyc_i;
 input wbs_stb_i;
 input wbs_we_i;
 input [37:0] io_in;
 output [37:0] io_oeb;
 output [37:0] io_out;
 input [63:0] la_data_in;
 output [63:0] la_data_out;
 input [63:0] la_oenb;
 output [2:0] user_irq;
 input [31:0] wbs_adr_i;
 input [31:0] wbs_dat_i;
 output [31:0] wbs_dat_o;
 input [3:0] wbs_sel_i;


 serv_0 u_serv_0 (.io_in({io_in[12],
    io_in[11],
    io_in[10],
    io_in[9],
    io_in[8]}),
    .io_oeb({io_oeb[12],
    io_oeb[11],
    io_oeb[10],
    io_oeb[9],
    io_oeb[8]}),
    .io_out({io_out[12],
    io_out[11],
    io_out[10],
    io_out[9],
    io_out[8]}));
 serv_1 u_serv_1 (.io_in({io_in[17],
    io_in[16],
    io_in[15],
    io_in[14],
    io_in[13]}),
    .io_oeb({io_oeb[17],
    io_oeb[16],
    io_oeb[15],
    io_oeb[14],
    io_oeb[13]}),
    .io_out({io_out[17],
    io_out[16],
    io_out[15],
    io_out[14],
    io_out[13]}));
endmodule

