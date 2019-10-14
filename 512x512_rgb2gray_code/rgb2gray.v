module rgb2gray#(
	parameter DATAWIDTH = 8
)
(
	input 					     CLK,
	input 						 RSTn,
	input                        start,
	input  [ DATAWIDTH - 1 : 0 ] DATA_R,
	input  [ DATAWIDTH - 1 : 0 ] DATA_G,
	input  [ DATAWIDTH - 1 : 0 ] DATA_B,
	output [ DATAWIDTH - 1 : 0 ] gray_picture,
	output                       Done_one
);

reg [ DATAWIDTH - 1 : 0 ] data_r;
reg [ DATAWIDTH - 1 : 0 ] data_g;
reg [ DATAWIDTH - 1 : 0 ] data_b;
reg [ 23 : 0 ] gray;
reg get_gray;
reg [2:0] k;
reg isDone;


always @ ( posedge CLK or negedge RSTn )
begin
	if (!RSTn)
	begin
		data_b <= 0;
		data_g <= 0;
		data_r <= 0;
		get_gray <= 0;
	end
	else if (start)
	begin
		data_b <= DATA_B;
		data_g <= DATA_G;
		data_r <= DATA_R;
		get_gray <= 1;
	end
end
always @ ( posedge CLK or negedge RSTn )
begin
	if (!RSTn)
	begin
		gray <= 0;
		isDone <= 0;
		k <= 0;
	end
	else if (get_gray)
		case ( k ) 
        0: 
            begin
                gray <= 19589 * data_r + 38469 * data_g + 7471 * data_b;
                k <= k + 1'b1; 
            end
        1: 
            begin 
                isDone <= 1'b1; 
                k <= k + 1'b1; 
                end
        2: 
            begin 
                isDone <= 1'b0; 
                k <= 3'd0; 
            end
    endcase
	
end

assign gray_picture = ( gray >> 16 );
assign Done_one = isDone;
endmodule