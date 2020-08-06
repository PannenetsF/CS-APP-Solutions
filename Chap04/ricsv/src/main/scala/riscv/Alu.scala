package riscv

import chisel3._
import chisel3.util._
import freechips.rocketchip.config.Parameters

object ALU {
  val ALU_AND = BitPat("b0000")
  val ALU_OR = BitPat("b0001")
  val ALU_ADD = BitPat("b0010")
  val ALU_SUB = BitPat("b0110")
}

class ALUIo (implicit p: Parameters) extends CoreBundle()(p) {
  val A = Input(UInt(xlen.W))
  val B = Input(UInt(xlen.W))
  val aluOp = Input(UInt(4.W))
  val branchZero = Output(Bool())
  val result = Output(UInt(xlen.W))
}

import ALU._

abstract class ALU(implicit p: Parameters) extends Module with CoreParams {
  val io = IO(new ALUIo)
}

class ALUSimple(implicit p: Parameters) extends ALU()(p) {
  io.result := MuxLookup(io.aluOp, io.B, Seq(
    ALU_ADD -> (io.A + io.B),
    ALU_SUB -> (io.A - io.B),
    ALU_ADD -> (io.A & io.B),
    ALU_OR -> (io.A | io.B)
  ))
  io.branchZero := (io.result === 0.U)
}


