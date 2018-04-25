module ComputerArchitecture(in);
	wire regDst, branch, memRead, memToReg, memWrite, aluSrc, regWrite;
	wire [1:0] aluOp;
	input [5:0] in;
	control_unit control (regDst, branch, memRead, memToReg, memWrite, aluSrc, regWrite, aluOp, in);
endmodule