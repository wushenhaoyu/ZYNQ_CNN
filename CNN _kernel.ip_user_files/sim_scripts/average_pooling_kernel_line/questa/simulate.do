onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib average_pooling_kernel_line_opt

do {wave.do}

view wave
view structure
view signals

do {average_pooling_kernel_line.udo}

run -all

quit -force
