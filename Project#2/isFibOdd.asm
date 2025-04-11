.data
input:      .word 9         #input
Fib_output: .word 0         #Fibonacci nth number stored at address 0x10010000(+4) on data segment
isFibOdd:   .word 0         #0 if even, 1 if odd  stored at address 0x10010000(+8) on data segment

.text
.globl main

main:
    lw $t0, input               #input value stored to t0
    ble $t0, 1, check_odd_loop  #if n <= 1, return
    sub $t1, $t1, $t1           #a = 0
    sub $t2, $t2, $t2           #initialize b to 0
    addi $t2, $t2, 1            # b = 1
    sub $t3, $t3, $t3           #initialize i to 0
    subi $t3, $t0, 1            # i = n - 1
      
fib_loop: 
    move $t4, $t2               #temp = b
    add  $t2, $t1, $t2          #b = a + b
    move $t1, $t4               # a = temp
    subi $t3, $t3, 1            # i--
    bgtz $t3, fib_loop          # if i > 0, loop
    
    move $t0, $t2               #get result of t2 and store to t0
    sw   $t0, Fib_output
    
check_odd_loop:    
    beq $t0, 1, fib_odd         #if nth number = 1, jump to fib_odd
    beq $t0, 0, fib_even        #if nth number =0, jump to fib_even
    subi $t0, $t0, 2            #n = n - 2
    j	check_odd_loop          
   
fib_even:
    sw $t0, isFibOdd            #store even result
    j end                       

fib_odd:
    sw $t0, isFibOdd            #store odd result
    
end:  
    

    
    
