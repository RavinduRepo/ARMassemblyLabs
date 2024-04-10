@ ARM Assembly - lab 2
@ Group Number : 19

	.text 	@ instruction memory
	.global main
main:
	@ stack handling, will discuss later
	@ push (store) lr to the stack
	sub sp, sp, #4
	str lr, [sp, #0]

	@ load values
	
	@ Write YOUR CODE HERE
	
	@	Sum = 0;
	@	for (i=0;i<10;i++){
	@			for(j=5;j<15;j++){
	@				if(i+j<10) sum+=i*2
	@				else sum+=(i&j);	
	@			}	
	@	} 
	@ Put final sum to r5
	@ ---------------------
	mov r8, #0
	mov r9, #0
	mov r10, #0
	mov r5, #0	@Sum
	mov r6, #0	@i
	cmp r6, #10
	blt Loopi
	b End
Loopi:
	mov r7, #5	@j
	cmp r7, #15
	blt Loopj
	add r6, #1
	cmp r6, #10
	blt Loopi
	b End
Loopj:
	add r8, r6, r7
	cmp r8, #10
	blt If
	and r10, r6, r7
	add r5, r5, r10
	add r7, #1
	cmp r7, #15
	blt Loopj
	add r6, #1
	cmp r6, #10
	blt Loopi
	b End
If:
	add r9, r6, r6
	add r5, r5, r9
	add r7, #1
	cmp r7, #15
	blt Loopj
	add r6, #1
	cmp r6, #10
	blt Loopi
End:		
	@ ---------------------
	
	
	@ load aguments and print
	ldr r0, =format
	mov r1, r5
	bl printf

	@ stack handling (pop lr from the stack) and return
	ldr lr, [sp, #0]
	add sp, sp, #4
	mov pc, lr

	.data	@ data memory
format: .asciz "The Answer is %d (Expect 300 if correct)\n"

