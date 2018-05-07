from os import listdir
from parser import Parser
from code_writer import CodeWriter

# TODO: make this command line arguments
FILENAME='FibonacciElement'
BASE = '/Users/plum/Desktop/codes/nand2tetris/projects/08/FunctionCalls/FibonacciElement/'
READ_ADDRESS = '{0}'.format(BASE)
WRITE_ADDRESS = '{0}{1}.asm'.format(BASE, FILENAME)

if __name__ == '__main__':
    c = CodeWriter(WRITE_ADDRESS)

    files = [f for f in listdir(READ_ADDRESS) if f.find('.vm') != -1]
    sys_init = files.index('Sys.vm')
    main = files.index('Main.vm')
    c.write_init()
    for filename in [files[sys_init], files[main]]: #  order matters
        # only parse .vm files
        if filename.find('.vm') != -1:
            p = Parser(BASE + filename)
            while p.has_more_lines():
                p.advance()
                command = p.command_type()
                arg_1 = p.arg_1()
                arg_2 = p.arg_2()
                if command in ['C_PUSH', 'C_POP']:
                    c.write_push_pop(command, arg_1, arg_2)

                if command == 'C_ARITHMETIC':
                    c.write_arithmetic(arg_1)

                if command == 'C_GOTO':
                    c.write_goto(arg_1)

                if command == 'C_IF':
                    c.write_if(arg_1)

                if command == 'C_LABEL':
                    c.write_label(arg_1)

                if command == 'C_FUNCTION':
                    c.write_function(arg_1, arg_2)

                if command == 'C_RETURN':
                    c.write_return()

                if command == 'C_CALL':
                    c.write_call(arg_1, arg_2)

    c.close()


