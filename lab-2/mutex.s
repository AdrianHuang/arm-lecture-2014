	.syntax unified
	.arch armv7-a
	.text

	.equ locked, 1
	.equ unlocked, 0

	.global lock_mutex
	.type lock_mutex, function
lock_mutex:
        @ INSERT CODE BELOW
	mov r1, locked

.loop:
	ldrex r4, [r0] 	

	cmp r4, unlocked
	strexeq r4, r1, [r0]
	cmp r4, #0
	bne .loop

        @ END CODE INSERT
	bx lr

	.size lock_mutex, .-lock_mutex

	.global unlock_mutex
	.type unlock_mutex, function
unlock_mutex:
	@ INSERT CODE BELOW

 	mov r4, unlocked

	@ memory barrier
	dmb
	str r4, [r0]
       
        @ END CODE INSERT
	bx lr
	.size unlock_mutex, .-unlock_mutex

	.end
