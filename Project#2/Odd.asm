.data
input:      .word 1023     #input value
output:     .word 0        #output value stored at address 0x10010000(+4) on data segment

.text
.globl isodd

isodd:
    lw $t0, input          # n 
    
loop:          
    beq $t0, 1, odd     #if n = 1, odd
    beq $t0, 0, even    #if n =0, even
    subi $t0, $t0, 2     #n = n - 2
    j	loop
   
even:
    sw $t0, output
    j end

odd:
    sw $t0, output
    
end: 
   
