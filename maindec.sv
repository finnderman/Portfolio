
module maindec(input logic [5:0] op,
  output logic memtoreg, memwrite,
  output logic branch, bne, alusrc, zeroimm,
  output logic regdst, regwrite,
  output logic jump,
  output logic [1:0] aluop);


  logic [10:0] controls;
  assign {regwrite, regdst, alusrc, zeroimm, branch, bne, memwrite, memtoreg, jump, aluop} = controls;
  always_comb
    case(op)
      6'b000000: controls <= 11'b11000000010; // RTYPE
      6'b100011: controls <= 11'b10100001000; // LW
      6'b101011: controls <= 11'b00100010000; // SW
      6'b000100: controls <= 11'b00001000001; // BEQ
      6'b000101: controls <= 11'b00000100001; //bne
      6'b001000: controls <= 11'b10100000000; // ADDI
      6'b001101: controls <= 11'b10110000011; //ori
      6'b000010: controls <= 11'b00000000100; // J
      default: controls <= 11'bxxxxxxxxxxx; // illegal op
    endcase
endmodule