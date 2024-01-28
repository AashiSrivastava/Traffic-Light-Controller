module traffic_light_tb();
  reg clk=0,rst;
  reg x=0;
  wire [1:0] highway_light, country_light;
  
  traffic_light dut(clk,rst,x,highway_light, country_light);
  
  always begin
    #5 clk = ~clk;
  end
  
  initial begin
    rst=1;
    repeat(5) @(posedge clk);
    rst=0;
    #20;
    x=1;
    #10;
    x=0;
    #300;
    $finish;
  end
  
  initial begin
    $monitor("sensor=%d, country light=%0d, highway light=%0d", x,country_light,highway_light);
    $dumpfile("dump.vcd");
    $dumpvars();
  end
  
endmodule
    
  
  