@ ARM Assembly - lab 3.2 
@ Group Number :19 

	.text 	@ instruction memory

	
@ Write YOUR CODE HERE	

@ ---------------------	
gcd:
	
cond:
	cmp r1, #0		@check if reached to GDC
	bne gcdloop		@goto algorithe if GDC havent found
	mov pc, lr		@return

gcdloop:
	mov r3, r0		@keeping current a to get remainder
	mov r0, r1		@a = b

divloop:
	cmp r3, r1		
	subge r3, r3, r1@r3 = r3 - b if a >= b
	bge divloop		@loop
	mov r1, r3		@b = a%b
	b cond

@ ---------------------	

	.global main
main:
	@ stack handling, will discuss later
	@ push (store) lr to the stack
	sub sp, sp, #4
	str lr, [sp, #0]

	mov r4, #64 	@the value a
	mov r5, #24 	@the value b
	

	@ calling the mypow function
	mov r0, r4 	@the arg1 load
	mov r1, r5 	@the arg2 load
	bl gcd
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
format: .asciz "gcd(%d,%d) = %d\n"

