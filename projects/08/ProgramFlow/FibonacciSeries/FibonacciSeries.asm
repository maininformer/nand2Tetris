
            //////////
            // PUSH //
            //////////
        
            @1  // get the offset
            D=A
            @ARG  // get the memory
            A=M+D // go to the index
            D=M   // get the value
                
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

            @THAT
            M=D   // put the stack value there
            
            //////////
            // PUSH //
            //////////
        
            @0
            D=A
                
            @SP  // get the stack
            A=M   // go to that address

            M=D   // save the value

            @SP
            M=M+1  // increase the stack pointer
        
            ///////
            //POP//
            ///////
            
            @0  // get the offset
            D=A
            @THAT  // get the memory
            D=M+D // save the address

            @R13
            M=D   // put the address in a general register

            @SP   // get the stack
            M=M-1 // decreas the stack pointer
            A=M   // go to that address

            D=M   // save the value

            @R13
            A=M   // go to the saved address
            M=D   // put the stack value there
            
            //////////
            // PUSH //
            //////////
        
            @1
            D=A
                
            @SP  // get the stack
            A=M   // go to that address

            M=D   // save the value

            @SP
            M=M+1  // increase the stack pointer
        
            ///////
            //POP//
            ///////
            
            @1  // get the offset
            D=A
            @THAT  // get the memory
            D=M+D // save the address

            @R13
            M=D   // put the address in a general register

            @SP   // get the stack
            M=M-1 // decreas the stack pointer
            A=M   // go to that address

            D=M   // save the value

            @R13
            A=M   // go to the saved address
            M=D   // put the stack value there
            
            //////////
            // PUSH //
            //////////
        
            @0  // get the offset
            D=A
            @ARG  // get the memory
            A=M+D // go to the index
            D=M   // get the value
                
            @SP  // get the stack
            A=M   // go to that address

            M=D   // save the value

            @SP
            M=M+1  // increase the stack pointer
        
            //////////
            // PUSH //
            //////////
        
            @2
            D=A
                
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
            
            ///////
            //POP//
            ///////
            
            @0  // get the offset
            D=A
            @ARG  // get the memory
            D=M+D // save the address

            @R13
            M=D   // put the address in a general register

            @SP   // get the stack
            M=M-1 // decreas the stack pointer
            A=M   // go to that address

            D=M   // save the value

            @R13
            A=M   // go to the saved address
            M=D   // put the stack value there
            (MAIN_LOOP_START)
            //////////
            // PUSH //
            //////////
        
            @0  // get the offset
            D=A
            @ARG  // get the memory
            A=M+D // go to the index
            D=M   // get the value
                
            @SP  // get the stack
            A=M   // go to that address

            M=D   // save the value

            @SP
            M=M+1  // increase the stack pointer
        
       @SP    // get the stack
       M=M-1  // decrease the pointer
       A=M    // go to that address

       D=M    // save the value

       @COMPUTE_ELEMENT    // load the label address
       D;JNE  // jump if D is not equal to zero
       
        @END_PROGRAM    // load the label address and jump to it
        0;JMP
        (COMPUTE_ELEMENT)
            //////////
            // PUSH //
            //////////
        
            @0  // get the offset
            D=A
            @THAT  // get the memory
            A=M+D // go to the index
            D=M   // get the value
                
            @SP  // get the stack
            A=M   // go to that address

            M=D   // save the value

            @SP
            M=M+1  // increase the stack pointer
        
            //////////
            // PUSH //
            //////////
        
            @1  // get the offset
            D=A
            @THAT  // get the memory
            A=M+D // go to the index
            D=M   // get the value
                
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
            
            ///////
            //POP//
            ///////
            
            @2  // get the offset
            D=A
            @THAT  // get the memory
            D=M+D // save the address

            @R13
            M=D   // put the address in a general register

            @SP   // get the stack
            M=M-1 // decreas the stack pointer
            A=M   // go to that address

            D=M   // save the value

            @R13
            A=M   // go to the saved address
            M=D   // put the stack value there
            
            @THAT
            D=M
            
            @SP  // get the stack
            A=M   // go to that address

            M=D   // save the value

            @SP
            M=M+1  // increase the stack pointer
        
            //////////
            // PUSH //
            //////////
        
            @1
            D=A
                
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
            
            ///////
            //POP//
            ///////
            
            @SP   // get the stack
            M=M-1 // decreas the stack pointer
            A=M   // go to that address

            D=M   // save the value

            @THAT
            M=D   // put the stack value there
            
            //////////
            // PUSH //
            //////////
        
            @0  // get the offset
            D=A
            @ARG  // get the memory
            A=M+D // go to the index
            D=M   // get the value
                
            @SP  // get the stack
            A=M   // go to that address

            M=D   // save the value

            @SP
            M=M+1  // increase the stack pointer
        
            //////////
            // PUSH //
            //////////
        
            @1
            D=A
                
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
            
            ///////
            //POP//
            ///////
            
            @0  // get the offset
            D=A
            @ARG  // get the memory
            D=M+D // save the address

            @R13
            M=D   // put the address in a general register

            @SP   // get the stack
            M=M-1 // decreas the stack pointer
            A=M   // go to that address

            D=M   // save the value

            @R13
            A=M   // go to the saved address
            M=D   // put the stack value there
            
        @MAIN_LOOP_START    // load the label address and jump to it
        0;JMP
        (END_PROGRAM)
            (INFINITE_LOOP)
              @INFINITE_LOOP
              0;JMP