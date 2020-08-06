package riscv

import chisel3._
import chisel3.util._
import freechips.rocketchip.config.Parameters


class ImmGenIo (implicit p: Parameters) extends CoreBundle()(p) {
  val inst = Input(UInt(32.W))
  val immSel = Input(UInt(4.W))
  val Imm = Output(UInt(xlen.W))
}


abstract class ImmGen(implicit p: Parameters) extends Module {
  val io = IO(new ImmGenIo)
}
