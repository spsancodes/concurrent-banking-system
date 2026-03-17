#include <stdio.h>
#include "bank.h"

int accountA = 1000;
int accountB = 1000;
int accountC = 1000;

void printBalances()
{
    printf("Account A: %d\n", accountA);
    printf("Account B: %d\n", accountB);
    printf("Account C: %d\n", accountC);

    int total = accountA + accountB + accountC;
    printf("Total Money: %d\n\n", total);
}