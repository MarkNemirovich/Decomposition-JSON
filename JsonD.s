	.file	"JsonD.c"
	.text
	.globl	example
	.data
	.align 32
	.type	example, @object
	.size	example, 104
example:
	.string	"{ \"obj1\": { \"Msg1\": \"First example : 20, 3]\", \"val1\" : 1337, \"val3\" : true, \"obj2\" : { \"val22\": 5 } } }"
	.globl	level
	.bss
	.align 4
	.type	level, @object
	.size	level, 4
level:
	.zero	4
	.text
	.globl	Pow
	.type	Pow, @function
Pow:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	$1, -4(%rbp)
	jmp	.L2
.L3:
	movl	-4(%rbp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, -4(%rbp)
	subl	$1, -20(%rbp)
.L2:
	cmpl	$1, -20(%rbp)
	jg	.L3
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	Pow, .-Pow
	.globl	CharToInt
	.type	CharToInt, @function
CharToInt:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$32, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -32(%rbp)
	movl	%esi, -36(%rbp)
	movl	%edx, -40(%rbp)
	movl	$0, -16(%rbp)
	movl	-40(%rbp), %eax
	subl	-36(%rbp), %eax
	movl	%eax, -12(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L6
.L7:
	movl	-36(%rbp), %edx
	movl	-20(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	leal	-48(%rax), %ebx
	movl	-12(%rbp), %eax
	subl	-20(%rbp), %eax
	movl	%eax, %edi
	call	Pow
	imull	%ebx, %eax
	addl	%eax, -16(%rbp)
	addl	$1, -20(%rbp)
.L6:
	movl	-20(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jl	.L7
	movl	-16(%rbp), %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	CharToInt, .-CharToInt
	.section	.rodata
.LC0:
	.string	"Number %-5d is at lvl %d\n"
	.text
	.globl	Parse
	.type	Parse, @function
Parse:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movl	%esi, -44(%rbp)
	movl	$0, -16(%rbp)
	movl	$0, -12(%rbp)
	movl	$0, -8(%rbp)
	movb	$0, -18(%rbp)
	movb	$0, -17(%rbp)
	jmp	.L10
.L20:
	cmpb	$1, -18(%rbp)
	jne	.L11
	movl	-16(%rbp), %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$34, %al
	jne	.L21
	movb	$0, -18(%rbp)
	jmp	.L13
.L11:
	movl	-16(%rbp), %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	cmpl	$125, %eax
	je	.L14
	cmpl	$125, %eax
	jg	.L15
	cmpl	$123, %eax
	je	.L16
	cmpl	$123, %eax
	jg	.L15
	cmpl	$93, %eax
	je	.L14
	cmpl	$93, %eax
	jg	.L15
	cmpl	$91, %eax
	je	.L16
	cmpl	$91, %eax
	jg	.L15
	cmpl	$34, %eax
	je	.L17
	cmpl	$34, %eax
	jl	.L15
	subl	$48, %eax
	cmpl	$9, %eax
	ja	.L15
	cmpb	$1, -17(%rbp)
	je	.L22
	movb	$1, -17(%rbp)
	movl	-16(%rbp), %eax
	movl	%eax, -12(%rbp)
	jmp	.L13
.L17:
	movb	$1, -18(%rbp)
	movb	$0, -17(%rbp)
	jmp	.L13
.L16:
	movl	level(%rip), %eax
	addl	$1, %eax
	movl	%eax, level(%rip)
	movb	$0, -17(%rbp)
	jmp	.L13
.L14:
	movl	level(%rip), %eax
	subl	$1, %eax
	movl	%eax, level(%rip)
	movb	$0, -17(%rbp)
	jmp	.L13
.L15:
	cmpb	$1, -17(%rbp)
	jne	.L19
	movl	-16(%rbp), %edx
	movl	-12(%rbp), %ecx
	movq	-40(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	CharToInt
	movl	%eax, -4(%rbp)
	movl	level(%rip), %edx
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L19:
	movb	$0, -17(%rbp)
	jmp	.L13
.L21:
	nop
	jmp	.L13
.L22:
	nop
.L13:
	addl	$1, -16(%rbp)
.L10:
	movl	-16(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jl	.L20
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	Parse, .-Parse
	.section	.rodata
	.align 8
.LC1:
	.string	"Json-obj from RawString (c++) \t%s\n"
.LC2:
	.string	"r"
.LC3:
	.string	"test.txt"
.LC4:
	.string	"File don't found"
.LC5:
	.string	"Json-obj from File \t%s\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	leaq	example(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$104, %esi
	leaq	example(%rip), %rdi
	call	Parse
	movl	$10, %edi
	call	putchar@PLT
	movq	$0, -16(%rbp)
	movl	$0, -24(%rbp)
	leaq	.LC2(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	fopen@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L26
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	jmp	.L25
.L27:
	addl	$1, -24(%rbp)
.L26:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	getc@PLT
	cmpl	$-1, %eax
	jne	.L27
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	rewind@PLT
	movl	-24(%rbp), %eax
	addl	$1, %eax
	cltq
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	je	.L28
	cmpl	$0, -24(%rbp)
	jle	.L28
	movl	$0, -20(%rbp)
	jmp	.L29
.L30:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	getc@PLT
	movl	%eax, %ecx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movl	%ecx, %edx
	movb	%dl, (%rax)
	addl	$1, -20(%rbp)
.L29:
	movl	-20(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jl	.L30
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-24(%rbp), %edx
	movq	-16(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	Parse
.L28:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	$0, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
.L25:
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
