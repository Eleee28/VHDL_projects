# VHDL projects

In this repository you will find several VHDL projects along with simulation and constraint files to test their functionality by simulating them or on a Basys 3 FPGA Board.

## Lab 1

Lab 1 consists of an introduction to VHDL and the GUI of Vivado.

- 1a: 4-bit adder
- 1b: register with parallel input and parallel output
- 1c: Mod-16 counter created in a structural way using the modules adder (1a) and register (1b)

## Lab 2

Lab 2 consists on the implementation of an 8 bit digital combinational lock as a Finite State Machine (FSM).

### Information on implementation (2a)

The lock is initially open (LED on), when the push button is pressed, the key is internally stored in a register and the lock is closed (LED off). After that, the user has 3 attempts (pressing the push button) to open the lock. The values of the register and the new imput are compared and the remaining attemps are displayed in the 7-segment display.

### Information on implementation (2b)

This consists on modifying some aspects of 2a. Now we use two buttons, one to enter the initial password and other one to guess it. When the FSM is in state Three, Two or One, if the user pushes the button to enter a new initial password, it will be saved and the FSM goes back to state Three.

## Lab 3

Lab 3 is about iterative networks.

### Information on implementation (3a)

- Network 1 consists on implementing an interative networks in 1-D in order to find the maximum among several numbers.
- Networks 2 is the same as Network 1 but it is implemented in 2D (tree-shaped)

Both networks are defined generically for any quantity of numbers (at least powers of 2).

### Information on implementation (3b)

This consists on modifying Network 2 of 3a to add some registers.

## Lab 4

Lab 4 is about a sequencial divider. It consists on coding an ASM system that implements an algorithm for dividing two numbers.

## Final Lab

The final lab is about a microprocessor using a MIPS multicycle implementation. <br>
The goal is to implement some instructions (move with register, move with immediate and unconditional jump)

### MIPS Instruction Set Architecture

- R-Type instructions: arithmetic-logical
  - **add** rd, rs, rt : \[ rd <- rs + rt ; PC <- PC + 4 ]
  - **sub** rd, rs, rt : \[ rd <- rs - rt ; PC <- PC + 4 ]
  - **and** rd, rs, rt : \[ rd <- rs and rt ; PC <- PC + 4 ]
  - **or** rd, rs, rt : \[ rd <- rs or rt ; PC <- PC + 4 ]
  - **nor** rd, rs, rt : \[ rd <- rs nor rt ; PC <- PC + 4 ]
  - **xor** rd, rs, rt : \[ rd <- rs xor rt ; PC <- PC + 4 ]
- I-Type instructions: with memory, conditional branch, with immediate
  - **lw** rt, immed(rs) : \[ rt <- Mem(rs + SignExt(immed)) ; PC <- PC + 4 ]
  - **sw** rt, immed(rs) : \[ Mem(rs + SignExt(immed)) <- rt ; PC <- PC + 4 ]
  - **beq** rs, rt, immed : if (rs == rt) then { PC <- PC + 4 + 4*SignExt(immed) } &nbsp; &nbsp; else { PC <- PC + 4 }
  - **mv** rt, #immed : \[ rt <- SignExt(immed) ; PC <- PC + 4 ]
  - **mv** rt, rs : \[ rt <- rs ; PC <- PC + 4 ]
- J-Type instructions: jump (unconditional branches)
  - **j** instr : \[ PC <- 0000 & instr & 00 ]
  
 

  

  
