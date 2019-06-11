# interleaved-sync-FIFO
Synchronous FIFO which consist of Single Port RAM for FPGA implementation by using SystemVerilog

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
