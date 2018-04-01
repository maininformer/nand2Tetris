class CodeWriter(object):
    def __init__(self, filename):
        self.file_object = open(filename, 'wb')
    def write_artithmetic(self, command):
        pass
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

