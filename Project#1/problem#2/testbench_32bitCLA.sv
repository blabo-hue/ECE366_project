//This testbench is executed in EDA playground using: iverilog '-Wall' '-g2012' //(Filename).sv (testbench_filename).sv  && unbuffer vvp a.out  


module CLA_32bit_tb;

    reg [31:0] A, B;  
    reg Cin;          
    wire [31:0] S;    
    wire Cout;        

    
    CLA cla_32bit (
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
        $monitor("A = %h, B = %h, Cin = %b, S = %h, Cout = %b", A, B, Cin, S, Cout);
    end

    /*
    $random generates a random number based on the bus size of the variable.
    This happens every 50 units of time.
    */
    always begin
        #50;
        A = $random;  
        B = $random;  
        Cin = $random % 2;  
    end

endmodule