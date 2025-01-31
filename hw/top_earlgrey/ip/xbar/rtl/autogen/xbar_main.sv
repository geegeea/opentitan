// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// xbar_main module generated by `tlgen.py` tool
// all reset signals should be generated from one reset signal to not make any deadlock
//
// Interconnect
// corei
//   -> s1n_18
//     -> sm1_19
//       -> rom
//     -> sm1_20
//       -> debug_mem
//     -> sm1_21
//       -> ram_main
//     -> sm1_22
//       -> eflash
// cored
//   -> s1n_23
//     -> sm1_19
//       -> rom
//     -> sm1_20
//       -> debug_mem
//     -> sm1_21
//       -> ram_main
//     -> sm1_22
//       -> eflash
//     -> sm1_24
//       -> uart
//     -> sm1_25
//       -> gpio
//     -> sm1_26
//       -> spi_device
//     -> sm1_27
//       -> flash_ctrl
//     -> sm1_28
//       -> rv_timer
//     -> sm1_29
//       -> aes
//     -> sm1_30
//       -> hmac
//     -> sm1_31
//       -> rv_plic
//     -> sm1_32
//       -> pinmux
//     -> sm1_33
//       -> alert_handler
//     -> sm1_34
//       -> nmi_gen
// dm_sba
//   -> s1n_35
//     -> sm1_19
//       -> rom
//     -> sm1_21
//       -> ram_main
//     -> sm1_22
//       -> eflash
//     -> sm1_24
//       -> uart
//     -> sm1_25
//       -> gpio
//     -> sm1_26
//       -> spi_device
//     -> sm1_27
//       -> flash_ctrl
//     -> sm1_28
//       -> rv_timer
//     -> sm1_29
//       -> aes
//     -> sm1_30
//       -> hmac
//     -> sm1_31
//       -> rv_plic
//     -> sm1_32
//       -> pinmux
//     -> sm1_33
//       -> alert_handler
//     -> sm1_34
//       -> nmi_gen

module xbar_main (
  input clk_main_i,
  input rst_main_ni,

  // Host interfaces
  input  tlul_pkg::tl_h2d_t tl_corei_i,
  output tlul_pkg::tl_d2h_t tl_corei_o,
  input  tlul_pkg::tl_h2d_t tl_cored_i,
  output tlul_pkg::tl_d2h_t tl_cored_o,
  input  tlul_pkg::tl_h2d_t tl_dm_sba_i,
  output tlul_pkg::tl_d2h_t tl_dm_sba_o,

  // Device interfaces
  output tlul_pkg::tl_h2d_t tl_rom_o,
  input  tlul_pkg::tl_d2h_t tl_rom_i,
  output tlul_pkg::tl_h2d_t tl_debug_mem_o,
  input  tlul_pkg::tl_d2h_t tl_debug_mem_i,
  output tlul_pkg::tl_h2d_t tl_ram_main_o,
  input  tlul_pkg::tl_d2h_t tl_ram_main_i,
  output tlul_pkg::tl_h2d_t tl_eflash_o,
  input  tlul_pkg::tl_d2h_t tl_eflash_i,
  output tlul_pkg::tl_h2d_t tl_uart_o,
  input  tlul_pkg::tl_d2h_t tl_uart_i,
  output tlul_pkg::tl_h2d_t tl_gpio_o,
  input  tlul_pkg::tl_d2h_t tl_gpio_i,
  output tlul_pkg::tl_h2d_t tl_spi_device_o,
  input  tlul_pkg::tl_d2h_t tl_spi_device_i,
  output tlul_pkg::tl_h2d_t tl_flash_ctrl_o,
  input  tlul_pkg::tl_d2h_t tl_flash_ctrl_i,
  output tlul_pkg::tl_h2d_t tl_rv_timer_o,
  input  tlul_pkg::tl_d2h_t tl_rv_timer_i,
  output tlul_pkg::tl_h2d_t tl_hmac_o,
  input  tlul_pkg::tl_d2h_t tl_hmac_i,
  output tlul_pkg::tl_h2d_t tl_aes_o,
  input  tlul_pkg::tl_d2h_t tl_aes_i,
  output tlul_pkg::tl_h2d_t tl_rv_plic_o,
  input  tlul_pkg::tl_d2h_t tl_rv_plic_i,
  output tlul_pkg::tl_h2d_t tl_pinmux_o,
  input  tlul_pkg::tl_d2h_t tl_pinmux_i,
  output tlul_pkg::tl_h2d_t tl_alert_handler_o,
  input  tlul_pkg::tl_d2h_t tl_alert_handler_i,
  output tlul_pkg::tl_h2d_t tl_nmi_gen_o,
  input  tlul_pkg::tl_d2h_t tl_nmi_gen_i,

  input scanmode_i
);

  import tlul_pkg::*;
  import tl_main_pkg::*;

  // scanmode_i is currently not used, but provisioned for future use
  // this assignment prevents lint warnings
  logic unused_scanmode;
  assign unused_scanmode = scanmode_i;

  tl_h2d_t tl_s1n_18_us_h2d ;
  tl_d2h_t tl_s1n_18_us_d2h ;


  tl_h2d_t tl_s1n_18_ds_h2d [4];
  tl_d2h_t tl_s1n_18_ds_d2h [4];

  // Create steering signal
  logic [2:0] dev_sel_s1n_18;


  tl_h2d_t tl_sm1_19_us_h2d [3];
  tl_d2h_t tl_sm1_19_us_d2h [3];

  tl_h2d_t tl_sm1_19_ds_h2d ;
  tl_d2h_t tl_sm1_19_ds_d2h ;


  tl_h2d_t tl_sm1_20_us_h2d [2];
  tl_d2h_t tl_sm1_20_us_d2h [2];

  tl_h2d_t tl_sm1_20_ds_h2d ;
  tl_d2h_t tl_sm1_20_ds_d2h ;


  tl_h2d_t tl_sm1_21_us_h2d [3];
  tl_d2h_t tl_sm1_21_us_d2h [3];

  tl_h2d_t tl_sm1_21_ds_h2d ;
  tl_d2h_t tl_sm1_21_ds_d2h ;


  tl_h2d_t tl_sm1_22_us_h2d [3];
  tl_d2h_t tl_sm1_22_us_d2h [3];

  tl_h2d_t tl_sm1_22_ds_h2d ;
  tl_d2h_t tl_sm1_22_ds_d2h ;

  tl_h2d_t tl_s1n_23_us_h2d ;
  tl_d2h_t tl_s1n_23_us_d2h ;


  tl_h2d_t tl_s1n_23_ds_h2d [15];
  tl_d2h_t tl_s1n_23_ds_d2h [15];

  // Create steering signal
  logic [3:0] dev_sel_s1n_23;


  tl_h2d_t tl_sm1_24_us_h2d [2];
  tl_d2h_t tl_sm1_24_us_d2h [2];

  tl_h2d_t tl_sm1_24_ds_h2d ;
  tl_d2h_t tl_sm1_24_ds_d2h ;


  tl_h2d_t tl_sm1_25_us_h2d [2];
  tl_d2h_t tl_sm1_25_us_d2h [2];

  tl_h2d_t tl_sm1_25_ds_h2d ;
  tl_d2h_t tl_sm1_25_ds_d2h ;


  tl_h2d_t tl_sm1_26_us_h2d [2];
  tl_d2h_t tl_sm1_26_us_d2h [2];

  tl_h2d_t tl_sm1_26_ds_h2d ;
  tl_d2h_t tl_sm1_26_ds_d2h ;


  tl_h2d_t tl_sm1_27_us_h2d [2];
  tl_d2h_t tl_sm1_27_us_d2h [2];

  tl_h2d_t tl_sm1_27_ds_h2d ;
  tl_d2h_t tl_sm1_27_ds_d2h ;


  tl_h2d_t tl_sm1_28_us_h2d [2];
  tl_d2h_t tl_sm1_28_us_d2h [2];

  tl_h2d_t tl_sm1_28_ds_h2d ;
  tl_d2h_t tl_sm1_28_ds_d2h ;


  tl_h2d_t tl_sm1_29_us_h2d [2];
  tl_d2h_t tl_sm1_29_us_d2h [2];

  tl_h2d_t tl_sm1_29_ds_h2d ;
  tl_d2h_t tl_sm1_29_ds_d2h ;


  tl_h2d_t tl_sm1_30_us_h2d [2];
  tl_d2h_t tl_sm1_30_us_d2h [2];

  tl_h2d_t tl_sm1_30_ds_h2d ;
  tl_d2h_t tl_sm1_30_ds_d2h ;


  tl_h2d_t tl_sm1_31_us_h2d [2];
  tl_d2h_t tl_sm1_31_us_d2h [2];

  tl_h2d_t tl_sm1_31_ds_h2d ;
  tl_d2h_t tl_sm1_31_ds_d2h ;


  tl_h2d_t tl_sm1_32_us_h2d [2];
  tl_d2h_t tl_sm1_32_us_d2h [2];

  tl_h2d_t tl_sm1_32_ds_h2d ;
  tl_d2h_t tl_sm1_32_ds_d2h ;


  tl_h2d_t tl_sm1_33_us_h2d [2];
  tl_d2h_t tl_sm1_33_us_d2h [2];

  tl_h2d_t tl_sm1_33_ds_h2d ;
  tl_d2h_t tl_sm1_33_ds_d2h ;


  tl_h2d_t tl_sm1_34_us_h2d [2];
  tl_d2h_t tl_sm1_34_us_d2h [2];

  tl_h2d_t tl_sm1_34_ds_h2d ;
  tl_d2h_t tl_sm1_34_ds_d2h ;

  tl_h2d_t tl_s1n_35_us_h2d ;
  tl_d2h_t tl_s1n_35_us_d2h ;


  tl_h2d_t tl_s1n_35_ds_h2d [14];
  tl_d2h_t tl_s1n_35_ds_d2h [14];

  // Create steering signal
  logic [3:0] dev_sel_s1n_35;



  assign tl_sm1_19_us_h2d[0] = tl_s1n_18_ds_h2d[0];
  assign tl_s1n_18_ds_d2h[0] = tl_sm1_19_us_d2h[0];

  assign tl_sm1_20_us_h2d[0] = tl_s1n_18_ds_h2d[1];
  assign tl_s1n_18_ds_d2h[1] = tl_sm1_20_us_d2h[0];

  assign tl_sm1_21_us_h2d[0] = tl_s1n_18_ds_h2d[2];
  assign tl_s1n_18_ds_d2h[2] = tl_sm1_21_us_d2h[0];

  assign tl_sm1_22_us_h2d[0] = tl_s1n_18_ds_h2d[3];
  assign tl_s1n_18_ds_d2h[3] = tl_sm1_22_us_d2h[0];

  assign tl_sm1_19_us_h2d[1] = tl_s1n_23_ds_h2d[0];
  assign tl_s1n_23_ds_d2h[0] = tl_sm1_19_us_d2h[1];

  assign tl_sm1_20_us_h2d[1] = tl_s1n_23_ds_h2d[1];
  assign tl_s1n_23_ds_d2h[1] = tl_sm1_20_us_d2h[1];

  assign tl_sm1_21_us_h2d[1] = tl_s1n_23_ds_h2d[2];
  assign tl_s1n_23_ds_d2h[2] = tl_sm1_21_us_d2h[1];

  assign tl_sm1_22_us_h2d[1] = tl_s1n_23_ds_h2d[3];
  assign tl_s1n_23_ds_d2h[3] = tl_sm1_22_us_d2h[1];

  assign tl_sm1_24_us_h2d[0] = tl_s1n_23_ds_h2d[4];
  assign tl_s1n_23_ds_d2h[4] = tl_sm1_24_us_d2h[0];

  assign tl_sm1_25_us_h2d[0] = tl_s1n_23_ds_h2d[5];
  assign tl_s1n_23_ds_d2h[5] = tl_sm1_25_us_d2h[0];

  assign tl_sm1_26_us_h2d[0] = tl_s1n_23_ds_h2d[6];
  assign tl_s1n_23_ds_d2h[6] = tl_sm1_26_us_d2h[0];

  assign tl_sm1_27_us_h2d[0] = tl_s1n_23_ds_h2d[7];
  assign tl_s1n_23_ds_d2h[7] = tl_sm1_27_us_d2h[0];

  assign tl_sm1_28_us_h2d[0] = tl_s1n_23_ds_h2d[8];
  assign tl_s1n_23_ds_d2h[8] = tl_sm1_28_us_d2h[0];

  assign tl_sm1_29_us_h2d[0] = tl_s1n_23_ds_h2d[9];
  assign tl_s1n_23_ds_d2h[9] = tl_sm1_29_us_d2h[0];

  assign tl_sm1_30_us_h2d[0] = tl_s1n_23_ds_h2d[10];
  assign tl_s1n_23_ds_d2h[10] = tl_sm1_30_us_d2h[0];

  assign tl_sm1_31_us_h2d[0] = tl_s1n_23_ds_h2d[11];
  assign tl_s1n_23_ds_d2h[11] = tl_sm1_31_us_d2h[0];

  assign tl_sm1_32_us_h2d[0] = tl_s1n_23_ds_h2d[12];
  assign tl_s1n_23_ds_d2h[12] = tl_sm1_32_us_d2h[0];

  assign tl_sm1_33_us_h2d[0] = tl_s1n_23_ds_h2d[13];
  assign tl_s1n_23_ds_d2h[13] = tl_sm1_33_us_d2h[0];

  assign tl_sm1_34_us_h2d[0] = tl_s1n_23_ds_h2d[14];
  assign tl_s1n_23_ds_d2h[14] = tl_sm1_34_us_d2h[0];

  assign tl_sm1_19_us_h2d[2] = tl_s1n_35_ds_h2d[0];
  assign tl_s1n_35_ds_d2h[0] = tl_sm1_19_us_d2h[2];

  assign tl_sm1_21_us_h2d[2] = tl_s1n_35_ds_h2d[1];
  assign tl_s1n_35_ds_d2h[1] = tl_sm1_21_us_d2h[2];

  assign tl_sm1_22_us_h2d[2] = tl_s1n_35_ds_h2d[2];
  assign tl_s1n_35_ds_d2h[2] = tl_sm1_22_us_d2h[2];

  assign tl_sm1_24_us_h2d[1] = tl_s1n_35_ds_h2d[3];
  assign tl_s1n_35_ds_d2h[3] = tl_sm1_24_us_d2h[1];

  assign tl_sm1_25_us_h2d[1] = tl_s1n_35_ds_h2d[4];
  assign tl_s1n_35_ds_d2h[4] = tl_sm1_25_us_d2h[1];

  assign tl_sm1_26_us_h2d[1] = tl_s1n_35_ds_h2d[5];
  assign tl_s1n_35_ds_d2h[5] = tl_sm1_26_us_d2h[1];

  assign tl_sm1_27_us_h2d[1] = tl_s1n_35_ds_h2d[6];
  assign tl_s1n_35_ds_d2h[6] = tl_sm1_27_us_d2h[1];

  assign tl_sm1_28_us_h2d[1] = tl_s1n_35_ds_h2d[7];
  assign tl_s1n_35_ds_d2h[7] = tl_sm1_28_us_d2h[1];

  assign tl_sm1_29_us_h2d[1] = tl_s1n_35_ds_h2d[8];
  assign tl_s1n_35_ds_d2h[8] = tl_sm1_29_us_d2h[1];

  assign tl_sm1_30_us_h2d[1] = tl_s1n_35_ds_h2d[9];
  assign tl_s1n_35_ds_d2h[9] = tl_sm1_30_us_d2h[1];

  assign tl_sm1_31_us_h2d[1] = tl_s1n_35_ds_h2d[10];
  assign tl_s1n_35_ds_d2h[10] = tl_sm1_31_us_d2h[1];

  assign tl_sm1_32_us_h2d[1] = tl_s1n_35_ds_h2d[11];
  assign tl_s1n_35_ds_d2h[11] = tl_sm1_32_us_d2h[1];

  assign tl_sm1_33_us_h2d[1] = tl_s1n_35_ds_h2d[12];
  assign tl_s1n_35_ds_d2h[12] = tl_sm1_33_us_d2h[1];

  assign tl_sm1_34_us_h2d[1] = tl_s1n_35_ds_h2d[13];
  assign tl_s1n_35_ds_d2h[13] = tl_sm1_34_us_d2h[1];

  assign tl_s1n_18_us_h2d = tl_corei_i;
  assign tl_corei_o = tl_s1n_18_us_d2h;

  assign tl_rom_o = tl_sm1_19_ds_h2d;
  assign tl_sm1_19_ds_d2h = tl_rom_i;

  assign tl_debug_mem_o = tl_sm1_20_ds_h2d;
  assign tl_sm1_20_ds_d2h = tl_debug_mem_i;

  assign tl_ram_main_o = tl_sm1_21_ds_h2d;
  assign tl_sm1_21_ds_d2h = tl_ram_main_i;

  assign tl_eflash_o = tl_sm1_22_ds_h2d;
  assign tl_sm1_22_ds_d2h = tl_eflash_i;

  assign tl_s1n_23_us_h2d = tl_cored_i;
  assign tl_cored_o = tl_s1n_23_us_d2h;

  assign tl_uart_o = tl_sm1_24_ds_h2d;
  assign tl_sm1_24_ds_d2h = tl_uart_i;

  assign tl_gpio_o = tl_sm1_25_ds_h2d;
  assign tl_sm1_25_ds_d2h = tl_gpio_i;

  assign tl_spi_device_o = tl_sm1_26_ds_h2d;
  assign tl_sm1_26_ds_d2h = tl_spi_device_i;

  assign tl_flash_ctrl_o = tl_sm1_27_ds_h2d;
  assign tl_sm1_27_ds_d2h = tl_flash_ctrl_i;

  assign tl_rv_timer_o = tl_sm1_28_ds_h2d;
  assign tl_sm1_28_ds_d2h = tl_rv_timer_i;

  assign tl_aes_o = tl_sm1_29_ds_h2d;
  assign tl_sm1_29_ds_d2h = tl_aes_i;

  assign tl_hmac_o = tl_sm1_30_ds_h2d;
  assign tl_sm1_30_ds_d2h = tl_hmac_i;

  assign tl_rv_plic_o = tl_sm1_31_ds_h2d;
  assign tl_sm1_31_ds_d2h = tl_rv_plic_i;

  assign tl_pinmux_o = tl_sm1_32_ds_h2d;
  assign tl_sm1_32_ds_d2h = tl_pinmux_i;

  assign tl_alert_handler_o = tl_sm1_33_ds_h2d;
  assign tl_sm1_33_ds_d2h = tl_alert_handler_i;

  assign tl_nmi_gen_o = tl_sm1_34_ds_h2d;
  assign tl_sm1_34_ds_d2h = tl_nmi_gen_i;

  assign tl_s1n_35_us_h2d = tl_dm_sba_i;
  assign tl_dm_sba_o = tl_s1n_35_us_d2h;

  always_comb begin
    // default steering to generate error response if address is not within the range
    dev_sel_s1n_18 = 3'd4;
    if ((tl_s1n_18_us_h2d.a_address & ~(ADDR_MASK_ROM)) == ADDR_SPACE_ROM) begin
      dev_sel_s1n_18 = 3'd0;
    end else if ((tl_s1n_18_us_h2d.a_address & ~(ADDR_MASK_DEBUG_MEM)) == ADDR_SPACE_DEBUG_MEM) begin
      dev_sel_s1n_18 = 3'd1;
    end else if ((tl_s1n_18_us_h2d.a_address & ~(ADDR_MASK_RAM_MAIN)) == ADDR_SPACE_RAM_MAIN) begin
      dev_sel_s1n_18 = 3'd2;
    end else if ((tl_s1n_18_us_h2d.a_address & ~(ADDR_MASK_EFLASH)) == ADDR_SPACE_EFLASH) begin
      dev_sel_s1n_18 = 3'd3;
    end
  end

  always_comb begin
    // default steering to generate error response if address is not within the range
    dev_sel_s1n_23 = 4'd15;
    if ((tl_s1n_23_us_h2d.a_address & ~(ADDR_MASK_ROM)) == ADDR_SPACE_ROM) begin
      dev_sel_s1n_23 = 4'd0;
    end else if ((tl_s1n_23_us_h2d.a_address & ~(ADDR_MASK_DEBUG_MEM)) == ADDR_SPACE_DEBUG_MEM) begin
      dev_sel_s1n_23 = 4'd1;
    end else if ((tl_s1n_23_us_h2d.a_address & ~(ADDR_MASK_RAM_MAIN)) == ADDR_SPACE_RAM_MAIN) begin
      dev_sel_s1n_23 = 4'd2;
    end else if ((tl_s1n_23_us_h2d.a_address & ~(ADDR_MASK_EFLASH)) == ADDR_SPACE_EFLASH) begin
      dev_sel_s1n_23 = 4'd3;
    end else if ((tl_s1n_23_us_h2d.a_address & ~(ADDR_MASK_UART)) == ADDR_SPACE_UART) begin
      dev_sel_s1n_23 = 4'd4;
    end else if ((tl_s1n_23_us_h2d.a_address & ~(ADDR_MASK_GPIO)) == ADDR_SPACE_GPIO) begin
      dev_sel_s1n_23 = 4'd5;
    end else if ((tl_s1n_23_us_h2d.a_address & ~(ADDR_MASK_SPI_DEVICE)) == ADDR_SPACE_SPI_DEVICE) begin
      dev_sel_s1n_23 = 4'd6;
    end else if ((tl_s1n_23_us_h2d.a_address & ~(ADDR_MASK_FLASH_CTRL)) == ADDR_SPACE_FLASH_CTRL) begin
      dev_sel_s1n_23 = 4'd7;
    end else if ((tl_s1n_23_us_h2d.a_address & ~(ADDR_MASK_RV_TIMER)) == ADDR_SPACE_RV_TIMER) begin
      dev_sel_s1n_23 = 4'd8;
    end else if ((tl_s1n_23_us_h2d.a_address & ~(ADDR_MASK_AES)) == ADDR_SPACE_AES) begin
      dev_sel_s1n_23 = 4'd9;
    end else if ((tl_s1n_23_us_h2d.a_address & ~(ADDR_MASK_HMAC)) == ADDR_SPACE_HMAC) begin
      dev_sel_s1n_23 = 4'd10;
    end else if ((tl_s1n_23_us_h2d.a_address & ~(ADDR_MASK_RV_PLIC)) == ADDR_SPACE_RV_PLIC) begin
      dev_sel_s1n_23 = 4'd11;
    end else if ((tl_s1n_23_us_h2d.a_address & ~(ADDR_MASK_PINMUX)) == ADDR_SPACE_PINMUX) begin
      dev_sel_s1n_23 = 4'd12;
    end else if ((tl_s1n_23_us_h2d.a_address & ~(ADDR_MASK_ALERT_HANDLER)) == ADDR_SPACE_ALERT_HANDLER) begin
      dev_sel_s1n_23 = 4'd13;
    end else if ((tl_s1n_23_us_h2d.a_address & ~(ADDR_MASK_NMI_GEN)) == ADDR_SPACE_NMI_GEN) begin
      dev_sel_s1n_23 = 4'd14;
    end
  end

  always_comb begin
    // default steering to generate error response if address is not within the range
    dev_sel_s1n_35 = 4'd14;
    if ((tl_s1n_35_us_h2d.a_address & ~(ADDR_MASK_ROM)) == ADDR_SPACE_ROM) begin
      dev_sel_s1n_35 = 4'd0;
    end else if ((tl_s1n_35_us_h2d.a_address & ~(ADDR_MASK_RAM_MAIN)) == ADDR_SPACE_RAM_MAIN) begin
      dev_sel_s1n_35 = 4'd1;
    end else if ((tl_s1n_35_us_h2d.a_address & ~(ADDR_MASK_EFLASH)) == ADDR_SPACE_EFLASH) begin
      dev_sel_s1n_35 = 4'd2;
    end else if ((tl_s1n_35_us_h2d.a_address & ~(ADDR_MASK_UART)) == ADDR_SPACE_UART) begin
      dev_sel_s1n_35 = 4'd3;
    end else if ((tl_s1n_35_us_h2d.a_address & ~(ADDR_MASK_GPIO)) == ADDR_SPACE_GPIO) begin
      dev_sel_s1n_35 = 4'd4;
    end else if ((tl_s1n_35_us_h2d.a_address & ~(ADDR_MASK_SPI_DEVICE)) == ADDR_SPACE_SPI_DEVICE) begin
      dev_sel_s1n_35 = 4'd5;
    end else if ((tl_s1n_35_us_h2d.a_address & ~(ADDR_MASK_FLASH_CTRL)) == ADDR_SPACE_FLASH_CTRL) begin
      dev_sel_s1n_35 = 4'd6;
    end else if ((tl_s1n_35_us_h2d.a_address & ~(ADDR_MASK_RV_TIMER)) == ADDR_SPACE_RV_TIMER) begin
      dev_sel_s1n_35 = 4'd7;
    end else if ((tl_s1n_35_us_h2d.a_address & ~(ADDR_MASK_AES)) == ADDR_SPACE_AES) begin
      dev_sel_s1n_35 = 4'd8;
    end else if ((tl_s1n_35_us_h2d.a_address & ~(ADDR_MASK_HMAC)) == ADDR_SPACE_HMAC) begin
      dev_sel_s1n_35 = 4'd9;
    end else if ((tl_s1n_35_us_h2d.a_address & ~(ADDR_MASK_RV_PLIC)) == ADDR_SPACE_RV_PLIC) begin
      dev_sel_s1n_35 = 4'd10;
    end else if ((tl_s1n_35_us_h2d.a_address & ~(ADDR_MASK_PINMUX)) == ADDR_SPACE_PINMUX) begin
      dev_sel_s1n_35 = 4'd11;
    end else if ((tl_s1n_35_us_h2d.a_address & ~(ADDR_MASK_ALERT_HANDLER)) == ADDR_SPACE_ALERT_HANDLER) begin
      dev_sel_s1n_35 = 4'd12;
    end else if ((tl_s1n_35_us_h2d.a_address & ~(ADDR_MASK_NMI_GEN)) == ADDR_SPACE_NMI_GEN) begin
      dev_sel_s1n_35 = 4'd13;
    end
  end


  // Instantiation phase
  tlul_socket_1n #(
    .HReqDepth (4'h0),
    .HRspDepth (4'h0),
    .DReqDepth ({4{4'h0}}),
    .DRspDepth ({4{4'h0}}),
    .N         (4)
  ) u_s1n_18 (
    .clk_i        (clk_main_i),
    .rst_ni       (rst_main_ni),
    .tl_h_i       (tl_s1n_18_us_h2d),
    .tl_h_o       (tl_s1n_18_us_d2h),
    .tl_d_o       (tl_s1n_18_ds_h2d),
    .tl_d_i       (tl_s1n_18_ds_d2h),
    .dev_select   (dev_sel_s1n_18)
  );
  tlul_socket_m1 #(
    .HReqDepth ({3{4'h0}}),
    .HRspDepth ({3{4'h0}}),
    .DReqDepth (4'h0),
    .DRspDepth (4'h0),
    .M         (3)
  ) u_sm1_19 (
    .clk_i        (clk_main_i),
    .rst_ni       (rst_main_ni),
    .tl_h_i       (tl_sm1_19_us_h2d),
    .tl_h_o       (tl_sm1_19_us_d2h),
    .tl_d_o       (tl_sm1_19_ds_h2d),
    .tl_d_i       (tl_sm1_19_ds_d2h)
  );
  tlul_socket_m1 #(
    .HReqPass  (2'h0),
    .HRspPass  (2'h0),
    .DReqPass  (1'b0),
    .DRspPass  (1'b0),
    .M         (2)
  ) u_sm1_20 (
    .clk_i        (clk_main_i),
    .rst_ni       (rst_main_ni),
    .tl_h_i       (tl_sm1_20_us_h2d),
    .tl_h_o       (tl_sm1_20_us_d2h),
    .tl_d_o       (tl_sm1_20_ds_h2d),
    .tl_d_i       (tl_sm1_20_ds_d2h)
  );
  tlul_socket_m1 #(
    .HReqDepth ({3{4'h0}}),
    .HRspDepth ({3{4'h0}}),
    .DReqDepth (4'h0),
    .DRspDepth (4'h0),
    .M         (3)
  ) u_sm1_21 (
    .clk_i        (clk_main_i),
    .rst_ni       (rst_main_ni),
    .tl_h_i       (tl_sm1_21_us_h2d),
    .tl_h_o       (tl_sm1_21_us_d2h),
    .tl_d_o       (tl_sm1_21_ds_h2d),
    .tl_d_i       (tl_sm1_21_ds_d2h)
  );
  tlul_socket_m1 #(
    .HReqDepth ({3{4'h0}}),
    .HRspDepth ({3{4'h0}}),
    .DReqDepth (4'h0),
    .DRspDepth (4'h0),
    .M         (3)
  ) u_sm1_22 (
    .clk_i        (clk_main_i),
    .rst_ni       (rst_main_ni),
    .tl_h_i       (tl_sm1_22_us_h2d),
    .tl_h_o       (tl_sm1_22_us_d2h),
    .tl_d_o       (tl_sm1_22_ds_h2d),
    .tl_d_i       (tl_sm1_22_ds_d2h)
  );
  tlul_socket_1n #(
    .HReqDepth (4'h0),
    .HRspDepth (4'h0),
    .DReqDepth ({15{4'h0}}),
    .DRspDepth ({15{4'h0}}),
    .N         (15)
  ) u_s1n_23 (
    .clk_i        (clk_main_i),
    .rst_ni       (rst_main_ni),
    .tl_h_i       (tl_s1n_23_us_h2d),
    .tl_h_o       (tl_s1n_23_us_d2h),
    .tl_d_o       (tl_s1n_23_ds_h2d),
    .tl_d_i       (tl_s1n_23_ds_d2h),
    .dev_select   (dev_sel_s1n_23)
  );
  tlul_socket_m1 #(
    .HReqPass  (2'h0),
    .HRspPass  (2'h0),
    .DReqPass  (1'b0),
    .DRspPass  (1'b0),
    .M         (2)
  ) u_sm1_24 (
    .clk_i        (clk_main_i),
    .rst_ni       (rst_main_ni),
    .tl_h_i       (tl_sm1_24_us_h2d),
    .tl_h_o       (tl_sm1_24_us_d2h),
    .tl_d_o       (tl_sm1_24_ds_h2d),
    .tl_d_i       (tl_sm1_24_ds_d2h)
  );
  tlul_socket_m1 #(
    .HReqPass  (2'h0),
    .HRspPass  (2'h0),
    .DReqPass  (1'b0),
    .DRspPass  (1'b0),
    .M         (2)
  ) u_sm1_25 (
    .clk_i        (clk_main_i),
    .rst_ni       (rst_main_ni),
    .tl_h_i       (tl_sm1_25_us_h2d),
    .tl_h_o       (tl_sm1_25_us_d2h),
    .tl_d_o       (tl_sm1_25_ds_h2d),
    .tl_d_i       (tl_sm1_25_ds_d2h)
  );
  tlul_socket_m1 #(
    .HReqPass  (2'h0),
    .HRspPass  (2'h0),
    .DReqPass  (1'b0),
    .DRspPass  (1'b0),
    .M         (2)
  ) u_sm1_26 (
    .clk_i        (clk_main_i),
    .rst_ni       (rst_main_ni),
    .tl_h_i       (tl_sm1_26_us_h2d),
    .tl_h_o       (tl_sm1_26_us_d2h),
    .tl_d_o       (tl_sm1_26_ds_h2d),
    .tl_d_i       (tl_sm1_26_ds_d2h)
  );
  tlul_socket_m1 #(
    .HReqPass  (2'h0),
    .HRspPass  (2'h0),
    .DReqPass  (1'b0),
    .DRspPass  (1'b0),
    .M         (2)
  ) u_sm1_27 (
    .clk_i        (clk_main_i),
    .rst_ni       (rst_main_ni),
    .tl_h_i       (tl_sm1_27_us_h2d),
    .tl_h_o       (tl_sm1_27_us_d2h),
    .tl_d_o       (tl_sm1_27_ds_h2d),
    .tl_d_i       (tl_sm1_27_ds_d2h)
  );
  tlul_socket_m1 #(
    .HReqPass  (2'h0),
    .HRspPass  (2'h0),
    .DReqPass  (1'b0),
    .DRspPass  (1'b0),
    .M         (2)
  ) u_sm1_28 (
    .clk_i        (clk_main_i),
    .rst_ni       (rst_main_ni),
    .tl_h_i       (tl_sm1_28_us_h2d),
    .tl_h_o       (tl_sm1_28_us_d2h),
    .tl_d_o       (tl_sm1_28_ds_h2d),
    .tl_d_i       (tl_sm1_28_ds_d2h)
  );
  tlul_socket_m1 #(
    .HReqPass  (2'h0),
    .HRspPass  (2'h0),
    .DReqPass  (1'b0),
    .DRspPass  (1'b0),
    .M         (2)
  ) u_sm1_29 (
    .clk_i        (clk_main_i),
    .rst_ni       (rst_main_ni),
    .tl_h_i       (tl_sm1_29_us_h2d),
    .tl_h_o       (tl_sm1_29_us_d2h),
    .tl_d_o       (tl_sm1_29_ds_h2d),
    .tl_d_i       (tl_sm1_29_ds_d2h)
  );
  tlul_socket_m1 #(
    .HReqPass  (2'h0),
    .HRspPass  (2'h0),
    .DReqPass  (1'b0),
    .DRspPass  (1'b0),
    .M         (2)
  ) u_sm1_30 (
    .clk_i        (clk_main_i),
    .rst_ni       (rst_main_ni),
    .tl_h_i       (tl_sm1_30_us_h2d),
    .tl_h_o       (tl_sm1_30_us_d2h),
    .tl_d_o       (tl_sm1_30_ds_h2d),
    .tl_d_i       (tl_sm1_30_ds_d2h)
  );
  tlul_socket_m1 #(
    .HReqPass  (2'h0),
    .HRspPass  (2'h0),
    .DReqPass  (1'b0),
    .DRspPass  (1'b0),
    .M         (2)
  ) u_sm1_31 (
    .clk_i        (clk_main_i),
    .rst_ni       (rst_main_ni),
    .tl_h_i       (tl_sm1_31_us_h2d),
    .tl_h_o       (tl_sm1_31_us_d2h),
    .tl_d_o       (tl_sm1_31_ds_h2d),
    .tl_d_i       (tl_sm1_31_ds_d2h)
  );
  tlul_socket_m1 #(
    .HReqPass  (2'h0),
    .HRspPass  (2'h0),
    .DReqPass  (1'b0),
    .DRspPass  (1'b0),
    .M         (2)
  ) u_sm1_32 (
    .clk_i        (clk_main_i),
    .rst_ni       (rst_main_ni),
    .tl_h_i       (tl_sm1_32_us_h2d),
    .tl_h_o       (tl_sm1_32_us_d2h),
    .tl_d_o       (tl_sm1_32_ds_h2d),
    .tl_d_i       (tl_sm1_32_ds_d2h)
  );
  tlul_socket_m1 #(
    .HReqPass  (2'h0),
    .HRspPass  (2'h0),
    .DReqPass  (1'b0),
    .DRspPass  (1'b0),
    .M         (2)
  ) u_sm1_33 (
    .clk_i        (clk_main_i),
    .rst_ni       (rst_main_ni),
    .tl_h_i       (tl_sm1_33_us_h2d),
    .tl_h_o       (tl_sm1_33_us_d2h),
    .tl_d_o       (tl_sm1_33_ds_h2d),
    .tl_d_i       (tl_sm1_33_ds_d2h)
  );
  tlul_socket_m1 #(
    .HReqPass  (2'h0),
    .HRspPass  (2'h0),
    .DReqPass  (1'b0),
    .DRspPass  (1'b0),
    .M         (2)
  ) u_sm1_34 (
    .clk_i        (clk_main_i),
    .rst_ni       (rst_main_ni),
    .tl_h_i       (tl_sm1_34_us_h2d),
    .tl_h_o       (tl_sm1_34_us_d2h),
    .tl_d_o       (tl_sm1_34_ds_h2d),
    .tl_d_i       (tl_sm1_34_ds_d2h)
  );
  tlul_socket_1n #(
    .HReqPass  (1'b0),
    .HRspPass  (1'b0),
    .DReqPass  (14'h0),
    .DRspPass  (14'h0),
    .N         (14)
  ) u_s1n_35 (
    .clk_i        (clk_main_i),
    .rst_ni       (rst_main_ni),
    .tl_h_i       (tl_s1n_35_us_h2d),
    .tl_h_o       (tl_s1n_35_us_d2h),
    .tl_d_o       (tl_s1n_35_ds_h2d),
    .tl_d_i       (tl_s1n_35_ds_d2h),
    .dev_select   (dev_sel_s1n_35)
  );

endmodule
