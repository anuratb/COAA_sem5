##################### ASSIGNMENT 2 #########################
# Semester 5 Autumn 2021                                    
# Question 2
# Anurat Bhattacharya(19CS10071)
# Sunanda Mandal(19CS10060)
############################################################

    .globl main

    .data
prompt1:
    .asciiz "Enter the first positive integer: "
prompt2:
    .asciiz "Enter the second positive integer: "
    
res:
    .asciiz "GCD of the two integers is: "
invalidInput:
    .asciiz "Invalid Input ,Enter positive number .Exitting...\n"

    .text

gcd:
     
    move    $t0 , $a0                   # copy a to $t0
    move    $t1,  $a1                   # copy b to $t1  
    beq     $t0 , $zero , retB          # if a==0  return b($t1)
    
loop:
    beq     $t1 , $zero , retA          # if b==0 return a    
    slt     $t2 , $t1, $t0              # check if b<a ,
    beq     $t2, 1, decreaseA           # if a>b that is b<a go to subtracting b from a
decreaseB:
    sub     $t1, $t1, $t0               # else b = b-a    subtract a from b 
    j       loop                        # Continue loop

decreaseA:
    sub     $t0 , $t0, $t1              # a = a-b
    j       loop                        # Continue loop    

retA:
    move    $v0, $t0                    # Move $t0(a) to $v0 and return 
    jr      $ra
retB:
    move    $v0 , $t1                   # Move $t1(b) to $v0 and then return   
    jr      $ra


# main program
#
# program variables
#   a:  $s0
#   b:  $s1
#   g:  $s3
#
main:    

    # Input for first integer
    li      $v0, 4                      #for printing string prompt1
    la      $a0, prompt1
    syscall

    li      $v0 , 5                     #for read int
    syscall

    slt     $t0, $zero ,$v0             # sanity checking
    beq		$t0, $zero, InvalidInput	# if $v0<=0 branch to label Invalid Input
    move    $s0, $v0                    # store in $s0


    # Input for second integer
    li      $v0, 4                      # for printing string promt2
    la      $a0, prompt2
    syscall

    li      $v0 , 5                     # for read int
    syscall

    slt     $t0, $zero ,$v0             # sanity checking
    beq		$t0, $zero, InvalidInput	# if $v0<=0 branch to label Invalid Input
    move    $s1, $v0                    # store in $s1


    move    $a0, $s0                    # $a0<== $s0  first argument
    move    $a1 , $s1                   # $a1<== $s1  second argument
    jal		gcd				            # call gcd function
    move    $s3, $v0                    # move gcd result to $s3
    
    li      $v0, 4                      # for printing result g=gcd(a,b) 
    la      $a0, res
    syscall

    li		$v0, 1		                # Print the gcd result integer
    move    $a0 , $s3
    syscall

Exit:
    li      $v0, 10                     # terminate the program
    syscall

InvalidInput:
    li      $v0, 4                      # for printing string for invalid input
    la      $a0, invalidInput    
    syscall
    j       Exit                        # Exit the program