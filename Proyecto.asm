.text
.global main

main:
 
  li $a0,5
  li $a1,20
  li $a2,10
  li $a3,10
  
  li $v0,100
  syscall
  jal draw_rectangle
  
  li $v0,102
  syscall
 
  jr $ra

draw_horizontal_line:
  move $t0,$a0 ;#x
  move $t1,$a1 ;#x2
  move $t2,$a2 ;#y
  move $t3,$a3 ;#color
   addi $t1,$t1,1
for_loop:
  slt $t4,$t0,$t1
  beq $t4,$zero,end_loop
  move $a0,$t0
  move $a1,$t2
  move $a2,$t3
  li $v0,101
  syscall
  addi $t0,$t0,1
  j for_loop
end_loop:
  jr $ra

draw_rectangle:
    li $t0,0  ;#dy
    move $t2,$a2 ;# t2=w
    move $t3,$a3 ;# t3=h
    move $t4,$a1 ;# t4=y
    move $t5,$a0 ;# t5=x
    loop_y:
       slt $t6,$t0,$t3
       beq $t6,$zero,end
       li $t6,0 ;#dx
       loop_x:
         slt $t7,$t6,$t2
         beq $t7,$zero,end_x
         add $t7,$t5,$t6
         add $t8,$t4,$t0
         move $a0,$t7
         move $a1,$t8
         li $a2,0x00FF00
         li $v0,101
         syscall
         addi $t6,$t6,1
         j loop_x
    end_x:
    addi $t0,$t0,1
    j loop_y
    end:
     jr $ra
