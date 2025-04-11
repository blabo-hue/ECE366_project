ECE 366 project#2: Final Report

Member(s):
Bobby Labonite, blabo@uic.edu

Contribution:
Bobby Labonite
  - coded fib(n) which finds the nth Fibonacci number by following closely the given Figure 1a pseudo-code.
  - coded odd(n) which detects if the given number is odd or even by using division by subtraction. For instance, the given number will be subtracted by 2 until it reaches 0 or 1(O = even, 1 = odd) and store its result.           
  - coded isFibOdd(n) by combining the previous 2 function which finds the nth Fibonacci number(fib(n)) and get that result to find if it is odd(1) or even(0).
               
Github link: https://github.com/blabo-hue/ECE366_project

Prerequisites:
MARS (MIPS Assembler and Runtime Simulator) - Download and install from:http://courses.missouristate.edu/KenVollmar/mars/
Java SDK - Required for running MARS, available at: https://www.oracle.com/java/technologies/javase-downloads.html

How to run the program:

1. Download the the files from the given github link on Project#2 folder

    (i) Fib(n) - finds the nth Fibonacci number.
    (ii) Odd(n) - check if the given number is Odd(1) or Even(0).
    (iii) isFibOdd(n) - computes the nth Fibonacci number and use that result to check if it is odd(1) or even(0).
 
3. Open MARS and load the desired file.
   
4. Modify Input:
    In the .data section, change:
    input: .word 15   # Replace '15' with your desired n
   
5. Run the Program:
    Click "Assemble" (screwdriver/wrench icon).
    Click "Run" (green play button).
    View results in the data segment (comments indicate output location).

Insights:

  -The code on finding the nth Fibonacci number closely follows the logic of the pseudo-code by making i = n - 1, and loop until it reaches before 0. 
  -Finding the odd number is much simplier since it just subtracts the given number by 2 and keeps repeating it until it reaches 1 or 0. If it is odd, it will always reach 1 when subtracted by 2 repeatedly before it hits 0, thus I coded a 
  condition to jump to Odd when it reaches the value of 1 or 0 first. 
  -Lastly, I combined the 2 program to create the final function isFibOdd(n) with some modifications to make it shorter.
