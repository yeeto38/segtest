import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, ClockCycles, Timer

@cocotb.test()
async def test_SevenSeg(dut):
	cocotb.start_soon(Clock(dut.clock,84,units="ns").start())
	# await ClockCycles(dut.clock,1000)
	await Timer(20, units="ms")
	dut._log.info("Finished waiting")

