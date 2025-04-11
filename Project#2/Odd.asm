.data
n:      .word 1023
output: .word 0 

.text
.globl isodd

isodd:
    lw $t0, n          # n 
    
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
   