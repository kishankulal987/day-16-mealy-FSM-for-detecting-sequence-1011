# Mealy FSM 1011 Detector in Verilog

## Overview

In this project, I implemented a Mealy finite state machine (FSM) in Verilog to detect the sequence "1011" in a serial input stream. My goal was to create a circuit that outputs 1 when the sequence "1011" is detected and 0 otherwise, using a Mealy machine where the output depends on both the current state and the input. I designed the FSM with four states (A to D) to track the sequence, using clock and reset inputs to control state transitions and an input in to receive the serial data. I wrote a testbench to verify the functionality by testing random input sequences, and I confirmed the design works as expected through simulation.

Module: mealy_1011





What I Did: I designed a Mealy FSM to detect the sequence "1011" in a serial input stream.



Inputs:





clk: Clock signal (positive edge-triggered).



reset: Asynchronous reset (active-high) to initialize the FSM.



in: Serial input bit (0 or 1).



Outputs:





out: Output bit (1 when "1011" is detected, 0 otherwise).



How It Works:





I defined four states using local parameters: A (000), B (001), C (010), D (011).





A: Initial state (no match).



B: Seen "1".



C: Seen "10".



D: Seen "101".



State Transition and Output Logic (always @(in or current_state)):





From A: If in=1, go to B, out=0; else stay in A, out=0.



From B: If in=1, stay in B, out=0; else go to C, out=0.



From C: If in=1, go to D, out=0; else go to A, out=0.



From D: If in=1, go to B, out=1 (sequence "1011" detected); else go to C, out=0.



State Update (always @(posedge clk or posedge reset)):





On reset, current_state is set to A.



Otherwise, current_state updates to next_state on each clock edge.



For example, if the input sequence is "1101011", the FSM transitions through states A → B → B → C → D → C → D → B, outputting 1 when transitioning from D to B (on the final 1 of "1011").



Style: Behavioral modeling with separate always blocks for state transitions/output and state updates.

Testbench: testbench





What I Did: I created a testbench to verify the Mealy FSM for sequence "1011" detection.



How It Works:





I defined clk, reset, and in as inputs, and out as the output.



I generated a clock with a 10ns period (forever #5 clk=~clk).



I applied the following sequence:





reset=1 for 10ns (initializes FSM to state A).



reset=0, then 50 cycles of random inputs (in=$random) with 10ns per cycle.



I did not include $monitor or $display in the testbench, so I expect to observe outputs via waveform analysis.



Time Scale: I set 1ns / 1ps for precise simulation timing.



Purpose: The testbench verifies the FSM correctly detects "1011" sequences in random input streams by checking the output out.

Files





mealy_1011.v: Verilog module for the Mealy FSM 1011 detector.



testbench.v: Testbench for simulation.

## State Diagram

Below is the state diagram for the Mealy FSM 1011 detector.

![kwmgI](https://github.com/user-attachments/assets/d2eeecf3-891a-4741-9ea0-6ce7b6b3601a)


## Schematic Diagram

Below is the schematic diagram for the Mealy FSM 1011 detector.

![Screenshot 2025-06-15 131052](https://github.com/user-attachments/assets/089babbb-d7ce-4ee9-9c96-88c82a8df9b1)


## Simulation Waveform

Below is the simulation waveform, showing inputs clk, reset, in, and output out over time.

![Screenshot 2025-06-15 130957](https://github.com/user-attachments/assets/76aad6d8-9ca8-4b88-8933-0d84489fbb8e)
