module Mealy1101(
  input clk,
  input reset,
  input in,
  output reg out
);

  // Define the states using parameters
  parameter S0 = 2'b00;
  parameter S1 = 2'b01;
  parameter S2 = 2'b10;
  parameter S3 = 2'b11;
  
  reg [1:0] state;
  
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      out <= 1'b0;
      state <= S0;
    end else begin
      case (state)
        S0:
          if (in) begin
            state <= S1;
            out <= 1'b0;
          end
        S1:
          if (in) begin
            state <= S2;
            out <= 1'b0;
          end else begin
            state <= S0;
            out <= 1'b0;
          end
        S2:
          if (~in) begin
            state <= S3;
            out <= 1'b0;
          end else begin
            out <= 1'b0;
          end
        S3:
          if (in) begin
            state <= S1;
            out <= 1'b1;
          end else begin
            state <= S0;
            out <= 1'b0;
          end
      endcase
    end
  end
  
endmodule
