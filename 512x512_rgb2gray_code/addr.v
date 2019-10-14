module addr#(
	parameter ADDRWIDTH = 18
	
)
(
	input 	              		 CLK,
	input 						 RSTn,
	input                        start,
	input                        Done_one,
	output [ ADDRWIDTH - 1 : 0 ] ADDR,
	output                       Done_full
);

reg [ ADDRWIDTH - 1 : 0 ] addr;
reg isDone;

always @ ( posedge CLK  )
begin
	if (!RSTn)
		begin
			addr <= 0;
			isDone <= 0;
			#100 addr <= 1;
		end
//	else 
//		begin
//			addr <= 1;
//		end
end		
always @ ( posedge CLK or negedge RSTn )
begin		
		if (addr == 19'd262144)
		begin
			addr <= 0;
			isDone <= 1;
		end
		else if (Done_one)
		begin
			addr <= addr + 1;
			isDone <= 0;
		end
end		

assign ADDR = addr;
assign Done_full = isDone;
endmodule