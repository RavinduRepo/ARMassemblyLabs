@ ARM Assembly - exercise 7 
@ Group Number :19

	.text 	@ instruction memory

	
@ Write YOUR CODE HERE	

@ ---------------------	
Fibonacci:
	sub sp, sp, #8			@sp moving for storage
	str lr, [sp, #4]		@storing returning address 

	cmp r0, #1				
	bgt L1					@jump to F1 if > 1

	cmp r0, #0				
	bgt F1					@jump to F1 if == 0

	mov r0, #0				@returnin val for f0
	str r0, [sp, #0]		@storing answer on the stack
	add sp, sp, #8			@releasing srack
	mov pc, lr				@return

F1:
	sub r0, r0, #1			@n-1
	bl Fibonacci			@ricuring
	mov r0, #1 				@return val for f1
	ldr lr, [sp, #4]		@getting return address
	add sp, sp, #8			@releasing stack
	mov pc, lr				@returning

L1:
	sub r0, r0, #1			@n-1
	bl Fibonacci			@recuuring

	sub sp, sp, #16			@going up in sp again to get fn-2 value from the stack
	ldr r3, [sp, #0]		@fn-2
	mov r2, r0				@fn-1
	add r0, r2, r3			@fn = fn-1 + fn-2
	str r2, [sp, #8]		@storing current fn-1 value on the stack(next time it is accessed as fn-2)
	add sp, sp, #16			@geting sp back 
	ldr lr, [sp, #4]		@getting return adress
	add sp, sp, #8			@releasing stack
	mov pc, lr				@return


@ ---------------------
	
	.global main
main:
	@ stack handling, will discuss later
	@ push (store) lr to the stack
	sub sp, sp, #4
	str lr, [sp, #0]

	mov r4, #16 	@the value n

	@ calling the Fibonacci function
	mov r0, r4 	@the arg1 load
	bl Fibonacci
	mov r5,r0
	

	@ load aguments and print
	ldr r0, =format
	mov r1, r4
	mov r2, r5
	bl printf

	@ stack handling (pop lr from the stack) and return
	ldr lr, [sp, #0]
	add sp, sp, #4
	mov pc, lr

	.data	@ data memory
format: .asciz "F_%d is %d\n"

