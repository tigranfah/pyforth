from src.scanner import get_next_token


def is_valid_token(token: str):
    return token.isdigit() or token in [".", ".s", "+", "-", "*", "/"]


def parse_and_generate_code(file):
    generated_code = ""

    num_stack_elems = 0
    inst_count = 0
    while True:
        token = get_next_token(file)
        inst_count += 1
        print(f"Nest token {token}")
        if token is None:
            break

        if not is_valid_token(token):
            raise Exception(f"Error: Invalid token: {token} ({inst_count}).")

        if token.isdigit():
            digit = int(token)
            generated_code += f"\tpush ${digit}\n"
            num_stack_elems += 1 # increment stack count
        elif token in ["+", "-", "*", "/"]:
            if num_stack_elems < 2:
                raise Exception("Error: Insufficient number of operands for binary operation.")

            generated_code += "\tpop %rbx\n"
            generated_code += "\tpop %rax\n"
            
            if token == "+":
                generated_code += "\tadd %rbx, %rax  # add operation\n"
            elif token == "-":
                generated_code += "\tsub %rbx, %rax  # subtract operation\n"
            elif token == "*":
                generated_code += "\timul %rbx, %rax  # multiply operation\n"
            elif token == "/":
                generated_code += "\tcqo\n"\
                                "\tidiv %rbx  # divide operation\n"

            generated_code += "\tpush %rax\n\n"
            num_stack_elems -= 1 # decrement stack count
        elif token == ".s":
            generated_code += "\tmov (%rsp), %rbx\n" \
                            f"\tmov ${num_stack_elems}, %rsi  # 2nd argument to printf\n"

            if num_stack_elems > 0:
                generated_code += "\tmov %rbx, %rdx  # 3nd argument to printf\n"
                format_str = "s_dot_string"
            else:
                format_str = "s_dot_string0"
            
            generated_code += f"\tleaq {format_str}(%rip), %rdi  # 1st argument to printf\n" \
                            "\txor %rax, %rax  # clear %rax for varargs calling convention\n" \
                            "\tcall printf  # call printf\n"
        elif token == ".":
            if num_stack_elems < 1:
                raise Exception(f"Error: Cannot pop from empty stack.")
            generated_code += "\tpop %rbx\n" \
                            "\tmov %rbx, %rsi  # 2nd argument to printf\n" \
                            "\tleaq s_string(%rip), %rdi  # 1st argument to printf\n" \
                            "\txor %rax, %rax  # clear %rax for varargs calling convention\n" \
                            "\tcall printf  # call printf\n"
            num_stack_elems -= 1 # decrement stack count


    generated_code += f"\n\tadd ${num_stack_elems * 8}, %rsp  # fix the stack\n\n"

    return generated_code


def generate_as(file, as_file_name: str):
    generated_code = ".section .data\n" \
                    "s_dot_string0:\n" \
                    '    .string "<%d>\\n"   # format string for printf\n\n' \
                    "s_dot_string:\n" \
                    '    .string "<%d> %d\\n"   # format string for printf\n\n' \
                    "s_string:\n" \
                    '    .string "%d\\n"   # format string for printf\n\n' \
                    ".section .text\n" \
                    "\t.globl main\n" \
                    "\t.extern printf\n\n" \
                    "main:\n" \
                    "\tpush %rbp\n"

    generated_code += parse_and_generate_code(file)

    generated_code += "\tmov $0, %rax          # return 0 from main\n" \
                    "\tpop %rbp\n" \
                    "\tret\n"

    as_file = open(as_file_name, "w")
    as_file.write(generated_code)