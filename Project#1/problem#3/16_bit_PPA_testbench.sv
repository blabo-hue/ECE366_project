module PPA16_tb;

  
    reg [15:0] A, B;  // 16-bit inputs
    reg Cin;          // Carry input
  
    wire [15:0] S;    // 16-bit sum output
    wire Cout;        // Carry output

  
    PPA16 ppa_16bit (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout)
    );

    // Finish the simulation after 1000 time units
    initial begin
        #1000 $finish;
    end

    // Monitor to display inputs and outputs
    initial begin
        $monitor("Time = %0t: A = %h, B = %h, Cin = %b, S = %h, Cout = %b", 
                 $time, A, B, Cin, S, Cout);
    end

    // Dump waveform for debugging
    initial begin
        $dumpfile("ppa16_waveform.vcd"); 
        $dumpvars(0, PPA16_tb);           
    end

    // Test cases
    initial begin
      
        A = 16'h0000; B = 16'h0000; Cin = 0;
        #50;

    
        A = 16'hFFFF; B = 16'hFFFF; Cin = 0;
        #50;

        
        A = 16'h0001; B = 16'h0001; Cin = 1;
        #50;

   
        A = $random; B = $random; Cin = $random % 2;
        #50;

        A = $random; B = $random; Cin = $random % 2;
        #50;

        A = 16'hFFFF; B = 16'h0001; Cin = 0;
        #50;

        A = 16'h7FFF; B = 16'h7FFF; Cin = 0;
        #50;

        A = $random; B = $random; Cin = $random % 2;
        #50;

        // End simulation
        $finish;
    end

endmodule