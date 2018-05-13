
       @256
       D=A
       @SP
       M=D  // initialize the stack
       
        // save the return address
        @RETURN-ADDRESS1 // // get the return address RETURN-ADDRESS1
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
        @0
        D=A
        @ARG
        M=M-D

        // reposition the local
        @SP
        D=M
        @LCL
        M=D

        // go to the function
        @Sys.init
        0;JMP

        (RETURN-ADDRESS1)
        
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
        0;JMP
        
        (Sys.init)
        
            //////////
            // PUSH //
            //////////
        
            @4000
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

            @THIS
            M=D   // put the stack value there
            
            //////////
            // PUSH //
            //////////
        
            @5000
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

            @THAT
            M=D   // put the stack value there
            
        // save the return address
        @RETURN-ADDRESS2 // // get the return address RETURN-ADDRESS2
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
        @0
        D=A
        @ARG
        M=M-D

        // reposition the local
        @SP
        D=M
        @LCL
        M=D

        // go to the function
        @Sys.main
        0;JMP

        (RETURN-ADDRESS2)
        
            ///////
            //POP//
            ///////
            
            @SP   // get the stack
            M=M-1 // decreas the stack pointer
            A=M   // go to that address

            D=M   // save the value

            @R6
            M=D   // put the stack value there
            (Sys.init$LOOP)
        @Sys.init$LOOP    // load the label address and jump to it
        0;JMP
        
        (Sys.main)
        
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
        
            //////////
            // PUSH //
            //////////
        
            @4001
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

            @THIS
            M=D   // put the stack value there
            
            //////////
            // PUSH //
            //////////
        
            @5001
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

            @THAT
            M=D   // put the stack value there
            
            //////////
            // PUSH //
            //////////
        
            @200
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
            @LCL  // get the memory
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
        
            @40
            D=A
                
            @SP  // get the stack
            A=M   // go to that address

            M=D   // save the value

            @SP
            M=M+1  // increase the stack pointer
        
            ///////
            //POP//
            ///////
            
            @2  // get the offset
            D=A
            @LCL  // get the memory
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
        
            @6
            D=A
                
            @SP  // get the stack
            A=M   // go to that address

            M=D   // save the value

            @SP
            M=M+1  // increase the stack pointer
        
            ///////
            //POP//
            ///////
            
            @3  // get the offset
            D=A
            @LCL  // get the memory
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
        
            @123
            D=A
                
            @SP  // get the stack
            A=M   // go to that address

            M=D   // save the value

            @SP
            M=M+1  // increase the stack pointer
        
        // save the return address
        @RETURN-ADDRESS3 // // get the return address RETURN-ADDRESS3
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
        @Sys.add12
        0;JMP

        (RETURN-ADDRESS3)
        
            ///////
            //POP//
            ///////
            
            @SP   // get the stack
            M=M-1 // decreas the stack pointer
            A=M   // go to that address

            D=M   // save the value

            @R5
            M=D   // put the stack value there
            
            //////////
            // PUSH //
            //////////
        
            @0  // get the offset
            D=A
            @LCL  // get the memory
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
            @LCL  // get the memory
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
        
            @2  // get the offset
            D=A
            @LCL  // get the memory
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
        
            @3  // get the offset
            D=A
            @LCL  // get the memory
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
        
            @4  // get the offset
            D=A
            @LCL  // get the memory
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
        0;JMP
        
        (Sys.add12)
        
            //////////
            // PUSH //
            //////////
        
            @4002
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

            @THIS
            M=D   // put the stack value there
            
            //////////
            // PUSH //
            //////////
        
            @5002
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
        
            @12
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
        0;JMP
        
            (INFINITE_LOOP)
              @INFINITE_LOOP
              0;JMP