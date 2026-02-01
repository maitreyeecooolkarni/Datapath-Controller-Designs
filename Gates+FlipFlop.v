`timescale 1ns/1ps

module top_tb;

  reg X;
  reg clk;
  reg rst;

  wire q1, q2, q3;
  wire d1, d2, d3;
  wire Z;

  top DUT (
    .X(X),
    .clk(clk),
    .rst(rst),
    .q1(q1),
    .q2(q2),
    .q3(q3),
    .d1(d1),
    .d2(d2),
    .d3(d3),
    .Z(Z)
  );

  always #5 clk = ~clk;

  initial begin

    clk = 0;
    rst = 1;
    X   = 0;


    $monitor("T=%0t | rst=%b X=%b | q1=%b q2=%b q3=%b | Z=%b",
              $time, rst, X, q1, q2, q3, Z);

    @(posedge clk) rst = 1;
   
    @(posedge clk);
    rst = 0;

    
    @(posedge clk) X = 1;
    @(posedge clk) X = 0;
    @(posedge clk) X = 1;
    @(posedge clk) X = 0;

    #20 $finish;
  end

endmodule

  
  
  
  
