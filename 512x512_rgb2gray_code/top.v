module top#(
	parameter DATAWIDTH = 8,
	parameter ADDRWIDTH = 18
)
(
	input 						CLK,
	input 						RSTn,
	input 						start,
	output [ DATAWIDTH - 1 :0 ] Gray,
	output					    Done_full,
	output                      Done_one
);

wire [ ADDRWIDTH - 1 :0 ] addri;
wire [ DATAWIDTH - 1 :0 ] r;
wire [ DATAWIDTH - 1 :0 ] g;
wire [ DATAWIDTH - 1 :0 ] b;
wire                      Done_one_w;

addr addr (.CLK(CLK),
           .start(start),
           .Done_one(Done_one_w),
		   .RSTn(RSTn),
		   .ADDR(addri),
		   .Done_full(Done_full));
picture_512x512_r R (.clka(CLK),
				   .addra(addri),
				   .douta(r));
picture_512x512_g G (.clka(CLK),
				   .addra(addri),
				   .douta(g));
picture_512x512_b B (.clka(CLK),
				   .addra(addri),
				   .douta(b));
				   
rgb2gray rgb2gray (.CLK(CLK),
				   .RSTn(RSTn),
				   .start(start),
				   .DATA_R(r),
				   .DATA_G(g),
				   .DATA_B(b),
				   .gray_picture(Gray),
				   .Done_one(Done_one_w));
				   
assign Done_one = Done_one_w;
endmodule