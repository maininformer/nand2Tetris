
            //////////
            // PUSH //
            //////////
        
            @111
            D=A
                
            @SP  // get the stack
            A=M   // go to that address

            M=D   // save the value

            @SP
            M=M+1  // increase the stack pointer
        
            //////////
            // PUSH //
            //////////
        
            @333
            D=A
                
            @SP  // get the stack
            A=M   // go to that address

            M=D   // save the value

            @SP
            M=M+1  // increase the stack pointer
        
            //////////
            // PUSH //
            //////////
        
            @888
            D=A
                
            @SP  // get the stack
            A=M   // go to that address

            M=D   // save the value

            @SP
            M=M+1  // increase the stack pointer
        
            ///////
            //POP//
            ///////
            
            @SP   // get the stack
            M=M-1 // decreas the stack pointer
            A=M   // go to that address

            D=M   // save the value

            @24
            M=D   // put the stack value there
            
            ///////
            //POP//
            ///////
            
            @SP   // get the stack
            M=M-1 // decreas the stack pointer
            A=M   // go to that address

            D=M   // save the value

            @19
            M=D   // put the stack value there
            
            ///////
            //POP//
            ///////
            
            @SP   // get the stack
            M=M-1 // decreas the stack pointer
            A=M   // go to that address

            D=M   // save the value

            @17
            M=D   // put the stack value there
            
            //////////
            // PUSH //
            //////////
        
            @19
            D=M
            
            @SP  // get the stack
            A=M   // go to that address

            M=D   // save the value

            @SP
            M=M+1  // increase the stack pointer
        
            //////////
            // PUSH //
            //////////
        
            @17
            D=M
            
            @SP  // get the stack
            A=M   // go to that address

            M=D   // save the value

            @SP
            M=M+1  // increase the stack pointer
        
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
            
            //////////
            // PUSH //
            //////////
        
            @24
            D=M
            
            @SP  // get the stack
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

            @SP  // decrease the stack pointer
            M=M-1

            A=M  // go to the next number
            D=D+M // add

            M=D  // put it back in the stack

            @SP
            M=M+1
            
            (INFINITE_LOOP)
              @INFINITE_LOOP
              0;JMP