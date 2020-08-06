package riscv

import chisel3._
import chisel3.util._
import freechips.rocketchip.config.Parameters

class AluCtrlIo(implicit p: Parameters) extends CoreBundle()(p) {
  val instAluCtrl = Input(UInt(4.W))
  val aluOp = Input(UInt(2.W))
  val aluCtrl = Output(UInt(4.W))
}

class AluCtrl(implicit val p: Parameters) extends Module with  CoreParams {
  val io = IO(new AluCtrlIo)
  val default = BitPat.bitPatToUInt(BitPat("b0000"))
  val map = Array(
    BitPat.bitPatToUInt(BitPat("b00????")) -> List(BitPat("b0010")),
    BitPat.bitPatToUInt(BitPat("b?1????")) -> List(BitPat("b0110")),
    BitPat.bitPatToUInt(BitPat("b1?0000")) -> List(BitPat("b0010")),
    BitPat.bitPatToUInt(BitPat("b1?1000")) -> List(BitPat("b0110")),
    BitPat.bitPatToUInt(BitPat("b1?0111")) -> List(BitPat("b0000")),
    BitPat.bitPatToUInt(BitPat("b1?0110")) -> List(BitPat("b0001"))
  )
  val cat = Cat(io.aluOp, io.instAluCtrl)
  val ans = ListLookup(cat, default, map)
  io.aluCtrl := ans(0)
}
