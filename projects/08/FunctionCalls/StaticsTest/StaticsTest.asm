
       @256
       D=A
       @SP
       M=D  // initialize the stack
       

        // CALLING Sys.init WITH 0 ARGUMENTS
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
        
        // RETURNING
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
        
            @6
            D=A
                
            @SP  // get the stack
            A=M   // go to that address

            M=D   // save the value

            @SP
            M=M+1  // increase the stack pointer
        
            //////////
            // PUSH //
            //////////
        
            @8
            D=A
                
            @SP  // get the stack
            A=M   // go to that address

            M=D   // save the value

            @SP
            M=M+1  // increase the stack pointer
        

        // CALLING Class1.set WITH 2 ARGUMENTS
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
        @2
        D=A
        @ARG
        M=M-D

        // reposition the local
        @SP
        D=M
        @LCL
        M=D

        // go to the function
        @Class1.set
        0;JMP

        (RETURN-ADDRESS2)
        
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
        
            @23
            D=A
                
            @SP  // get the stack
            A=M   // go to that address

            M=D   // save the value

            @SP
            M=M+1  // increase the stack pointer
        
            //////////
            // PUSH //
            //////////
        
            @15
            D=A
                
            @SP  // get the stack
            A=M   // go to that address

            M=D   // save the value

            @SP
            M=M+1  // increase the stack pointer
        

        // CALLING Class2.set WITH 2 ARGUMENTS
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
        @2
        D=A
        @ARG
        M=M-D

        // reposition the local
        @SP
        D=M
        @LCL
        M=D

        // go to the function
        @Class2.set
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
            

        // CALLING Class1.get WITH 0 ARGUMENTS
        @RETURN-ADDRESS4 // // get the return address RETURN-ADDRESS4
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
        @Class1.get
        0;JMP

        (RETURN-ADDRESS4)
        

        // CALLING Class2.get WITH 0 ARGUMENTS
        @RETURN-ADDRESS5 // // get the return address RETURN-ADDRESS5
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
        @Class2.get
        0;JMP

        (RETURN-ADDRESS5)
        (Sys.init$WHILE)
        @Sys.init$WHILE    // load the label address and jump to it
        0;JMP
        
        (Class1.set)
        
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
        
            @SP   // get the stack
            M=M-1 // decrease the stack pointer
            A=M   // go to that address

            D=M   // save the value

            @Class1.vm$0
            M=D   // put the stack value there
            
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
        
            @SP   // get the stack
            M=M-1 // decrease the stack pointer
            A=M   // go to that address

            D=M   // save the value

            @Class1.vm$1
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
        
        // RETURNING
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
        
        (Class1.get)
        
            @Class1.vm$0
            D=M

            @SP  // get the stack
            A=M   // go to that address

            M=D   // save the value

            @SP
            M=M+1  // increase the stack pointer
            
            @Class1.vm$1
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
            
        // RETURNING
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
        
        (Class2.set)
        
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
        
            @SP   // get the stack
            M=M-1 // decrease the stack pointer
            A=M   // go to that address

            D=M   // save the value

            @Class2.vm$0
            M=D   // put the stack value there
            
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
        
            @SP   // get the stack
            M=M-1 // decrease the stack pointer
            A=M   // go to that address

            D=M   // save the value

            @Class2.vm$1
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
        
        // RETURNING
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
        
        (Class2.get)
        
            @Class2.vm$0
            D=M

            @SP  // get the stack
            A=M   // go to that address

            M=D   // save the value

            @SP
            M=M+1  // increase the stack pointer
            
            @Class2.vm$1
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
            
        // RETURNING
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