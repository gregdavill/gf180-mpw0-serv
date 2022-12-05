module serv_rf_ram
  #(parameter width=8,
    parameter csr_regs=4,
    parameter depth=32*(32+csr_regs)/width)
   (input wire i_clk,
    input wire [$clog2(depth)-1:0] i_waddr,
    input wire [width-1:0] 	   i_wdata,
    input wire 			   i_wen,
    input wire [$clog2(depth)-1:0] i_raddr,
    output wire [width-1:0] 	   o_rdata);

  wire [width-1:0] 		   rdata ;

  wire [$clog2(depth)-1:0] addr;
  assign addr = i_wen ? i_waddr : i_raddr;

gf180mcu_fd_ip_sram__sram256x8m8wm1 RAM0 (
	.CLK(i_clk),
	.CEN(1'b0), // Active LOW chip enable
	.GWEN(~i_wen), // Active LOW Write enable
	.WEN({8{~i_wen}}), // Active LOW
	.A(addr),
	.D(i_wdata),
	.Q(rdata),
	.VDD(1'b1),
	.VSS(1'b0)
);

   /* Reads from reg x0 needs to return 0
    Check that the part of the read address corresponding to the register
    is zero and gate the output
    width LSB of reg index $clog2(width)
    2     4                1
    4     3                2
    8     2                3
    16    1                4
    32    0                5
    */
   reg regzero;

   always @(posedge i_clk)
     regzero <= !(|i_raddr[$clog2(depth)-1:5-$clog2(width)]);

   assign o_rdata = rdata & ~{width{regzero}};

endmodule
