set_property -dict { PACKAGE_PIN L17   IOSTANDARD LVCMOS33 } [get_ports { clock }]; #IO_L12P_T1_MRCC_14 Sch=gclk
create_clock -add -name sys_clk_pin -period 83.33 -waveform {0 41.66} [get_ports {clock}];

set_property -dict { PACKAGE_PIN A15   IOSTANDARD LVCMOS33 } [get_ports { seg[11]  }]; #IO_L6N_T0_VREF_16 Sch=pio[07]
set_property -dict { PACKAGE_PIN J1    IOSTANDARD LVCMOS33 } [get_ports { seg[9] }]; #IO_L3N_T0_DQS_AD5N_35 Sch=pio[11]
set_property -dict { PACKAGE_PIN K2    IOSTANDARD LVCMOS33 } [get_ports { seg[10] }]; #IO_L5P_T0_AD13P_35 Sch=pio[12]
set_property -dict { PACKAGE_PIN L1    IOSTANDARD LVCMOS33 } [get_ports { seg[7] }]; #IO_L6N_T0_VREF_35 Sch=pio[13]
set_property -dict { PACKAGE_PIN L2    IOSTANDARD LVCMOS33 } [get_ports { seg[8] }]; #IO_L5N_T0_AD13N_35 Sch=pio[14]
set_property -dict { PACKAGE_PIN M1    IOSTANDARD LVCMOS33 } [get_ports { seg[6] }]; #IO_L9N_T1_DQS_AD7N_35 Sch=pio[17]
set_property -dict { PACKAGE_PIN W5    IOSTANDARD LVCMOS33 } [get_ports { seg[4] }]; #IO_L12P_T1_MRCC_34 Sch=pio[36]
set_property -dict { PACKAGE_PIN V4    IOSTANDARD LVCMOS33 } [get_ports { seg[5] }]; 
set_property -dict { PACKAGE_PIN U2    IOSTANDARD LVCMOS33 } [get_ports { seg[0] }]; #IO_L9N_T1_DQS_34 Sch=pio[42]
set_property -dict { PACKAGE_PIN W6    IOSTANDARD LVCMOS33 } [get_ports { seg[1] }]; #IO_L13N_T2_MRCC_34 Sch=pio[43]
set_property -dict { PACKAGE_PIN U3    IOSTANDARD LVCMOS33 } [get_ports { seg[2] }]; #IO_L9P_T1_DQS_34 Sch=pio[44]
set_property -dict { PACKAGE_PIN U7    IOSTANDARD LVCMOS33 } [get_ports { seg[3] }]; #IO_L19P_T3_34 Sch=pio[45]

set_property -dict { PACKAGE_PIN A18   IOSTANDARD LVCMOS33 } [get_ports { rst }];