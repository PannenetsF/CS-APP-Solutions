package riscv

import chipsalliance.rocketchip.config.Parameters
import chisel3._
import chisel3.util.Cat


class InstMemIo(implicit p: Parameters) extends CoreBundle()(p) {
  val raddr = Input(UInt(xlen.W))
  val instFull = Output(UInt(32.W))
  val instRead1 = Output(UInt(5.W))
  val instRead2 = Output(UInt(5.W))
  val instWrite = Output(UInt(5.W))
  val instAluCtrl = Output(UInt(4.W))
}

class InstMem(implicit val p: Parameters) extends Module with CoreParams {
  val io = IO(new InstMemIo)
  val mem = Mem(1 << xlen, UInt(32.W))

  io.instFull := mem(io.raddr)
  io.instRead1 := io.instFull(19, 15)
  io.instRead2 := io.instFull(24, 20)
  io.instWrite := io.instFull(11, 7)
  io.instAluCtrl := Cat(io.instFull(30), io.instFull(14, 12))
}
