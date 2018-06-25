from tokenizer import Tokenizer

DIRECTORY_NAME = 'Square'
FILE_NAME = 'Main'
SRC_SUFFIX = 'jack'
COMPILE_PATH = './compiled/{}'.format(DIRECTORY_NAME)
READ_PATH = '{0}/{1}.{2}'.format(DIRECTORY_NAME, FILE_NAME, SRC_SUFFIX)
TOKENIZED_SUFFIX = 'xml'

tokenizer = Tokenizer(READ_PATH)
while tokenizer.has_more_tokens:
    pass



