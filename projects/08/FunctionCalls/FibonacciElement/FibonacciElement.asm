
       @256
       D=A
       @SP
       M=D  // initialize the stack
       @Sys.init
       
        (Sys.init)
        
            //////////
            // PUSH //
            //////////
        
            @4
            D=A
                
            @SP  // get the stack
            A=M   // go to that address

            M=D   // save the value

            @SP
            M=M+1  // increase the stack pointer
        
        // save the return address
        @RETURN-ADDRESS // get the return address
        D=A  // save the address
        @SP  // get the stack address
        A=M  // go to the end of the stack
        M=D  // save the return address there
        @SP
        M=M+1 // increase the stack pointer

        // save the local address
        @LCL // get the local address
        D=M  // save the address
        @SP  // get the stack address
        A=M  // go to the end of the stack
        M=D  // save the address there
        @SP
        M=M+1 // increase the stack pointer

        // save the argument address
        @ARG // get the argument address
        D=M  // save the address
        @SP  // get the stack address
        A=M  // go to the end of the stack
        M=D  // save the address there
        @SP
        M=M+1 // increase the stack pointer

        // save the this address
        @THIS // get the this address
        D=M  // save the address
        @SP  // get the stack address
        A=M  // go to the end of the stack
        M=D  // save the address there
        @SP
        M=M+1 // increase the stack pointer

        // save the that address
        @THAT // get the that address
        D=M  // save the address
        @SP  // get the stack address
        A=M  // go to the end of the stack
        M=D  // save the address there
        @SP
        M=M+1 // increase the stack pointer

        // reposition the argument
        @SP
        D=M
        @ARG
        M=D
        @5
        D=A
        @ARG
        M=M-D
        @1
        D=A
        @ARG
        M=M-D

        // reposition the local
        @SP
        D=M
        @LCL
        M=D

        // go to the function
        @Main.fibonacci
        0;JMP

        (RETURN-ADDRESS)
        (WHILE)
        @WHILE    // load the label address and jump to it
        0;JMP
        
        (Main.fibonacci)
        
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
            @TRUE1
            D;JGT
            @SP  // return false
            A=M
            M=0
            @END1
            0;JMP

            (TRUE1)
              @SP  // return true
              A=M
              M=-1
              @END1
              0;JMP

            (END1)
              @SP
              M=M+1
            
       @SP    // get the stack
       M=M-1  // decrease the pointer
       A=M    // go to that address

       D=M    // save the value

       @IF_TRUE    // load the label address
       D;JNE  // jump if D is not equal to zero
       
        @IF_FALSE    // load the label address and jump to it
        0;JMP
        (IF_TRUE)
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
        
        @5
        D=A
        @LCL
        A=M-D // go to the return
        D=M   // save the return address in R13
        @R13
        M=D

        // put the top of the stack in arg 0 which will be the top of the stack for the caller
        @SP   // get the stack
        M=M-1 // decrease the stack pointer
        A=M   // go to that address

        D=M   // save the value

        @ARG // go to ARG
        A=M   // go to the saved address
        M=D   // put the stack value there

        @ARG
        D=M
        @SP
        M=D+1   // reposition the stack

        @LCL    // restore THAT
        A=M-1
        D=M
        @THAT
        M=D

        @2
        D=A
        @LCL    // restore THIS
        A=M-D
        D=M
        @THIS
        M=D

        @3
        D=A
        @LCL    // restore ARG
        A=M-D
        D=M
        @ARG
        M=D

        @4
        D=A
        @LCL    // restore LCL
        A=M-D
        D=M
        @LCL
        M=D

        @R13    // go to the saved RET
        A=M
        (IF_FALSE)
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
            
        // save the return address
        @RETURN-ADDRESS // get the return address
        D=A  // save the address
        @SP  // get the stack address
        A=M  // go to the end of the stack
        M=D  // save the return address there
        @SP
        M=M+1 // increase the stack pointer

        // save the local address
        @LCL // get the local address
        D=M  // save the address
        @SP  // get the stack address
        A=M  // go to the end of the stack
        M=D  // save the address there
        @SP
        M=M+1 // increase the stack pointer

        // save the argument address
        @ARG // get the argument address
        D=M  // save the address
        @SP  // get the stack address
        A=M  // go to the end of the stack
        M=D  // save the address there
        @SP
        M=M+1 // increase the stack pointer

        // save the this address
        @THIS // get the this address
        D=M  // save the address
        @SP  // get the stack address
        A=M  // go to the end of the stack
        M=D  // save the address there
        @SP
        M=M+1 // increase the stack pointer

        // save the that address
        @THAT // get the that address
        D=M  // save the address
        @SP  // get the stack address
        A=M  // go to the end of the stack
        M=D  // save the address there
        @SP
        M=M+1 // increase the stack pointer

        // reposition the argument
        @SP
        D=M
        @ARG
        M=D
        @5
        D=A
        @ARG
        M=M-D
        @1
        D=A
        @ARG
        M=M-D

        // reposition the local
        @SP
        D=M
        @LCL
        M=D

        // go to the function
        @Main.fibonacci
        0;JMP

        (RETURN-ADDRESS)
        
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
            
        // save the return address
        @RETURN-ADDRESS // get the return address
        D=A  // save the address
        @SP  // get the stack address
        A=M  // go to the end of the stack
        M=D  // save the return address there
        @SP
        M=M+1 // increase the stack pointer

        // save the local address
        @LCL // get the local address
        D=M  // save the address
        @SP  // get the stack address
        A=M  // go to the end of the stack
        M=D  // save the address there
        @SP
        M=M+1 // increase the stack pointer

        // save the argument address
        @ARG // get the argument address
        D=M  // save the address
        @SP  // get the stack address
        A=M  // go to the end of the stack
        M=D  // save the address there
        @SP
        M=M+1 // increase the stack pointer

        // save the this address
        @THIS // get the this address
        D=M  // save the address
        @SP  // get the stack address
        A=M  // go to the end of the stack
        M=D  // save the address there
        @SP
        M=M+1 // increase the stack pointer

        // save the that address
        @THAT // get the that address
        D=M  // save the address
        @SP  // get the stack address
        A=M  // go to the end of the stack
        M=D  // save the address there
        @SP
        M=M+1 // increase the stack pointer

        // reposition the argument
        @SP
        D=M
        @ARG
        M=D
        @5
        D=A
        @ARG
        M=M-D
        @1
        D=A
        @ARG
        M=M-D

        // reposition the local
        @SP
        D=M
        @LCL
        M=D

        // go to the function
        @Main.fibonacci
        0;JMP

        (RETURN-ADDRESS)
        
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
            
        @5
        D=A
        @LCL
        A=M-D // go to the return
        D=M   // save the return address in R13
        @R13
        M=D

        // put the top of the stack in arg 0 which will be the top of the stack for the caller
        @SP   // get the stack
        M=M-1 // decrease the stack pointer
        A=M   // go to that address

        D=M   // save the value

        @ARG // go to ARG
        A=M   // go to the saved address
        M=D   // put the stack value there

        @ARG
        D=M
        @SP
        M=D+1   // reposition the stack

        @LCL    // restore THAT
        A=M-1
        D=M
        @THAT
        M=D

        @2
        D=A
        @LCL    // restore THIS
        A=M-D
        D=M
        @THIS
        M=D

        @3
        D=A
        @LCL    // restore ARG
        A=M-D
        D=M
        @ARG
        M=D

        @4
        D=A
        @LCL    // restore LCL
        A=M-D
        D=M
        @LCL
        M=D

        @R13    // go to the saved RET
        A=M
        
            (INFINITE_LOOP)
              @INFINITE_LOOP
              0;JMP