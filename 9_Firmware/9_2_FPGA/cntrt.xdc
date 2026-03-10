# ============================================================================
# RADAR SYSTEM FPGA CONSTRAINTS
# ============================================================================
# Device: [XC7A100T]
# Created: [DATE]
# Description: Main constraints file for radar system with FT601 USB 3.0
# ============================================================================

# ============================================================================
# CLOCK CONSTRAINTS
# ============================================================================

# 100MHz System Clock
create_clock -name clk_100m -period 10.0 [get_ports {clk_100m}]
set_input_jitter [get_clocks clk_100m] 0.1

# 120MHz DAC Clock
create_clock -name clk_120m_dac -period 8.333 [get_ports {clk_120m_dac}]
set_input_jitter [get_clocks clk_120m_dac] 0.1

# FT601 Clock (100MHz from FT601)
create_clock -name ft601_clk_in -period 10.0 [get_ports {ft601_clk_in}]
set_input_jitter [get_clocks ft601_clk_in] 0.1

# ADC DCO Clock (400MHz LVDS)
create_clock -name adc_dco_p -period 2.5 [get_ports {adc_dco_p}]
set_input_jitter [get_clocks adc_dco_p] 0.05

# ============================================================================
# RESET CONSTRAINTS
# ============================================================================

set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {reset_n}]
set_property IOSTANDARD LVCMOS33 [get_ports {reset_n}]
set_property PULLUP true [get_ports {reset_n}]

# ============================================================================
# TRANSMITTER INTERFACE (DAC)
# ============================================================================

# DAC Data Bus (8-bit)
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {dac_data[0]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {dac_data[1]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {dac_data[2]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {dac_data[3]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {dac_data[4]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {dac_data[5]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {dac_data[6]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {dac_data[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dac_data[*]}]
set_property SLEW FAST [get_ports {dac_data[*]}]
set_property DRIVE 8 [get_ports {dac_data[*]}]

# DAC Control
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {dac_clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {dac_clk}]
set_property SLEW FAST [get_ports {dac_clk}]

set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {dac_sleep}]
set_property IOSTANDARD LVCMOS33 [get_ports {dac_sleep}]

# RF Switch Control
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {fpga_rf_switch}]
set_property IOSTANDARD LVCMOS33 [get_ports {fpga_rf_switch}]

# Mixer Enables
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {rx_mixer_en}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {tx_mixer_en}]
set_property IOSTANDARD LVCMOS33 [get_ports {rx_mixer_en}]
set_property IOSTANDARD LVCMOS33 [get_ports {tx_mixer_en}]

# ============================================================================
# ADAR1000 BEAMFORMER CONTROL
# ============================================================================

# ADAR1000 Load/Control Pins (Channel 1-4)
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {adar_tx_load_1}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {adar_rx_load_1}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {adar_tx_load_2}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {adar_rx_load_2}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {adar_tx_load_3}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {adar_rx_load_3}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {adar_tx_load_4}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {adar_rx_load_4}]
set_property IOSTANDARD LVCMOS33 [get_ports {adar_*_load_*}]

# ADAR1000 TR Pins
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {adar_tr_1}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {adar_tr_2}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {adar_tr_3}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {adar_tr_4}]
set_property IOSTANDARD LVCMOS33 [get_ports {adar_tr_*}]

# ============================================================================
# LEVEL SHIFTER SPI INTERFACE (STM32 to ADAR1000)
# ============================================================================

# 3.3V Side (from STM32)
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {stm32_sclk_3v3}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {stm32_mosi_3v3}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {stm32_miso_3v3}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {stm32_cs_adar1_3v3}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {stm32_cs_adar2_3v3}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {stm32_cs_adar3_3v3}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {stm32_cs_adar4_3v3}]
set_property IOSTANDARD LVCMOS33 [get_ports {stm32_*_3v3}]

# 1.8V Side (to ADAR1000)
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {stm32_sclk_1v8}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {stm32_mosi_1v8}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {stm32_miso_1v8}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {stm32_cs_adar1_1v8}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {stm32_cs_adar2_1v8}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {stm32_cs_adar3_1v8}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {stm32_cs_adar4_1v8}]
set_property IOSTANDARD LVCMOS18 [get_ports {stm32_*_1v8}]

# ============================================================================
# STM32 CONTROL INTERFACE
# ============================================================================

set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {stm32_new_chirp}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {stm32_new_elevation}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {stm32_new_azimuth}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {stm32_mixers_enable}]
set_property IOSTANDARD LVCMOS33 [get_ports {stm32_new_*}]
set_property IOSTANDARD LVCMOS33 [get_ports {stm32_mixers_enable}]

# ============================================================================
# ADC INTERFACE (LVDS - 400MHz)
# ============================================================================

# ADC Data (LVDS pairs)
set_property PACKAGE_PIN [PIN_NUMBER_P] [get_ports {adc_d_p[0]}]
set_property PACKAGE_PIN [PIN_NUMBER_N] [get_ports {adc_d_n[0]}]
set_property PACKAGE_PIN [PIN_NUMBER_P] [get_ports {adc_d_p[1]}]
set_property PACKAGE_PIN [PIN_NUMBER_N] [get_ports {adc_d_n[1]}]
set_property PACKAGE_PIN [PIN_NUMBER_P] [get_ports {adc_d_p[2]}]
set_property PACKAGE_PIN [PIN_NUMBER_N] [get_ports {adc_d_n[2]}]
set_property PACKAGE_PIN [PIN_NUMBER_P] [get_ports {adc_d_p[3]}]
set_property PACKAGE_PIN [PIN_NUMBER_N] [get_ports {adc_d_n[3]}]
set_property PACKAGE_PIN [PIN_NUMBER_P] [get_ports {adc_d_p[4]}]
set_property PACKAGE_PIN [PIN_NUMBER_N] [get_ports {adc_d_n[4]}]
set_property PACKAGE_PIN [PIN_NUMBER_P] [get_ports {adc_d_p[5]}]
set_property PACKAGE_PIN [PIN_NUMBER_N] [get_ports {adc_d_n[5]}]
set_property PACKAGE_PIN [PIN_NUMBER_P] [get_ports {adc_d_p[6]}]
set_property PACKAGE_PIN [PIN_NUMBER_N] [get_ports {adc_d_n[6]}]
set_property PACKAGE_PIN [PIN_NUMBER_P] [get_ports {adc_d_p[7]}]
set_property PACKAGE_PIN [PIN_NUMBER_N] [get_ports {adc_d_n[7]}]

# ADC DCO Clock (LVDS)
set_property PACKAGE_PIN [PIN_NUMBER_P] [get_ports {adc_dco_p}]
set_property PACKAGE_PIN [PIN_NUMBER_N] [get_ports {adc_dco_n}]

# ADC Power Down
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {adc_pwdn}]
set_property IOSTANDARD LVCMOS33 [get_ports {adc_pwdn}]

# LVDS Constraints
set_property IOSTANDARD LVDS_25 [get_ports {adc_d_p[*]}]
set_property IOSTANDARD LVDS_25 [get_ports {adc_d_n[*]}]
set_property IOSTANDARD LVDS_25 [get_ports {adc_dco_p}]
set_property IOSTANDARD LVDS_25 [get_ports {adc_dco_n}]

# Differential pair constraints
set_property DIFF_TERM TRUE [get_ports {adc_d_p[*]}]
set_property DIFF_TERM TRUE [get_ports {adc_dco_p}]

# Input delay for ADC data (adjust based on PCB trace length)
set_input_delay -clock [get_clocks adc_dco_p] -max 1.0 [get_ports {adc_d_p[*]}]
set_input_delay -clock [get_clocks adc_dco_p] -min 0.2 [get_ports {adc_d_p[*]}]

# ============================================================================
# FT601 USB 3.0 INTERFACE
# ============================================================================

# FT601 Data Bus (32-bit bidirectional)
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_data[0]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_data[1]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_data[2]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_data[3]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_data[4]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_data[5]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_data[6]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_data[7]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_data[8]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_data[9]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_data[10]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_data[11]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_data[12]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_data[13]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_data[14]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_data[15]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_data[16]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_data[17]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_data[18]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_data[19]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_data[20]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_data[21]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_data[22]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_data[23]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_data[24]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_data[25]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_data[26]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_data[27]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_data[28]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_data[29]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_data[30]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_data[31]}]

# Byte enables
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_be[0]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_be[1]}]

# Control signals
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_txe_n}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_rxf_n}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_txe}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_rxf}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_wr_n}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_rd_n}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_oe_n}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_siwu_n}]

# FIFO flags
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_srb[0]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_srb[1]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_swb[0]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_swb[1]}]

# Clock out (optional)
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {ft601_clk_out}]

# FT601 I/O Standards (3.3V for FT601)
set_property IOSTANDARD LVCMOS33 [get_ports {ft601_data[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ft601_be[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ft601_txe_n}]
set_property IOSTANDARD LVCMOS33 [get_ports {ft601_rxf_n}]
set_property IOSTANDARD LVCMOS33 [get_ports {ft601_txe}]
set_property IOSTANDARD LVCMOS33 [get_ports {ft601_rxf}]
set_property IOSTANDARD LVCMOS33 [get_ports {ft601_wr_n}]
set_property IOSTANDARD LVCMOS33 [get_ports {ft601_rd_n}]
set_property IOSTANDARD LVCMOS33 [get_ports {ft601_oe_n}]
set_property IOSTANDARD LVCMOS33 [get_ports {ft601_siwu_n}]
set_property IOSTANDARD LVCMOS33 [get_ports {ft601_srb[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ft601_swb[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ft601_clk_out}]

# FT601 timing constraints
set_output_delay -clock [get_clocks ft601_clk_in] -max 2.0 [get_ports {ft601_data[*]}]
set_output_delay -clock [get_clocks ft601_clk_in] -min 0.5 [get_ports {ft601_data[*]}]
set_output_delay -clock [get_clocks ft601_clk_in] -max 2.0 [get_ports {ft601_be[*]}]
set_output_delay -clock [get_clocks ft601_clk_in] -min 0.5 [get_ports {ft601_be[*]}]

# ============================================================================
# STATUS OUTPUTS
# ============================================================================

set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {current_elevation[0]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {current_elevation[1]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {current_elevation[2]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {current_elevation[3]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {current_elevation[4]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {current_elevation[5]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {current_azimuth[0]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {current_azimuth[1]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {current_azimuth[2]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {current_azimuth[3]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {current_azimuth[4]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {current_azimuth[5]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {current_chirp[0]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {current_chirp[1]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {current_chirp[2]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {current_chirp[3]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {current_chirp[4]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {current_chirp[5]}]

set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {new_chirp_frame}]
set_property IOSTANDARD LVCMOS33 [get_ports {new_chirp_frame}]

# Debug outputs
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {dbg_doppler_data[0]}]
# ... (continue for all 32 bits)
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {dbg_doppler_data[31]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {dbg_doppler_valid}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {dbg_doppler_bin[0]}]
# ... (continue for all 5 bits)
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {dbg_doppler_bin[4]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {dbg_range_bin[0]}]
# ... (continue for all 6 bits)
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {dbg_range_bin[5]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {system_status[0]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {system_status[1]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {system_status[2]}]
set_property PACKAGE_PIN [PIN_NUMBER] [get_ports {system_status[3]}]

set_property IOSTANDARD LVCMOS33 [get_ports {dbg_*}]
set_property IOSTANDARD LVCMOS33 [get_ports {system_status[*]}]

# ============================================================================
# TIMING EXCEPTIONS
# ============================================================================

# False paths for asynchronous signals
set_false_path -from [get_ports {stm32_new_*}]
set_false_path -from [get_ports {stm32_mixers_enable}]

# Multicycle paths for slow signals
set_multicycle_path -setup 2 -from [get_clocks clk_100m] -to [get_clocks ft601_clk_in]
set_multicycle_path -hold 1 -from [get_clocks clk_100m] -to [get_clocks ft601_clk_in]

# ============================================================================
# PHYSICAL CONSTRAINTS
# ============================================================================

# Group related pins into banks
set_property BITSTREAM.CONFIG.UNUSEDPIN Pullup [current_design]

# Place high-speed interfaces in same bank
set_property PACKAGE_PIN_BANK [BANK_NUMBER] [get_ports {ft601_data[*]}]
set_property PACKAGE_PIN_BANK [BANK_NUMBER] [get_ports {ft601_*_n}]

# ============================================================================
# END OF CONSTRAINTS
# ============================================================================
