// test bench
module ram_tb();

reg [9:0] addr;
reg [7:0] data_in;
reg wr, cs;

wire [7:0] data_out;

integer i, seed;

// instantiation of ram module
ram_3 ff(data_out, data_in, addr, wr, cs);

initial
    begin
        seed = 35;
        wr = 0;
        cs = 0;
    end

initial
    begin
    $display("Helo lijin");
        for(i=0; i<=1023; i=i+1)
            begin
//            $display("address = %b", addr);
//            $display($time, " address = %5d | data_in = %4d | data_out = %4d", addr, data_in, data_out);

                addr = i;
                data_in = (i*3) % 256;
                wr = 1;
                cs = 1;
                
                #2 ;
                wr = 0;
                cs = 0;
                #2;
            end
            
            #2 ;
            
            $display("hey mahn");
            repeat(20)
                begin
                    #2 addr = $random(seed) % 1024; 
                    wr = 0;
                    cs = 1;
                    $display($time, " address = %5d | data_in = %4d | data_out = %4d", addr, data_in, data_out);
                    cs = 0;
                    #1;
                end
                
                $finish();
    end
 
endmodule
