// TITLE: TRAFFIC LIGHT CONTROLLER
// DEVELOPED BY: AASHI SRIVASTAVA
// DATE: 28.01.24
//-------------------------------------------------------------

module traffic_light(input clk,rst, input x, output reg [1:0] highway_light, country_light);
  
  reg [2:0] present_state, next_state;
  parameter red=2'b00;
  parameter yellow=2'b01;
  parameter green=2'b10;
  parameter s0=3'd0,s1=3'd1,s2=3'd2,s3=3'd3,s4=3'd4,s5=3'd5;
  
  always @(posedge clk)begin
    if(rst)
      present_state<=s0; //default state
    else
      present_state<=next_state;
  end
  
  always @(*)begin
    case(present_state)
      s0:
        begin
          if(x==1)
            next_state<=s1;
          else
            next_state<=s0;
        end
      
      s1:
        begin
          repeat(3) @(posedge clk);
          next_state<=s2;
        end
      
      s2:
        begin
          repeat(2) @(posedge clk);
          next_state<=s3;
        end
      
      s3:
        begin
          if(x==1)
            next_state<=s3;
          else
            next_state<=s4;
        end
      
      s4:
        begin
          repeat(3) @(posedge clk);
          next_state<=s0;
        end
      
      default: next_state<=s0;
      
    endcase
  end
  
  
  always @(*)begin
    case(present_state)
      s0:
        begin
          highway_light<=green;
      	  country_light<=red;
        end
      s1:
        begin
          highway_light<=yellow;
      	  country_light<=red;
        end
      s2:
        begin
          highway_light<=red;
      	  country_light<=red;
        end
      s3:
        begin
          highway_light<=red;
      	  country_light<=green;
        end
      s4:
        begin
          highway_light<=red;
      	  country_light<=yellow;
        end
    endcase
  end
  
endmodule
            

      
      
    
    
    
  