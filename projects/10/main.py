from os import listdir

from tokenizer import Tokenizer
from compiler import Compiler

DIRECTORY_NAME = 'Square'
SRC_SUFFIX = 'jack'
TOKENIZED_SUFFIX = 'xml'

if __name__ == '__main__':
    READ_PATH = '{0}/'.format(DIRECTORY_NAME)
    files = [f for f in listdir(READ_PATH) if f.find('.jack') != -1]
    for f in files:
        COMPILE_PATH_1 = './compiled/{0}/{1}T.{2}'.format(DIRECTORY_NAME, f.split('.')[0], TOKENIZED_SUFFIX)
        tokenizer = Tokenizer('{0}/{1}'.format(READ_PATH, f))
        dest_file = open(COMPILE_PATH_1, 'wb')
        dest_file.write('<tokens>\n')
        tokenizer.advance()
        while tokenizer.has_more_tokens:
            next_line='  '
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

            tokenizer.advance()

        dest_file.write('</tokens>')
        dest_file.close()

    READ_PATH_2 = './compiled/{0}'.format(DIRECTORY_NAME)
    tokenized_files = [f for f in listdir(READ_PATH_2) if f.find('T.{}'.format(TOKENIZED_SUFFIX)) != -1]
    print(tokenized_files)
    for f in tokenized_files:
        COMPILE_PATH_1 = './compiled/{0}/{1}'.format(DIRECTORY_NAME, f)
        COMPILE_PATH_2 = './compiled/{0}/{1}.{2}'.format(DIRECTORY_NAME, f.split('T.')[0], TOKENIZED_SUFFIX)
        compiler = Compiler(COMPILE_PATH_1, COMPILE_PATH_2)
        compiler.compileClass()



