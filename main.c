#include <stdio.h>
#include <windows.h>
#include "bank.h"
#include "transaction.h"

int main()
{
    HANDLE threads[10];

    printf("Initial Balances:\n");
    printBalances();

    for(int i = 0; i < 10; i++)
    {
        threads[i] = CreateThread(NULL, 0, randomTransaction, NULL, 0, NULL);
    }

    WaitForMultipleObjects(10, threads, TRUE, INFINITE);

    printf("Final Balances:\n");
    printBalances();

    return 0;
}