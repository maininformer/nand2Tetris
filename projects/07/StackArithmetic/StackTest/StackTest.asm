
            //////////
            // PUSH //
            //////////
            @17 // get the number to be pushed
            D=A  // save it

            @SP  // get the memory base pointer
            A=M   // go to that address

            M=D   // save the value

            @SP
            M=M+1  // increase the stack pointer
        
            //////////
            // PUSH //
            //////////
            @17 // get the number to be pushed
            D=A  // save it

            @SP  // get the memory base pointer
            A=M   // go to that address

            M=D   // save the value

            @SP
            M=M+1  // increase the stack pointer
        
            ///////
            //EQ//
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
            D;JEQ
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
            
            //////////
            // PUSH //
            //////////
            @17 // get the number to be pushed
            D=A  // save it

            @SP  // get the memory base pointer
            A=M   // go to that address

            M=D   // save the value

            @SP
            M=M+1  // increase the stack pointer
        
            //////////
            // PUSH //
            //////////
            @16 // get the number to be pushed
            D=A  // save it

            @SP  // get the memory base pointer
            A=M   // go to that address

            M=D   // save the value

            @SP
            M=M+1  // increase the stack pointer
        
            ///////
            //EQ//
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
            @TRUE2
            D;JEQ
            @SP  // return false
            A=M
            M=0
            @END2
            0;JMP

            (TRUE2)
              @SP  // return true
              A=M
              M=-1
              @END2
              0;JMP

            (END2)
              @SP
              M=M+1
            
            //////////
            // PUSH //
            //////////
            @16 // get the number to be pushed
            D=A  // save it

            @SP  // get the memory base pointer
            A=M   // go to that address

            M=D   // save the value

            @SP
            M=M+1  // increase the stack pointer
        
            //////////
            // PUSH //
            //////////
            @17 // get the number to be pushed
            D=A  // save it

            @SP  // get the memory base pointer
            A=M   // go to that address

            M=D   // save the value

            @SP
            M=M+1  // increase the stack pointer
        
            ///////
            //EQ//
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
            @TRUE3
            D;JEQ
            @SP  // return false
            A=M
            M=0
            @END3
            0;JMP

            (TRUE3)
              @SP  // return true
              A=M
              M=-1
              @END3
              0;JMP

            (END3)
              @SP
              M=M+1
            
            //////////
            // PUSH //
            //////////
            @892 // get the number to be pushed
            D=A  // save it

            @SP  // get the memory base pointer
            A=M   // go to that address

            M=D   // save the value

            @SP
            M=M+1  // increase the stack pointer
        
            //////////
            // PUSH //
            //////////
            @891 // get the number to be pushed
            D=A  // save it

            @SP  // get the memory base pointer
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
            @TRUE4
            D;JGT
            @SP  // return false
            A=M
            M=0
            @END4
            0;JMP

            (TRUE4)
              @SP  // return true
              A=M
              M=-1
              @END4
              0;JMP

            (END4)
              @SP
              M=M+1
            
            //////////
            // PUSH //
            //////////
            @891 // get the number to be pushed
            D=A  // save it

            @SP  // get the memory base pointer
            A=M   // go to that address

            M=D   // save the value

            @SP
            M=M+1  // increase the stack pointer
        
            //////////
            // PUSH //
            //////////
            @892 // get the number to be pushed
            D=A  // save it

            @SP  // get the memory base pointer
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
            @TRUE5
            D;JGT
            @SP  // return false
            A=M
            M=0
            @END5
            0;JMP

            (TRUE5)
              @SP  // return true
              A=M
              M=-1
              @END5
              0;JMP

            (END5)
              @SP
              M=M+1
            
            //////////
            // PUSH //
            //////////
            @891 // get the number to be pushed
            D=A  // save it

            @SP  // get the memory base pointer
            A=M   // go to that address

            M=D   // save the value

            @SP
            M=M+1  // increase the stack pointer
        
            //////////
            // PUSH //
            //////////
            @891 // get the number to be pushed
            D=A  // save it

            @SP  // get the memory base pointer
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
            @TRUE6
            D;JGT
            @SP  // return false
            A=M
            M=0
            @END6
            0;JMP

            (TRUE6)
              @SP  // return true
              A=M
              M=-1
              @END6
              0;JMP

            (END6)
              @SP
              M=M+1
            
            //////////
            // PUSH //
            //////////
            @32767 // get the number to be pushed
            D=A  // save it

            @SP  // get the memory base pointer
            A=M   // go to that address

            M=D   // save the value

            @SP
            M=M+1  // increase the stack pointer
        
            //////////
            // PUSH //
            //////////
            @32766 // get the number to be pushed
            D=A  // save it

            @SP  // get the memory base pointer
            A=M   // go to that address

            M=D   // save the value

            @SP
            M=M+1  // increase the stack pointer
        
            ///////
            //GT//
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
            @TRUE7
            D;JLT
            @SP  // return false
            A=M
            M=0
            @END7
            0;JMP

            (TRUE7)
              @SP  // return true
              A=M
              M=-1
              @END7
              0;JMP

            (END7)
              @SP
              M=M+1
            
            //////////
            // PUSH //
            //////////
            @32766 // get the number to be pushed
            D=A  // save it

            @SP  // get the memory base pointer
            A=M   // go to that address

            M=D   // save the value

            @SP
            M=M+1  // increase the stack pointer
        
            //////////
            // PUSH //
            //////////
            @32767 // get the number to be pushed
            D=A  // save it

            @SP  // get the memory base pointer
            A=M   // go to that address

            M=D   // save the value

            @SP
            M=M+1  // increase the stack pointer
        
            ///////
            //GT//
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
            @TRUE8
            D;JLT
            @SP  // return false
            A=M
            M=0
            @END8
            0;JMP

            (TRUE8)
              @SP  // return true
              A=M
              M=-1
              @END8
              0;JMP

            (END8)
              @SP
              M=M+1
            
            //////////
            // PUSH //
            //////////
            @32766 // get the number to be pushed
            D=A  // save it

            @SP  // get the memory base pointer
            A=M   // go to that address

            M=D   // save the value

            @SP
            M=M+1  // increase the stack pointer
        
            //////////
            // PUSH //
            //////////
            @32766 // get the number to be pushed
            D=A  // save it

            @SP  // get the memory base pointer
            A=M   // go to that address

            M=D   // save the value

            @SP
            M=M+1  // increase the stack pointer
        
            ///////
            //GT//
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
            @TRUE9
            D;JLT
            @SP  // return false
            A=M
            M=0
            @END9
            0;JMP

            (TRUE9)
              @SP  // return true
              A=M
              M=-1
              @END9
              0;JMP

            (END9)
              @SP
              M=M+1
            
            //////////
            // PUSH //
            //////////
            @57 // get the number to be pushed
            D=A  // save it

            @SP  // get the memory base pointer
            A=M   // go to that address

            M=D   // save the value

            @SP
            M=M+1  // increase the stack pointer
        
            //////////
            // PUSH //
            //////////
            @31 // get the number to be pushed
            D=A  // save it

            @SP  // get the memory base pointer
            A=M   // go to that address

            M=D   // save the value

            @SP
            M=M+1  // increase the stack pointer
        
            //////////
            // PUSH //
            //////////
            @53 // get the number to be pushed
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
            @112 // get the number to be pushed
            D=A  // save it

            @SP  // get the memory base pointer
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
            //NEG//
            //////
            @SP  // get the stack
            M=M-1 // the current stack position is empty
            A=M  // go to the top of the stack

            M=-M  // save that number

            @SP
            M=M+1
            
            ///////
            //AND//
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
            D=D&M

            M=D  // put it back in the stack

            @SP
            M=M+1
            
            //////////
            // PUSH //
            //////////
            @82 // get the number to be pushed
            D=A  // save it

            @SP  // get the memory base pointer
            A=M   // go to that address

            M=D   // save the value

            @SP
            M=M+1  // increase the stack pointer
        
            ///////
            //OR//
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
            D=D|M

            M=D  // put it back in the stack

            @SP
            M=M+1
            
            ///////
            //NOT//
            //////
            @SP  // get the stack
            M=M-1 // the current stack position is empty
            A=M  // go to the top of the stack

            M=!M  // save that number

            @SP
            M=M+1
            
            (INFINITE_LOOP)
              @INFINITE_LOOP
              0;JMP