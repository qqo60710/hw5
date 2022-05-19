VERIOG = iverilog
TARGET = lfsr.vcd
TEMP = temp.vvp

$(TARGET) : $(TEMP)
	vvp $(TEMP)

$(TEMP): testbench.v lfsr.v
	$(VERIOG) -o $(TEMP) testbench.v lfsr.v

clean:
	rm $(TARGET)
	rm $(TEMP)