# C Concurrent Banking Simulation

This program simulates a banking system with concurrent transactions.

Multiple threads perform transfers between accounts simultaneously.

Because no synchronization (mutex/locks) is used, race conditions may occur
and the total balance may become inconsistent.

This program is used to compare with a Haskell implementation using
Software Transactional Memory (STM), which guarantees safe concurrent updates.