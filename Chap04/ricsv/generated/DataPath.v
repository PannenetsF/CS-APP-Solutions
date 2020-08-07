module InstMem(
  input         clock,
  output [31:0] io_instFull,
  output [4:0]  io_instRead1,
  output [4:0]  io_instRead2,
  output [4:0]  io_instWrite
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [31:0] mem [0:0]; // @[InstMem.scala 19:16]
  wire [31:0] mem__T_data; // @[InstMem.scala 19:16]
  wire  mem__T_addr; // @[InstMem.scala 19:16]
  assign mem__T_addr = 1'h0;
  assign mem__T_data = mem[mem__T_addr]; // @[InstMem.scala 19:16]
  assign io_instFull = mem__T_data; // @[InstMem.scala 21:15]
  assign io_instRead1 = io_instFull[19:15]; // @[InstMem.scala 22:16]
  assign io_instRead2 = io_instFull[24:20]; // @[InstMem.scala 23:16]
  assign io_instWrite = io_instFull[11:7]; // @[InstMem.scala 24:16]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    mem[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RegFile(
  input         clock,
  input  [4:0]  io_raddr1,
  input  [4:0]  io_raddr2,
  input  [4:0]  io_waddr,
  input  [63:0] io_wdata,
  output [63:0] io_rdata1,
  output [63:0] io_rdata2,
  input         io_we
);
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [63:0] regs [0:31]; // @[RegFile.scala 19:17]
  wire [63:0] regs__T_1_data; // @[RegFile.scala 19:17]
  wire [4:0] regs__T_1_addr; // @[RegFile.scala 19:17]
  wire [63:0] regs__T_4_data; // @[RegFile.scala 19:17]
  wire [4:0] regs__T_4_addr; // @[RegFile.scala 19:17]
  wire [63:0] regs__T_8_data; // @[RegFile.scala 19:17]
  wire [4:0] regs__T_8_addr; // @[RegFile.scala 19:17]
  wire  regs__T_8_mask; // @[RegFile.scala 19:17]
  wire  regs__T_8_en; // @[RegFile.scala 19:17]
  wire  _T = |io_raddr1; // @[RegFile.scala 21:33]
  wire  _T_3 = |io_raddr2; // @[RegFile.scala 22:33]
  wire  _T_6 = |io_waddr; // @[RegFile.scala 23:29]
  assign regs__T_1_addr = io_raddr1;
  assign regs__T_1_data = regs[regs__T_1_addr]; // @[RegFile.scala 19:17]
  assign regs__T_4_addr = io_raddr2;
  assign regs__T_4_data = regs[regs__T_4_addr]; // @[RegFile.scala 19:17]
  assign regs__T_8_data = io_wdata;
  assign regs__T_8_addr = io_waddr;
  assign regs__T_8_mask = 1'h1;
  assign regs__T_8_en = io_we & _T_6;
  assign io_rdata1 = _T ? regs__T_1_data : 64'h0; // @[RegFile.scala 21:13]
  assign io_rdata2 = _T_3 ? regs__T_4_data : 64'h0; // @[RegFile.scala 22:13]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {2{`RANDOM}};
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    regs[initvar] = _RAND_0[63:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(regs__T_8_en & regs__T_8_mask) begin
      regs[regs__T_8_addr] <= regs__T_8_data; // @[RegFile.scala 19:17]
    end
  end
endmodule
module ImmGen(
  input  [31:0] io_inst,
  output [3:0]  io_aluCtrl,
  output [63:0] io_Imm
);
  wire [11:0] Iimm = io_inst[31:20]; // @[ImmGen.scala 32:35]
  wire [11:0] Simm = {io_inst[31:25],io_inst[11:7]}; // @[ImmGen.scala 33:57]
  wire [11:0] SBimm = {io_inst[31],io_inst[7],io_inst[30:25],io_inst[11:8]}; // @[ImmGen.scala 34:83]
  wire [31:0] Uimm = {io_inst[31:12],12'h0}; // @[ImmGen.scala 35:52]
  wire [20:0] UJimm = {io_inst[31],io_inst[19:12],io_inst[20],io_inst[30:25],io_inst[24:21],1'h0}; // @[ImmGen.scala 36:112]
  wire [31:0] _T_23 = io_inst & 32'h707f; // @[Lookup.scala 31:38]
  wire  _T_24 = 32'h3003 == _T_23; // @[Lookup.scala 31:38]
  wire  _T_26 = 32'h3023 == _T_23; // @[Lookup.scala 31:38]
  wire  _T_28 = 32'h63 == _T_23; // @[Lookup.scala 31:38]
  wire [1:0] _T_41 = _T_28 ? 2'h3 : 2'h0; // @[Lookup.scala 33:37]
  wire [1:0] _T_42 = _T_26 ? 2'h1 : _T_41; // @[Lookup.scala 33:37]
  wire [1:0] instType = _T_24 ? 2'h1 : _T_42; // @[Lookup.scala 33:37]
  wire  _T_43 = 2'h1 == instType; // @[Mux.scala 80:60]
  wire [11:0] _T_44 = _T_43 ? $signed(Iimm) : $signed(12'sh0); // @[Mux.scala 80:57]
  wire  _T_45 = 2'h2 == instType; // @[Mux.scala 80:60]
  wire [11:0] _T_46 = _T_45 ? $signed(Simm) : $signed(_T_44); // @[Mux.scala 80:57]
  wire  _T_47 = 2'h3 == instType; // @[Mux.scala 80:60]
  wire [11:0] _T_48 = _T_47 ? $signed(SBimm) : $signed(_T_46); // @[Mux.scala 80:57]
  wire [2:0] _GEN_0 = {{1'd0}, instType}; // @[Mux.scala 80:60]
  wire  _T_49 = 3'h4 == _GEN_0; // @[Mux.scala 80:60]
  wire [31:0] _T_50 = _T_49 ? $signed(Uimm) : $signed({{20{_T_48[11]}},_T_48}); // @[Mux.scala 80:57]
  wire  _T_51 = 3'h5 == _GEN_0; // @[Mux.scala 80:60]
  wire [31:0] _T_53 = _T_51 ? $signed({{11{UJimm[20]}},UJimm}) : $signed(_T_50); // @[ImmGen.scala 52:11]
  assign io_aluCtrl = {io_inst[30],io_inst[14:12]}; // @[ImmGen.scala 53:14]
  assign io_Imm = {{32'd0}, _T_53}; // @[ImmGen.scala 50:10]
endmodule
module ALUSimple(
  input  [63:0] io_A,
  input  [63:0] io_B,
  input  [3:0]  io_aluCtrl,
  output [63:0] io_result
);
  wire [63:0] _T_1 = io_A + io_B; // @[Alu.scala 30:22]
  wire [63:0] _T_3 = io_A - io_B; // @[Alu.scala 31:22]
  wire [63:0] _T_4 = io_A & io_B; // @[Alu.scala 32:22]
  wire [63:0] _T_5 = io_A | io_B; // @[Alu.scala 33:21]
  wire  _T_6 = 4'h2 == io_aluCtrl; // @[Mux.scala 80:60]
  wire [63:0] _T_7 = _T_6 ? _T_1 : io_B; // @[Mux.scala 80:57]
  wire  _T_8 = 4'h6 == io_aluCtrl; // @[Mux.scala 80:60]
  wire [63:0] _T_9 = _T_8 ? _T_3 : _T_7; // @[Mux.scala 80:57]
  wire [63:0] _T_11 = _T_6 ? _T_4 : _T_9; // @[Mux.scala 80:57]
  wire  _T_12 = 4'h1 == io_aluCtrl; // @[Mux.scala 80:60]
  assign io_result = _T_12 ? _T_5 : _T_11; // @[Alu.scala 29:13]
endmodule
module AluCtrl(
  input  [3:0] io_instAluCtrl,
  input  [1:0] io_aluOp,
  output [3:0] io_aluCtrl
);
  wire [5:0] cat = {io_aluOp,io_instAluCtrl}; // @[Cat.scala 29:58]
  wire [5:0] _T = cat & 6'h30; // @[Lookup.scala 31:38]
  wire  _T_1 = 6'h0 == _T; // @[Lookup.scala 31:38]
  wire [5:0] _T_2 = cat & 6'h10; // @[Lookup.scala 31:38]
  wire  _T_3 = 6'h10 == _T_2; // @[Lookup.scala 31:38]
  wire [5:0] _T_4 = cat & 6'h2f; // @[Lookup.scala 31:38]
  wire  _T_5 = 6'h20 == _T_4; // @[Lookup.scala 31:38]
  wire  _T_7 = 6'h28 == _T_4; // @[Lookup.scala 31:38]
  wire  _T_9 = 6'h27 == _T_4; // @[Lookup.scala 31:38]
  wire  _T_11 = 6'h26 == _T_4; // @[Lookup.scala 31:38]
  wire [3:0] _T_12 = _T_11 ? 4'h1 : 4'h0; // @[Lookup.scala 33:37]
  wire [3:0] _T_13 = _T_9 ? 4'h0 : _T_12; // @[Lookup.scala 33:37]
  wire [3:0] _T_14 = _T_7 ? 4'h6 : _T_13; // @[Lookup.scala 33:37]
  wire [3:0] _T_15 = _T_5 ? 4'h2 : _T_14; // @[Lookup.scala 33:37]
  wire [3:0] _T_16 = _T_3 ? 4'h6 : _T_15; // @[Lookup.scala 33:37]
  assign io_aluCtrl = _T_1 ? 4'h2 : _T_16; // @[AluCtrl.scala 29:14]
endmodule
module singleClkControl(
  input  [31:0] io_inst,
  output        io_aluSrc,
  output        io_mem2Reg,
  output        io_regWrite,
  output        io_memRead,
  output        io_memWrite,
  output [1:0]  io_aluOp
);
  wire [31:0] _T = io_inst & 32'h707f; // @[Lookup.scala 31:38]
  wire  signal_1 = 32'h3003 == _T; // @[Lookup.scala 31:38]
  wire  _T_3 = 32'h3023 == _T; // @[Lookup.scala 31:38]
  wire  _T_5 = 32'h63 == _T; // @[Lookup.scala 31:38]
  wire [31:0] _T_6 = io_inst & 32'hfe00707f; // @[Lookup.scala 31:38]
  wire  _T_7 = 32'h33 == _T_6; // @[Lookup.scala 31:38]
  wire  _T_9 = 32'h40000033 == _T_6; // @[Lookup.scala 31:38]
  wire  _T_11 = 32'h7033 == _T_6; // @[Lookup.scala 31:38]
  wire  _T_13 = 32'h6033 == _T_6; // @[Lookup.scala 31:38]
  wire  _T_27 = _T_11 | _T_13; // @[Lookup.scala 33:37]
  wire  _T_28 = _T_9 | _T_27; // @[Lookup.scala 33:37]
  wire  _T_29 = _T_7 | _T_28; // @[Lookup.scala 33:37]
  wire  _T_30 = _T_5 | _T_29; // @[Lookup.scala 33:37]
  wire  _T_31 = _T_3 ? 1'h0 : _T_30; // @[Lookup.scala 33:37]
  wire [1:0] _T_50 = _T_13 ? 2'h2 : 2'h0; // @[Lookup.scala 33:37]
  wire [1:0] _T_51 = _T_11 ? 2'h2 : _T_50; // @[Lookup.scala 33:37]
  wire [1:0] _T_52 = _T_9 ? 2'h2 : _T_51; // @[Lookup.scala 33:37]
  wire [1:0] _T_53 = _T_7 ? 2'h2 : _T_52; // @[Lookup.scala 33:37]
  wire [1:0] _T_54 = _T_5 ? 2'h1 : _T_53; // @[Lookup.scala 33:37]
  wire [1:0] _T_55 = _T_3 ? 2'h0 : _T_54; // @[Lookup.scala 33:37]
  assign io_aluSrc = signal_1 | _T_3; // @[Control.scala 84:13]
  assign io_mem2Reg = 32'h3003 == _T; // @[Control.scala 85:14]
  assign io_regWrite = signal_1 | _T_31; // @[Control.scala 86:15]
  assign io_memRead = 32'h3003 == _T; // @[Control.scala 87:14]
  assign io_memWrite = signal_1 ? 1'h0 : _T_3; // @[Control.scala 88:15]
  assign io_aluOp = signal_1 ? 2'h0 : _T_55; // @[Control.scala 90:12]
endmodule
module DataPath(
  input         clock,
  input         reset,
  output [63:0] io_addr,
  output [63:0] io_wdata,
  input  [63:0] io_rdata,
  output        io_memRead,
  output        io_memWrite
);
  wire  instMem_clock; // @[DataPath.scala 16:23]
  wire [31:0] instMem_io_instFull; // @[DataPath.scala 16:23]
  wire [4:0] instMem_io_instRead1; // @[DataPath.scala 16:23]
  wire [4:0] instMem_io_instRead2; // @[DataPath.scala 16:23]
  wire [4:0] instMem_io_instWrite; // @[DataPath.scala 16:23]
  wire  regFile_clock; // @[DataPath.scala 17:23]
  wire [4:0] regFile_io_raddr1; // @[DataPath.scala 17:23]
  wire [4:0] regFile_io_raddr2; // @[DataPath.scala 17:23]
  wire [4:0] regFile_io_waddr; // @[DataPath.scala 17:23]
  wire [63:0] regFile_io_wdata; // @[DataPath.scala 17:23]
  wire [63:0] regFile_io_rdata1; // @[DataPath.scala 17:23]
  wire [63:0] regFile_io_rdata2; // @[DataPath.scala 17:23]
  wire  regFile_io_we; // @[DataPath.scala 17:23]
  wire [31:0] immGen_io_inst; // @[DataPath.scala 18:22]
  wire [3:0] immGen_io_aluCtrl; // @[DataPath.scala 18:22]
  wire [63:0] immGen_io_Imm; // @[DataPath.scala 18:22]
  wire [63:0] alu_io_A; // @[DataPath.scala 19:19]
  wire [63:0] alu_io_B; // @[DataPath.scala 19:19]
  wire [3:0] alu_io_aluCtrl; // @[DataPath.scala 19:19]
  wire [63:0] alu_io_result; // @[DataPath.scala 19:19]
  wire [3:0] aluCtrl_io_instAluCtrl; // @[DataPath.scala 20:23]
  wire [1:0] aluCtrl_io_aluOp; // @[DataPath.scala 20:23]
  wire [3:0] aluCtrl_io_aluCtrl; // @[DataPath.scala 20:23]
  wire [31:0] ctrl_io_inst; // @[DataPath.scala 21:20]
  wire  ctrl_io_aluSrc; // @[DataPath.scala 21:20]
  wire  ctrl_io_mem2Reg; // @[DataPath.scala 21:20]
  wire  ctrl_io_regWrite; // @[DataPath.scala 21:20]
  wire  ctrl_io_memRead; // @[DataPath.scala 21:20]
  wire  ctrl_io_memWrite; // @[DataPath.scala 21:20]
  wire [1:0] ctrl_io_aluOp; // @[DataPath.scala 21:20]
  InstMem instMem ( // @[DataPath.scala 16:23]
    .clock(instMem_clock),
    .io_instFull(instMem_io_instFull),
    .io_instRead1(instMem_io_instRead1),
    .io_instRead2(instMem_io_instRead2),
    .io_instWrite(instMem_io_instWrite)
  );
  RegFile regFile ( // @[DataPath.scala 17:23]
    .clock(regFile_clock),
    .io_raddr1(regFile_io_raddr1),
    .io_raddr2(regFile_io_raddr2),
    .io_waddr(regFile_io_waddr),
    .io_wdata(regFile_io_wdata),
    .io_rdata1(regFile_io_rdata1),
    .io_rdata2(regFile_io_rdata2),
    .io_we(regFile_io_we)
  );
  ImmGen immGen ( // @[DataPath.scala 18:22]
    .io_inst(immGen_io_inst),
    .io_aluCtrl(immGen_io_aluCtrl),
    .io_Imm(immGen_io_Imm)
  );
  ALUSimple alu ( // @[DataPath.scala 19:19]
    .io_A(alu_io_A),
    .io_B(alu_io_B),
    .io_aluCtrl(alu_io_aluCtrl),
    .io_result(alu_io_result)
  );
  AluCtrl aluCtrl ( // @[DataPath.scala 20:23]
    .io_instAluCtrl(aluCtrl_io_instAluCtrl),
    .io_aluOp(aluCtrl_io_aluOp),
    .io_aluCtrl(aluCtrl_io_aluCtrl)
  );
  singleClkControl ctrl ( // @[DataPath.scala 21:20]
    .io_inst(ctrl_io_inst),
    .io_aluSrc(ctrl_io_aluSrc),
    .io_mem2Reg(ctrl_io_mem2Reg),
    .io_regWrite(ctrl_io_regWrite),
    .io_memRead(ctrl_io_memRead),
    .io_memWrite(ctrl_io_memWrite),
    .io_aluOp(ctrl_io_aluOp)
  );
  assign io_addr = alu_io_result; // @[DataPath.scala 45:11]
  assign io_wdata = regFile_io_rdata2; // @[DataPath.scala 46:12]
  assign io_memRead = ctrl_io_memRead; // @[DataPath.scala 47:14]
  assign io_memWrite = ctrl_io_memWrite; // @[DataPath.scala 48:15]
  assign instMem_clock = clock;
  assign regFile_clock = clock;
  assign regFile_io_raddr1 = instMem_io_instRead1; // @[DataPath.scala 30:21]
  assign regFile_io_raddr2 = instMem_io_instRead2; // @[DataPath.scala 31:21]
  assign regFile_io_waddr = instMem_io_instWrite; // @[DataPath.scala 32:20]
  assign regFile_io_wdata = ctrl_io_mem2Reg ? io_rdata : alu_io_result; // @[DataPath.scala 33:20]
  assign regFile_io_we = ctrl_io_regWrite; // @[DataPath.scala 34:17]
  assign immGen_io_inst = instMem_io_instFull; // @[DataPath.scala 36:18]
  assign alu_io_A = regFile_io_rdata1; // @[DataPath.scala 41:12]
  assign alu_io_B = ctrl_io_aluSrc ? immGen_io_Imm : regFile_io_rdata2; // @[DataPath.scala 42:12]
  assign alu_io_aluCtrl = aluCtrl_io_aluCtrl; // @[DataPath.scala 43:18]
  assign aluCtrl_io_instAluCtrl = immGen_io_aluCtrl; // @[DataPath.scala 39:26]
  assign aluCtrl_io_aluOp = ctrl_io_aluOp; // @[DataPath.scala 38:20]
  assign ctrl_io_inst = instMem_io_instFull; // @[DataPath.scala 27:16]
endmodule
