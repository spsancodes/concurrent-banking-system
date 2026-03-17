#ifndef TRANSACTION_H
#define TRANSACTION_H

DWORD WINAPI randomTransaction(LPVOID arg);
void transfer(int *from, int *to, int amount);

#endif