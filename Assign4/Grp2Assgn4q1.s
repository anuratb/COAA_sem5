
##################### ASSIGNMENT 3 #########################
# Semester 5 Autumn 2021                                    
# Question 1   (print determinant of a matrix)
# Group 2(19CS10071(Anurat Bhattacharya) ,  19CS10060(Sunanda Mandal))
############################################################
    .globl main
    .data
endl:
    .asciiz "\n"
spc:
    .asciiz " "
inputNos: 
    .asciiz "Enter four positive integers n, a ,r and m(modulus): \n"
printA:
    .asciiz "The input Matrix is: \n"
printDet:
    .asciiz "The final determinant of matrix A is: \n"
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

#function to pop from stack and return the popped value in v0
popFromStack:
    lw      $v0,($sp)
    addi    $sp,$sp,4
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





#function to compute determinant recursively
#det(mat,n)
recursive_Det:
    #a0 :  mat
    #a1  :  n
    #return in v0
    #LOCAL VAR INFO
    #s0 : mat[][]
    #s1 : n
    #s2 : temp[][]
    #s3 : current sign
    #s4 : current ans
    #s5 : for index j in transition for loop (as recursive calls may overwrite t registers) 
    addi    $sp,$sp,-28       #allocate space in stack
    sw      $ra,($sp)
    sw      $s0,4($sp)
    sw      $s1,8($sp)
    sw      $s2,12($sp)
    sw      $s3,16($sp)
    sw      $s4,20($sp)
    sw      $s5,24($sp)

    move    $s0,$a0
    move    $s1,$a1
#Base case when n==1
    beq     $s1,1,BaseCase   
Recursion:
    #allocate space for temp matrix store address in s2
    addi    $t0,$s1,-1     #t0 = n-1
    mul     $a0,$t0,$t0   # temp is n-1 X n-1 matrix
    jal     mallocInStack
    move    $s2,$v0       #temp = s2
    li      $s3,1        #stores current sign
    li      $s4,0        #stores current answer initially 0
########Construct temp from mat#################
    #for i = 1;i<n;i++
    li      $t0,1
ConstrFor1:
    beq     $t0,$s1,EndConstrFor1
    # for j = 1;j<n;j++
    li      $t1,1
ConstrFor2:
    beq     $t1,$s1,EndConstrFor2
    #temp[i-1][j-1] = mat[i][j]
    addi    $t6,$s1,-1   # = n-1
    addi    $t2,$t0,-1
    mul     $t2,$t2,$t6
    add     $t2,$t2,$t1
    addi    $t2,$t2,-1
    mul     $t2,$t2,4
    add     $t2,$t2,$s2    #t2 = &temp[i-1][j-1]
    mul     $t3,$s1,$t0
    add     $t3,$t3,$t1
    mul     $t3,$t3,4
    add     $t3,$t3,$s0    #t3  =&mat[i][j]
    lw      $t3,($t3)     #t3  = mat[i][j]
    sw      $t3,($t2)     #temp[i-1][j-1] = mat[i][j]
    
    addi    $t1,$t1,1
    j       ConstrFor2
EndConstrFor2:
    addi    $t0,$t0,1
    j		ConstrFor1			    
EndConstrFor1:
########Recursion Transitions############
#for j = 0 ; j<n; j++  , s5 stores j
    li      $s5,0
TransFor1:
    beq     $s5,$s1,EndTransFor1
    move    $a0,$s2
    addi    $a1,$s1,-1
    jal     recursive_Det
    move    $t0,$v0
    mul     $t0,$t0,$s3    #multiply with sign
    mul     $t1,$s5,4      
    add     $t1,$t1,$s0
    lw      $t1,($t1)      #t1 = mat[0][j] where j  =$s5
    mul     $t0,$t0,$t1
    add     $s4,$s4,$t0    #update ans =  ans + sign*mat[0][j]*det(temp,n-1)
    mul     $s3,$s3,-1     #update the sign = sign*-1
    addi    $t0,$s1,-1
    beq     $s5,$t0,EndTransFor1   #break if i == n-1
    #update the minor
    #by replacing column j of temp by column j of matrix of course excluding the first row 
    #O(n) for each new construction once already constructed
    #for i = 1;i<n;i++   t0  =i
    li      $t0,1
TransFor2:
    beq     $t0,$s1,EndTransFor2
    #temp[i-1][j] = mat[i][j]
    mul     $t1,$t0,$s1  #i*n
    add     $t1,$t1,$s5
    sll     $t1,$t1,2
    add     $t1,$s0,$t1
    lw      $t3,($t1)    #t3 = mat[i][j]
    addi    $t1,$t0,-1
    addi    $t2,$s1,-1
    mul     $t1,$t1,$t2    #(i-1)*(n-1)
    add     $t1,$t1,$s5    #(i-1)*(n-1) + j
    sll     $t1,$t1,2
    add     $t1,$s2,$t1    #t1 = $temp[i-1][j]
    sw      $t3,($t1)    #temp[i-1][j] = mat[i][j]
    addi    $t0,$t0,1    
    j		TransFor2			
EndTransFor2:
    addi    $s5,$s5,1
    j		TransFor1				    
EndTransFor1:
    #pop temp
    addi    $t0,$s1,-1
    mul     $t0,$t0,$t0   #= (n-1)^2
    sll     $t0,$t0,2
    add     $sp,$sp,$t0   #pop temp from stack
    move    $v0,$s4
    j       ReturnBlock
BaseCase:
    lw      $v0,($s0)

ReturnBlock:
    
    #restrore saved elenents
    lw      $ra,($sp)
    lw      $s0,4($sp)
    lw      $s1,8($sp)
    lw      $s2,12($sp)
    lw      $s3,16($sp)
    lw      $s4,20($sp)
    lw      $s5,24($sp)
    addi    $sp,$sp,28
    jr      $ra






#main function
main:
    jal     initStack
    li      $v0,4
    la      $a0,inputNos
    syscall
    #input n
    li      $v0,5
    syscall
    slt     $t0,$zero,$v0
    bne     $t0,1,invalidState          #sanity checking
    move    $s1,$v0     #n
    #input a
    li      $v0,5
    syscall
    slt     $t0,$zero,$v0
    bne     $t0,1,invalidState          #sanity checking
    move    $t4,$v0     #a
    #input r
    li      $v0,5
    syscall
    slt     $t0,$zero,$v0
    bne     $t0,1,invalidState          #sanity checking
    move    $t5,$v0     #r
    #input   m
    li      $v0,5
    syscall
    slt     $t0,$zero,$v0
    bne     $t0,1,invalidState          #sanity checking
    move    $s0,$v0     #m stored in s0

    #allocate memory
    move    $a0,$s1       #n X n matrix  n stored in s1
    move    $a1,$s1
    jal     mallocInStack
    move    $s2,$v0      #s2  start of the matrix


    #genrate the matrix
    
    li      $t0,0
    #for int t0=0;t0<s1;t0++
Row3:
    beq     $t0,$s1,EndRow3

    #for int t1=0;t1<s1;t1++
    li		$t1,0 		
Col3:
    beq     $t1,$s1,EndCol3
    li      $v0,1
    mul     $t2,$t0,$s1  # t0 * s1
    add     $t2,$t2,$t1  # Compute current index  i*cols + j
    mul     $t2,$t2,4
    add     $t2,$t2,$s2    
    div		$t4, $s0			# elem/m   
    mfhi	$t4					# $t4  =  elem%m    
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

    move    $a0,$s1
    move    $a1,$s1
    move 	$a2,$s2
    jal		printMatrix 
    #--ok till this(debug)

    #compute the determinant
    move    $a0,$s2
    move    $a1,$s1
    jal     recursive_Det
    move    $s3,$v0
    #print determinant
    li		$v0,4
    la      $a0,printDet
    syscall
    li      $v0,1
    move    $a0,$s3
    syscall
    li      $v0,4
    la      $a0,spc
    syscall

    #restore stack
    move    $sp,$fp
    lw      $fp,($sp)
    addi    $sp,$sp,4

Exit:
    li      $v0,10
    syscall

invalidState:
    li      $v0,4
    la      $a0,InvalidState
    syscall
    j       Exit




