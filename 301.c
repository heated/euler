#include <stdlib.h>
#include <stdbool.h>
#include <math.h>
#include <stdio.h>

bool nim_win(a, b, c) {
  return (a ^ b ^ c) != 0;
}

int main(void) {
  int MAX = pow(2, 30);
  int losses = 0;

  for (int n = 1; n <= MAX; n++) {
    if (!nim_win(n, 2 * n, 3 * n)) {
      losses++;
    }
  }

  printf ("Losses: %d\n", losses);

  return 0;
}