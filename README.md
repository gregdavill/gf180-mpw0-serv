# GF180 MPW0 Serv

An award winning CPU design fit into the GF180 MPW0 Shuttle.

To keep the design simple this project places a Serv CPU with a scan-chain around it connecting it's wishbone bus which is a combination of data and instructions out via I/O pins. 

Another I/O pin is responsible for handling clock and reset.
Operation will run as follows:
 1. Using an external controller, load in default values for the wishbone bus, bring serv out of reset and clock it.
 2. Latch in and scan out the wishbone bus values. Handle any requests.
 3. Scan in data from the request and clock serv.
 4. Goto 2.

In this manner we should be able to implement external peripherals like UARTs, timers, and GPIOs. The external controller can be a microcontroller, FPGA, or the caravel harness SoC.
