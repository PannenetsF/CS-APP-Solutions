package riscv

import chisel3._
import chisel3.util.{BitPat, ListLookup}
import freechips.rocketchip.config.Parameters
import ISA._


object Control {
  val Y = true.B
  val N = false.B

  // branch
  val BranchX = N
  val BranchN = N
  val BranchY = Y

  // MemRead
  val MReadX = N
  val MReadN = N
  val MReadY = Y

  // MemtoReg
  val M2RegX = N
  val M2RegN = N
  val M2RegY = Y

  // ALUOp
  val ALUOpX  = BitPat.bitPatToUInt(BitPat("b00"))
  val ALUOp00 = BitPat.bitPatToUInt(BitPat("b00"))
  val ALUOp01 = BitPat.bitPatToUInt(BitPat("b01"))
  val ALUOp10 = BitPat.bitPatToUInt(BitPat("b10"))
  val ALUOp11 = BitPat.bitPatToUInt(BitPat("b11"))

  // MemWrite
  val MWriteX = N
  val MWriteN = N
  val MWriteY = Y

  // ALUSrc
  val ALUSrcX = N
  val ALUSrcN = N
  val ALUSrcY = Y

  // RegWrite
  val RWriteX = N
  val RWriteN = N
  val RWriteY = Y

}

import Control._
import ISA._

class singleClkControlIo extends CoreBundle {
  val inst = Input(UInt(32.W))
  val aluSrc = Output(Bool())
  val mem2Reg = Output(Bool())
  val regWrite = Output(Bool())
  val memRead = Output(Bool())
  val memWrite = Output(Bool())
  val branch = Output(Bool())
  val aluOp = Output(UInt(2.W))


}

class singleClkControl extends Module with CoreParams {
  val io = IO(new singleClkControlIo)

  val default =   // alusrc mem2reg regwrite  memread memWrite  branch  aluOp
    List(ALUSrcX, M2RegX, RWriteX, MReadX, MWriteX, BranchX, ALUOpX)
  val map = Array(
    LD   ->     List(ALUSrcY, M2RegY, RWriteY, MReadY, MWriteN, BranchN, ALUOp00),
    SD   ->     List(ALUSrcY, M2RegX, RWriteN, MReadN, MWriteY, BranchN, ALUOp00),
    BEQ  ->     List(ALUSrcN, M2RegN, RWriteY, MReadN, MWriteN, BranchN, ALUOp01),
    ADD  ->     List(ALUSrcN, M2RegN, RWriteY, MReadN, MWriteN, BranchN, ALUOp10),
    SUB  ->     List(ALUSrcN, M2RegN, RWriteY, MReadN, MWriteN, BranchN, ALUOp10),
    AND  ->     List(ALUSrcN, M2RegN, RWriteY, MReadN, MWriteN, BranchN, ALUOp10),
    OR   ->     List(ALUSrcN, M2RegN, RWriteY, MReadN, MWriteN, BranchN, ALUOp10),
  )

  val signal = ListLookup(io.inst, default, map)
  io.aluSrc := signal(0).toBool
  io.mem2Reg := signal(1).toBool
  io.regWrite := signal(2).toBool
  io.memRead := signal(3).toBool
  io.memWrite := signal(4).toBool
  io.branch := signal(5).toBool
  io.aluOp := signal(6)

}