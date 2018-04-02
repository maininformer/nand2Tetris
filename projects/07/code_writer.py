class CodeWriter(object):
    def __init__(self, filename):
        self.file_object = open(filename, 'wb')
    def write_arithmetic(self, command):
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

                @SP  // decrease the stack pointe
                M=M-1

                A=M  // go to the next number
                D=D+M // add

                M=D  // put it back in the stack

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
