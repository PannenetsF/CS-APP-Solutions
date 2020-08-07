package riscv

import chisel3._
import chisel3.util._
import freechips.rocketchip.config.Parameters
import riscv.ALU.{ALU_ADD, ALU_AND, ALU_OR, ALU_SUB}

import ALU._

class AluCtrlIo extends CoreBundle {
  val instAluCtrl = Input(UInt(4.W))
  val aluOp = Input(UInt(2.W))
  val aluCtrl = Output(UInt(4.W))
}

class AluCtrl extends Module with  CoreParams {
  val io = IO(new AluCtrlIo)
  val default = List(BitPat.bitPatToUInt(BitPat("b0000")))
  val map = Array(
    (BitPat("b00????")) -> List(ALU_ADD),
    (BitPat("b?1????")) -> List(ALU_SUB),
    (BitPat("b1?0000")) -> List(ALU_ADD),
    (BitPat("b1?1000")) -> List(ALU_SUB),
    (BitPat("b1?0111")) -> List(ALU_AND),
    (BitPat("b1?0110")) -> List(ALU_OR)
  )
  val cat = Cat(io.aluOp, io.instAluCtrl)
  val ans = ListLookup(cat, default, map)
  io.aluCtrl := ans(0)
}
