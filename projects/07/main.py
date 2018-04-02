from pdb import set_trace as br
from parser import Parser
from code_writer import CodeWriter

FILENAME = 'SimpleAdd'
BASE = '/Users/plum/Desktop/nand2tetris/projects/07/StackArithmetic/SimpleAdd/'
READ_ADDRESS = '{0}{1}.vm'.format(BASE, FILENAME)
WRITE_ADDRESS = '{0}{1}.asm'.format(BASE, FILENAME)

if __name__ == '__main__':
    p = Parser(READ_ADDRESS)
    c = CodeWriter(WRITE_ADDRESS)
    while p.has_more_lines():
        p.advance()
        command = p.command_type()
        arg_1 = p.arg_1()
        arg_2 = p.arg_2()
        if command in ['C_PUSH', 'C_POP']:
            c.write_push_pop(command, arg_1, arg_2)

        if command == 'C_ARITHMETIC':
            c.write_arithmetic(arg_1)

    c.close()


