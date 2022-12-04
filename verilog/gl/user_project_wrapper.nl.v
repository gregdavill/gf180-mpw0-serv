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

 wire _00_;
 wire _01_;
 wire _02_;
 wire _03_;
 wire _04_;
 wire _05_;
 wire _06_;
 wire _07_;
 wire _08_;
 wire _09_;
 wire _10_;
 wire _11_;
 wire _12_;
 wire _13_;
 wire _14_;
 wire _15_;
 wire _16_;
 wire _17_;

 serv_0 u_serv_0 (.io_in({io_in[9],
    io_in[8],
    io_in[7],
    io_in[6],
    io_in[5]}),
    .io_oeb({_14_,
    _13_,
    _12_,
    io_oeb[11],
    io_oeb[10]}),
    .io_out({_17_,
    _16_,
    _15_,
    io_out[11],
    io_out[10]}));
 serv_1 u_serv_1 (.io_in({io_in[16],
    io_in[15],
    io_in[14],
    io_in[13],
    io_in[12]}),
    .io_oeb({_08_,
    _07_,
    _06_,
    io_oeb[18],
    io_oeb[17]}),
    .io_out({_11_,
    _10_,
    _09_,
    io_out[18],
    io_out[17]}));
 serv_2 u_serv_2 (.io_in({io_in[23],
    io_in[22],
    io_in[21],
    io_in[20],
    io_in[19]}),
    .io_oeb({_02_,
    _01_,
    _00_,
    io_oeb[25],
    io_oeb[24]}),
    .io_out({_05_,
    _04_,
    _03_,
    io_out[25],
    io_out[24]}));
endmodule

