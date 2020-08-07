package riscv


import java.io.{File, FileWriter}

import chisel3._
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}
//import firrtl._
import freechips.rocketchip.config.Parameters


object Main extends App{
//  val dir = new File("gen") ; dir.mkdirs
//  val chirrtl = firrtl.Parser.parse(chisel3.Driver.emit(() => new DataPath()))
//  val writer = new FileWriter(new File(dir, s"${chirrtl.main}.fir"))
//  val verilog = new FileWriter(new File(dir, s"${chirrtl.main}.v"))
//  verilog write (new firrtl.VerilogCompiler).compileAndEmit(firrtl.CircuitState(chirrtl, firrtl.ChirrtlForm)).getEmittedCircuit.value
//  verilog.close
//  chisel3.Driver.execute(Array("--target-dir", "generated"), () => new DataPath)
  (new chisel3.stage.ChiselStage).execute(
    Array("-X", "verilog","--target-dir", "generated"),
    Seq(ChiselGeneratorAnnotation(() => new DataPath )))
}
