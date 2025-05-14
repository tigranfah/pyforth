.section .data
s_dot_string0:
    .string "<%d>\n"   # format string for printf

s_dot_string:
    .string "<%d> %d\n"   # format string for printf

s_string:
    .string "%d\n"   # format string for printf

.section .text
	.globl main
	.extern printf

main:
	push %rbp
	push $42
	pop %rbx
	mov %rbx, %rsi  # 2nd argument to printf
	leaq s_string(%rip), %rdi  # 1st argument to printf
	xor %rax, %rax  # clear %rax for varargs calling convention
	call printf  # call printf
	push $123
	push $456
	mov (%rsp), %rbx
	mov $2, %rsi  # 2nd argument to printf
	mov %rbx, %rdx  # 3nd argument to printf
	leaq s_dot_string(%rip), %rdi  # 1st argument to printf
	xor %rax, %rax  # clear %rax for varargs calling convention
	call printf  # call printf
	pop %rbx
	mov %rbx, %rsi  # 2nd argument to printf
	leaq s_string(%rip), %rdi  # 1st argument to printf
	xor %rax, %rax  # clear %rax for varargs calling convention
	call printf  # call printf
	pop %rbx
	mov %rbx, %rsi  # 2nd argument to printf
	leaq s_string(%rip), %rdi  # 1st argument to printf
	xor %rax, %rax  # clear %rax for varargs calling convention
	call printf  # call printf
	push $2
	push $3
	pop %rbx
	pop %rax
	add %rbx, %rax  # add operation
	push %rax

	pop %rbx
	mov %rbx, %rsi  # 2nd argument to printf
	leaq s_string(%rip), %rdi  # 1st argument to printf
	xor %rax, %rax  # clear %rax for varargs calling convention
	call printf  # call printf
	push $10
	push $0
	pop %rbx
	pop %rax
	add %rbx, %rax  # add operation
	push %rax

	pop %rbx
	mov %rbx, %rsi  # 2nd argument to printf
	leaq s_string(%rip), %rdi  # 1st argument to printf
	xor %rax, %rax  # clear %rax for varargs calling convention
	call printf  # call printf
	push $5
	push $3
	pop %rbx
	pop %rax
	sub %rbx, %rax  # subtract operation
	push %rax

	pop %rbx
	mov %rbx, %rsi  # 2nd argument to printf
	leaq s_string(%rip), %rdi  # 1st argument to printf
	xor %rax, %rax  # clear %rax for varargs calling convention
	call printf  # call printf
	push $3
	push $5
	pop %rbx
	pop %rax
	sub %rbx, %rax  # subtract operation
	push %rax

	pop %rbx
	mov %rbx, %rsi  # 2nd argument to printf
	leaq s_string(%rip), %rdi  # 1st argument to printf
	xor %rax, %rax  # clear %rax for varargs calling convention
	call printf  # call printf
	push $4
	push $2
	pop %rbx
	pop %rax
	imul %rbx, %rax  # multiply operation
	push %rax

	pop %rbx
	mov %rbx, %rsi  # 2nd argument to printf
	leaq s_string(%rip), %rdi  # 1st argument to printf
	xor %rax, %rax  # clear %rax for varargs calling convention
	call printf  # call printf
	push $7
	push $0
	pop %rbx
	pop %rax
	imul %rbx, %rax  # multiply operation
	push %rax

	pop %rbx
	mov %rbx, %rsi  # 2nd argument to printf
	leaq s_string(%rip), %rdi  # 1st argument to printf
	xor %rax, %rax  # clear %rax for varargs calling convention
	call printf  # call printf
	push $8
	push $2
	pop %rbx
	pop %rax
	cqo
	idiv %rbx  # divide operation
	push %rax

	pop %rbx
	mov %rbx, %rsi  # 2nd argument to printf
	leaq s_string(%rip), %rdi  # 1st argument to printf
	xor %rax, %rax  # clear %rax for varargs calling convention
	call printf  # call printf
	push $9
	push $4
	pop %rbx
	pop %rax
	cqo
	idiv %rbx  # divide operation
	push %rax

	pop %rbx
	mov %rbx, %rsi  # 2nd argument to printf
	leaq s_string(%rip), %rdi  # 1st argument to printf
	xor %rax, %rax  # clear %rax for varargs calling convention
	call printf  # call printf
	push $2
	push $3
	pop %rbx
	pop %rax
	add %rbx, %rax  # add operation
	push %rax

	push $4
	pop %rbx
	pop %rax
	imul %rbx, %rax  # multiply operation
	push %rax

	pop %rbx
	mov %rbx, %rsi  # 2nd argument to printf
	leaq s_string(%rip), %rdi  # 1st argument to printf
	xor %rax, %rax  # clear %rax for varargs calling convention
	call printf  # call printf
	push $10
	push $5
	pop %rbx
	pop %rax
	sub %rbx, %rax  # subtract operation
	push %rax

	push $3
	pop %rbx
	pop %rax
	cqo
	idiv %rbx  # divide operation
	push %rax

	pop %rbx
	mov %rbx, %rsi  # 2nd argument to printf
	leaq s_string(%rip), %rdi  # 1st argument to printf
	xor %rax, %rax  # clear %rax for varargs calling convention
	call printf  # call printf
	push $6
	push $2
	pop %rbx
	pop %rax
	imul %rbx, %rax  # multiply operation
	push %rax

	push $4
	pop %rbx
	pop %rax
	add %rbx, %rax  # add operation
	push %rax

	push $2
	pop %rbx
	pop %rax
	cqo
	idiv %rbx  # divide operation
	push %rax

	pop %rbx
	mov %rbx, %rsi  # 2nd argument to printf
	leaq s_string(%rip), %rdi  # 1st argument to printf
	xor %rax, %rax  # clear %rax for varargs calling convention
	call printf  # call printf
	push $1
	push $2
	push $3
	pop %rbx
	mov %rbx, %rsi  # 2nd argument to printf
	leaq s_string(%rip), %rdi  # 1st argument to printf
	xor %rax, %rax  # clear %rax for varargs calling convention
	call printf  # call printf
	pop %rbx
	mov %rbx, %rsi  # 2nd argument to printf
	leaq s_string(%rip), %rdi  # 1st argument to printf
	xor %rax, %rax  # clear %rax for varargs calling convention
	call printf  # call printf
	pop %rbx
	mov %rbx, %rsi  # 2nd argument to printf
	leaq s_string(%rip), %rdi  # 1st argument to printf
	xor %rax, %rax  # clear %rax for varargs calling convention
	call printf  # call printf
	push $10
	push $20
	push $30
	mov (%rsp), %rbx
	mov $3, %rsi  # 2nd argument to printf
	mov %rbx, %rdx  # 3nd argument to printf
	leaq s_dot_string(%rip), %rdi  # 1st argument to printf
	xor %rax, %rax  # clear %rax for varargs calling convention
	call printf  # call printf
	push $10
	push $20
	pop %rbx
	pop %rax
	add %rbx, %rax  # add operation
	push %rax

	mov (%rsp), %rbx
	mov $4, %rsi  # 2nd argument to printf
	mov %rbx, %rdx  # 3nd argument to printf
	leaq s_dot_string(%rip), %rdi  # 1st argument to printf
	xor %rax, %rax  # clear %rax for varargs calling convention
	call printf  # call printf
	pop %rbx
	mov %rbx, %rsi  # 2nd argument to printf
	leaq s_string(%rip), %rdi  # 1st argument to printf
	xor %rax, %rax  # clear %rax for varargs calling convention
	call printf  # call printf
	pop %rbx
	mov %rbx, %rsi  # 2nd argument to printf
	leaq s_string(%rip), %rdi  # 1st argument to printf
	xor %rax, %rax  # clear %rax for varargs calling convention
	call printf  # call printf
	pop %rbx
	mov %rbx, %rsi  # 2nd argument to printf
	leaq s_string(%rip), %rdi  # 1st argument to printf
	xor %rax, %rax  # clear %rax for varargs calling convention
	call printf  # call printf
	pop %rbx
	mov %rbx, %rsi  # 2nd argument to printf
	leaq s_string(%rip), %rdi  # 1st argument to printf
	xor %rax, %rax  # clear %rax for varargs calling convention
	call printf  # call printf
	push $0
	push $42
	pop %rbx
	pop %rax
	add %rbx, %rax  # add operation
	push %rax

	pop %rbx
	mov %rbx, %rsi  # 2nd argument to printf
	leaq s_string(%rip), %rdi  # 1st argument to printf
	xor %rax, %rax  # clear %rax for varargs calling convention
	call printf  # call printf
	push $100
	push $1
	pop %rbx
	pop %rax
	sub %rbx, %rax  # subtract operation
	push %rax

	push $1
	pop %rbx
	pop %rax
	sub %rbx, %rax  # subtract operation
	push %rax

	pop %rbx
	mov %rbx, %rsi  # 2nd argument to printf
	leaq s_string(%rip), %rdi  # 1st argument to printf
	xor %rax, %rax  # clear %rax for varargs calling convention
	call printf  # call printf
	push $1
	push $2
	pop %rbx
	pop %rax
	add %rbx, %rax  # add operation
	push %rax

	push $3
	pop %rbx
	pop %rax
	add %rbx, %rax  # add operation
	push %rax

	push $4
	pop %rbx
	pop %rax
	add %rbx, %rax  # add operation
	push %rax

	push $5
	pop %rbx
	pop %rax
	add %rbx, %rax  # add operation
	push %rax

	pop %rbx
	mov %rbx, %rsi  # 2nd argument to printf
	leaq s_string(%rip), %rdi  # 1st argument to printf
	xor %rax, %rax  # clear %rax for varargs calling convention
	call printf  # call printf

	add $0, %rsp  # fix the stack

	mov $0, %rax          # return 0 from main
	pop %rbp
	ret
