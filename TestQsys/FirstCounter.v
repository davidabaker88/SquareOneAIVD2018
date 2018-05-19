module FirstCounter (rst_n, CLOCK_50,A,B,c_out);
parameter COUNTBITS = 24;

input wire rst_n;
input wire CLOCK_50;
input wire A;
input wire B;
output wire [COUNTBITS-1:0] c_out;



	reg [1:0] r_prev;
	wire [1:0] w_curr;
	reg [1:0] r_curr;
	reg [1:0] temp_curr;
	reg [COUNTBITS-1:0] r_count;
	reg [COUNTBITS-1:0] count_next;
	
	assign w_curr = {A,B};
	
	assign c_out =  r_count;
	
	always @(posedge CLOCK_50) begin
		temp_curr <= w_curr;
		r_curr <= temp_curr;
		r_prev <= r_curr;
		r_count <= ~rst_n ? 'd0: count_next;
	end
	
	always @(*) begin
	   count_next = r_count;
		if(r_curr==0)begin
			if(r_prev==2)begin
			count_next = r_count -1;
			end
			if(r_prev==1)begin
			count_next = r_count +1;
			end
		end
			
		if(r_curr==1)begin
			if(r_prev==0)begin
			count_next = r_count -1;
			end
			if(r_prev==3)begin
			count_next = r_count +1;
			end
		end
			
		if(r_curr==2)begin
			if(r_prev==3)begin
			count_next = r_count -1;
			end
			if(r_prev==0)begin
			count_next = r_count +1;
			end
		end
			
		if(r_curr==3)begin
			if(r_prev==1)begin
			count_next = r_count -1;
			end
			if(r_prev==2)begin
			count_next = r_count +1;
			end
		end
	end
			
endmodule