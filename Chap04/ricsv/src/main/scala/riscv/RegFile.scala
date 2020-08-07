package riscv

import chisel3._
import chisel3.util._
import freechips.rocketchip.config.Parameters

class RegFileIo extends CoreBundle {
  val raddr1 = Input(UInt(5.W))
  val raddr2 = Input(UInt(5.W))
  val waddr = Input(UInt(5.W))
  val wdata = Input(UInt(xlen.W))
  val rdata1 = Output(UInt(xlen.W))
  val rdata2 = Output(UInt(xlen.W))
  val we = Input(Bool())
}

class RegFile extends Module with CoreParams {
  val io = IO(new RegFileIo)
  val regs = Mem(32, UInt(xlen.W))

  io.rdata1 := Mux(io.raddr1.orR(), regs(io.raddr1), 0.U)
  io.rdata2 := Mux(io.raddr2.orR(), regs(io.raddr2), 0.U)
  when (io.we & io.waddr.orR()) {
    regs(io.waddr) := io.wdata
  }
}

