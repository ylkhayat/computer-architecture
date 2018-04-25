module control_unit (regDst, branch, memRead, memToReg,memWrite, aluSrc, regWrite, aluOp, instruction);
output reg regDst, branch, memRead, memToReg,memWrite, aluSrc, regWrite;
output reg [1:0] aluOp;
input [5:0] instruction;
	always@(instruction)
	begin
		case (instruction)
			/*Instructions: {ADD, SUB, SLL, SRL, AND, OR, SLT, SLTU} */
			6'h0: begin
						regDst <= 1; 
						branch <= 0; 
						memRead <= 0; 
						memToReg <= 0; 
						memWrite <= 0; 
						aluSrc <= 0; 
						regWrite <= 1; 
						aluOp <= 2'b1x;
					end
			/*Instruction: {ADDI}*/
			6'h8: begin
						regDst <= 0;
						branch <= 0; 
						memRead <= 0; 
						memToReg <= 0;
						memWrite <= 0; 
						aluSrc <= 1; 
						regWrite <= 1; 
						aluOp <= 2'b1x;
					end
			/*Instruction: {LW}*/
			6'h23:begin
						regDst <= 0; 
						branch <= 0; 
						memRead <= 1;
						memToReg <= 1; 
						memWrite <= 0; 
						aluSrc <= 1; 
						regWrite <= 1; 
						aluOp <= 2'b00;
					end
			/*Instruction: {LH}*/
			6'h21:begin
						regDst <= 0;
						branch <= 0; 
						memRead <= 1;
						memToReg <= 1; 
						memWrite <= 0; 
						aluSrc <= 1; 
						regWrite <= 1; 
						aluOp <= 2'b00;
					end
			/*Instruction: {LHU}*/
			6'h25:begin
						regDst <= 0;
						branch <= 0; 
						memRead <= 1;
						memToReg <= 1; 
						memWrite <= 0; 
						aluSrc <= 1; 
						regWrite <= 1; 
						aluOp <= 2'b00;
					end
			/*Instruction: {SW}*/
			6'h2B:begin
						regDst <= 1'bx;
						branch <= 0; 
						memRead <= 0;
						memToReg <= 1'bx; 
						memWrite <= 1; 
						aluSrc <= 1; 
						regWrite <= 0; 
						aluOp <= 2'b00;
					end
			/*Instruction: {ANDI}*/
			6'hC: begin
						regDst <= 0;	
						branch <= 0; 
						memRead <= 0; 
						memToReg <= 0;
						memWrite <= 0; 
						aluSrc <= 1; 
						regWrite <= 1; 
						aluOp <= 2'b1x;
					end
			/*Instruction: {ORI}*/
			6'hD: begin
						regDst <= 0;	
						branch <= 0; 
						memRead <= 0; 
						memToReg <= 0;
						memWrite <= 0; 
						aluSrc <= 1; 
						regWrite <= 1; 
						aluOp <= 2'b1x;
					end
			/*Instruction: {BEQ}*/
			6'h4: begin
						regDst <= 1'bx;
						branch <= 1; 
						memRead <= 0; 
						memToReg <= 1'bx;
						memWrite <= 0; 
						aluSrc <= 0; 
						regWrite <= 0; 
						aluOp <= 2'bx1;
					end
		endcase
	end
	
	
endmodule