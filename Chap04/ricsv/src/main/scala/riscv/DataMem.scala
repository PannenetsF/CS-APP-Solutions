package riscv


import chisel3._
import chisel3.util._
import freechips.rocketchip.config.Parameters

class DataMemIo(implicit p: Parameters) extends CoreBundle()(p) {
  val addr = Input(UInt(xlen.W))
  val wdata = Input(UInt(xlen.W))
  val rdata = Output(UInt(xlen.W))
  val memRead = Input(Bool())
  val memWrite = Input(Bool())
}

class DataMem(implicit val p: Parameters) extends Module with CoreParams {
  val io = IO(new DataMemIo)
  val mem = Mem(1 << xlen, UInt(xlen.W))
  when (io.memRead)  {
    io.rdata := mem(io.addr)
  }
  when (io.memWrite) {
    mem(io.addr) := io.wdata
  }
}

