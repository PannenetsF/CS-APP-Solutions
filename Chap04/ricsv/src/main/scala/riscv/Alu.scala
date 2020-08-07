package riscv

import chisel3._
import chisel3.util._
import freechips.rocketchip.config.Parameters

object ALU {
  val ALU_AND = BitPat.bitPatToUInt(BitPat("b0000"))
  val ALU_OR =  BitPat.bitPatToUInt(BitPat("b0001"))
  val ALU_ADD = BitPat.bitPatToUInt(BitPat("b0010"))
  val ALU_SUB = BitPat.bitPatToUInt(BitPat("b0110"))
}

class ALUIo  extends CoreBundle {
  val A = Input(UInt(xlen.W))
  val B = Input(UInt(xlen.W))
  val aluCtrl = Input(UInt(4.W))
  val branchZero = Output(Bool())
  val result = Output(UInt(xlen.W))
}

import ALU._

class ALU extends Module with CoreParams {
  val io = IO(new ALUIo)
}

class ALUSimple extends ALU  {
  io.result := MuxLookup(io.aluCtrl, io.B.asUInt, Seq(
    ALU_ADD -> (io.A + io.B),
    ALU_SUB -> (io.A - io.B),
    ALU_ADD -> (io.A & io.B),
    ALU_OR -> (io.A | io.B)
  )).asUInt()
  io.branchZero := (io.result === 0.U)
}


