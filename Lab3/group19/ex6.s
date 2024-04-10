@ ARM Assembly - exercise 6 
@ Group Number :19

	.text 	@ instruction memory
	
	
@ Write YOUR CODE HERE	

@ ---------------------	
fact:
	mov r2, r0 @moving the n value to re
loop:
	sub r2, r2, #1	@substracting 1 from n
	cmp r2, #0	@compare if greater than 0
	ble return	@end of loop
	mov r1, r0	@temperaly mov to multiply
	mul r0, r1, r2	
	b loop		@looping	
return:
	mov pc, lr	@return to called location

@ ---------------------	

.global main
main:
	@ stack handling, will discuss later
	@ push (store) lr to the stack
	sub sp, sp, #4
	str lr, [sp, #0]

	mov r4, #8 	@the value n

	@ calling the fact function
	mov r0, r4 	@the arg1 load
	bl fact
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
format: .asciz "Factorial of %d is %d\n"

