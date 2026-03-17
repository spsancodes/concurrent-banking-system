#include <stdlib.h>
#include <windows.h>
#include "bank.h"
#include "transaction.h"

void transfer(int *from, int *to, int amount)
{
    if(*from >= amount)
    {
        *from = *from - amount;
        *to = *to + amount;
    }
}

DWORD WINAPI randomTransaction(LPVOID arg)
{
    for(int i = 0; i < 10000; i++)
    {
        int r = rand() % 3;
        int amount = rand() % 50;

        if(r == 0)
            transfer(&accountA, &accountB, amount);
        else if(r == 1)
            transfer(&accountB, &accountC, amount);
        else
            transfer(&accountC, &accountA, amount);
    }

    return 0;
}