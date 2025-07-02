SIMULATOR=xrun -64 
CMD=$(SIMULATOR) +access+rwc -timescale 1ns/1ps rtl/*.sv testbench/interleaved_sync_fifo_tb.sv

all:
	$(CMD)

gui:
	bsub -XF -Is $(CMD) -gui &
