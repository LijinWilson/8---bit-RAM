module ram_3(data_out, data_in, addr, wr, cs);

parameter word_size = 8;
parameter addr_size = 10;
parameter mem_size = 1024;

input [word_size-1:0] data_in;
input [addr_size-1:0] addr;
input wr, cs;
output [word_size-1:0] data_out;

reg [word_size-1:0] mem [mem_size-1:0];
// 1024 array of memory having the size of 8bit;

assign data_out = mem[addr];

//assign data_out = (cs && !wr) ? mem[addr] : {word_size{1'bz}};

initial
    begin
        $monitor("mem[addr] = %b", mem[addr]);
    end

initial
    begin
        $monitor("data_out = %b, data_in = %b, addr = %b", data_out, data_in, addr);
    end

always @ (wr or cs)
    begin
        if(wr) mem[addr] = data_in;
    end

endmodule
