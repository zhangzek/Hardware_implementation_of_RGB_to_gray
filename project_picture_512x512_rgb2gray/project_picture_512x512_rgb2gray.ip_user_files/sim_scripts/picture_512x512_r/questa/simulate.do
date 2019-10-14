onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib picture_512x512_r_opt

do {wave.do}

view wave
view structure
view signals

do {picture_512x512_r.udo}

run -all

quit -force
