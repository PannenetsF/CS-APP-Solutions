package riscv


import chisel3._
import chisel3.util._
import freechips.rocketchip.config.Parameters

class DataMemIo extends CoreBundle{
  val addr = Output(UInt(xlen.W))
  val wdata = Output(UInt(xlen.W))
  val rdata = Input(UInt(xlen.W))
  val memRead = Output(Bool())
  val memWrite = Output(Bool())
}
//
//class DataMem extends Module with CoreParams {
//  val io = IO(new DataMemIo)
//  val mem = Mem(1 << xlen, UInt(xlen.W))
//  when (io.memRead)  {
//    io.rdata := mem(io.addr)
//  }
//  when (io.memWrite) {
//    mem(io.addr) := io.wdata
//  }
//}
//
