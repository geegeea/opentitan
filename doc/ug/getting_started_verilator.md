# Getting started with Verilator

## About Verilator

Verilator is a cycle-accurate simulation tool.
It translates synthesizable Verilog code into a simulation program in C++, which is then compiled and executed.

## Prerequisites

_Make sure you followed the install instructions to [prepare the system]({{< relref "install_instructions#system-preparation" >}}) and to install the [software development tools]({{< relref "doc/ug/install_instructions#software-development" >}}) and [Verilator]({{< relref "install_instructions#verilator" >}})._

## Simulating a design with Verilator

First the simulation needs to built itself.

```console
$ cd $REPO_TOP
$ fusesoc --cores-root . run --target=sim --setup --build lowrisc:systems:top_earlgrey_verilator
```

Then we need to build software to run on the simulated system.
There are 3 memory types: ROM, RAM and Flash.
By default, the system will first execute out of ROM and then jump to flash.
A program needs to be built for each until ROM functionality for code download is ready.

For that purpose compile the demo program with "simulation" settings, which adjusts the frequencies to better match the simulation speed.
In the instructions below, `SW_DIR` is a requirement argument, while `SW_BUILD_DIR` is not a required argument.
If `SW_BUILD_DIR` argument is not supplied, the default location of the of output files are in `SW_DIR`
Please see [SW build flow]({{< relref "sw/device/doc/sw_build_flow" >}}) for more details.

```console
$ cd $REPO_TOP
$ make -C sw/device SIM=1 SW_DIR=boot_rom SW_BUILD_DIR=sim_boot_rom clean all
$ make -C sw/device SIM=1 SW_DIR=examples/hello_world \
  SW_BUILD_DIR=sim_hello_world clean all
```

Now the simulation can be run.
The program listed after `--rominit` and `--flashinit` are loaded into the system's respective memories and start executing immediately.

```console
$ cd $REPO_TOP
$ build/lowrisc_systems_top_earlgrey_verilator_0.1/sim-verilator/Vtop_earlgrey_verilator \
  --rominit=sw/device/sim_boot_rom/rom.vmem \
  --flashinit=sw/device/sim_hello_world/sw.vmem
```

To stop the simulation press CTRL-c.

## Interact with the simulated UART

The simulation contains code to create a virtual UART port.
When starting the simulation you should see a message like

```console
UART: Created /dev/pts/11 for uart0. Connect to it with any terminal program, e.g.
$ screen /dev/pts/11
```

Use any terminal program, e.g. `screen` to connect to the simulation.
If you only want to see the program output you can use `cat` instead.

```console
$ # to only see the program output
$ cat /dev/pts/11

$ # to interact with the simulation
$ screen /dev/pts/11
```

Note that `screen` will only show output that has been generated after `screen` starts, whilst `cat` will show output that was produced before `cat` started.

You can exit `screen` (in the default configuration) by pressing `CTRL-a k` and confirm with `y`.

## Interact with GPIO

The simulation includes a DPI module to map general-purpose I/O (GPIO) pins to two POSIX FIFO files: one for input, and one for output.
Observe the `gpio0-read` file for outputs:

```console
$ cat gpio0-read
```

To drive input pins write to the `gpio0-write` file.
A command consists of the desired state: `h` for high, and `l` for low, and the decimal pin number.
Multiple commands can be issued by separating them with a single space.

```console
$ echo 'h09 l31' > gpio0-write  # Pull the pin 9 high, and pin 31 low.
```


## Connect with OpenOCD to the JTAG port and use GDB

The simulation includes a "virtual JTAG" port to which OpenOCD can connect using its `remote_bitbang` driver.
All necessary configuration files are included in this repository.

Run the simulation, then connect with OpenOCD using the following command.

```console
$ cd $REPO_TOP
$ /tools/openocd/bin/openocd -s util/openocd -f board/lowrisc-earlgrey-verilator.cfg
```

To connect GDB use the following command (noting it needs to be altered to point to the sw binary in use).

```console
$ riscv32-unknown-elf-gdb -ex "target extended-remote :3333" -ex "info reg" sw/device/sim_hello_world/sw.elf
```

Note that debug support is not yet mature (see https://github.com/lowRISC/opentitan/issues/574).
In particular GDB cannot set breakpoints as it can't write to the (emulated) flash memory.
HW breakpoint support is planned for Ibex to allow breakpointing code in flash.

You can also run the debug compliance test suite built into OpenOCD.

```console
$ cd $REPO_TOP
$ /tools/openocd/bin/openocd -s util/openocd -f board/lowrisc-earlgrey-verilator.cfg -c 'init; riscv test_compliance; shutdown'
```

## SPI device test interface

The simulation contains code to monitor the SPI bus and provide a master interface to allow interaction with the `spi_device`.
When starting the simulation you should see a message like

```console
SPI: Created /dev/pts/4 for spi0. Connect to it with any terminal program, e.g.
$ screen /dev/pts/4
NOTE: a SPI transaction is run for every 4 characters entered.
SPI: Monitor output file created at /auto/homes/mdh10/github/opentitan/spi0.log. Works well with tail:
$ tail -f /auto/homes/mdh10/github/opentitan/spi0.log
```

Use any terminal program, e.g. `screen` or `microcom` to connect to the simulation.

```console
$ screen /dev/pts/4
```

Microcom seems less likely to send unexpected control codes when starting:
```console
$ microcom -p /dev/pts/4
```

The terminal will accept (but not echo) characters.
After 4 characters are received a 4-byte SPI packet is sent containing the characters.
The four characters received from the SPI transaction are echoed to the terminal.
The `hello_world` code will print out the bytes received from the SPI port (substituting _ for non-printable characters).
The `hello_world` code initially sets the SPI transmitter to return `SPI!` (so that should echo after the four characters are typed) and when bytes are received it will invert their bottom bit and set them for transmission in the next transfer (thus the Nth set of four characters typed should have an echo of the N-1th set with bottom bit inverted).

The SPI monitor output is written to a file.
It may be monitored with `tail -f` which conveniently notices when the file is truncated on a new run, so does not need restarting between simulations.
The output consists of a textual "waveform" representing the SPI signals.

## Software execution traces

All executed instructions in the loaded software are logged to the file `trace_core_00000000.log`.
The columns in this file are tab separated; change the tab width in your editor if the columns don't appear clearly, or open the file in a spreadsheet application.

## Generating waveforms

With the `--trace` argument the simulation generates a FST signal trace which can be viewed with Gtkwave (only).
Tracing slows down the simulation by roughly factor of 1000.

```console
$ cd $REPO_TOP
$ build/lowrisc_systems_top_earlgrey_verilator_0.1/sim-verilator/Vtop_earlgrey_verilator \
  --rominit=sw/device/sim_boot_rom/rom.vmem \
  --flashinit=sw/device/sim_hello_world/sw.vmem \
  --trace
$ gtkwave sim.fst
```
