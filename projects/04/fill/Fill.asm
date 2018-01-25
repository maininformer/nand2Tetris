// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(LOOP)
  @SCREEN
  D=A
  @i
  M=D

  @KBD  // Read the keyboard address
  D=M   // Save it's data
  @DARKEN
  D;JGT  // If any key is pressed jump to DARKEN
  (LIGHTENLOOP) // Same logic as DARKEN
    @KBD
	D=M
	@LOOP
	D;JGT      // If any key is pressed jump back to LOOP
	@i
	A=M
	M=0
	A=A+1
	D=A
	@i
	M=D
	@LIGHTENLOOP
	0;JMP
    @LOOP
    0;JMP
(DARKEN)
  @SCREEN  // Get the first SCREEN address
  D=A      // Save it's address
  @i       // Get a random register
  M=D      // Put the SCREEN address that is in D in i
  (DARKENLOOP)
	@KBD  // Get the keyboard address
	D=M   // Save it's valus in D
	@LOOP 
	D;JEQ // If no key is pressed jump back to LOOP
	@i    // Get the i register
	A=M   // Go to the address that i is showing
	M=-1  // "blacken" that address
	A=A+1 // Go to the next word
	D=A   // Save the address in D
	@i
	M=D   // Save the address in i
	@DARKENLOOP
	0;JMP // Jump to DAREKNLOOP
    @LOOP
    0;JMP
