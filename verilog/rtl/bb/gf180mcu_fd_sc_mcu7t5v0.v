
// Copyright 2022 GlobalFoundries PDK Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

(*blackbox*)
module gf180mcu_fd_sc_mcu7t5v0__sdffq_1( SE, SI, D, CLK, Q, VDD, VSS );
input CLK, D, SE, SI;
inout VDD, VSS;
output Q;
reg notifier;
endmodule

(*blackbox*)
module gf180mcu_fd_sc_mcu7t5v0__buf_1( I, Z, VDD, VSS );
input I;
inout VDD, VSS;
output Z;
endmodule

(*blackbox*)
module gf180mcu_fd_sc_mcu7t5v0__buf_2( I, Z, VDD, VSS );
input I;
inout VDD, VSS;
output Z;
endmodule

(*blackbox*)
module gf180mcu_fd_sc_mcu7t5v0__buf_4( I, Z, VDD, VSS );
input I;
inout VDD, VSS;
output Z;
endmodule

(*blackbox*)
module gf180mcu_fd_sc_mcu7t5v0__dffnq_1( CLKN, D, Q, VDD, VSS );
input CLKN, D;
inout VDD, VSS;
output Q;
reg notifier;
endmodule

(*blackbox*)
module gf180mcu_fd_ip_sram__sram256x8m8wm1 (
input           CLK,
input           CEN,    //Chip Enable
input           GWEN,   //Global Write Enable
input   [7:0]  	WEN,    //Write Enable
input   [7:0]   A,
input   [7:0]  	D,
output	[7:0]	Q,
inout		VDD,
inout		VSS
);

endmodule