// Code your testbench here
// or browse Examples
module TestBench();
    reg [3:0] A, B;  
    reg Cin;         
    wire [3:0] S;    
    wire Cout;       

   
    four_bit_RCS uut (.A(A), .B(B), .Cin(Cin), .S(S), .Cout(Cout));

    initial begin
      $monitor("Delay = %0t: A - B = %b - %b, Cin = %b, S = %b, Cout = %b", $time, A, B, Cin, S, Cout);



      {A,B,Cin} = {4'b0101, 4'b0001, 1'b1};
      #10
      {A,B,Cin} = {4'b0101, 4'b0010, 1'b1};
      #10
      {A,B,Cin} = {4'b0101, 4'b0011, 1'b1};
      #10
      {A,B,Cin} = {4'b0101, 4'b0100, 1'b1};
      #10
      {A,B,Cin} = {4'b0101, 4'b0101, 1'b1};
      #10
      {A,B,Cin} = {4'b0101, 4'b0110, 1'b1};
      #10
      {A,B,Cin} = {4'b0101, 4'b1000, 1'b1};
      #10
   
      
      $finish;
       
    end
endmodule