package riscv


import chisel3._
import chisel3.util._
import freechips.rocketchip.config.Parameters

class DataPath extends Module with CoreParams {

  val io = IO(new DataMemIo)

  // PC
  val nextPC = Wire(UInt(xlen.W))
  val PC = RegInit(0.U(xlen.W))
  PC := nextPC
  val instMem = Module(new  InstMem)
  val regFile = Module(new RegFile)
  val immGen = Module(new ImmGen)
  val alu = Module(new ALUSimple)
  val aluCtrl = Module(new AluCtrl)
  val ctrl = Module(new singleClkControl)
//  val mem = Module(new DataMem)

  instMem.io.raddr := PC


  ctrl.io.inst := instMem.io.instFull


  regFile.io.raddr1 := instMem.io.instRead1
  regFile.io.raddr2 := instMem.io.instRead2
  regFile.io.waddr := instMem.io.instWrite
  regFile.io.wdata := Mux(ctrl.io.mem2Reg, io.rdata, alu.io.result)
  regFile.io.we := ctrl.io.regWrite

  immGen.io.inst := instMem.io.instFull

  aluCtrl.io.aluOp := ctrl.io.aluOp
  aluCtrl.io.instAluCtrl := immGen.io.aluCtrl

  alu.io.A := regFile.io.rdata1
  alu.io.B := Mux(ctrl.io.aluSrc, immGen.io.Imm, regFile.io.rdata2)
  alu.io.aluCtrl := aluCtrl.io.aluCtrl

  io.addr := alu.io.result
  io.wdata := regFile.io.rdata2
  io.memRead := ctrl.io.memRead
  io.memWrite := ctrl.io.memWrite

  val sum = Wire(UInt(xlen.W))
  sum := ((immGen.io.Imm << 1.U) + PC).asUInt
  nextPC := Mux(ctrl.io.branch & alu.io.branchZero, sum, PC + 4.U)


}
