<<<<<<< HEAD
# C Concurrent Banking Simulation

This program simulates a banking system with concurrent transactions.

Multiple threads perform transfers between accounts simultaneously.

Because no synchronization (mutex/locks) is used, race conditions may occur
and the total balance may become inconsistent.

This program is used to compare with a Haskell implementation using
Software Transactional Memory (STM), which guarantees safe concurrent updates.
=======
# Concurrent Banking System using Haskell STM

This project demonstrates how Haskell's Software Transactional Memory (STM)
provides safe concurrency for banking transactions.

## Features
- Account creation
- Deposit and withdrawal
- Money transfer
- Concurrent transaction simulation

## Key Concept
Haskell uses STM to ensure transactions are:
- Atomic
- Consistent
- Safe from race conditions

## Running the Program

Compile:
ghc Main.hs

Run:
./Main
>>>>>>> badfa911b5772b070c8ec78548f4869ecf2e2ac7
