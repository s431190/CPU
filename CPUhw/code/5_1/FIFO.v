module FIFO(input [7:0]Data_in, 
	    input rd, wr, clk, rst,
    	    output empty, full, 
            output reg [3:0]count,
            output reg [7:0]Data_out);
reg [7:0]fifo_ram[0:7];
reg [2:0] wr_ptr;
reg [2:0] rd_ptr;

assign empty = (count == 0);
assign full  = (count == 8);

always@(posedge clk) 
        if(wr && !full)
		fifo_ram[wr_ptr] <= Data_in;
	else if(wr && rd)
		fifo_ram[wr_ptr] <= Data_in;

always@(posedge clk) 
	if(rd && !empty)
		Data_out <= fifo_ram[rd_ptr];
	else if(rd && wr && empty)
		Data_out <= Data_in;


always@(posedge clk,posedge rst)
	if(rst) begin
		wr_ptr <= 0;
		rd_ptr <= 0;
	end
	else	begin
		wr_ptr <= ((wr && !full)||(wr && rd)) ? wr_ptr + 1 : wr_ptr;
		rd_ptr <= ((rd && !empty)||(wr && rd)) ? rd_ptr + 1: rd_ptr;
	end
 
always@(posedge clk) 
	if(rst)
		count <= 0;
	else 
		case({wr,rd})
			2'b00 : count <= count;
			2'b01 : count <= (count == 0) ? 0 : count - 1;
			2'b10 : count <= (count == 8) ? 8 : count + 1;
			2'b11 : count <= count;
			default: count <= count;
		endcase


endmodule
