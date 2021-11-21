#include <stdio.h>

int main()
{
  int8_t x = 0b00101010;
  printf("x=%x", x);
  printf("\nx<<4=%x", x<<4);
  printf("\nx>>4=%x\n", x>>4);

  return 0;
}