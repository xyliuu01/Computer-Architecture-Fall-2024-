.data
input_num: .word    3
prefix:     .string "Fibonacci("
suffix:     .string ") = "

.text
main:                          
        lw    a0, input_num     # Load the input_num (N) from memory
        li    s0, 1            # Set s0 to 1 (this will be the first Fibonacci number)
        li    s1, 0            # Initialize s1 to 0 (this will be the second Fibonacci number)
        li    t0, 0             # Initialize counter t0 to 0
        
loop:                           
        beq   t0, a0, L1       # If counter (t0) equals N, exit loop
        add   t2, s0, s1       # t2 = s0 + s1 (Fibonacci calculation)
        mv    s0, s1           # Move s1 to s0 for next iteration
        mv    s1, t2           # Move t2 to s1 for next iteration
        addi  t0, t0, 1        # Increment counter t0
        j     loop             # Jump back to start of loop
        
L1:    
        mv    a0, s1           # The result is in s1 (the N-th Fibonacci number)

        # Prepare to print the result
        lw    a1, input_num     # Load the input_num (N) again for printing
        jal   ra, Result  

        j     terminate             

Result:                   
        mv    t0, a1           # Move N to t0 for printing
        mv    t1, a0           # Move the Fibonacci result to t1 for printing
        la    a0, prefix         # Load address of prefix
        li    a7, 4            # System call for print string
        ecall                  
        mv    a0, t0           # Move N to a0 for printing
        li    a7, 1            # System call for print integer
        ecall                  
        la    a0, suffix       # Load address of suffix
        li    a7, 4            # System call for print string
        ecall                  
        mv    a0, t1           # Move Fibonacci result to a0 for printing
        li    a7, 1            # System call for print integer
        ecall                  
        ret

terminate:
        li   a7, 12            # Exit system call
        ecall