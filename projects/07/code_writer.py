class CodeWriter(object):
    def __init__(self, filename):
        self.file_object = open(filename, 'wb')
        self.counter = 0

    def write_arithmetic(self, command):
        assembly = ''
        self.counter += 1
        if command == 'add':
            assembly = """
            ///////
            //ADD//
            //////
            @SP  // get the stack
            M=M-1 // the current stack position is empty
            A=M  // go to the top of the stack

            D=M  // save that number

            // I decided not to clean up the stack to zero
            // cause I don't think that is necessary

            @SP  // decrease the stack pointer
            M=M-1

            A=M  // go to the next number
            D=D+M // add

            M=D  // put it back in the stack

            @SP
            M=M+1
            """
        if command == 'sub':
            assembly = """
            ///////
            //SUB//
            //////
            @SP  // get the stack
            M=M-1 // the current stack position is empty
            A=M  // go to the top of the stack

            D=-M  // save that number

            // I decided not to clean up the stack to zero
            // cause I don't think that is necessary

            @SP  // decrease the stack pointer
            M=M-1

            A=M  // go to the next number
            D=D+M // add

            M=D  // put it back in the stack

            @SP
            M=M+1
            """
        if command == 'neg':
            assembly = """
            ///////
            //NEG//
            //////
            @SP  // get the stack
            M=M-1 // the current stack position is empty
            A=M  // go to the top of the stack

            M=-M  // save that number

            @SP
            M=M+1
            """
        if command == 'eq':
            assembly = """
            ///////
            //EQ//
            //////
            @SP  // get the stack
            M=M-1 // the current stack position is empty
            A=M  // go to the top of the stack

            D=M  // save that number

            // I decided not to clean up the stack to zero
            // cause I don't think that is necessary

            @SP  // decrease the stack pointer
            M=M-1
            A=M  // go to the next number

            D=D-M
            @TRUE{0}
            D;JEQ
            @SP  // return false
            A=M
            M=0
            @END{0}
            0;JMP

            (TRUE{0})
              @SP  // return true
              A=M
              M=-1
              @END{0}
              0;JMP

            (END{0})
              @SP
              M=M+1
            """.format(self.counter)
        if command == 'gt':
            assembly = """
            ///////
            //GT//
            //////
            @SP  // get the stack
            M=M-1 // the current stack position is empty
            A=M  // go to the top of the stack

            D=M  // save that number

            // I decided not to clean up the stack to zero
            // cause I don't think that is necessary

            @SP  // decrease the stack pointer
            M=M-1
            A=M  // go to the next number

            D=D-M
            @TRUE{0}
            D;JLT
            @SP  // return false
            A=M
            M=0
            @END{0}
            0;JMP

            (TRUE{0})
              @SP  // return true
              A=M
              M=-1
              @END{0}
              0;JMP

            (END{0})
              @SP
              M=M+1
            """.format(self.counter)
        if command == 'lt':
            assembly = """
            ///////
            //LT//
            //////
            @SP  // get the stack
            M=M-1 // the current stack position is empty
            A=M  // go to the top of the stack

            D=M  // save that number

            // I decided not to clean up the stack to zero
            // cause I don't think that is necessary

            @SP  // decrease the stack pointer
            M=M-1
            A=M  // go to the next number

            D=D-M
            @TRUE{0}
            D;JGT
            @SP  // return false
            A=M
            M=0
            @END{0}
            0;JMP

            (TRUE{0})
              @SP  // return true
              A=M
              M=-1
              @END{0}
              0;JMP

            (END{0})
              @SP
              M=M+1
            """.format(self.counter)
        if command == 'and':
            assembly = """
            ///////
            //AND//
            //////
            @SP  // get the stack
            M=M-1 // the current stack position is empty
            A=M  // go to the top of the stack

            D=M  // save that number

            // I decided not to clean up the stack to zero
            // cause I don't think that is necessary

            @SP  // decrease the stack pointer
            M=M-1

            A=M  // go to the next number
            D=D&M

            M=D  // put it back in the stack

            @SP
            M=M+1
            """
        if command == 'or':
            assembly = """
            ///////
            //OR//
            //////
            @SP  // get the stack
            M=M-1 // the current stack position is empty
            A=M  // go to the top of the stack

            D=M  // save that number

            // I decided not to clean up the stack to zero
            // cause I don't think that is necessary

            @SP  // decrease the stack pointer
            M=M-1

            A=M  // go to the next number
            D=D|M

            M=D  // put it back in the stack

            @SP
            M=M+1
            """
        if command == 'not':
            assembly = """
            ///////
            //NOT//
            //////
            @SP  // get the stack
            M=M-1 // the current stack position is empty
            A=M  // go to the top of the stack

            M=!M  // save that number

            @SP
            M=M+1
            """

        self.file_object.write(assembly)


    def write_push_pop(self, command, segment, index):
        SEGMENT_MAPPING = {
            'constant': 'SP'
        }
        assembly = ''
        if command == 'C_PUSH':
            assembly= """
            //////////
            // PUSH //
            //////////
            @{0} // get the number to be pushed
            D=A  // save it

            @{1}  // get the memory base pointer
            A=M   // go to that address

            M=D   // save the value

            @{1}
            M=M+1  // increase the stack pointer
        """.format(index, SEGMENT_MAPPING[segment])

        self.file_object.write(assembly)

    def close(self):
        self.file_object.write("""
            (INFINITE_LOOP)
              @INFINITE_LOOP
              0;JMP""")
        self.file_object.close()
