-makelib ies_lib/xil_defaultlib -sv \
  "D:/APPs/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "D:/APPs/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/blk_mem_gen_v8_4_2 \
  "../../../ipstatic/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../project_picture_512x512_rgb2gray.srcs/sources_1/ip/picture_512x512_r/sim/picture_512x512_r.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

