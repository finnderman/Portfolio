module alu (input logic [31:0] a, b, input logic[2:0] f, output logic[31:0] y, output logic zero) ;
  logic [31:0] BB ;
  logic [31:0] S ;
  logic   cout ;
  
  assign BB = (f[2]) ? ~b : b ;
  assign {cout, S} = f[2] + a + BB ;
  always @ * begin
   case (f[1:0]) 
    2'b00 : y <= a & BB ;
    2'b01 : y <= a | BB ;
    2'b10 : y <= S ;
    2'b11 : y <= {31'd0, S[31]};
   endcase
  end 
  assign zero = (y === 0) ;
   
 endmodule
