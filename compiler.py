#!/usr/bin/python3

import sys
import os
import subprocess

from src.generator_parser import generate_as


def compile(program_file_path, build_dir="./build"):
    program_file = open(program_file_path, "rb")

    base_file_name = program_file_path.split("/")[-1].split(".")[0]
    as_file_path = os.path.join(build_dir, base_file_name + ".s")
    generate_as(program_file, as_file_path)

    obj_file_path = os.path.join(build_dir, base_file_name + ".o")
    print(subprocess.run(
        ["as", "--64", "-o", obj_file_path, as_file_path],
        capture_output=True
    ))
    print(subprocess.run(
        # ["gcc", "-c", "src/print.c", "-o", "build/print.o"],
        ["gcc", f"build/{base_file_name}.o", "-o", base_file_name],
        capture_output=True
    ))


if __name__ == "__main__":
    compile(sys.argv[1])