#COCOTB_TOPLEVEL     := t1
#COCOTB_TEST_MODULES := t1
#MODULE=t1

# defaults (can override by environment)
SIM ?= verilator
TOPLEVEL_LANG ?= verilog

# Input things
# VERILOG_SOURCES += $(PWD)/Input.v
# VERILOG_SOURCES += $(PWD)/SevenSeg.v
# VERILOG_SOURCES += $(PWD)/SegDecode.v
#
# TOPLEVEL = Input
# MODULE = test_SevenSeg

# Timer things
VERILOG_SOURCES += Timer.v

TOPLEVEL = Timer
MODULE = test_Timer

# Verilator simulation args - enable tracing
SIM_ARGS += --trace --trace-structs --trace-fst
EXTRA_ARGS += --trace --trace-structs --trace-fst

# Enable cocotb tracing output (optional)
COCOTB_TRACE = 1

# Debug print SIM_ARGS to verify
$(info SIM_ARGS is: $(SIM_ARGS))

# Include cocotb's simulation makefile
include $(shell cocotb-config --makefiles)/Makefile.sim
