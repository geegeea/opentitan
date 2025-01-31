// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

class uart_agent extends dv_base_agent#(
    .CFG_T          (uart_agent_cfg),
    .DRIVER_T       (uart_driver),
    .SEQUENCER_T    (uart_sequencer),
    .MONITOR_T      (uart_monitor),
    .COV_T          (uart_agent_cov)
  );
  `uvm_component_utils(uart_agent)

  `uvm_component_new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    // get uart_if handle
    if (!uvm_config_db#(virtual uart_if)::get(this, "", "vif", cfg.vif))
      `uvm_fatal(`gfn, "failed to get uart_if handle from uvm_config_db")

  endfunction

endclass
