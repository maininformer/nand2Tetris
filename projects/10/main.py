from tokenizer import Tokenizer

DIRECTORY_NAME = 'Square'
FILE_NAME = 'Main'
SRC_SUFFIX = 'jack'
TOKENIZED_SUFFIX = 'xml'
COMPILE_PATH = './compiled/{0}/{1}T.{2}'.format(DIRECTORY_NAME, FILE_NAME, TOKENIZED_SUFFIX)
READ_PATH = '{0}/{1}.{2}'.format(DIRECTORY_NAME, FILE_NAME, SRC_SUFFIX)

if __name__ == '__main__':
    tokenizer = Tokenizer(READ_PATH)
    dest_file = open(COMPILE_PATH, 'wb')
    dest_file.write('<tokens>\n')
    while tokenizer.has_more_tokens:
        next_line='  '
        tokenizer.advance()
        token_type = tokenizer.token_type()
        if token_type == 'KEYWORD':
            next_line += '<keyword> {0} </keyword>'.format(tokenizer.keyword())
        elif token_type == 'SYMBOL':
            next_line += '<symbol> {0} </symbol>'.format(tokenizer.symbol())
        elif token_type == 'IDENTIFIER':
            next_line += '<identifier> {0} </identifier>'.format(tokenizer.identifier())
        elif token_type == 'INT_CONST':
            next_line += '<integerConstant> {0} </integerConstant>'.format(tokenizer.intVal())
        elif token_type == 'STRING_CONST':
            next_line += '<stringConstant> {0} </stringConstant>'.format(tokenizer.stringVal())
        if len(next_line.strip())>0:
            dest_file.write('{}\n'.format(next_line))

    dest_file.write('</tokens>')
    dest_file.close()

