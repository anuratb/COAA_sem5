
##################### ASSIGNMENT 3 #########################
# Semester 5 Autumn 2021                                    
# Question 1   (ternary search)
# Group 2(19CS10071(Anurat Bhattacharya) ,  19CS10060(Sunanda Mandal))
############################################################

    .globl main

    .data
Enter10Integers:
    .asciiz "Enter 10 integers : \n"
Enterk:
    .asciiz "Enter the value to be searched: "
FoundAtIndex:
    .asciiz " found at index(0 indexed) "
NotFound:
    .asciiz " not found in the array\n"
SortedArray:
    .asciiz "The sorted array is : "
endl:
    .asciiz "\n"
space:
    .asciiz " " 

    .text



initStack:
    addi    $sp,$sp,-4
    sw		$fp, 0($sp)		
    move    $fp,$sp
    jr      $ra

pushToStack:
    addi    $sp,$sp,-4    
    sw      $a0,0($sp)
    move    $v0,$sp
    jr      $ra

printArray:
    addi    $sp,$sp,-8
    sw      $s0,($sp)    #arr
    sw      $s1,4($sp)   #n
    move    $s0,$a0
    move    $s1,$a1
    #Outputting Result
    la      $a0,SortedArray
    li      $v0,4
    syscall

    #output of the array
    #for int t0 = 0;t0!=n;t0++
    li      $t0,0 

OutLoop:    
    beq     $t0, $s1,EndOutLoop
    mul     $t1,$t0,4
    add     $t1,$t1,$s0
    li      $v0,1
    lw      $a0,($t1)    #print current elem
    syscall    
    li      $v0,4
    la      $a0,space    #print spaces
    syscall
    addi    $t0, $t0, 1         #increment t0
    j       OutLoop               # jump to target

EndOutLoop:
    lw      $s1,4($sp)
    lw      $s0,($sp)
    addi    $sp,$sp,8
    jr     $ra

#leaf function no need to store in stack
swap:
#  a0 : arr
#  a1 : i
#  a2 : j   ==> Swap arr[i] and arr[j]
    addi    $sp,$sp,-12
    sw      $s0,($sp)
    sw      $s1,4($sp)
    sw      $s2,8($sp)

    sll     $s0, $a1, 2             # $s0 = i*4
    add     $s0, $a0, $s0           # $s0 = &arr[i]
    sll     $s1, $a2, 2             # $s1 = j*4
    add     $s1, $a0, $s1           # $s1 = &arr[j]
    lw      $s2,($s1)      #s2 = arr[j]
    lw      $t6,($s0)      #t6  =arr[i]
    sw      $s2,($s0)     #arr[i] = arr[j] value     
    sw      $t6,($s1)     #arr[j] = arr[i] value

    lw      $s2,8($sp)
    lw      $s1,4($sp)
    lw      $s0,0($sp)
    addi    $sp,$sp,12
    jr      $ra 


recursive_sort:
    #a0 : arr  (s0)
    #a1 : left (s1)
    #a2 : right (s2)

    #s3 : p  (s3)
    #s4 : l  (s4)
    #s5 : r  (s5)

    add     $sp, $sp, -28
    sw      $ra,0($sp)
    sw      $s0,4($sp)      
    sw      $s1,8($sp)
    sw      $s2,12($sp)
    sw      $s3,16($sp)
    sw      $s4,20($sp)
    sw      $s5,24($sp)

    move $s0,$a0
    move $s1,$a1
    move $s2,$a2
    move $s3, $s1                   # p=left  
    move $s4, $s1                   # l 
    move $s5, $s2                   # r

While:
    bge $s4, $s5 , RetFunction     #l<r    

InnerWhile1:
    bge $s4,$s2,InnerWhile2    #if l>=r goto next while loop

    sll $t3, $s3, 2                 # $t3 = p * 4
    add $t3, $s0, $t3               # $t3 = arr+(p*4) (address of arr[p])
    lw $t3, 0($t3)                  # $t3 = arr[p]
    sll $t4, $s4, 2                 # $t4 = l * 4
    add $t4, $s0, $t4               # $t4 = arr+(l*4) (address of arr[l])
    lw $t4, 0($t4)                  # $t4 = arr[l]
    bgt $t4,$t3,InnerWhile2

    addi $s4, $s4, 1                #l++
    j InnerWhile1    #Till this --ok

InnerWhile2:
    ble $s5,$s1,IfCondition     #if r<=left break to IfCondition
    

    sll $t3, $s3, 2                 # $t3 = p * 4
    add $t3, $s0, $t3               # $t3 = arr+(p*4) (address of arr[p])
    lw $t3, 0($t3)                  # $t3 = arr[p]
    sll $t4, $s5, 2                 # $t4 = r * 4
    add $t4, $s0, $t4               # $t4 = arr+(r*4) (address of arr[r])
    lw $t4, 0($t4)                  # $t4 = arr[r]
    blt $t4,$t3,IfCondition   

    addi $s5, $s5, -1               #r--
    j InnerWhile2        #Til this  --ok
IfCondition:
    blt $s4,$s5,EndIf  #if l<r goto endif
    
    move $a0, $s0
    move $a1, $s3
    move $a2, $s5
    jal swap                    # swap arr[p] and arr[r]
    #call recursive_sort on left part
    move $a0, $s0
    move $a1, $s1               # left
    addi $a2, $s5, -1           # r-1    
    jal recursive_sort
    #call recursive_sort on right part
    move $a0, $s0
    addi $a1, $s5, 1            # r+1
    move $a2, $s2               # right
    jal recursive_sort
    j    RetFunction   #return 

EndIf:
    move $a0, $s0
    move $a1, $s4
    move $a2, $s5
    jal swap                    # swap arr[l] and arr[r]
    j  While

RetFunction:
    lw      $s5,24($sp)
    lw      $s4,20($sp)
    lw      $s3,16($sp)
    lw      $s2, 12($sp)        
    lw      $s1, 8($sp)
    lw      $s0,4($sp)
    lw      $ra ,0($sp)
    addi    $sp,$sp,28
    jr      $ra




recursive_search:
    #save variabless
    #A,start,end ,key
    #a0 :A   (s0)
    #a1 : start  (s1)
    #a2 : end  (s2)
    #a3 : key  (s3)
    add		$sp, $sp, -20
    sw      $ra,($sp)
    sw      $s0,4($sp)		
    sw      $s1,8($sp)
    sw      $s2,12($sp)
    sw      $s3,16($sp)

    move    $s0,$a0
    move    $s1,$a1
    move    $s2,$a2
    move    $s3,$a3

    #function body
    #init start and end
    #start : t0
    #end : t1
    move    $t0,$s1
    move    $t1,$s2			
    #base case
    #if $t0> $t1  invalid return
    bgt     $t0,$t1,RetNotFound
    #t2  : mid1
    #t3  : mid2
    sub     $t2,$t1,$t0
    div     $t2,$t2,3
    sub     $t3,$t1,$t2  #t3 = end - (end-start)/2
    add     $t2,$t2,$t0  #t2 = start + (end-start)/2
    #find A[mid1] and A[mid2] stored in t4 and t5
    mul     $t4,$t2,4
    add     $t4,$t4,$s0
    lw      $t4,($t4)
    mul     $t5,$t3,4
    add     $t5,$t5,$s0
    lw      $t5,($t5)

    #The branch conditions 
    beq     $s3,$t4,RetMid1    #if key == A[mid1]
    beq     $s3,$t5,RetMid2         #if key == A[mid2]
    blt     $s3,$t4,RetRecStartMid1_1    #if key < A[mid1]
    bgt     $s3,$t5,RetRecMid2__1End        #if key >A[mid2]
    j       RetRecMid1__1Mid2_1         #else
    

#return mid1    
RetMid1:
#restore variables
    lw      $s3, 16($sp)
    lw		$s2, 12($sp)		
    lw      $s1, 8($sp)
    lw      $s0,4($sp)
    lw      $ra ,0($sp)
    addi    $sp,$sp,20
    move    $v0,$t2
    jr      $ra
#return mid2
RetMid2:
#restore variables
    lw      $s3, 16($sp)
    lw		$s2, 12($sp)		
    lw      $s1, 8($sp)
    lw      $s0,4($sp)
    lw      $ra ,0($sp)
    addi    $sp,$sp,20
    move    $v0,$t3
    jr      $ra
RetRecStartMid1_1:
    #rec(A,start,mid1-1,k)
    move    $a0,$s0
    move    $a1,$t0
    sub     $a2,$t2,1
    move    $a3,$s3
    jal     recursive_search#result alraeady stored in v0
    lw      $s3, 16($sp)
    lw		$s2, 12($sp)		
    lw      $s1, 8($sp)
    lw      $s0,4($sp)
    lw      $ra ,0($sp)
    addi    $sp,$sp,20    
    jr      $ra

RetRecMid2__1End:
    #rec(A,mid2+1,end,k)
    move    $a0,$s0
    addi    $a1,$t3,1
    move    $a2,$t1
    move    $a3,$s3
    jal     recursive_search#result alraeady stored in v0
    lw      $s3, 16($sp)
    lw		$s2, 12($sp)		
    lw      $s1, 8($sp)
    lw      $s0,4($sp)
    lw      $ra ,0($sp)
    addi    $sp,$sp,20    
    jr      $ra
RetRecMid1__1Mid2_1:
    #rec(A,mid1+1,mid2-1)
    move    $a0,$s0
    addi    $a1,$t2,1
    sub     $a2,$t3,1
    move    $a3,$s3
    jal     recursive_search#result alraeady stored in v0
    lw      $s3, 16($sp)
    lw		$s2, 12($sp)		
    lw      $s1, 8($sp)
    lw      $s0,4($sp)
    lw      $ra ,0($sp)
    addi    $sp,$sp,20    
    jr      $ra
RetNotFound:
    #restore variables
    lw      $s3, 16($sp)
    lw		$s2, 12($sp)		
    lw      $s1, 8($sp)
    lw      $s0,4($sp)
    lw      $ra ,0($sp)
    addi    $sp,$sp,20
    li      $v0,-1
    jr      $ra


main:
#s0 size of array (10 in this case)
#s1 : start of stac1k
#t0 : loop index (current)
#s2 : value to be seached
#s3 : search result index (-1 if not found)

    #take input
    jal     initStack
    li		$v0,4 
    la		$a0, Enter10Integers	
    syscall
    li      $t0,0
    li      $s0,10   #10 integers
InputLoop:
    beq     $t0,$s0,InputLoopEnd
    li      $v0,5
    syscall
    move    $a0,$v0
    jal     pushToStack
    move    $s1,$v0     #s1 stores current array start
    addi	$t0, $t0, 1			    
    j       InputLoop
InputLoopEnd:

    move    $a0,$s1      #array begin A
    li      $a1,0        #left  = 0
    sub     $a2,$s0,1    #right = n-1
    jal     recursive_sort
    #print sorted arrays
    move    $a0,$s1
    move    $a1,$s0
    jal     printArray
    
    li      $v0,4
    la      $a0,endl
    syscall
    #take search value input
    li      $v0,4
    la      $a0,Enterk
    syscall
    li      $v0,5
    syscall
    move    $s2,$v0    #store k in  s2
    #call search function
    move    $a0,$s1      #array begin A
    li      $a1,0        #left  = 0
    sub     $a2,$s0,1    #right = n-1
    move    $a3,$s2      #a3 = key
    jal     recursive_search
    move    $s3,$v0   #array index =-1 if not found
    beq     $s3,-1,ValNotFound
#output the result
ValFound:
    li      $v0,1
    move    $a0,$s2
    syscall
    li      $v0,4
    la      $a0,FoundAtIndex
    syscall
    li      $v0,1
    move    $a0,$s3
    syscall
    li      $v0,4
    la      $a0,endl   #print newline
    syscall
    j       Exit
ValNotFound:
    li      $v0,1
    move    $a0,$s2
    syscall
    li      $v0,4
    la      $a0,NotFound
    syscall
Exit:
    #restore stack
    move    $sp,$fp
    lw      $fp,($sp)
    addi    $sp,$sp,4
    li      $v0,10   #for prog termination
    syscall
    
    