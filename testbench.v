module testbench;
  reg clk;
  reg clr;
  parameter PERIOD = 20;
  parameter real DUTY_CYCLE = 0.5;
  parameter OFFSET = 0;
  initial begin
    #OFFSET;
    forever begin
      clk = 1'b0;
      #(PERIOD-(PERIOD*DUTY_CYCLE)) clk = 1'b1;
      #(PERIOD*DUTY_CYCLE);
    end
  end
  initial begin
    clr = 1'b1;
    #50 clr = 1'b0;
    #200 clr = 1'b1;
    #50 clr = 1'b0;
    #200 $finish;
  end
  initial begin
    $dumpfile("lfsr.vcd");
    $dumpvars(0, lfsr);
  end
  LFSR lfsr(.clk(clk), .reset(clr));
endmodule