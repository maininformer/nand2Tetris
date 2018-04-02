
            //////////
            // PUSH //
            //////////
            @7 // get the number to be pushed
            D=A  // save it

            @SP  // get the memory base pointer
            A=M   // go to that address

            M=D   // save the value

            @SP
            M=M+1  // increase the stack pointer
 
            //////////
            // PUSH //
            //////////
            @8 // get the number to be pushed
            D=A  // save it

            @SP  // get the memory base pointer
            A=M   // go to that address

            M=D   // save the value

            @SP
            M=M+1  // increase the stack pointer
 
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
            
            (INFINITE_LOOP)
              @INFINITE_LOOP
              0;JMP