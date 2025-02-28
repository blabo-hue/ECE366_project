
module TestBench();
    reg [3:0] A, B; 
    reg Cin;         
    wire [3:0] S;    
    wire Cout;       

    
    four_bit_RCA_RCS uut (.A(A), .B(B), .Cin(Cin), .S(S), .Cout(Cout));

    initial begin
      //addition  
      $display("Addition(Cin = 0:)");
      
        Cin = 0;
        A = 4'b0101; B = 4'b0011;
        #10;
       $display("A = %b + B = %b, S = %b , Cout = %b", A, B, S, Cout);

        A = 4'b0010; B = 4'b1101; 
        #10;
        $display("A = %b + B = %b, S = %b , Cout = %b", A, B, S, Cout);

        //subtraction
        $display("Subtraction (Cin = 1):");
        Cin = 1;
      
        A = 4'b0101; B = 4'b0010;
        #10;
      
       $display("A = %b - B = %b, S = %b , Cout = %b", A, B, S, Cout);

        A = 4'b0011; B = 4'b1101; // 1101 is -3 in 2's complement
        #10;
       $display("A = %b - B = %b, S = %b , Cout = %b", A, B, S, Cout);

        // End simulation
        $finish;
    end
endmodule