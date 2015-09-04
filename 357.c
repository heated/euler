#include <stdlib.h>
#include <stdbool.h>
#include <math.h>
#include <stdio.h>

int main(void) {
  int MAX = 1e8;

  bool* prime = malloc(MAX * sizeof(bool));

  for (int i = 0; i < MAX; i++) {
    prime[i] = i > 1;
  }

  for (int i = 2; i < sqrt(MAX); i++) {
    if (prime[i]) {
      for (int n = i * i; n < MAX; n += i) {
        prime[n] = false;
      }
    }
  }

  long sum = 0;

  for (int i = 0; i < MAX; i++) {
    if (prime[i]) {
      int n = i - 1;
      bool still_cool = true;

      for (int f = 2; f <= sqrt(n); f++) {
        if (n % f == 0 && !prime[f + n / f]) {
          still_cool = false;
          break;
        }
      }

      if (still_cool) {
        sum += n;
      }
    }
  }

  printf ("Sum: %ld\n", sum);

  return 0;
}