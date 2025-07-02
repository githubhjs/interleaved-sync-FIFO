# interleaved-sync-FIFO
Synchronous FIFO which consist of Single Port RAM for ASIC/FPGA implementation by using SystemVerilog

## Feature
- **This module is NOT practical because it was created experimentally**
- **Only use 2 cycle delay Single Port RAM**
    - This RAM architecture is synthesizable at any device
    - In general, however, FIFO use 1 cycle delay Dual Port RAM recently
        - Description of synchronous FIFO consist of Dual Port RAM is [here](https://github.com/kyk0910/SystemVerilog-sync-FIFO)
- Interface are designed by VALID-READY handshake
- You can read data at each cycle because of data prefetch and interleaving even though only use Single Port RAM
- Latency is 6 cycle
- Don't use distributed RAM, but BRAM

## License
MIT


## 差異

🌟 FIFO Design Comparison: Interleaved vs Single SRAM

📅 Comparison Targets

jh_external_interleaved_sync_fifo - Interleaved dual 2T FIFO using two SRAMs.

jh_external_sync_2t_fifo - Single 2T FIFO using one single-port SRAM and prefetch buffer.

🔹 Architecture and Feature Comparison

Feature

jh_external_interleaved_sync_fifo

jh_external_sync_2t_fifo

Memory Usage

2x sync_2t_fifo (each likely with its own SRAM)

Single-port SRAM + prefetch register FIFO

Data Handling

Alternates input/output between FIFO0 and FIFO1 using in_sel/out_sel

All writes go to SRAM, reads go through prefetch buffer

I/O Protocol

Valid-Ready handshake

Valid-Ready handshake

Prefetch Strategy

Each FIFO prefetches one data word

SRAM data prefetches into a small FIFO buffer

Resource Utilization

Higher (2 SRAMs, more logic)

Lower (1 SRAM, minimal logic)

Performance Intent

High throughput under burst traffic

Area and timing efficient under constrained resources

Access Arbitration

Controlled by in_sel/out_sel switches

Controlled by in_exec and prefetch_exec arbitration

FIFO Capacity Split

Each FIFO holds FIFO_DEPTH / 2

Full FIFO_DEPTH capacity in one FIFO

🚀 Key Architectural Differences

Interleaved FIFO Design

Designed for higher throughput by leveraging two separate 2T FIFOs.

Maintains smooth data flow even under continuous input/output pressure.

Better suited for applications needing maximum bandwidth.

Single SRAM FIFO Design

Optimized for resource efficiency using only one single-port SRAM.

Employs a prefetch FIFO to mitigate read/write contention.

Better for area/power-sensitive applications where throughput is moderate.

✅ Usage Recommendations

Scenario

Recommended FIFO

High throughput, SRAM resource available

jh_external_interleaved_sync_fifo

Area/power sensitive, minimal SRAM

jh_external_sync_2t_fifo

For ASIC adaptations or optimizations in timing, area, or power, please provide specific design constraints or scenarios for further refinement.
