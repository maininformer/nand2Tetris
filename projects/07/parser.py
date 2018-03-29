class Parser(object):
    def __init__(self, filename):
        self.file_object = open(filename, 'rb')
        self.current_line = self.file_object.next()

    def has_more_lines(self):
        try:
            # probe the next line, and reset if
            # there is one
            last_pos = self.file_object.tell()
            self.file_object.readline()
            self.file_object.seek(last_post)
            return True
        except StopIteration:
            return False

    def advance(self):
        self.current_line = self.file_object.readline()
    def command_type(self):
        pass
    def arg_1(self):
        pass
    def arg_2(self):
        pass
