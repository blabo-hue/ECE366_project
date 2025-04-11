.data
input:      .word 15        #input value
output:     .word 0         #output value stored at address 0x10010000(+4) on data segment

.text
.globl fib
fib:
    lw $t0, input          # n 
    ble $t0, 1, base_return #if n <= 1, return
    
    sub $t1, $t1, $t1  # a = 0
    sub $t2, $t2, $t2  #initialize b to 0
    addi $t2, $t2, 1   # b = 1
    sub $t3, $t3, $t3 # initialize i to 0
    subi $t3, $t0, 1  # i = n - 1
    
loop: 
    move $t4, $t2    #temp = b
    add  $t2, $t1, $t2   #b = a + b
    move $t1, $t4        # a = temp
    subi $t3, $t3, 1     # i--
    bgtz $t3, loop       # if i > 0, loop
    move $t0, $t2
    
base_return:
    sw $t0, output

    
