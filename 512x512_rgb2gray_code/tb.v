module tb();
	reg CLK;
	reg RSTn;
	reg start;
	wire [7:0] Gray;
	wire Done_full;
	wire Done_one;	
reg [18:0] counter;	
integer fout;
initial 
begin
	CLK = 0;
	forever #10 CLK = ~CLK;
end

initial 
begin
	RSTn = 0;
	start = 0;
	counter = 0;
	fout = $fopen ("rgb2gray_512x512_v.txt");
	#100 RSTn = 1;
	start = 1;
	counter = 1;
end

always @ ( posedge CLK )
  if ( Done_one ) 
  begin
     $fwrite (fout,"%d",Gray,"\n");
  end
  
always @ ( posedge CLK )
  if ( Done_one ) 
    begin
       counter <= counter + 1;
    end
 always @ ( posedge CLK )
  if ( counter == 19'd262145 ) 
    begin
       start <= 0;
       $stop;
    end
top top (.CLK(CLK),
         .RSTn(RSTn),
		 .start(start),
		 .Gray(Gray),
		 .Done_full(Done_full),
		 .Done_one(Done_one));
endmodule