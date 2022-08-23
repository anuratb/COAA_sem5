##################### ASSIGNMENT 3 #########################
# Semester 5 Autumn 2021                                    
# Question 1  (Booths Multiplication)
# Group 2
#19CS10071
#19CS10060
############################################################


    .globl  main
    .data
inputa: 
    .asciiz "Enter First number: "
inputb: 
    .asciiz "Enter Second number: "
productOp:
    .asciiz "The product is: "
endl:
    .asciiz "\n"
space:
    .asciiz " "
overflowError:
    .asciiz "Error OverFlow! Enter 16 bit signed number!\n"
    .text

#leaf function so no need to store ra
multiply_booth:
    addi    $sp,$sp,-8
    sw      $s0,($sp)
    sw      $s1,4($sp)
    move    $s0,$a0   #multiplicand
    move    $s1,$a1     #multiplier
    #handle edge cases like the multiplicand  = -2^15, or both being -2^15
    bne     $s0,-32768,BEGIN_ALGO
    #swap the two numbers since multiplicand is -2^15, which will cause overflow on substraction from 0
    move    $t0,$s0
    move    $s0,$s1
    move    $s1,$t0
BEGIN_ALGO:
    beq     $s0,-32768,BOTH_EQUAL_INT16MIN
    andi    $s1,$s1,0x0000ffff   #clear left half bits of the multiplier
    sll     $s0,$s0,16          #shift to the left half (multiplicand)
    li      $t0,0     #Q_1
    li      $t1,16    #stores the count
BOOTH_LOOP:
    andi    $t3,$s1,1       #lsb of multiplier
    beq     $t3,$t0,BOTH_EQUAL    #00,11, case
    beq     $t3,1,ONE_ZERO        #10 case,branch to ZERO_ONE
ZERO_ONE:                         #01 case
    add     $s1,$s1,$s0             # A = A + M
    j		BOTH_EQUAL				# coommon stage for both non homogeonous cases   
    
ONE_ZERO:
    sub     $s1,$s1,$s0             #A =  A-M
BOTH_EQUAL:
    move    $t0,$t3    #Q_ = lsb
    sra     $s1,$s1,1     #arithmetic right shift
    addi    $t1,$t1,-1      #decrement count
    beq     $t1,0,END_BOOTH_LOOP    #break if count becomes 0
    j		BOOTH_LOOP			
END_BOOTH_LOOP:
    move    $v0,$s1     #store in v0 and restore saved variables and return
    lw      $s1,4($sp)
    lw      $s0,4($sp)
    addi    $sp,$sp,8
    jr      $ra
BOTH_EQUAL_INT16MIN:        #return separately when both are equal to -2^15
    li      $v0,1073741824  #2^30
    lw      $s1,4($sp)
    lw      $s0,4($sp)
    addi    $sp,$sp,8
    jr      $ra


main:
    #input 1
    li      $v0,4
    la      $a0,inputa
    syscall
    li      $v0,5
    syscall
    #check if outside of range of 16 bit signed
    slt     $t0,$v0,32768
    beq     $t0,0,Invalid
    li      $t0,-32768
    slt     $t0,$v0,$t0
    beq     $t0,1,Invalid
    move    $s0,$v0

    #input 1
    li      $v0,4
    la      $a0,inputb
    syscall
    li      $v0,5
    syscall
    #check if outside of range of 16 bit signed
    slt     $t0,$v0,32768
    beq     $t0,0,Invalid
    li      $t0,-32768
    slt     $t0,$v0,$t0
    beq     $t0,1,Invalid
    move    $s1,$v0

    #load arguments into a0,a1 and call multiply_booth
    move    $a0,$s0
    move    $a1,$s1
    jal		multiply_booth				
    move    $s2,$v0

    #print the answer
    li      $v0,4
    la      $a0,productOp
    syscall
    li      $v0,1
    move    $a0,$s2
    syscall
    li      $v0,4
    la      $a0,endl    
    syscall



Exit: 
    li      $v0,10  #terminate
    syscall

Invalid:
    li      $v0 ,4
    la      $a0 ,overflowError
    syscall
    j Exit



