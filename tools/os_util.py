import os
import os.path as path
import subprocess

from typing import List

CWD = os.getcwd()
OUT_DIR = path.join(CWD, 'out')

def run(args: List[str]):
    print(args)
    result = subprocess.run(args)
    if result.returncode != 0:
        raise Exception('upstream process failed!')
    return result

def run_s(str: List[str]):
    print(str)
    result = os.system(str)
    if result != 0:
        raise Exception('upstream process failed!')
    return result

def clean():
    run(['rm', '-rf', OUT_DIR])

def mkdir(p):
    run(['mkdir', '-p', p])

def overwrite_whole_file(file_path: str, content: str):
    with open(file_path, 'w') as f:
        f.write(content)
