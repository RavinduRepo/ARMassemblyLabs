@ ARM Assembly - lab 3.1
@ 
@ Roshan Ragel - roshanr@pdn.ac.lk
@ Hasindu Gamaarachchi - hasindu@ce.pdn.ac.lk

	.text 	@ instruction memory

	
@ Write YOUR CODE HERE	

@ ---------------------	
mypow:
	mov r3, r0		@storing base value
cond:
	cmp r1, #0		
	bne notzero		@check if pow is zero
	mov r0, #1		@ans = 1 if pow = 0
	mov pc, lr		@return

notzero:
	cmp r1, #1		
	bgt loop		@check val of pow
	mov pc, lr		@return if pow = 1

loop:
	mov r2, r0		@temp store to multiply
	mul r0, r2, r3	
	sub r1, r1, #1	@substracting pow
	b notzero		@looping(iterating)
@ ---------------------	

	.global main
main:
	@ stack handling, will discuss later
	@ push (store) lr to the stack
	sub sp, sp, #4
	str lr, [sp, #0]

	mov r4, #8 	@the value x
	mov r5, #3 	@the value n
	

	@ calling the mypow function
	mov r0, r4 	@the arg1 load
	mov r1, r5 	@the arg2 load
	bl mypow
	mov r6,r0
	

	@ load aguments and print
	ldr r0, =format
	mov r1, r4
	mov r2, r5
	mov r3, r6
	bl printf

	@ stack handling (pop lr from the stack) and return
	ldr lr, [sp, #0]
	add sp, sp, #4
	mov pc, lr

	.data	@ data memory
format: .asciz "%d^%d is %d\n"

