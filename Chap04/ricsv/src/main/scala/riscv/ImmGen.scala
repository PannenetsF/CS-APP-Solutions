package riscv

import chisel3._
import chisel3.util._
import freechips.rocketchip.config.Parameters


class ImmGenIo extends CoreBundle {
  val inst = Input(UInt(32.W))
//  val immSel = Input(UInt(4.W))
  val aluCtrl = Output(UInt(4.W))
  val Imm = Output(UInt(xlen.W))
}

object InstType {
  val R = 0.U
  val I = 1.U
  val S = 2.U
  val SB = 3.U
  val U = 4.U
  val UJ = 5.U
}

import ISA._
import InstType._

class ImmGen extends Module {
  val io = IO(new ImmGenIo)


  val Rimm = 0.U.asSInt()
  val Iimm = io.inst(31,20).asSInt()
  val Simm = Cat(io.inst(31, 25), io.inst(11, 7)).asSInt()
  val SBimm = Cat(io.inst(31), io.inst(7), io.inst(30, 25), io.inst(11, 8)).asSInt()
  val Uimm = Cat(io.inst(31, 12), 0.U(12.W)).asSInt()
  val UJimm = Cat(io.inst(31), io.inst(19, 12), io.inst(20), io.inst(30, 25), io.inst(24, 21), 0.U(1.W)).asSInt()


  val map = Seq(
    LD -> I,
    SD -> I,
    BEQ -> SB,
    ADD -> R,
    SUB -> R,
    AND -> R,
    OR -> R
  )
  val default = 0.U
  val instType = Lookup(io.inst, default, map)
  io.Imm := MuxLookup(instType, 0.S,
    Seq(R->Rimm, I->Iimm, S->Simm, SB->SBimm, U->Uimm, UJ->UJimm)
  ).asUInt()
  io.aluCtrl := Cat(io.inst(30), io.inst(14,12)).asUInt
}

