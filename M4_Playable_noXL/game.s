	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"game.c"
	.text
	.align	2
	.global	displayTime
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	displayTime, %function
displayTime:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	lr, #384
	ldr	r2, .L4
	ldr	r3, .L4+4
	ldr	r1, [r2]
	ldr	r4, .L4+8
	ldr	r0, [r3]
	smull	r3, r2, r4, r1
	smull	r3, r6, r4, r0
	asr	r3, r1, #31
	rsb	r3, r3, r2, asr #2
	add	r5, r3, r3, lsl #2
	ldr	r4, .L4+12
	ldr	ip, .L4+16
	sub	r1, r1, r5, lsl #1
	ldr	r2, .L4+20
	add	r5, r1, #2
	lsl	r3, r3, #16
	ldm	r4, {r1, r8}
	ldr	r7, [ip]
	ldr	r2, [r2]
	asr	r3, r3, #16
	add	ip, r3, #2
	asr	r4, r0, #31
	ldr	r3, .L4+24
	sub	r1, r1, #16
	rsb	r4, r4, r6, asr #2
	sub	r2, r8, r2
	sub	r1, r1, r7
	lsl	ip, ip, #5
	strh	ip, [r3, #164]	@ movhi
	lsl	r2, r2, #16
	lsl	ip, r4, #16
	lsl	r1, r1, #16
	add	r4, r4, r4, lsl #2
	lsr	r1, r1, #16
	lsr	r2, r2, #16
	sub	r0, r0, r4, lsl #1
	asr	ip, ip, #16
	strh	r1, [r3, #160]	@ movhi
	strh	r1, [r3, #168]	@ movhi
	strh	r1, [r3, #176]	@ movhi
	strh	r1, [r3, #184]	@ movhi
	strh	r1, [r3, #192]	@ movhi
	add	ip, ip, #2
	add	r1, r2, #4
	add	r0, r0, #2
	sub	r4, r2, #4
	lsl	r5, r5, #5
	strh	r2, [r3, #170]	@ movhi
	strh	r1, [r3, #178]	@ movhi
	lsl	ip, ip, #5
	add	r1, r2, #8
	lsl	r0, r0, #5
	add	r2, r2, #12
	strh	r5, [r3, #172]	@ movhi
	strh	r4, [r3, #162]	@ movhi
	strh	lr, [r3, #180]	@ movhi
	strh	r1, [r3, #186]	@ movhi
	strh	r2, [r3, #194]	@ movhi
	strh	ip, [r3, #188]	@ movhi
	strh	r0, [r3, #196]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	time_m
	.word	time_s
	.word	1717986919
	.word	guy
	.word	guyvOff
	.word	guyhOff
	.word	shadowOAM
	.size	displayTime, .-displayTime
	.align	2
	.global	timerInterruptHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	timerInterruptHandler, %function
timerInterruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	ldr	r2, .L53
	ldr	r2, [r2]
	ldr	r3, .L53+4
	cmp	r2, r1
	push	{r4, lr}
	strh	r1, [r3, #8]	@ movhi
	bne	.L7
	ldrh	r2, [r3, #2]
	ldr	r3, .L53+8
	tst	r2, #32
	ldr	r2, [r3]
	bne	.L49
.L9:
	ldr	r3, .L53+12
	ldr	r3, [r3]
	orrs	r3, r2, r3
	bne	.L7
	ldr	r3, .L53+4
	ldrh	r3, [r3, #2]
	tst	r3, #1
	bne	.L50
.L12:
	ldr	r3, .L53+4
	ldrh	r3, [r3, #2]
	tst	r3, #4096
	beq	.L24
	ldr	r2, .L53+16
	ldrh	r3, [r2, #48]
	ands	r3, r3, #4
	strheq	r3, [r2, #10]	@ movhi
.L24:
	mov	r1, #1
	ldr	r3, .L53+4
	ldrh	r2, [r3, #2]
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L7:
	ldr	r3, .L53+4
	ldrh	r3, [r3, #2]
	tst	r3, #1
	beq	.L12
	ldr	r3, .L53+20
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L20
.L48:
	ldr	r2, [r3, #28]
	ldr	r1, [r3, #20]
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #28]
	ble	.L20
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L51
	ldr	r0, .L53+24
	ldr	r1, .L53+16
	ldr	r0, [r0]
	str	r2, [r3, #12]
	str	r2, [r0, #20]
	strh	r2, [r1, #2]	@ movhi
.L20:
	ldr	r3, .L53+28
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L12
	ldr	r2, [r3, #28]
	ldr	r1, [r3, #20]
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #28]
	ble	.L12
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L52
	ldr	r0, .L53+24
	ldr	r1, .L53+16
	ldr	r0, [r0]
	str	r2, [r3, #12]
	str	r2, [r0, #32]
	strh	r2, [r1, #6]	@ movhi
	b	.L12
.L49:
	ldr	r1, .L53+32
	ldr	r3, [r1]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r1]
	bge	.L9
	mov	ip, #59
	ldr	r0, .L53+36
	ldr	r3, [r0]
	sub	r3, r3, #1
	str	r3, [r0]
	str	ip, [r1]
	b	.L9
.L50:
	bl	displayTime
	ldr	r3, .L53+20
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L20
	b	.L48
.L51:
	ldm	r3, {r0, r1}
	ldr	r3, .L53+40
	mov	lr, pc
	bx	r3
	b	.L20
.L52:
	ldm	r3, {r0, r1}
	ldr	r3, .L53+44
	mov	lr, pc
	bx	r3
	b	.L12
.L54:
	.align	2
.L53:
	.word	paused
	.word	67109376
	.word	won
	.word	lost
	.word	67109120
	.word	soundA
	.word	dma
	.word	soundB
	.word	time_s
	.word	time_m
	.word	playSoundA
	.word	playSoundB
	.size	timerInterruptHandler, .-timerInterruptHandler
	.align	2
	.global	enableTimerInterrupts
	.syntax unified
	.arm
	.fpu softvfp
	.type	enableTimerInterrupts, %function
enableTimerInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	ip, #49152
	mov	lr, #0
	mov	r0, #195
	ldr	r1, .L57
	ldrh	r2, [r1]
	ldr	r3, .L57+4
	orr	r2, r2, #32
	strh	lr, [r3, #10]	@ movhi
	strh	r2, [r1]	@ movhi
	ldr	lr, [sp], #4
	strh	ip, [r3, #8]	@ movhi
	strh	r0, [r3, #10]	@ movhi
	bx	lr
.L58:
	.align	2
.L57:
	.word	67109376
	.word	67109120
	.size	enableTimerInterrupts, .-enableTimerInterrupts
	.align	2
	.global	setupTimerInterrupts
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupTimerInterrupts, %function
setupTimerInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #67108864
	push	{r4, lr}
	mov	r0, #49152
	mov	r4, #0
	mov	lr, #195
	mov	ip, #1
	ldrh	r2, [r1, #4]
	orr	r2, r2, #8
	strh	r2, [r1, #4]	@ movhi
	ldr	r3, .L61
	ldrh	r1, [r3]
	ldr	r2, .L61+4
	orr	r1, r1, #33
	strh	r4, [r2, #10]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r0, [r2, #8]	@ movhi
	ldr	r1, .L61+8
	ldr	r0, .L61+12
	strh	lr, [r2, #10]	@ movhi
	strh	ip, [r3, #8]	@ movhi
	pop	{r4, lr}
	str	r0, [r1, #4092]
	bx	lr
.L62:
	.align	2
.L61:
	.word	67109376
	.word	67109120
	.word	50360320
	.word	timerInterruptHandler
	.size	setupTimerInterrupts, .-setupTimerInterrupts
	.align	2
	.global	initGuy
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGuy, %function
initGuy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #16
	push	{r4, lr}
	mov	r2, #1
	mov	r1, #0
	mov	r4, #8
	mov	lr, #4
	mov	ip, #2
	ldr	r3, .L65
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	ldr	r0, .L65+4
	str	lr, [r3, #40]
	stm	r3, {r0, r4}
	str	ip, [r3, #28]
	str	r2, [r3, #12]
	str	r2, [r3, #8]
	str	r2, [r3, #48]
	str	r2, [r3, #52]
	str	r1, [r3, #24]
	str	r1, [r3, #36]
	str	r1, [r3, #56]
	pop	{r4, lr}
	bx	lr
.L66:
	.align	2
.L65:
	.word	guy
	.word	742
	.size	initGuy, .-initGuy
	.align	2
	.global	initDoor
	.syntax unified
	.arm
	.fpu softvfp
	.type	initDoor, %function
initDoor:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r0, #16
	mov	r1, #32
	mov	r2, #1
	mov	r7, #164
	mov	r6, #476
	mov	r5, #200
	mov	r4, #640
	mov	lr, #48
	mov	ip, #230
	ldr	r3, .L69
	stm	r3, {r6, r7}
	str	r5, [r3, #24]
	str	r4, [r3, #20]
	str	lr, [r3, #44]
	str	r0, [r3, #8]
	str	r0, [r3, #28]
	str	r0, [r3, #48]
	str	ip, [r3, #40]
	str	r1, [r3, #12]
	str	r1, [r3, #32]
	str	r1, [r3, #52]
	str	r2, [r3, #16]
	str	r2, [r3, #36]
	str	r2, [r3, #56]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L70:
	.align	2
.L69:
	.word	door
	.size	initDoor, .-initDoor
	.align	2
	.global	initKey
	.syntax unified
	.arm
	.fpu softvfp
	.type	initKey, %function
initKey:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #16
	mov	r1, #1
	mov	r6, #152
	mov	r5, #324
	mov	r4, #184
	mov	lr, #568
	mov	ip, #232
	mov	r0, #100
	ldr	r3, .L73
	stm	r3, {r5, r6}
	str	r4, [r3, #24]
	str	lr, [r3, #20]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	r2, [r3, #48]
	str	r2, [r3, #52]
	str	ip, [r3, #44]
	str	r0, [r3, #40]
	str	r1, [r3, #16]
	str	r1, [r3, #36]
	str	r1, [r3, #56]
	pop	{r4, r5, r6, lr}
	bx	lr
.L74:
	.align	2
.L73:
	.word	key
	.size	initKey, .-initKey
	.align	2
	.global	initTele
	.syntax unified
	.arm
	.fpu softvfp
	.type	initTele, %function
initTele:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #32
	mov	lr, #208
	mov	ip, #37
	mov	r0, #56
	mov	r1, #222
	ldr	r3, .L77
	stm	r3, {ip, lr}
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	r0, [r3, #24]
	str	r1, [r3, #20]
	ldr	lr, [sp], #4
	bx	lr
.L78:
	.align	2
.L77:
	.word	tele
	.size	initTele, .-initTele
	.align	2
	.global	initBoots
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBoots, %function
initBoots:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #16
	mov	ip, #72
	mov	r1, #1
	ldr	r3, .L80
	ldr	r0, .L80+4
	str	r2, [r3, #8]
	stm	r3, {r0, ip}
	str	r2, [r3, #12]
	str	r1, [r3, #16]
	bx	lr
.L81:
	.align	2
.L80:
	.word	boots
	.word	366
	.size	initBoots, .-initBoots
	.align	2
	.global	initShirt
	.syntax unified
	.arm
	.fpu softvfp
	.type	initShirt, %function
initShirt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #16
	mov	r1, #1
	mov	ip, #136
	mov	r0, #60
	str	lr, [sp, #-4]!
	ldr	r3, .L84
	ldr	lr, .L84+4
	str	r2, [r3, #8]
	str	lr, [r3]
	str	r2, [r3, #12]
	str	r2, [r3, #4]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	ip, [r3, #24]
	str	r0, [r3, #20]
	str	r1, [r3, #16]
	str	r1, [r3, #36]
	ldr	lr, [sp], #4
	bx	lr
.L85:
	.align	2
.L84:
	.word	shirt
	.word	282
	.size	initShirt, .-initShirt
	.align	2
	.global	initCustomer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initCustomer, %function
initCustomer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r1, #16
	mov	lr, #17
	mov	r2, #0
	mov	ip, #13
	mov	r0, #4
	ldr	r3, .L88
	str	lr, [r3]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	ip, [r3, #4]
	str	r0, [r3, #40]
	str	r2, [r3, #24]
	str	r2, [r3, #36]
	ldr	lr, [sp], #4
	bx	lr
.L89:
	.align	2
.L88:
	.word	customer
	.size	initCustomer, .-initCustomer
	.align	2
	.global	initBubble
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBubble, %function
initBubble:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #16
	mov	r4, #40
	mov	lr, #316
	mov	r1, #1
	mov	ip, #72
	mov	r0, #150
	ldr	r3, .L92
	str	r4, [r3, #4]
	str	lr, [r3]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	ip, [r3, #24]
	str	r0, [r3, #20]
	str	r1, [r3, #16]
	str	r1, [r3, #36]
	pop	{r4, lr}
	bx	lr
.L93:
	.align	2
.L92:
	.word	bubble
	.size	initBubble, .-initBubble
	.align	2
	.global	initCrazy
	.syntax unified
	.arm
	.fpu softvfp
	.type	initCrazy, %function
initCrazy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, #0
	ldr	r9, .L181
	mov	r10, r4
	mov	r1, r9
	mov	r3, r9
	mov	r6, r4
	mov	r2, r4
	mov	ip, r4
	mov	lr, #32
	mov	r0, #1
	ldr	r5, [r9, #60]
	sub	sp, sp, #76
	str	r5, [sp]
	ldr	r5, [r9, #180]
	str	r5, [sp, #20]
	ldr	r5, [r9, #184]
	str	r5, [sp, #24]
	ldr	r5, [r9, #120]
	str	r5, [sp, #8]
	ldr	r5, [r9, #124]
	str	r5, [sp, #12]
	ldr	r5, [r9, #300]
	str	r5, [sp, #44]
	ldr	r5, [r9, #304]
	str	r5, [sp, #48]
	ldr	r5, [r9, #240]
	str	r5, [sp, #32]
	ldr	r5, [r9, #244]
	str	r5, [sp, #36]
	ldr	r5, [r9, #420]
	str	r5, [sp, #64]
	ldr	r5, [r9, #424]
	str	r5, [sp, #68]
	ldr	r5, [r9, #360]
	str	r4, [sp, #56]
	str	r4, [sp, #40]
	str	r4, [sp, #28]
	str	r4, [sp, #16]
	str	r4, [sp, #4]
	ldr	fp, [r9, #64]
	ldr	r8, [r9]
	ldr	r7, [r9, #4]
	str	r5, [sp, #52]
	ldr	r5, [r9, #364]
	str	r5, [sp, #60]
.L113:
	cmp	r2, #0
	str	lr, [r3, #16]
	str	lr, [r3, #20]
	str	r0, [r3, #12]
	str	r0, [r3, #8]
	str	ip, [r3, #56]
	beq	.L121
	cmp	r2, #1
	beq	.L122
	cmp	r2, #2
	bne	.L178
	mvn	r9, #71
	mov	r5, #1
	str	r9, [sp, #12]
	mov	r9, #384
	stmib	sp, {r5, r9}
.L101:
	mov	r5, #4
	add	r2, r2, #1
	cmp	r2, #9
	str	ip, [r3, #36]
	str	r5, [r3, #40]
	str	ip, [r3, #44]
	str	r0, [r3, #48]
	add	r3, r3, #60
	bne	.L113
	cmp	r6, #0
	strne	r8, [r1]
	strne	r7, [r1, #4]
	cmp	r10, #0
	ldrne	r3, [sp]
	strne	r3, [r1, #60]
	ldr	r3, [sp, #4]
	strne	fp, [r1, #64]
	cmp	r3, #0
	ldrne	r3, [sp, #8]
	strne	r3, [r1, #120]
	ldrne	r3, [sp, #12]
	strne	r3, [r1, #124]
	ldr	r3, [sp, #16]
	cmp	r3, #0
	ldrne	r3, [sp, #20]
	strne	r3, [r1, #180]
	ldrne	r3, [sp, #24]
	strne	r3, [r1, #184]
	ldr	r3, [sp, #28]
	cmp	r3, #0
	ldrne	r3, [sp, #32]
	strne	r3, [r1, #240]
	ldrne	r3, [sp, #36]
	strne	r3, [r1, #244]
	ldr	r3, [sp, #40]
	cmp	r3, #0
	ldrne	r3, [sp, #44]
	strne	r3, [r1, #300]
	ldrne	r3, [sp, #48]
	strne	r3, [r1, #304]
	ldr	r3, [sp, #56]
	cmp	r3, #0
	ldrne	r3, [sp, #52]
	strne	r3, [r1, #360]
	ldrne	r3, [sp, #60]
	strne	r3, [r1, #364]
	cmp	r4, #0
	ldrne	r3, [sp, #64]
	strne	r3, [r1, #420]
	ldrne	r3, [sp, #68]
	strne	r3, [r1, #424]
	b	.L94
.L121:
	mov	r7, #152
	mov	r6, #1
	mov	r8, #488
	b	.L101
.L178:
	cmp	r2, #3
	bne	.L179
	mvn	r5, #39
	str	r5, [sp, #24]
	mov	r5, #1
	str	r5, [sp, #16]
	mov	r5, #328
	str	r5, [sp, #20]
	b	.L101
.L179:
	cmp	r2, #4
	beq	.L180
	cmp	r2, #5
	beq	.L126
	cmp	r2, #6
	bne	.L98
	mov	r5, #88
	str	r5, [sp, #60]
	mov	r5, #1
	mov	r9, #16
	str	r5, [sp, #56]
	mov	r5, #237
	str	r9, [r1, #376]
	str	r5, [sp, #52]
	b	.L101
.L98:
	cmp	r2, #7
	bne	.L99
	ldr	r2, [r1, #436]
	add	r2, r2, #56
	lsl	r2, r2, #1
	str	r2, [sp, #68]
	mov	r2, #4
	str	r2, [r3, #40]
	mov	r2, #185
	str	ip, [r3, #36]
	str	ip, [r3, #44]
	str	r0, [r3, #48]
	str	r2, [sp, #64]
	mov	r4, #1
	mov	r2, #8
	add	r3, r3, #60
	b	.L113
.L99:
	cmp	r2, #8
	bne	.L101
	cmp	r6, #0
	strne	r8, [r1]
	strne	r7, [r1, #4]
	cmp	r10, #0
	ldrne	r3, [sp]
	strne	r3, [r1, #60]
	ldr	r3, [sp, #4]
	strne	fp, [r1, #64]
	cmp	r3, #0
	ldrne	r3, [sp, #8]
	strne	r3, [r1, #120]
	ldrne	r3, [sp, #12]
	strne	r3, [r1, #124]
	ldr	r3, [sp, #16]
	cmp	r3, #0
	ldrne	r3, [sp, #20]
	strne	r3, [r1, #180]
	ldrne	r3, [sp, #24]
	strne	r3, [r1, #184]
	ldr	r3, [sp, #28]
	cmp	r3, #0
	ldrne	r3, [sp, #32]
	strne	r3, [r1, #240]
	ldrne	r3, [sp, #36]
	strne	r3, [r1, #244]
	ldr	r3, [sp, #40]
	cmp	r3, #0
	ldrne	r3, [sp, #44]
	strne	r3, [r1, #300]
	ldrne	r3, [sp, #48]
	strne	r3, [r1, #304]
	ldr	r3, [sp, #56]
	cmp	r3, #0
	ldrne	r3, [sp, #52]
	strne	r3, [r1, #360]
	ldrne	r3, [sp, #60]
	strne	r3, [r1, #364]
	cmp	r4, #0
	ldrne	r3, [sp, #64]
	strne	r3, [r1, #420]
	ldrne	r3, [sp, #68]
	mov	r5, #16
	mov	r4, #32
	mov	lr, #93
	mov	ip, #158
	mov	r0, #4
	mov	r2, #1
	strne	r3, [r1, #424]
	mov	r3, #0
	str	r5, [r1, #496]
	str	r4, [r1, #500]
	str	lr, [r1, #480]
	str	ip, [r1, #484]
	str	r3, [r1, #516]
	str	r3, [r1, #524]
	str	r0, [r1, #520]
	str	r2, [r1, #528]
.L94:
	add	sp, sp, #76
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L126:
	mov	r5, #136
	str	r5, [sp, #48]
	mov	r5, #1
	str	r5, [sp, #40]
	mov	r5, #404
	str	r5, [sp, #44]
	b	.L101
.L180:
	mov	r5, #120
	str	r5, [sp, #36]
	mov	r5, #1
	str	r5, [sp, #28]
	add	r5, r5, #284
	str	r5, [sp, #32]
	b	.L101
.L122:
	ldr	r9, .L181+4
	mov	fp, #136
	mov	r10, r2
	str	r9, [sp]
	b	.L101
.L182:
	.align	2
.L181:
	.word	crazy
	.word	429
	.size	initCrazy, .-initCrazy
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #2
	mov	ip, #8
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r3, #0
	mov	r1, #10
	mov	r5, #1
	mov	r6, #16
	mov	r2, #352
	mov	lr, #99
	mov	r7, #4
	ldr	r4, .L187
	str	r0, [r4]
	ldr	r4, .L187+4
	str	r0, [r4, #28]
	add	r0, r0, #740
	stm	r4, {r0, ip}
	ldr	ip, .L187+8
	ldr	r0, .L187+12
	str	r3, [ip]
	str	r3, [r0]
	ldr	ip, .L187+16
	ldr	r0, .L187+20
	str	r3, [ip]
	str	r3, [r0]
	ldr	ip, .L187+24
	ldr	r0, .L187+28
	str	r3, [ip]
	str	r3, [r0]
	ldr	ip, .L187+32
	ldr	r0, .L187+36
	str	r3, [ip]
	str	r3, [r0]
	ldr	ip, .L187+40
	ldr	r0, .L187+44
	str	r3, [ip]
	str	r3, [r0]
	ldr	ip, .L187+48
	ldr	r0, .L187+52
	str	r3, [ip]
	str	r3, [r0]
	ldr	ip, .L187+56
	ldr	r0, .L187+60
	str	r3, [ip]
	str	r3, [r0]
	ldr	ip, .L187+64
	ldr	r0, .L187+68
	str	r3, [ip]
	str	r3, [r0]
	ldr	ip, .L187+72
	ldr	r0, .L187+76
	str	r1, [ip]
	str	r1, [r0]
	ldr	ip, .L187+80
	ldr	r0, .L187+84
	ldr	r1, .L187+88
	mov	fp, #72
	str	r3, [r4, #24]
	str	r3, [r4, #36]
	str	lr, [ip]
	str	r2, [r0]
	str	r7, [r4, #40]
	str	r6, [r4, #16]
	str	r6, [r4, #20]
	str	r5, [r4, #12]
	str	r5, [r4, #8]
	mov	r10, #208
	str	r2, [r1]
	mov	r9, #37
	str	r3, [r4, #56]
	str	r5, [r4, #48]
	str	r5, [r4, #52]
	mov	r8, #56
	bl	initDoor
	mov	r7, #222
	bl	initKey
	mov	r1, #32
	mov	r2, r6
	mov	r0, r5
	ldr	r3, .L187+92
	ldr	ip, [r4, #4]
	ldr	lr, [r4]
	ldr	r4, .L187+96
	str	r6, [r3, #8]
	str	r6, [r3, #12]
	str	fp, [r3, #4]
	str	r4, [r3]
	str	r5, [r3, #16]
	ldr	r3, .L187+100
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r1, [r3, #28]
	str	r1, [r3, #32]
	stm	r3, {r9, r10}
	str	r8, [r3, #24]
	str	r7, [r3, #20]
	ldr	r3, .L187+104
	sub	r1, ip, #16
	sub	lr, lr, #16
	add	ip, ip, #32
.L184:
	str	r1, [r3, #4]
	add	r1, r1, #16
	cmp	ip, r1
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	lr, [r3]
	str	r0, [r3, #16]
	add	r3, r3, #20
	bne	.L184
	mov	r10, #136
	mov	r9, #60
	mov	r1, #0
	mov	r8, #17
	mov	r7, #13
	mov	r6, #4
	mov	lr, #72
	mov	ip, #150
	mov	r5, #40
	mov	r4, #316
	ldr	r3, .L187+108
	str	r10, [r3, #24]
	add	r10, r10, #146
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r0, [r3, #16]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	r0, [r3, #36]
	str	r10, [r3]
	str	r9, [r3, #20]
	ldr	r3, .L187+112
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r8, [r3]
	str	r7, [r3, #4]
	str	r1, [r3, #24]
	str	r1, [r3, #36]
	str	r6, [r3, #40]
	ldr	r3, .L187+116
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	lr, [r3, #24]
	str	r5, [r3, #4]
	str	r0, [r3, #16]
	str	r0, [r3, #36]
	str	r4, [r3]
	str	ip, [r3, #20]
	bl	initCrazy
	ldr	r3, .L187+120
	mov	lr, pc
	bx	r3
	ldr	r2, .L187+124
	ldr	r3, .L187+128
	ldrh	r2, [r2, #48]
	strh	r2, [r3]	@ movhi
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L188:
	.align	2
.L187:
	.word	life
	.word	guy
	.word	delivered
	.word	jumping
	.word	down
	.word	climbing
	.word	powerUp
	.word	jumpBoosted
	.word	frame
	.word	score
	.word	jumpFrame
	.word	downFrame
	.word	crazyFrame
	.word	hammerFrame
	.word	bootsFrame
	.word	floating
	.word	hOff
	.word	guyhOff
	.word	gravity
	.word	time_s
	.word	time_m
	.word	vOff
	.word	guyvOff
	.word	boots
	.word	366
	.word	tele
	.word	heart
	.word	shirt
	.word	customer
	.word	bubble
	.word	hideSprites
	.word	67109120
	.word	buttons
	.size	initGame, .-initGame
	.align	2
	.global	initHeart
	.syntax unified
	.arm
	.fpu softvfp
	.type	initHeart, %function
initHeart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r0, #16
	mov	lr, #1
	ldr	r3, .L193
	ldr	r1, [r3, #4]
	ldr	ip, [r3]
	ldr	r3, .L193+4
	sub	r2, r1, #16
	sub	ip, ip, #16
	add	r1, r1, #32
.L190:
	str	r2, [r3, #4]
	add	r2, r2, #16
	cmp	r2, r1
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	ip, [r3]
	str	lr, [r3, #16]
	add	r3, r3, #20
	bne	.L190
	ldr	lr, [sp], #4
	bx	lr
.L194:
	.align	2
.L193:
	.word	guy
	.word	heart
	.size	initHeart, .-initHeart
	.align	2
	.global	updateDoor
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateDoor, %function
updateDoor:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r6, #0
	ldr	r4, .L235
	add	r2, r4, #16
	ldr	r5, .L235+4
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	ldm	r2, {r2, r3}
	ldr	r7, .L235+8
	sub	sp, sp, #20
.L211:
	cmp	r6, #0
	beq	.L227
	cmp	r6, #1
	beq	.L228
	ldr	ip, [r4, #52]
	add	r8, r5, #48
	cmp	ip, #0
	ldr	lr, [r5, #40]
	ldr	ip, [r5, #44]
	ldm	r8, {r8, r9}
	bne	.L229
.L205:
	stm	sp, {ip, lr}
	str	r9, [sp, #12]
	str	r8, [sp, #8]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	ldrne	r3, [r4, #4]
	addne	r3, r3, #1
	strne	r3, [r4, #4]
.L207:
	cmp	r6, #2
	bne	.L230
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L227:
	ldr	ip, [r4, #48]
	add	r8, r5, #8
	cmp	ip, #0
	ldr	lr, [r5]
	ldr	ip, [r5, #4]
	ldm	r8, {r8, r9}
	bne	.L231
.L202:
	stm	sp, {ip, lr}
	str	r9, [sp, #12]
	str	r8, [sp, #8]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	ldr	r0, [r4, #4]
	bne	.L204
.L226:
	add	r2, r4, #16
	ldr	r1, [r4]
	ldm	r2, {r2, r3}
.L212:
	add	r6, r6, #1
	b	.L211
.L204:
	sub	r0, r0, #1
	add	r2, r4, #16
	str	r0, [r4, #4]
	ldr	r1, [r4]
	ldm	r2, {r2, r3}
	b	.L212
.L229:
	stm	sp, {ip, lr}
	str	r9, [sp, #12]
	str	r8, [sp, #8]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L232
	ldr	r3, [r4, #52]
	cmp	r3, #0
	bne	.L207
	add	r2, r4, #16
	add	r8, r5, #48
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	ldm	r2, {r2, r3}
	ldr	ip, [r5, #44]
	ldr	lr, [r5, #40]
	ldm	r8, {r8, r9}
	b	.L205
.L230:
	ldr	r0, [r4, #4]
	b	.L226
.L228:
	ldr	ip, [r4, #56]
	add	r8, r5, #28
	cmp	ip, #0
	ldr	lr, [r5, #20]
	ldr	ip, [r5, #24]
	ldm	r8, {r8, r9}
	beq	.L202
	stm	sp, {ip, lr}
	str	r9, [sp, #12]
	str	r8, [sp, #8]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L233
	ldr	r3, [r4, #56]
	add	r2, r4, #16
	cmp	r3, #0
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	ldm	r2, {r2, r3}
	bne	.L212
	add	r8, r5, #28
	ldr	ip, [r5, #24]
	ldr	lr, [r5, #20]
	ldm	r8, {r8, r9}
	b	.L202
.L231:
	stm	sp, {ip, lr}
	str	r9, [sp, #12]
	str	r8, [sp, #8]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L234
	ldr	r3, [r4, #48]
	add	r2, r4, #16
	cmp	r3, #0
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	ldm	r2, {r2, r3}
	bne	.L212
	add	r8, r5, #8
	ldr	ip, [r5, #4]
	ldr	lr, [r5]
	ldm	r8, {r8, r9}
	b	.L202
.L232:
	mov	r1, #0
	ldr	r3, .L235+12
	ldr	r2, .L235+16
	ldrh	r3, [r3]
	str	r1, [r5, #56]
	ldr	r1, .L235+20
	strh	r3, [r2]	@ movhi
	strh	r3, [r1]	@ movhi
	strh	r3, [r2, #128]	@ movhi
	strh	r3, [r1, #-62]	@ movhi
	strh	r3, [r2, #66]	@ movhi
	strh	r3, [r1, #66]	@ movhi
	strh	r3, [r2, #4]	@ movhi
	strh	r3, [r1, #4]	@ movhi
	strh	r3, [r2, #132]	@ movhi
	b	.L207
.L234:
	ldr	r3, .L235+12
	ldr	r2, .L235+24
	ldrh	r3, [r3]
	ldr	r0, .L235+28
	ldr	r1, .L235+32
	ldr	ip, .L235+36
	strh	r3, [r2]	@ movhi
	strh	r3, [ip]	@ movhi
	strh	r3, [r0]	@ movhi
	strh	r3, [r1]	@ movhi
	strh	r3, [r2, #66]	@ movhi
	strh	r3, [ip, #66]	@ movhi
	strh	r3, [r0, #-124]	@ movhi
	strh	r3, [r1, #66]	@ movhi
	strh	r3, [r2, #132]	@ movhi
	add	r2, r4, #16
	str	r6, [r5, #16]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	ldm	r2, {r2, r3}
	b	.L212
.L233:
	mov	r2, #0
	ldr	r3, .L235+12
	ldr	r0, .L235+40
	ldrh	r3, [r3]
	ldr	r1, .L235+44
	ldr	ip, .L235+48
	strh	r3, [r0]	@ movhi
	strh	r3, [r1]	@ movhi
	strh	r3, [ip]	@ movhi
	strh	r3, [r0, #192]	@ movhi
	strh	r3, [r1, #192]	@ movhi
	str	r2, [r5, #36]
	add	r2, r4, #16
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	ldm	r2, {r2, r3}
	b	.L212
.L236:
	.align	2
.L235:
	.word	guy
	.word	door
	.word	collision
	.word	100724482
	.word	100722442
	.word	100722506
	.word	100724520
	.word	100724648
	.word	100724522
	.word	100724584
	.word	100725746
	.word	100725810
	.word	100725874
	.size	updateDoor, .-updateDoor
	.align	2
	.global	updateKey
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateKey, %function
updateKey:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r4, #0
	ldr	r5, .L265
	ldr	r6, .L265+4
	ldr	r8, .L265+8
	ldr	r9, .L265+12
	sub	sp, sp, #20
.L249:
	cmp	r4, #0
	beq	.L262
	cmp	r4, #1
	beq	.L263
	ldr	r7, [r5, #52]
	cmp	r7, #0
	beq	.L264
.L246:
	cmp	r4, #2
	bne	.L250
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L262:
	ldr	r3, [r5, #48]
	cmp	r3, #0
	beq	.L239
.L242:
	ldr	r3, [r5]
	cmp	r3, r9
	movle	r2, #0
	movle	r3, #1
	strle	r2, [r6, #16]
	strle	r3, [r5, #48]
.L250:
	add	r4, r4, #1
	b	.L249
.L264:
	add	r2, r6, #40
	ldm	r2, {r2, r3}
	ldr	r0, [r6, #52]
	ldr	r1, [r6, #48]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	movne	r3, #1
	strne	r7, [r6, #56]
	strne	r3, [r5, #52]
	b	.L246
.L263:
	ldr	r7, [r5, #56]
	cmp	r7, #0
	bne	.L250
	add	r2, r6, #20
	ldm	r2, {r2, r3}
	ldr	r0, [r6, #32]
	ldr	r1, [r6, #28]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	strne	r4, [r5, #56]
	strne	r7, [r6, #36]
	add	r4, r4, #1
	b	.L249
.L239:
	ldm	r6, {r2, r3}
	ldr	r0, [r6, #12]
	ldr	r1, [r6, #8]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L242
	mov	r2, #0
	mov	r3, #1
	str	r2, [r6, #16]
	str	r3, [r5, #48]
	b	.L250
.L266:
	.align	2
.L265:
	.word	guy
	.word	key
	.word	collision
	.word	285
	.size	updateKey, .-updateKey
	.align	2
	.global	updateTele
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateTele, %function
updateTele:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L273
	ldm	r5, {r2, r3}
	ldr	r0, [r5, #12]
	ldr	r1, [r5, #8]
	sub	sp, sp, #16
	ldr	r4, .L273+4
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	ldr	r6, .L273+8
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L267
	mov	r1, #96
	mov	r0, #230
	ldr	r2, [r5, #8]
	ldr	r3, [r4, #16]
	rsb	r2, r2, #60
	add	r3, r3, r2, lsl #1
	ldr	ip, .L273+12
	ldr	r2, .L273+16
	str	r3, [r4, #4]
	str	r1, [ip]
	str	r1, [r2]
	str	r0, [r4]
.L267:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L274:
	.align	2
.L273:
	.word	tele
	.word	guy
	.word	collision
	.word	vOff
	.word	guyvOff
	.size	updateTele, .-updateTele
	.align	2
	.global	updateBoots
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBoots, %function
updateBoots:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r4, .L284
	ldr	r3, [r4, #16]
	cmp	r3, #0
	sub	sp, sp, #20
	bne	.L283
.L275:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L283:
	ldr	r0, .L284+4
	ldr	ip, [r4, #8]
	add	r2, r0, #16
	ldr	r1, [r0]
	ldm	r2, {r2, r3}
	ldr	r0, [r0, #4]
	ldr	r5, [r4, #12]
	ldr	lr, [r4]
	str	ip, [sp, #8]
	ldr	ip, [r4, #4]
	str	r5, [sp, #12]
	stm	sp, {ip, lr}
	ldr	r5, .L284+8
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L275
	mov	r1, #0
	mov	r2, #1
	ldr	r3, .L284+12
	ldr	r0, .L284+16
	ldr	ip, [r3]
	ldr	r3, .L284+20
	str	ip, [r0]
	str	r1, [r4, #16]
	str	r2, [r3]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L285:
	.align	2
.L284:
	.word	boots
	.word	guy
	.word	collision
	.word	frame
	.word	bootsFrame
	.word	jumpBoosted
	.size	updateBoots, .-updateBoots
	.align	2
	.global	updateShirt
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateShirt, %function
updateShirt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L297
	ldr	r3, [r4, #16]
	cmp	r3, #0
	mov	r5, #0
	ldr	r6, .L297+4
	ldr	r8, .L297+8
	ldr	r7, .L297+12
	sub	sp, sp, #16
	bne	.L296
.L288:
	cmp	r5, #1
	add	r4, r4, #20
	bne	.L291
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L291:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	mov	r5, #1
	beq	.L288
.L296:
	ldm	r4, {r2, r3}
	ldr	r0, [r4, #12]
	ldr	r1, [r4, #8]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r6, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r6]
	ldr	r0, [r6, #4]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	movne	r2, #0
	ldrne	r3, [r7]
	addne	r3, r3, #1
	strne	r3, [r7]
	strne	r2, [r4, #16]
	b	.L288
.L298:
	.align	2
.L297:
	.word	shirt
	.word	guy
	.word	collision
	.word	life
	.size	updateShirt, .-updateShirt
	.align	2
	.global	updateBubble
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBubble, %function
updateBubble:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, #0
	ldr	r4, .L310
	ldr	r3, [r4, #16]
	cmp	r3, #0
	mov	fp, r5
	ldr	r6, .L310+4
	ldr	r7, .L310+8
	ldr	r10, .L310+12
	ldr	r9, .L310+16
	ldr	r8, .L310+20
	sub	sp, sp, #20
	bne	.L309
.L301:
	cmp	r5, #1
	add	r4, r4, #20
	bne	.L304
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L304:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	mov	r5, #1
	beq	.L301
.L309:
	ldm	r4, {r2, r3}
	ldr	r0, [r4, #12]
	ldr	r1, [r4, #8]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r6, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r6]
	ldr	r0, [r6, #4]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L301
	mov	r3, #1
	mov	r2, #6
	str	r3, [r8]
	ldr	r3, [r9]
	str	fp, [r4, #16]
	str	r2, [r6, #28]
	str	r3, [r10]
	b	.L301
.L311:
	.align	2
.L310:
	.word	bubble
	.word	guy
	.word	collision
	.word	bubbleFrame
	.word	frame
	.word	floating
	.size	updateBubble, .-updateBubble
	.global	__aeabi_idivmod
	.align	2
	.global	updateCustomer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCustomer, %function
updateCustomer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L315
	ldr	r3, [r4, #24]
	ldr	r2, .L315+4
	add	r3, r3, #1
	smull	r0, r1, r2, r3
	asr	r2, r3, #31
	rsb	r2, r2, r1, asr #2
	add	r2, r2, r2, lsl #2
	cmp	r3, r2, lsl #1
	str	r3, [r4, #24]
	bne	.L312
	ldr	r0, [r4, #36]
	ldr	r3, .L315+8
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L312:
	pop	{r4, lr}
	bx	lr
.L316:
	.align	2
.L315:
	.word	customer
	.word	1717986919
	.word	__aeabi_idivmod
	.size	updateCustomer, .-updateCustomer
	.align	2
	.global	updateHeart
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateHeart, %function
updateHeart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L335
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L318
	mov	r1, #1
	ldr	r2, .L335+4
	cmp	r3, r1
	str	r1, [r2, #16]
	beq	.L318
	cmp	r3, #2
	str	r1, [r2, #36]
	beq	.L318
	str	r1, [r2, #56]
	bx	lr
.L318:
	rsbs	r1, r3, #3
	bxeq	lr
	mov	r2, #0
	mov	ip, r2
	ldr	r3, .L335+4
.L321:
	ldr	r0, [r3, #16]
	add	r2, r2, #1
	cmp	r0, #0
	strne	ip, [r3, #16]
	cmp	r2, r1
	add	r3, r3, #20
	bne	.L321
	bx	lr
.L336:
	.align	2
.L335:
	.word	life
	.word	heart
	.size	updateHeart, .-updateHeart
	.align	2
	.global	animateGuy
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateGuy, %function
animateGuy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #8
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r4, .L389
	add	r5, r4, #24
	ldm	r5, {r5, r6}
	tst	r5, #7
	str	r6, [r4, #32]
	str	r3, [r4, #28]
	sub	sp, sp, #20
	bne	.L338
	ldr	r0, [r4, #36]
	ldr	r3, .L389+4
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L338:
	ldr	r2, .L389+8
	ldr	r3, .L389+12
	ldr	r1, [r2]
	ldr	r3, [r3]
	ldr	r2, .L389+16
	orrs	r1, r3, r1
	ldr	r2, [r2]
	bne	.L339
	ldr	r5, .L389+20
	ldr	r3, [r5]
	cmp	r3, #0
	bne	.L340
	ldr	r3, .L389+24
	ldrh	r1, [r3, #48]
	tst	r1, #32
	bne	.L341
	cmp	r2, #0
	bne	.L342
	ldr	r2, .L389+28
	ldr	r2, [r2]
	cmp	r2, #0
	ldrh	r3, [r3, #48]
	bne	.L382
	tst	r3, #16
	str	r2, [r4, #28]
	beq	.L344
	ldr	r6, .L389+32
	ldrh	r3, [r6]
	tst	r3, #2
	beq	.L349
	ldr	r3, .L389+36
	ldrh	r3, [r3]
	ands	r3, r3, #2
	beq	.L385
.L349:
	ldr	r5, [r4, #24]
.L363:
	add	r5, r5, #1
	str	r5, [r4, #24]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L339:
	orrs	r3, r3, r2
	beq	.L386
.L340:
	mov	r3, #0
	str	r6, [r4, #28]
	str	r3, [r4, #36]
	str	r3, [r4, #24]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L386:
	ldr	r2, .L389+28
	ldr	r3, .L389+20
	ldr	r2, [r2]
	ldr	r3, [r3]
	orrs	r3, r2, r3
	bne	.L340
	ldr	r3, .L389+24
	ldrh	r2, [r3, #48]
	tst	r2, #64
	bne	.L387
.L361:
	mov	r3, #4
	str	r3, [r4, #28]
	b	.L363
.L341:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L346
	cmp	r2, #0
	beq	.L388
.L346:
	ldr	r6, [r4, #32]
	b	.L340
.L342:
	ldrh	r3, [r3, #48]
	b	.L346
.L387:
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L340
	b	.L361
.L388:
	ldr	r3, .L389+28
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L344
.L382:
	ldr	r3, [r4, #28]
.L353:
	cmp	r3, #8
	bne	.L349
	b	.L346
.L344:
	mov	r3, #2
	ldr	r6, .L389+32
	str	r3, [r4, #28]
.L348:
	ldrh	r3, [r6]
	tst	r3, #2
	beq	.L349
	ldr	r3, .L389+36
	ldrh	r3, [r3]
	ands	r3, r3, #2
	bne	.L349
	ldr	ip, [r4, #8]
	ldr	r1, [r4, #20]
	ldr	r2, [r4, #16]
	str	r3, [sp, #8]
	ldr	r7, .L389+40
	ldr	r3, [r4]
	ldr	r0, [r7]
	ldr	r6, .L389+44
	str	ip, [sp, #12]
	str	r1, [sp, #4]
	str	r2, [sp]
	mov	r1, #256
	ldr	r2, [r4, #4]
	mov	lr, pc
	bx	r6
	subs	ip, r0, #0
	bne	.L382
	mvn	r9, #23
	mov	r8, #15
	mov	r3, #3
	mov	r2, #1
	ldr	r0, .L389+48
	ldr	r1, .L389+52
	ldr	lr, [r0]
	ldr	r0, [r7]
	str	r9, [sp, #12]
	str	r8, [sp, #8]
	str	lr, [r1]
	ldr	r1, [r4, #20]
	ldr	lr, .L389+56
	str	r1, [sp, #4]
	ldr	r1, [r4, #16]
	str	r3, [r4, #28]
	str	r1, [sp]
	ldr	r3, [r4]
	str	r2, [r5]
	mov	r1, #256
	ldr	r2, [r4, #4]
	str	ip, [lr]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L382
	ldr	r3, .L389+60
	ldr	r3, [r3]
	ldm	r4, {r1, r2}
	cmp	r3, #0
	subne	r1, r1, #50
	addne	r2, r2, #25
	subeq	r1, r1, #24
	addeq	r2, r2, #15
	stm	r4, {r1, r2}
	ldr	r3, [r4, #28]
	b	.L353
.L385:
	ldr	ip, [r4, #8]
	ldr	r1, [r4, #20]
	ldr	r2, [r4, #16]
	str	r3, [sp, #8]
	ldr	r8, .L389+40
	ldr	r3, [r4]
	ldr	r0, [r8]
	ldr	r7, .L389+44
	str	ip, [sp, #12]
	str	r1, [sp, #4]
	str	r2, [sp]
	mov	r1, #256
	ldr	r2, [r4, #4]
	mov	lr, pc
	bx	r7
	subs	ip, r0, #0
	beq	.L350
	ldr	r3, [r4, #28]
	cmp	r3, #2
	beq	.L348
	b	.L353
.L350:
	mvn	lr, #14
	mov	r2, #1
	mvn	r6, #23
	ldr	r1, .L389+48
	ldr	r0, [r8]
	ldr	r1, [r1]
	str	lr, [sp, #8]
	ldr	lr, [r4, #20]
	str	lr, [sp, #4]
	ldr	lr, [r4, #16]
	ldr	r3, .L389+52
	str	lr, [sp]
	ldr	lr, .L389+56
	str	r6, [sp, #12]
	str	r2, [r4, #28]
	str	r1, [r3]
	str	r2, [r5]
	mov	r1, #256
	ldr	r3, [r4]
	ldr	r2, [r4, #4]
	str	ip, [lr]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L382
	ldr	r3, .L389+60
	ldr	r3, [r3]
	cmp	r3, #0
	ldm	r4, {r2, r3}
	subne	r3, r3, #25
	subeq	r3, r3, #15
	subne	r2, r2, #50
	subeq	r2, r2, #24
	stm	r4, {r2, r3}
	ldr	r3, [r4, #28]
	b	.L353
.L390:
	.align	2
.L389:
	.word	guy
	.word	__aeabi_idivmod
	.word	climbing
	.word	down
	.word	powerUp
	.word	jumping
	.word	67109120
	.word	floating
	.word	oldButtons
	.word	buttons
	.word	.LANCHOR0
	.word	collisionCheck
	.word	frame
	.word	jumpFrame
	.word	gravity
	.word	jumpBoosted
	.size	animateGuy, .-animateGuy
	.align	2
	.global	updateGuy
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGuy, %function
updateGuy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	fp, .L449
	ldr	r3, [fp]
	cmp	r3, #0
	sub	sp, sp, #20
	bgt	.L444
.L393:
	ldr	r9, .L449+4
	ldr	r4, .L449+8
	ldr	r3, [r9]
	ldr	r8, .L449+12
	ldr	r7, .L449+16
	ldr	r10, .L449+20
	ldr	r6, .L449+24
	add	r5, r4, #540
.L399:
	cmp	r3, #0
	bne	.L395
	ldr	r3, [r4, #48]
	cmp	r3, #0
	bne	.L445
.L396:
	ldr	r2, [r7]
	cmp	r2, #0
	beq	.L395
	ldr	r1, [r8]
	ldr	r2, [r10]
	orrs	r2, r1, r2
	bne	.L395
	ldr	r2, [r4, #52]
	cmp	r2, #0
	bne	.L395
	ldr	r2, [r6, #28]
	cmp	r2, #1
	beq	.L446
	cmp	r2, #3
	bne	.L395
	ldr	r1, [r6]
	ldr	r2, [r4]
	cmp	r1, r2
	bge	.L395
	ldr	r1, [r6, #4]
	ldr	r2, [r4, #4]
	cmp	r1, r2
	bgt	.L395
	mov	r1, #1
	ldr	r0, .L449+28
	ldr	r2, [r0]
	add	r2, r2, r1
	str	r2, [r0]
	str	r1, [r4, #52]
.L395:
	add	r4, r4, #60
	cmp	r5, r4
	bne	.L399
	ldr	r2, [r8]
	orrs	r3, r3, r2
	ldr	r3, [r7]
	bne	.L442
	cmp	r3, #0
	bne	.L401
	ldr	r3, .L449+32
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L402
	ldr	r3, .L449+36
	ldrh	r3, [r3, #48]
	ands	r3, r3, #64
	beq	.L447
.L403:
	ldr	r3, .L449+36
	ldrh	r3, [r3, #48]
	tst	r3, #128
	beq	.L405
	ldr	r3, [r7]
.L442:
	ldr	r4, .L449+20
.L400:
	ldr	r2, [r4]
	orrs	r3, r3, r2
	bne	.L401
	ldr	r3, [r8]
	cmp	r3, #0
	beq	.L411
.L401:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	animateGuy
.L445:
	add	r0, r4, #16
	ldm	r0, {r0, r1}
	add	r1, r1, r1, lsr #31
	asr	r1, r1, #1
	add	r2, r6, #16
	ldm	r2, {r2, r3}
	ldr	ip, [r4]
	str	r1, [sp, #12]
	ldr	r1, [r4, #4]
	add	r0, r0, r0, lsr #31
	stm	sp, {r1, ip}
	asr	r0, r0, #1
	str	r0, [sp, #8]
	add	r3, r3, r3, lsr #31
	add	r2, r2, r2, lsr #31
	ldr	r1, [r6]
	ldr	r0, [r6, #4]
	ldr	ip, .L449+40
	asr	r3, r3, #1
	asr	r2, r2, #1
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L397
.L441:
	ldr	r3, [r9]
	b	.L396
.L397:
	mov	r2, #0
	mov	r0, #1
	ldr	r3, [fp]
	ldr	ip, .L449+44
	sub	r3, r3, #1
	ldr	ip, [ip]
	str	r3, [fp]
	ldr	r1, .L449+48
	ldr	r3, .L449+52
	ldr	lr, .L449+56
	str	r0, [r8]
	str	ip, [r3]
	ldr	r1, [r1]
	str	r2, [r4, #48]
	ldr	r0, .L449+60
	ldr	r3, .L449+64
	str	ip, [lr]
	mov	lr, pc
	bx	r3
	b	.L441
.L444:
	ldr	r2, .L449+68
	add	ip, r2, #16
	ldr	r0, .L449+24
	ldm	r2, {r1, r2}
	ldm	ip, {ip, lr}
	ldr	r3, [r0, #20]
	stmib	sp, {r1, ip, lr}
	str	r2, [sp]
	ldr	r4, .L449+40
	ldr	r2, [r0, #16]
	ldr	r1, [r0]
	lsl	r3, r3, #1
	ldr	r0, [r0, #4]
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	beq	.L393
	mov	r0, #1
	ldr	r2, .L449+28
	ldr	r3, [r2]
	ldr	r1, .L449+72
	add	r3, r3, #5
	str	r3, [r2]
	str	r0, [r1]
	b	.L393
.L402:
	ldr	r3, .L449+20
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L401
.L411:
	ldr	r3, .L449+36
	ldrh	r3, [r3, #48]
	ands	r3, r3, #32
	beq	.L448
.L409:
	ldr	r3, .L449+36
	ldrh	r3, [r3, #48]
	ands	r3, r3, #16
	bne	.L401
	ldr	r4, .L449+24
	ldr	r0, [r4, #20]
	ldr	ip, [r4, #12]
	ldr	r2, [r4, #16]
	stmib	sp, {r0, ip}
	str	r3, [sp, #12]
	str	r2, [sp]
	ldr	r1, .L449+76
	ldr	r3, [r4]
	ldr	r0, [r1]
	ldr	r2, [r4, #4]
	mov	r1, #256
	ldr	r5, .L449+80
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L401
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #16]
	add	r2, r3, r2
	cmp	r2, #256
	bgt	.L401
	ldr	ip, .L449+84
	ldr	r2, [r4, #12]
	ldr	r1, [ip]
	add	r3, r3, r2
	cmp	r1, #14
	str	r3, [r4, #4]
	bgt	.L401
	ldr	r0, .L449+88
	ldr	lr, [r0]
	sub	r3, r3, lr
	cmp	r3, #120
	ble	.L401
.L443:
	add	r1, r2, r1
	add	r2, r2, lr
	str	r1, [ip]
	str	r2, [r0]
	b	.L401
.L446:
	ldr	r0, [r6]
	ldr	r1, [r4]
	cmp	r0, r1
	bge	.L395
	ldr	r0, [r6, #4]
	ldr	r1, [r4, #4]
	cmp	r0, r1
	bgt	.L395
	ldr	r0, .L449+28
	ldr	r1, [r0]
	add	r1, r1, #3
	str	r2, [r4, #52]
	str	r1, [r0]
	b	.L395
.L447:
	ldr	r5, .L449+24
	ldr	r2, [r5, #16]
	cmp	r2, #0
	add	r1, r2, #3
	movge	r1, r2
	ldr	r0, [r5, #8]
	ldr	lr, [r5, #20]
	ldr	ip, [r5, #4]
	asr	r1, r1, #2
	rsb	r0, r0, #0
	str	r1, [sp]
	str	r3, [sp, #8]
	str	r0, [sp, #12]
	str	lr, [sp, #4]
	ldr	r6, .L449+76
	add	r2, r2, r2, lsr #31
	add	r2, ip, r2, asr #1
	mov	r1, #256
	ldr	r3, [r5]
	ldr	r0, [r6]
	ldr	r9, .L449+92
	sub	r2, r2, #1
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	beq	.L403
	mov	r1, #1
	ldr	ip, .L449+96
	ldr	r3, [r5]
	ldr	r0, [r5, #8]
	ldr	r2, [ip]
	ldr	r4, .L449+20
	sub	r3, r3, r0
	cmp	r2, #0
	str	r3, [r5]
	str	r1, [r4]
	ble	.L404
	ldr	lr, .L449+100
	ldr	r1, [lr]
	sub	r10, r3, r1
	cmp	r10, #80
	suble	r1, r1, r0
	suble	r2, r2, r0
	strle	r1, [lr]
	strle	r2, [ip]
.L404:
	ldr	r2, .L449+36
	ldrh	r2, [r2, #48]
	tst	r2, #128
	bne	.L401
.L412:
	ldr	r2, [r5, #16]
	cmp	r2, #0
	add	r1, r2, #3
	movge	r1, r2
	mov	ip, #0
	str	r0, [sp, #12]
	ldr	r0, [r5, #4]
	asr	r1, r1, #2
	add	r2, r2, r2, lsr #31
	add	r2, r0, r2, asr #1
	ldr	r0, [r6]
	str	r1, [sp]
	ldr	r1, [r5, #20]
	sub	r2, r2, #1
	stmib	sp, {r1, ip}
	mov	r1, #256
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	bne	.L406
	ldr	r3, [r7]
	b	.L400
.L405:
	ldr	r5, .L449+24
	ldr	r4, .L449+20
	ldr	r3, [r5]
	ldr	r0, [r5, #8]
	ldr	r6, .L449+76
	ldr	r9, .L449+92
	b	.L412
.L448:
	ldr	r4, .L449+24
	add	r0, r4, #16
	ldr	r2, [r4, #12]
	ldm	r0, {r0, ip}
	rsb	r2, r2, #0
	stm	sp, {r0, ip}
	str	r3, [sp, #12]
	str	r2, [sp, #8]
	ldr	r1, .L449+76
	ldr	r3, [r4]
	ldr	r0, [r1]
	ldr	r2, [r4, #4]
	mov	r1, #256
	ldr	r5, .L449+80
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L409
	ldr	r3, [r4, #4]
	cmp	r3, #0
	ble	.L409
	ldr	lr, .L449+84
	ldr	r0, [r4, #12]
	ldr	r1, [lr]
	sub	r3, r3, r0
	cmp	r1, #0
	str	r3, [r4, #4]
	ble	.L409
	ldr	ip, .L449+88
	ldr	r2, [ip]
	sub	r3, r3, r2
	cmp	r3, #120
	suble	r1, r1, r0
	suble	r2, r2, r0
	strle	r1, [lr]
	strle	r2, [ip]
	b	.L409
.L406:
	mov	r1, #1
	ldr	r0, .L449+96
	ldr	r3, .L449+104
	ldr	lr, [r0]
	ldr	r2, [r5, #8]
	cmp	lr, r3
	ldr	r3, [r5]
	add	r3, r2, r3
	str	r3, [r5]
	str	r1, [r4]
	bgt	.L401
	ldr	ip, .L449+100
	ldr	r1, [ip]
	sub	r3, r3, r1
	cmp	r3, #80
	ble	.L401
	b	.L443
.L450:
	.align	2
.L449:
	.word	life
	.word	powerUp
	.word	crazy
	.word	down
	.word	jumping
	.word	climbing
	.word	guy
	.word	score
	.word	floating
	.word	67109120
	.word	collision
	.word	frame
	.word	sheidGuard_length
	.word	crazyFrame
	.word	downFrame
	.word	sheidGuard_data
	.word	playSoundB
	.word	customer
	.word	delivered
	.word	.LANCHOR0
	.word	collisionCheck
	.word	hOff
	.word	guyhOff
	.word	collisionLadderCheck
	.word	vOff
	.word	guyvOff
	.word	606
	.size	updateGuy, .-updateGuy
	.align	2
	.global	animateCustomer
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateCustomer, %function
animateCustomer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L454
	ldr	r3, [r4, #24]
	ldr	r2, .L454+4
	add	r3, r3, #1
	smull	r0, r1, r2, r3
	asr	r2, r3, #31
	rsb	r2, r2, r1, asr #2
	add	r2, r2, r2, lsl #2
	cmp	r3, r2, lsl #1
	str	r3, [r4, #24]
	bne	.L451
	ldr	r0, [r4, #36]
	ldr	r3, .L454+8
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L451:
	pop	{r4, lr}
	bx	lr
.L455:
	.align	2
.L454:
	.word	customer
	.word	1717986919
	.word	__aeabi_idivmod
	.size	animateCustomer, .-animateCustomer
	.align	2
	.global	animateCrazy
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateCrazy, %function
animateCrazy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L464
	ldr	r6, .L464+4
	add	r5, r4, #540
.L458:
	ldr	r3, [r4, #24]
	add	r3, r3, #1
	tst	r3, #7
	str	r3, [r4, #24]
	bne	.L457
	ldr	r3, [r4, #48]
	cmp	r3, #0
	beq	.L457
	add	r0, r4, #36
	ldm	r0, {r0, r1}
	add	r0, r0, #1
	mov	lr, pc
	bx	r6
	str	r1, [r4, #36]
.L457:
	add	r4, r4, #60
	cmp	r4, r5
	bne	.L458
	pop	{r4, r5, r6, lr}
	bx	lr
.L465:
	.align	2
.L464:
	.word	crazy
	.word	__aeabi_idivmod
	.size	animateCrazy, .-animateCrazy
	.align	2
	.global	updateCrazy
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCrazy, %function
updateCrazy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r3, r0
	mov	r7, r0
	ldr	lr, .L563
	ldr	r4, .L563+4
	ldr	r6, [lr, #16]
	ldr	r5, [lr, #196]
	ldr	r10, .L563+8
	ldr	fp, [lr, #136]
	ldr	r1, [lr, #380]
	ldr	r4, [r4]
	sub	sp, sp, #76
	ldr	r10, [r10]
	add	r9, r6, r6, lsr #31
	rsb	r8, r5, #60
	rsb	r6, r6, #56
	str	r4, [sp, #68]
	str	r6, [sp, #20]
	sub	r4, fp, fp, lsl #2
	add	r6, r1, r1, lsl #1
	asr	r9, r9, #1
	lsl	r8, r8, #1
	rsb	r1, r1, #60
	str	r9, [sp, #16]
	str	r10, [sp, #64]
	str	r8, [sp, #44]
	str	fp, [sp]
	str	r4, [sp, #40]
	str	r6, [sp, #56]
	str	r1, [sp, #60]
	ldr	fp, [lr, #124]
	ldr	r9, [lr, #132]
	ldr	r1, [lr, #4]
	ldr	r4, [lr, #12]
	ldr	r8, [lr, #364]
	ldr	r6, [lr, #372]
	ldr	r10, [lr, #184]
	mov	ip, lr
	mov	r2, lr
	ldr	lr, [lr, #192]
	str	lr, [sp, #24]
	ldr	lr, [sp, #16]
	add	lr, lr, #119
	str	r0, [sp, #36]
	str	r0, [sp, #8]
	str	r0, [sp, #32]
	str	r0, [sp, #4]
	str	r0, [sp, #28]
	str	r0, [sp, #12]
	str	lr, [sp, #16]
	ldr	lr, [sp, #20]
	lsl	lr, lr, #1
	str	lr, [sp, #20]
	ldr	lr, [sp, #44]
	sub	lr, lr, #5
	str	lr, [sp, #48]
	sub	r5, r5, r5, lsl #2
	ldr	lr, [sp, #40]
	add	r5, r5, #104
	str	r5, [sp, #52]
	add	r5, lr, #120
	str	r5, [sp, #44]
	ldr	r5, [sp]
	ldr	lr, [sp, #56]
	rsb	r5, r5, #95
	str	r5, [sp, #40]
	add	r5, lr, #119
	ldr	lr, [sp, #60]
	str	r5, [sp, #56]
	lsl	lr, lr, #1
	add	r5, sp, #64
	str	lr, [sp, #60]
	ldm	r5, {r5, lr}
	str	r0, [sp]
	sub	r5, r5, lr
	ldr	lr, [sp, #24]
.L496:
	cmp	r5, #49
	ble	.L467
	ldr	r0, [r2, #48]
	cmp	r0, #0
	moveq	r0, #1
	streq	r0, [r2, #48]
.L467:
	cmp	r3, #0
	beq	.L561
	cmp	r3, #2
	beq	.L562
	cmp	r3, #3
	bne	.L476
	ldr	r0, [sp, #48]
	cmp	r0, r10
	ldr	r0, [sp, #8]
	movle	r0, #1
	str	r0, [sp, #8]
	ldr	r0, [sp, #52]
	mvnle	lr, #0
	cmp	r0, r10
	movge	r0, #1
	movge	lr, r0
	strge	r0, [sp, #8]
	mov	r0, #1
	str	r0, [sp, #32]
	add	r10, r10, lr
.L479:
	add	r3, r3, #1
	cmp	r3, #9
	add	r2, r2, #60
	bne	.L496
	ldr	r3, [sp, #12]
	cmp	r3, #0
	ldr	r3, [sp, #28]
	strne	r1, [ip, #4]
	cmp	r7, #0
	strne	r4, [ip, #12]
	cmp	r3, #0
	ldr	r3, [sp, #4]
	strne	fp, [ip, #124]
	cmp	r3, #0
	ldr	r3, [sp, #32]
	strne	r9, [ip, #132]
	cmp	r3, #0
	ldr	r3, [sp, #8]
	str	lr, [sp, #24]
	strne	r10, [ip, #184]
	cmp	r3, #0
	ldrne	r3, [sp, #24]
	strne	r3, [ip, #192]
	ldr	r3, [sp, #36]
	ldr	r0, [sp]
	cmp	r3, #0
	strne	r8, [ip, #364]
	cmp	r0, #0
	strne	r6, [ip, #372]
	b	.L494
.L561:
	ldr	r0, [sp, #16]
	cmp	r0, r1
	ldr	r0, [sp, #20]
	mvnlt	r4, #0
	movlt	r7, #1
	cmp	r0, r1
	movge	r7, #1
	mov	r0, #1
	movge	r4, r7
	str	r0, [sp, #12]
	add	r1, r1, r4
	b	.L479
.L476:
	cmp	r3, #6
	bne	.L475
	ldr	r3, [sp, #56]
	cmp	r3, r8
	ldr	r3, [sp]
	movlt	r3, #1
	str	r3, [sp]
	ldr	r3, [sp, #60]
	mvnlt	r6, #0
	cmp	r3, r8
	movge	r3, #1
	movge	r6, r3
	strge	r3, [sp]
	mov	r3, #1
	add	r8, r8, r6
	str	r3, [sp, #36]
	add	r2, r2, #60
	mov	r3, #7
	b	.L496
.L475:
	cmp	r3, #8
	bne	.L479
	ldr	r3, [sp, #12]
	cmp	r3, #0
	ldr	r3, [sp, #28]
	strne	r1, [ip, #4]
	cmp	r7, #0
	strne	r4, [ip, #12]
	cmp	r3, #0
	ldr	r3, [sp, #4]
	strne	fp, [ip, #124]
	cmp	r3, #0
	ldr	r3, [sp, #32]
	strne	r9, [ip, #132]
	cmp	r3, #0
	ldr	r3, [sp, #8]
	str	lr, [sp, #24]
	strne	r10, [ip, #184]
	cmp	r3, #0
	ldrne	r3, [sp, #24]
	ldr	r2, [ip, #500]
	strne	r3, [ip, #192]
	ldr	r3, [sp, #36]
	ldr	r0, [sp]
	cmp	r3, #0
	add	r1, r2, r2, lsl #1
	ldr	r3, [ip, #484]
	add	r1, r1, #119
	strne	r8, [ip, #364]
	cmp	r0, #0
	strne	r6, [ip, #372]
	cmp	r1, r3
	mvnlt	r1, #0
	add	r2, r2, #120
	strlt	r1, [ip, #492]
	cmp	r3, r2
	movle	r1, #1
	movle	r2, r1
	ldrgt	r2, [ip, #492]
	add	r3, r3, r2
	strle	r1, [ip, #492]
	str	r3, [ip, #484]
.L494:
	add	sp, sp, #76
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	animateCrazy
.L562:
	ldr	r0, [sp, #40]
	cmp	r0, fp
	ldr	r0, [sp, #4]
	movle	r0, #1
	str	r0, [sp, #4]
	ldr	r0, [sp, #44]
	mvnle	r9, #0
	cmp	r0, fp
	movge	r0, #1
	movge	r9, r0
	strge	r0, [sp, #4]
	mov	r0, #1
	add	fp, fp, r9
	str	r0, [sp, #28]
	b	.L479
.L564:
	.align	2
.L563:
	.word	crazy
	.word	crazyFrame
	.word	frame
	.size	updateCrazy, .-updateCrazy
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r6, .L641
	ldr	r3, [r6]
	ldr	r2, .L641+4
	add	r3, r3, #1
	smull	r0, r1, r2, r3
	asr	r2, r3, #31
	rsb	r2, r2, r1, asr #2
	add	r2, r2, r2, lsl #2
	cmp	r3, r2, lsl #1
	str	r3, [r6]
	sub	sp, sp, #20
	bne	.L566
	ldr	r8, .L641+8
	ldr	r1, [r8, #4]
	cmp	r1, #20
	beq	.L633
	add	ip, r1, #1
	lsl	r2, ip, #6
	add	r2, r2, #100663296
	add	r2, r2, #61440
	ldr	r0, .L641+12
	ldrh	lr, [r2, #26]
	lsl	ip, ip, #6
	add	r0, ip, r0
	strh	lr, [r0, #26]	@ movhi
	ldrh	ip, [r2, #28]
	strh	ip, [r0, #28]	@ movhi
	ldr	r0, .L641+16
	ldrh	r0, [r0, #2]
	sub	r1, r1, #1
	str	r1, [r8, #4]
	strh	r0, [r2, #26]	@ movhi
	strh	r0, [r2, #28]	@ movhi
.L566:
	ldr	r1, .L641+20
	ldr	r0, .L641+24
	ldr	r2, [r1]
	cmp	r2, r0
	ldr	r4, .L641+28
	ble	.L630
.L568:
	ldr	r0, [r4]
	sub	r0, r0, r2
	cmp	r0, #80
	ble	.L602
.L570:
	ldr	r2, .L641+32
	ldr	r1, [r2]
	ldr	r9, .L641+36
	ldr	r7, .L641+40
	cmp	r1, #0
	ldr	r5, [r7]
	ldr	r1, [r9]
	beq	.L572
	ldr	r0, .L641+44
	ldr	r0, [r0]
	sub	r0, r3, r0
	cmp	r0, #25
	beq	.L634
.L573:
	ldr	r2, .L641+48
	ldr	r0, [r2]
	cmp	r0, #0
	beq	.L577
	ldr	r0, .L641+52
	ldr	r0, [r0]
	sub	r0, r3, r0
	cmp	r0, #30
	mov	ip, #5
	moveq	r0, #0
	str	ip, [r4, #28]
	streq	r0, [r2]
.L577:
	ldr	r2, .L641+56
	ldr	r0, [r2]
	cmp	r0, #0
	beq	.L579
	ldr	r0, .L641+60
	ldr	r0, [r0]
	sub	r0, r3, r0
	cmp	r0, #150
	moveq	r0, #0
	streq	r0, [r2]
	streq	r0, [r4, #28]
.L579:
	ldr	r0, .L641+64
	ldr	r2, .L641+68
	ldr	ip, [r0]
	ldr	r2, [r2]
	cmp	ip, #0
	sub	r2, r3, r2
	bne	.L635
	cmp	r2, #300
	moveq	r0, #1
	ldreq	r2, .L641+72
	streq	r0, [r2, #16]
.L582:
	cmp	r1, #0
	bne	.L636
.L584:
	ldr	r2, .L641+76
	ldr	r2, [r2]
	sub	r3, r3, r2
.L588:
	cmp	r3, #300
	moveq	r2, #1
	ldreq	r3, .L641+80
	streq	r2, [r3, #16]
	streq	r2, [r3, #36]
.L589:
	ldr	r3, [r7]
	cmp	r3, #0
	bne	.L637
.L591:
	bl	updateGuy
	bl	updateDoor
	bl	updateKey
	bl	updateTele
	bl	updateBoots
	ldr	r3, .L641+84
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L597
	mov	r1, #1
	ldr	r2, .L641+88
	cmp	r3, r1
	str	r1, [r2, #16]
	beq	.L597
	cmp	r3, #2
	str	r1, [r2, #36]
	beq	.L597
	str	r1, [r2, #56]
.L595:
	bl	updateShirt
	bl	updateBubble
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	updateCrazy
.L597:
	rsbs	r1, r3, #3
	beq	.L595
	mov	r2, #0
	mov	ip, r2
	ldr	r3, .L641+88
.L599:
	ldr	r0, [r3, #16]
	add	r2, r2, #1
	cmp	r0, #0
	strne	ip, [r3, #16]
	cmp	r2, r1
	add	r3, r3, #20
	bne	.L599
	b	.L595
.L634:
	mov	ip, #0
	mov	r0, #10
	str	ip, [r2]
	ldr	r2, .L641+92
	str	r0, [r2]
.L572:
	orrs	r5, r1, r5
	bne	.L573
	ldr	r8, .L641+8
	ldr	r10, .L641+96
	ldr	fp, .L641+92
	b	.L601
.L638:
	ldr	r3, [fp]
	cmp	r3, r5
	ble	.L574
	add	r5, r5, #1
.L601:
	mov	r1, #0
	ldr	r2, [r4, #20]
	ldr	r3, [r4, #16]
	str	r1, [sp, #8]
	str	r5, [sp, #12]
	str	r2, [sp, #4]
	str	r3, [sp]
	mov	r1, #256
	ldr	r3, [r4]
	ldr	r2, [r4, #4]
	ldr	r0, [r8]
	mov	lr, pc
	bx	r10
	cmp	r0, #0
	bne	.L638
.L574:
	ldr	r3, [r4]
	sub	r5, r5, #1
	add	r5, r3, r5
	str	r5, [r4]
	ldr	r3, [r6]
	ldr	r1, [r9]
	b	.L573
.L635:
	cmp	r2, #120
	moveq	r2, #0
	streq	r2, [r0]
	cmp	r1, #0
	beq	.L584
.L636:
	mov	ip, #0
	ldr	r3, [r4, #8]
	rsb	r3, r3, #0
	ldr	r1, [r4, #20]
	ldr	r2, [r4, #16]
	ldr	r0, .L641+8
	str	r3, [sp, #12]
	str	ip, [sp, #8]
	ldr	r0, [r0]
	str	r1, [sp, #4]
	str	r2, [sp]
	mov	r1, #256
	ldr	r3, [r4]
	ldr	r2, [r4, #4]
	ldr	r5, .L641+96
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L639
.L585:
	ldr	r2, .L641+76
	ldr	r3, [r6]
	ldr	r2, [r2]
	sub	r3, r3, r2
	cmp	r3, #130
	beq	.L640
	ldr	r2, [r9]
	cmp	r2, #0
	beq	.L588
	ldr	r3, [r7]
	cmp	r3, #0
	beq	.L591
.L637:
	mov	ip, #0
	ldr	r1, [r4, #8]
	ldr	r2, [r4, #20]
	ldr	r3, [r4, #16]
	ldr	r0, .L641+8
	str	ip, [sp, #8]
	ldr	r0, [r0]
	str	r1, [sp, #12]
	str	r2, [sp, #4]
	str	r3, [sp]
	mov	r1, #256
	ldr	r3, [r4]
	ldr	r2, [r4, #4]
	ldr	r4, .L641+96
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	streq	r0, [r7]
	b	.L591
.L630:
	ldr	r0, [r4]
	sub	r0, r0, r2
	cmp	r0, #80
	ble	.L569
	ldr	ip, .L641+100
	ldr	r0, [ip]
	add	r2, r2, #1
	add	r0, r0, #1
	cmp	r2, #1
	str	r2, [r1]
	str	r0, [ip]
	ble	.L570
	b	.L568
.L569:
	cmp	r2, #1
	ble	.L570
.L602:
	ldr	ip, .L641+100
	ldr	r0, [ip]
	sub	r2, r2, #1
	sub	r0, r0, #1
	str	r2, [r1]
	str	r0, [ip]
	b	.L570
.L633:
	mov	ip, #29
	ldr	r2, .L641+104
	ldr	r0, .L641+108
	ldrh	lr, [r2, #10]
	ldr	r1, .L641+16
	ldrh	r1, [r1, #2]
	strh	lr, [r0, #10]	@ movhi
	ldrh	lr, [r2, #12]
	strh	r1, [r2, #10]	@ movhi
	strh	lr, [r0, #12]	@ movhi
	strh	r1, [r2, #12]	@ movhi
	str	ip, [r8, #4]
	b	.L566
.L639:
	ldr	r3, [r4]
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r4]
	b	.L585
.L640:
	mov	r1, #0
	mov	r2, #10
	ldr	r3, .L641+92
	str	r1, [r9]
	str	r2, [r3]
	b	.L589
.L642:
	.align	2
.L641:
	.word	frame
	.word	1717986919
	.word	.LANCHOR0
	.word	100724672
	.word	100726080
	.word	guyvOff
	.word	606
	.word	guy
	.word	jumping
	.word	floating
	.word	climbing
	.word	jumpFrame
	.word	down
	.word	downFrame
	.word	powerUp
	.word	hammerFrame
	.word	jumpBoosted
	.word	bootsFrame
	.word	boots
	.word	bubbleFrame
	.word	bubble
	.word	life
	.word	heart
	.word	gravity
	.word	collisionCheck
	.word	vOff
	.word	100726096
	.word	100726672
	.size	updateGame, .-updateGame
	.align	2
	.global	drawGuy
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGuy, %function
drawGuy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #4
	ldr	r2, .L668
	ldr	r1, [r2]
	ldr	r2, .L668+4
	cmp	r1, #0
	push	{r4, lr}
	str	r3, [r2, #40]
	beq	.L644
	ldr	r1, .L668+8
	ldr	r3, .L668+12
	ldr	r1, [r1]
	ldr	r3, [r3]
	orrs	r3, r1, r3
	bne	.L645
.L644:
	ldr	r1, .L668+16
	ldr	r3, [r2, #4]
	ldr	r0, [r1]
	ldr	r1, .L668+20
	sub	r3, r3, r0
	ldr	ip, [r1]
	ldr	r1, [r2]
	ldr	r2, [r2, #36]
	lsl	r3, r3, #23
	ldr	r0, .L668+24
	lsr	r3, r3, #23
	sub	r1, r1, ip
	lsl	r2, r2, #6
	orr	r3, r3, #16384
	and	r1, r1, #255
	add	r2, r2, #15
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r2, [r0, #4]	@ movhi
.L643:
	pop	{r4, lr}
	bx	lr
.L645:
	ldr	r3, [r2, #28]
	cmp	r3, #0
	beq	.L663
	cmp	r3, #2
	beq	.L644
	cmp	r3, #1
	beq	.L664
	cmp	r3, #3
	beq	.L665
	cmp	r3, #5
	beq	.L666
	cmp	r3, #4
	beq	.L667
	cmp	r3, #6
	bne	.L643
	b	.L644
.L663:
	ldr	r1, .L668+16
	ldr	r3, [r2, #4]
	ldr	r0, [r1]
	ldr	r1, .L668+20
	sub	r3, r3, r0
	ldr	ip, [r1]
	ldr	r1, [r2]
	ldr	r2, [r2, #36]
	lsl	r3, r3, #23
	ldr	r0, .L668+24
	lsr	r3, r3, #23
	sub	r1, r1, ip
	lsl	r2, r2, #6
	orr	r3, r3, #16384
	and	r1, r1, #255
	add	r2, r2, #17
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L666:
	mov	r0, #19
	ldr	r1, .L668+16
	ldr	r3, [r2, #4]
	ldr	ip, [r1]
	ldr	r1, .L668+20
	sub	r3, r3, ip
	lsl	r3, r3, #23
	ldr	r2, [r2]
	ldr	ip, [r1]
	lsr	r3, r3, #23
.L662:
	ldr	r1, .L668+24
	sub	r2, r2, ip
	orr	r3, r3, #16384
	and	r2, r2, #255
	strh	r3, [r1, #2]	@ movhi
	strh	r2, [r1]	@ movhi
	strh	r0, [r1, #4]	@ movhi
	b	.L643
.L664:
	mov	r0, #23
	ldr	r1, .L668+16
	ldr	r3, [r2, #4]
	ldr	ip, [r1]
	ldr	r1, .L668+20
	sub	r3, r3, ip
	lsl	r3, r3, r0
	ldr	r2, [r2]
	ldr	ip, [r1]
	lsr	r3, r3, r0
	b	.L662
.L665:
	mov	lr, #2
	ldr	r1, .L668+16
	ldr	r3, [r2, #4]
	ldr	r0, [r1]
	ldr	r1, .L668+20
	sub	r3, r3, r0
	ldr	r4, [r1]
	ldr	r0, [r2]
	ldr	r1, [r2, #36]
	lsl	r3, r3, #23
	ldr	ip, .L668+24
	lsr	r3, r3, #23
	sub	r0, r0, r4
	lsl	r1, r1, #6
	orr	r3, r3, #16384
	and	r0, r0, #255
	add	r1, r1, #21
	strh	r3, [ip, #2]	@ movhi
	strh	r0, [ip]	@ movhi
	strh	r1, [ip, #4]	@ movhi
	str	lr, [r2, #40]
	b	.L643
.L667:
	mov	lr, #2
	ldr	r1, .L668+16
	ldr	r3, [r2, #4]
	ldr	r0, [r1]
	ldr	r1, .L668+20
	sub	r3, r3, r0
	ldr	r4, [r1]
	ldr	r0, [r2]
	ldr	r1, [r2, #36]
	lsl	r3, r3, #23
	ldr	ip, .L668+24
	lsr	r3, r3, #23
	sub	r0, r0, r4
	lsl	r1, r1, #6
	orr	r3, r3, #16384
	and	r0, r0, #255
	add	r1, r1, #25
	strh	r3, [ip, #2]	@ movhi
	strh	r0, [ip]	@ movhi
	strh	r1, [ip, #4]	@ movhi
	str	lr, [r2, #40]
	b	.L643
.L669:
	.align	2
.L668:
	.word	life
	.word	guy
	.word	time_m
	.word	time_s
	.word	guyhOff
	.word	guyvOff
	.word	shadowOAM
	.size	drawGuy, .-drawGuy
	.align	2
	.global	drawDoor
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawDoor, %function
drawDoor:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, #512
	mov	fp, #8
	ldr	r3, .L683
	ldr	r2, .L683+4
	ldr	r8, [r3]
	ldr	r5, [r2]
	ldr	r3, .L683+8
	lsl	r7, r5, #16
	lsl	r6, r8, #16
	ldr	r1, .L683+12
	ldr	r10, .L683+16
	lsr	r7, r7, #16
	lsr	r6, r6, #16
	add	r0, r3, #60
.L673:
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L671
	ldr	ip, [r3]
	sub	lr, ip, r5
	cmp	lr, #0
	ble	.L671
	ldr	r9, [r3, #4]
	sub	r2, r9, r8
	sub	r2, r2, #1
	cmp	r2, #238
	movhi	r2, #0
	movls	r2, #1
	cmp	lr, #159
	movgt	r2, #0
	cmp	r2, #0
	bne	.L682
.L671:
	strh	r4, [r1, #120]	@ movhi
.L672:
	add	r3, r3, #20
	cmp	r3, r0
	bne	.L673
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L682:
	sub	r2, ip, r7
	sub	ip, r9, r6
	lsl	ip, ip, #23
	and	r2, r2, #255
	lsr	ip, ip, #23
	orr	r2, r2, r10
	orr	ip, ip, r10
	strh	r2, [r1, #120]	@ movhi
	strh	ip, [r1, #122]	@ movhi
	strh	fp, [r1, #124]	@ movhi
	b	.L672
.L684:
	.align	2
.L683:
	.word	hOff
	.word	vOff
	.word	door
	.word	shadowOAM
	.word	-32768
	.size	drawDoor, .-drawDoor
	.align	2
	.global	drawKey
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawKey, %function
drawKey:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L707
	ldr	lr, .L707+4
	ldr	r8, [r3]
	mov	r1, #0
	mov	r3, lr
	mov	r0, #512
	ldr	fp, .L707+8
	ldr	r6, [fp]
	lsl	r4, r8, #16
	lsl	r5, r6, #16
	ldr	r2, .L707+12
	lsr	r5, r5, #16
	lsr	r4, r4, #16
.L690:
	ldr	ip, [r3, #16]
	cmp	ip, #0
	beq	.L686
	ldr	ip, [r3]
	sub	r9, ip, r6
	cmp	r9, #0
	ble	.L686
	ldr	r10, [r3, #4]
	sub	r7, r10, r8
	sub	r7, r7, #1
	cmp	r7, #238
	bhi	.L686
	sub	r10, r10, r4
	lsl	r10, r10, #23
	sub	ip, ip, r5
	lsr	r10, r10, #23
	cmp	r9, #159
	and	ip, ip, #255
	orr	r10, r10, #16384
	ble	.L704
.L686:
	strh	r0, [r2]	@ movhi
.L687:
	cmp	r1, #1
	add	r3, r3, #20
	add	r2, r2, #8
	movne	r1, #1
	bne	.L690
.L705:
	ldr	r3, [lr, #56]
	cmp	r3, #0
	bne	.L706
.L688:
	mov	r2, #512
	ldr	r3, .L707+16
	strh	r2, [r3]	@ movhi
.L685:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L706:
	ldr	r2, [fp]
	ldr	r3, [lr, #40]
	sub	r3, r3, r2
	cmp	r3, #0
	ble	.L688
	ldr	r1, .L707
	ldr	r2, [lr, #44]
	ldr	r1, [r1]
	sub	r2, r2, r1
	sub	r1, r2, #1
	cmp	r1, #238
	movhi	r1, #0
	movls	r1, #1
	cmp	r3, #159
	movgt	r1, #0
	cmp	r1, #0
	beq	.L688
	mov	r0, #70
	lsl	r2, r2, #23
	ldr	r1, .L707+16
	lsr	r2, r2, #23
	orr	r2, r2, #16384
	and	r3, r3, #255
	strh	r2, [r1, #2]	@ movhi
	strh	r3, [r1]	@ movhi
	strh	r0, [r1, #4]	@ movhi
	b	.L685
.L704:
	strh	ip, [r2]	@ movhi
	mov	ip, #6	@ movhi
	strh	r10, [r2, #2]	@ movhi
	strh	ip, [r2, #4]	@ movhi
	b	.L687
.L708:
	.align	2
.L707:
	.word	hOff
	.word	key
	.word	vOff
	.word	shadowOAM+640
	.word	shadowOAM+656
	.size	drawKey, .-drawKey
	.align	2
	.global	drawTele
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawTele, %function
drawTele:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	ip, #0
	mov	r8, #512
	ldr	r2, .L722
	ldr	r3, .L722+4
	ldr	lr, [r2]
	ldr	r6, [r3]
	lsl	r5, lr, #16
	lsl	r4, r6, #16
	ldr	r1, .L722+8
	ldr	r2, .L722+12
	ldr	fp, .L722+16
	lsr	r5, r5, #16
	lsr	r4, r4, #16
.L715:
	ldr	r0, [r2]
	sub	r10, r0, lr
	cmp	r10, #0
	add	r3, ip, #1
	ble	.L710
	ldr	r7, [r2, #4]
	sub	r9, r7, r6
	sub	r9, r9, #1
	cmp	r9, #238
	movhi	r9, #0
	movls	r9, #1
	cmp	r10, #159
	movgt	r9, #0
	cmp	r9, #0
	bne	.L720
.L710:
	lsl	r0, r3, #3
	strh	r8, [r0, r1]	@ movhi
.L713:
	cmp	r3, #2
	beq	.L709
.L712:
	mov	ip, r3
	add	r2, r2, #20
	b	.L715
.L709:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L720:
	sub	r9, r7, r4
	lsl	r9, r9, #23
	sub	r10, r0, r5
	lsr	r9, r9, #23
	cmp	ip, #0
	and	r10, r10, #255
	orr	r9, r9, fp
	beq	.L721
	mov	ip, #540	@ movhi
	ldr	r0, .L722+20
	strh	r10, [r0]	@ movhi
	strh	r9, [r0, #2]	@ movhi
	strh	ip, [r0, #4]	@ movhi
	b	.L713
.L721:
	mov	r0, #668	@ movhi
	ldr	r7, .L722+24
	strh	r10, [r7, #-2]	@ movhi
	strh	r9, [r7]	@ movhi
	strh	r0, [r7, #2]	@ movhi
	b	.L712
.L723:
	.align	2
.L722:
	.word	vOff
	.word	hOff
	.word	shadowOAM+392
	.word	tele
	.word	-32768
	.word	shadowOAM+408
	.word	shadowOAM+402
	.size	drawTele, .-drawTele
	.align	2
	.global	drawBoots
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBoots, %function
drawBoots:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L734
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L725
	ldr	r1, .L734+4
	ldr	r2, [r3]
	ldr	r1, [r1]
	sub	r2, r2, r1
	cmp	r2, #0
	ble	.L725
	ldr	r1, .L734+8
	ldr	r3, [r3, #4]
	ldr	r1, [r1]
	sub	r3, r3, r1
	sub	r1, r3, #1
	cmp	r1, #238
	movhi	r1, #0
	movls	r1, #1
	cmp	r2, #159
	movgt	r1, #0
	cmp	r1, #0
	bne	.L733
.L725:
	mov	r2, #512
	ldr	r3, .L734+12
	strh	r2, [r3, #136]	@ movhi
	bx	lr
.L733:
	mov	r0, #4
	lsl	r3, r3, #23
	ldr	r1, .L734+12
	lsr	r3, r3, #23
	orr	r3, r3, #16384
	and	r2, r2, #255
	strh	r3, [r1, #138]	@ movhi
	strh	r2, [r1, #136]	@ movhi
	strh	r0, [r1, #140]	@ movhi
	bx	lr
.L735:
	.align	2
.L734:
	.word	boots
	.word	vOff
	.word	hOff
	.word	shadowOAM
	.size	drawBoots, .-drawBoots
	.align	2
	.global	drawShirt
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawShirt, %function
drawShirt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r1, #0
	mov	r5, #512
	mov	r9, #2
	ldr	r2, .L749
	ldr	r3, .L749+4
	ldr	r4, [r2]
	ldr	r6, [r3]
	lsl	lr, r4, #16
	lsl	ip, r6, #16
	ldr	r3, .L749+8
	ldr	r2, .L749+12
	ldr	r10, .L749+16
	lsr	lr, lr, #16
	lsr	ip, ip, #16
.L739:
	ldr	r0, [r3, #16]
	cmp	r0, #0
	beq	.L737
	ldr	r8, [r3]
	sub	r7, r8, r4
	cmp	r7, #0
	ble	.L737
	ldr	fp, [r3, #4]
	sub	r0, fp, r6
	sub	r0, r0, #1
	cmp	r0, #238
	movhi	r0, #0
	movls	r0, #1
	cmp	r7, #159
	movgt	r0, #0
	cmp	r0, #0
	bne	.L748
.L737:
	strh	r5, [r2]	@ movhi
.L738:
	cmp	r1, #1
	add	r3, r3, #20
	add	r2, r2, #8
	bne	.L740
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L740:
	mov	r1, #1
	b	.L739
.L748:
	sub	r0, fp, ip
	and	r0, r0, r10
	sub	r8, r8, lr
	orr	r0, r0, #16384
	and	r8, r8, #255
	strh	r0, [r2, #2]	@ movhi
	strh	r8, [r2]	@ movhi
	strh	r9, [r2, #4]	@ movhi
	b	.L738
.L750:
	.align	2
.L749:
	.word	vOff
	.word	hOff
	.word	shirt
	.word	shadowOAM+480
	.word	511
	.size	drawShirt, .-drawShirt
	.align	2
	.global	drawBubble
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBubble, %function
drawBubble:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r1, #0
	mov	r5, #512
	mov	r9, #10
	ldr	r2, .L764
	ldr	r3, .L764+4
	ldr	r4, [r2]
	ldr	r6, [r3]
	lsl	lr, r4, #16
	lsl	ip, r6, #16
	ldr	r3, .L764+8
	ldr	r2, .L764+12
	ldr	r10, .L764+16
	lsr	lr, lr, #16
	lsr	ip, ip, #16
.L754:
	ldr	r0, [r3, #16]
	cmp	r0, #0
	beq	.L752
	ldr	r8, [r3]
	sub	r7, r8, r4
	cmp	r7, #0
	ble	.L752
	ldr	fp, [r3, #4]
	sub	r0, fp, r6
	sub	r0, r0, #1
	cmp	r0, #238
	movhi	r0, #0
	movls	r0, #1
	cmp	r7, #159
	movgt	r0, #0
	cmp	r0, #0
	bne	.L763
.L752:
	strh	r5, [r2]	@ movhi
.L753:
	cmp	r1, #1
	add	r3, r3, #20
	add	r2, r2, #8
	bne	.L755
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L755:
	mov	r1, #1
	b	.L754
.L763:
	sub	r0, fp, ip
	and	r0, r0, r10
	sub	r8, r8, lr
	orr	r0, r0, #16384
	and	r8, r8, #255
	strh	r0, [r2, #2]	@ movhi
	strh	r8, [r2]	@ movhi
	strh	r9, [r2, #4]	@ movhi
	b	.L753
.L765:
	.align	2
.L764:
	.word	vOff
	.word	hOff
	.word	bubble
	.word	shadowOAM+560
	.word	511
	.size	drawBubble, .-drawBubble
	.align	2
	.global	drawCustomer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCustomer, %function
drawCustomer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L773
	ldr	r1, .L773+4
	ldr	r3, [r2]
	ldr	r1, [r1]
	sub	r3, r3, r1
	cmp	r3, #0
	ble	.L767
	ldr	r0, .L773+8
	ldr	r1, [r2, #4]
	ldr	r0, [r0]
	sub	r1, r1, r0
	sub	r0, r1, #1
	cmp	r0, #238
	movhi	r0, #0
	movls	r0, #1
	cmp	r3, #159
	movgt	r0, #0
	cmp	r0, #0
	bne	.L772
.L767:
	mov	r2, #512
	ldr	r3, .L773+12
	strh	r2, [r3, #16]	@ movhi
	bx	lr
.L772:
	ldr	r2, [r2, #36]
	ldr	r0, .L773+12
	lsl	r2, r2, #6
	add	r2, r2, #13
	orr	r1, r1, #16384
	strh	r2, [r0, #20]	@ movhi
	strh	r3, [r0, #16]	@ movhi
	strh	r1, [r0, #18]	@ movhi
	bx	lr
.L774:
	.align	2
.L773:
	.word	customer
	.word	vOff
	.word	hOff
	.word	shadowOAM
	.size	drawCustomer, .-drawCustomer
	.align	2
	.global	drawCrazy
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCrazy, %function
drawCrazy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L790
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r1, .L790+4
	mov	lr, r3
	ldr	r2, .L790+8
	ldr	r3, [r3, #456]
	ldr	r7, [r1]
	ldr	fp, [r2]
	lsl	r3, r3, #23
	add	r3, r3, #5439488
	sub	sp, sp, #12
	lsl	r6, r7, #16
	lsl	r5, fp, #16
	lsr	r3, r3, #16
	mov	r4, #0
	mov	r10, #512
	ldr	r0, .L790+12
	ldr	r9, .L790+16
	ldr	r8, .L790+20
	str	r3, [sp, #4]
	lsr	r6, r6, #16
	lsr	r5, r5, #16
	b	.L785
.L783:
	mov	r4, r3
	add	lr, lr, #60
	add	r0, r0, #8
.L785:
	ldr	r3, [lr]
	ldr	r1, [lr, #4]
	sub	r2, r3, r6
	lsl	r2, r2, #16
	sub	r3, r3, r7
	sub	r3, r3, #1
	lsr	r2, r2, #16
	sub	ip, r1, r5
	and	ip, ip, r9
	cmp	r3, #158
	sub	r3, r2, #14
	and	r3, r3, #255
	orr	ip, ip, r8
	strh	r3, [r0, #240]	@ movhi
	strh	ip, [r0, #242]	@ movhi
	add	r3, r4, #1
	bhi	.L776
	sub	r1, r1, fp
	sub	r1, r1, #1
	cmp	r1, #238
	bls	.L787
.L776:
	strh	r10, [r0, #240]	@ movhi
.L779:
	cmp	r3, #9
	bne	.L783
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L787:
	sub	r1, r4, #2
	cmp	r4, #0
	cmpne	r1, #1
	bhi	.L777
	ldr	r2, [lr, #12]
	cmn	r2, #1
	ldr	r2, [lr, #36]
	lsl	r2, r2, #7
	addeq	r2, r2, #129
	addne	r2, r2, #133
	strh	r2, [r0, #244]	@ movhi
	b	.L779
.L777:
	sub	r1, r4, #6
	bics	r1, r1, #2
	beq	.L788
	cmp	r4, #7
	beq	.L789
	ldr	r2, [lr, #36]
	lsl	r2, r2, #7
	add	r2, r2, #137
	strh	r2, [r0, #244]	@ movhi
	b	.L779
.L788:
	ldr	r1, [lr, #36]
	sub	r2, r2, #17
	ldr	ip, [lr, #12]
	and	r2, r2, #255
	orr	r2, r2, r8
	lsl	r1, r1, #23
	cmp	ip, #1
	strh	r2, [r0, #240]	@ movhi
	lsr	r2, r1, #16
	addeq	r2, r2, #27
	addne	r2, r2, #29
	strh	r2, [r0, #244]	@ movhi
	b	.L779
.L789:
	ldr	r2, .L790+24
	ldr	r1, [sp, #4]
	strh	r1, [r2]	@ movhi
	b	.L783
.L791:
	.align	2
.L790:
	.word	crazy
	.word	vOff
	.word	hOff
	.word	shadowOAM
	.word	511
	.word	-32768
	.word	shadowOAM+300
	.size	drawCrazy, .-drawCrazy
	.align	2
	.global	drawHeart
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHeart, %function
drawHeart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r2, #0
	mov	r5, #512
	mov	r4, #12
	ldr	r3, .L798
	ldr	ip, .L798+4
	ldr	lr, .L798+8
	ldm	r3, {r0, r1}
	ldr	ip, [ip]
	ldr	r3, [lr]
	sub	r0, r0, #8
	sub	r1, r1, #8
	sub	r0, r0, ip
	sub	r1, r1, r3
	lsl	r0, r0, #16
	lsl	r1, r1, #16
	ldr	ip, .L798+12
	ldr	r3, .L798+16
	lsr	r0, r0, #16
	lsr	r1, r1, #16
.L795:
	ldr	lr, [ip, #16]
	cmp	lr, #0
	add	lr, r1, r2
	add	r2, r2, #8
	strhne	r0, [r3, #72]	@ movhi
	strhne	lr, [r3, #74]	@ movhi
	strhne	r4, [r3, #76]	@ movhi
	strheq	r5, [r3, #72]	@ movhi
	cmp	r2, #24
	add	ip, ip, #20
	add	r3, r3, #8
	bne	.L795
	pop	{r4, r5, lr}
	bx	lr
.L799:
	.align	2
.L798:
	.word	guy
	.word	guyvOff
	.word	guyhOff
	.word	heart
	.word	shadowOAM
	.size	drawHeart, .-drawHeart
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	drawGuy
	bl	drawDoor
	bl	drawKey
	bl	drawTele
	bl	drawBoots
	bl	drawHeart
	bl	drawShirt
	bl	drawCustomer
	bl	drawBubble
	bl	drawCrazy
	ldr	r3, .L802
	mov	lr, pc
	bx	r3
	ldr	r4, .L802+4
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L802+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L802+12
	ldrh	r1, [r2]
	ldr	r2, .L802+16
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L803:
	.align	2
.L802:
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	hOff
	.word	vOff
	.size	drawGame, .-drawGame
	.global	upward
	.comm	boots,20,4
	.comm	door,60,4
	.comm	bubble,40,4
	.comm	tele,40,4
	.comm	shirt,40,4
	.comm	key,60,4
	.comm	scoreUI,40,4
	.comm	heart,60,4
	.comm	crazy,540,4
	.comm	hammer,60,4
	.comm	customer,60,4
	.comm	kong,60,4
	.comm	guy,60,4
	.global	collisionMap
	.comm	time_s,4,4
	.comm	time_m,4,4
	.comm	crazyFrame,4,4
	.comm	bubbleFrame,4,4
	.comm	bootsFrame,4,4
	.comm	hammerFrame,4,4
	.comm	downFrame,4,4
	.comm	jumpFrame,4,4
	.comm	score,4,4
	.comm	frame,4,4
	.comm	floating,4,4
	.comm	jumpBoosted,4,4
	.comm	powerUp,4,4
	.comm	climbing,4,4
	.comm	down,4,4
	.comm	jumping,4,4
	.comm	lost,4,4
	.comm	won,4,4
	.comm	paused,4,4
	.comm	gravity,4,4
	.comm	guyvOff,4,4
	.comm	guyhOff,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	delivered,4,4
	.comm	life,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	collisionMap, %object
	.size	collisionMap, 4
collisionMap:
	.word	collisionmapBitmap
	.type	upward, %object
	.size	upward, 4
upward:
	.word	29
	.ident	"GCC: (devkitARM release 53) 9.1.0"
