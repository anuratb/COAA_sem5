
##################### ASSIGNMENT 3 #########################
# Semester 5 Autumn 2021                                    
# Question 3   (print transpose of a matrix)
# Group 2
############################################################
    .globl main
    .data
endl:
    .asciiz "\n"
spc:
    .asciiz " "
inputNos: 
    .asciiz "Enter four positive integers m, n, a and r: \n"
printA:
    .asciiz "The input Matrix is: \n"
printTrans:
    .asciiz "The transpose of the input matrix is: \n"
InvalidState:
    .asciiz "Enter Positive Integer!\n"

    .text


#This function stores the frame pointer in the stack ,and then sets the frame pointer 
#to the stack pointer that is the beginnning of the stack pointer
initStack:
    addi    $sp,$sp,-4
    sw      $fp,($sp)
    move    $fp,$sp
    jr      $ra

#This funcction pushes to stack the value a0 that is the first parameter
pushToStack:   
    add     $sp,$sp,-4 
    sw      $a0,($sp)    
    jr      $ra


#function to allocate memory in the stack and return the final stack pointer
#a0 stores the number of elemets to be pushed
mallocInStack:    
    mul     $t0,$a0,-4      #multiply by -4(32 bits) to compute the correct offset
    add     $sp,$sp,$t0    
    move    $v0,$sp
    jr      $ra

#to print the matrix with
#m rows(stored in a0)
#n columns(stored in a1)
#A[][] (stored in a2)
#Leaf function no need to store ra in stack
printMatrix:
    addi    $sp,$sp,-12
    sw      $s0,0($sp)
    sw      $s1,4($sp)
    sw      $s2,8($sp)
    move    $s0,$a0
    move    $s1,$a1
    move    $s2,$a2

    #for int t0=0;t0<s0;t0++
    li      $t0,0
Row1:
    beq     $t0,$s0,EndRow1

    #for int t1=0;t1<s1;t1++
    li		$t1,0 		
Col1:
    beq     $t1,$s1,EndCol1
    li      $v0,1
    mul     $t2,$t0,$s1  # t0 * s1
    add     $t2,$t2,$t1  # Compute current index  i*cols + j
    mul     $t2,$t2,4
    add     $t2,$t2,$s2    
    lw      $t3,($t2)      
    move    $a0,$t3   #t3 stores A[t0][t1]
    syscall
    li      $v0,4
    la      $a0,spc
    syscall
    addi    $t1,$t1,1
    j       Col1
EndCol1:
    li      $v0,4
    la      $a0,endl
    syscall
    addi    $t0,$t0,1
    j		Row1				
    
EndRow1:
    lw      $s2,8($sp)
    lw      $s1,4($sp)
    lw      $s0,0($sp)
    addi    $sp,$sp,12
    jr      $ra



#to compute the transpose of the matrix
#m rows(stored in a0)
#n columns(stored in a1)
#A[][] (stored in a2)
#B[][] (stored in a3)
#Leaf function no need to store ra in stack
transposeMatrix:
    addi    $sp,$sp,-16
    sw      $s0,0($sp)
    sw      $s1,4($sp)
    sw      $s2,8($sp)
    sw      $s3,12($sp)
    move    $s0,$a0
    move    $s1,$a1
    move    $s2,$a2
    move    $s3,$a3
    #for int t0=0;t0<s0;t0++
    li      $t0,0
Row2:
    beq     $t0,$s0,EndRow2

    #for int t1=0;t1<s1;t1++
    li		$t1,0 		
Col2:
    beq     $t1,$s1,EndCol2
    li      $v0,1
    mul     $t2,$t0,$s1  # t0 * s1
    add     $t2,$t2,$t1  # Compute current index  i*cols + j
    mul     $t2,$t2,4
    add     $t2,$t2,$s2    
    lw      $t3,($t2)      
    mul     $t2,$t1,$s0 
    add     $t2,$t2,$t0
    mul     $t2,$t2,4
    add     $t2,$t2,$s3
    sw      $t3,($t2)
    addi    $t1,$t1,1
    j       Col2
EndCol2:
    addi    $t0,$t0,1
    j		Row2				
    
EndRow2:
    lw      $s3,12($sp)
    lw      $s2,8($sp)
    lw      $s1,4($sp)
    lw      $s0,0($sp)
    addi    $sp,$sp,16
    jr      $ra


main:
    li      $v0,4
    la      $a0,inputNos
    syscall
    #input
    li      $v0,5
    syscall
    slt     $t0,$zero,$v0
    bne     $t0,1,invalidState          #sanity checking
    move    $s0,$v0     #m
    li      $v0,5
    syscall
    slt     $t0,$zero,$v0
    bne     $t0,1,invalidState          #sanity checking
    move    $s1,$v0     #n
    li      $v0,5
    syscall
    slt     $t0,$zero,$v0
    bne     $t0,1,invalidState          #sanity checking
    move    $t4,$v0     #a
    li      $v0,5
    syscall
    slt     $t0,$zero,$v0
    bne     $t0,1,invalidState          #sanity checking
    move    $t5,$v0     #r
    #allocate memory
    move    $a0,$s0
    move    $a1,$s1
    jal     mallocInStack
    move    $s2,$v0

    move    $a0,$s1
    move    $a1,$s0
    jal     mallocInStack
    move    $s3,$v0

    #input the matrix
    
    li      $t0,0
Row3:
    beq     $t0,$s0,EndRow3

    #for int t1=0;t1<s1;t1++
    li		$t1,0 		
Col3:
    beq     $t1,$s1,EndCol3
    li      $v0,1
    mul     $t2,$t0,$s1  # t0 * s1
    add     $t2,$t2,$t1  # Compute current index  i*cols + j
    mul     $t2,$t2,4
    add     $t2,$t2,$s2    
    sw      $t4,($t2)    
    mul     $t4,$t4,$t5      
    addi    $t1,$t1,1
    j       Col3
EndCol3:
    addi    $t0,$t0,1
    j		Row3				
    
EndRow3:

    #print matrix A
    li      $v0,4
    la      $a0,printA
    syscall

    move    $a0,$s0
    move    $a1,$s1
    move 	$a2,$s2
    jal		printMatrix

    #compute transpose of A
    move    $a0,$s0
    move    $a1,$s1
    move 	$a2,$s2
    move    $a3,$s3
    jal		transposeMatrix

    #print matrix B
    li      $v0,4
    la      $a0,printTrans
    syscall

    move    $a0,$s1
    move    $a1,$s0
    move 	$a2,$s3
    jal		printMatrix

    

Exit:
    li      $v0,10
    syscall

invalidState:
    li      $v0,4
    la      $a0,InvalidState
    syscall
    j       Exit




