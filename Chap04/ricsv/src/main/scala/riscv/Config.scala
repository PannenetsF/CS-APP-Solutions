package riscv

import chisel3._
import freechips.rocketchip.config.{Parameters, Config, Field}

case object XLEN extends Field[Int] // cpu width
case object ILEN extends Field[Int] // instruction width
case object CLEN extends Field[Int] // controll signal width
case object R1LEN extends Field[Int] // read 1 width
case object R2LEN extends Field[Int] // read 2 width
case object WLEN extends Field[Int] // write width

abstract trait CoreParams {
  implicit val p: Parameters
  val xlen = p(XLEN)
  val ilen = p(ILEN)
  val clen = p(CLEN)
  val r1len = p(R1LEN)
  val r2len = p(R2LEN)
  val wlen = p(WLEN)
}

abstract class CoreBundle(implicit p: Parameters) extends Bundle with CoreParams

class RVConfig extends Config(
  (site, here, up) => {
    case XLEN => 64
    case ILEN => 32
    case CLEN => 7
    case R1LEN => 5
    case R2LEN => 5
    case WLEN => 5
  }
)
