	.cpu arm7tdmi
	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.global	train
	.data
	.align	2
	.type	train, %object
	.size	train, 40
train:
	.word	0
	.word	0
	.word	1065353216
	.word	1073741824
	.word	1073741824
	.word	1082130432
	.word	1077936128
	.word	1086324736
	.word	1082130432
	.word	1090519040
	.global	__aeabi_i2f
	.global	__aeabi_fdiv
	.text
	.align	2
	.global	rand_float
	.syntax unified
	.arm
	.type	rand_float, %function
rand_float:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	bl	rand
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_i2f
	mov	r3, r0
	mov	r1, #1325400064
	mov	r0, r3
	bl	__aeabi_fdiv
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	rand_float, .-rand_float
	.global	__aeabi_fmul
	.global	__aeabi_fsub
	.global	__aeabi_fadd
	.align	2
	.global	cost
	.syntax unified
	.arm
	.type	cost, %function
cost:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	str	r0, [fp, #-32]	@ float
	mov	r3, #0
	str	r3, [fp, #-8]	@ float
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L4
.L5:
	ldr	r2, .L7
	ldr	r3, [fp, #-12]
	ldr	r3, [r2, r3, lsl #3]	@ float
	str	r3, [fp, #-16]	@ float
	ldr	r1, [fp, #-32]	@ float
	ldr	r0, [fp, #-16]	@ float
	bl	__aeabi_fmul
	mov	r3, r0
	str	r3, [fp, #-20]	@ float
	ldr	r2, .L7
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldr	r3, [r3, #4]	@ float
	mov	r1, r3
	ldr	r0, [fp, #-20]	@ float
	bl	__aeabi_fsub
	mov	r3, r0
	str	r3, [fp, #-24]	@ float
	ldr	r1, [fp, #-24]	@ float
	ldr	r0, [fp, #-24]	@ float
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r1, r3
	ldr	r0, [fp, #-8]	@ float
	bl	__aeabi_fadd
	mov	r3, r0
	str	r3, [fp, #-8]	@ float
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L4:
	ldr	r3, [fp, #-12]
	cmp	r3, #4
	bls	.L5
	ldr	r1, .L7+4
	ldr	r0, [fp, #-8]	@ float
	bl	__aeabi_fdiv
	mov	r3, r0
	str	r3, [fp, #-8]	@ float
	ldr	r3, [fp, #-8]	@ float
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L8:
	.align	2
.L7:
	.word	train
	.word	1084227584
	.size	cost, .-cost
	.global	__aeabi_f2d
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%f\012\000"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #28
	mov	r0, #70
	bl	srand
	bl	rand_float
	mov	r3, r0
	ldr	r1, .L13
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	str	r3, [fp, #-16]	@ float
	ldr	r3, .L13+4
	str	r3, [fp, #-24]	@ float
	ldr	r3, .L13+4
	str	r3, [fp, #-28]	@ float
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L10
.L11:
	ldr	r1, [fp, #-24]	@ float
	ldr	r0, [fp, #-16]	@ float
	bl	__aeabi_fadd
	mov	r3, r0
	mov	r0, r3
	bl	cost
	mov	r4, r0
	ldr	r0, [fp, #-16]	@ float
	bl	cost
	mov	r3, r0
	mov	r1, r3
	mov	r0, r4
	bl	__aeabi_fsub
	mov	r3, r0
	ldr	r1, [fp, #-24]	@ float
	mov	r0, r3
	bl	__aeabi_fdiv
	mov	r3, r0
	str	r3, [fp, #-32]	@ float
	ldr	r1, [fp, #-32]	@ float
	ldr	r0, [fp, #-28]	@ float
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r1, r3
	ldr	r0, [fp, #-16]	@ float
	bl	__aeabi_fsub
	mov	r3, r0
	str	r3, [fp, #-16]	@ float
	ldr	r0, [fp, #-16]	@ float
	bl	cost
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2d
	mov	r2, r0
	mov	r3, r1
	ldr	r0, .L13+8
	bl	printf
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L10:
	ldr	r3, [fp, #-20]
	cmp	r3, #500
	bcc	.L11
	ldr	r0, [fp, #-16]	@ float
	bl	__aeabi_f2d
	mov	r2, r0
	mov	r3, r1
	ldr	r0, .L13+8
	bl	printf
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	1092616192
	.word	981668463
	.word	.LC0
	.size	main, .-main
	.ident	"GCC: (Arch Repository) 13.2.0"
