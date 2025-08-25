import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, ClockCycles, Timer

@cocotb.test()
async def test_Timer(dut):
	# 12 MHz clock
	#cocotb.start_soon(Clock(dut.clock,83.33,units="ns").start())
	# 10 MHz clock
	cocotb.start_soon(Clock(dut.clock,100,units="ns").start())
	# await ClockCycles(dut.clock,1000)
# await Timer(10, units="ms")
# dut.rst.value=1;
# for _ in range(1000):
#		await RisingEdge(dut.clock)
# dut.rst.value=0;
	await Timer(200, units="ms")
	#dut._log.info("Finished waiting")
