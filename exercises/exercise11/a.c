#include <stdio.h>

int main()
{
  int32_t x = -1;
  printf("x=%x", x);
  printf("\nx<<32=%x", x<<32);
  printf("\nx>>36=%x\n", x>>36);

  return 0;
}