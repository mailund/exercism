#include "armstrong_numbers.h"

static inline
int no_digits(int n)
{
  int digits = 0;
  for (; n; n /= 10) digits++;
  return digits;
}

static inline
int ipow(int x, int p)
{
  int res = 1;
  for (; p; p--) res *= x;
  return res;
}

#include <stdio.h>
bool is_armstrong_number(int n)
{
  int ndig = no_digits(n);
  int sum = 0;
  for (int k = n; k; k /= 10) sum += ipow(k % 10, ndig);
  return n == sum;
}
