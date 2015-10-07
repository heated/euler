#include <stdlib.h>
#include <stdbool.h>
#include <math.h>
#include <stdio.h>
#include <string.h>

int main(void) {
  int MAX = 1e8;

  bool* prime = malloc(MAX * sizeof(bool));
  memset(prime, true, sizeof(bool) * MAX);

  prime[0] = false;
  prime[1] = false;

  for (int i = 2; i < sqrt(MAX); i++) {
    if (prime[i]) {
      for (int n = i * i; n < MAX; n += i) {
        prime[n] = false;
      }
    }
  }

  int totalPrimes = 0;
  for (int i = 0; i < MAX; i++) {
    if (prime[i]) {
      totalPrimes++;
    }
  }

  int* primes = malloc(totalPrimes * sizeof(int));
  int j = 0;
  for (int i = 0; i < MAX; i++) {
    if (prime[i]) {
      primes[j] = i;
      j++;
    }
  }

  int lastPrime = primes[totalPrimes - 1];
  long sum = 0;

  // memset(largest_root_factor, 1, sizeof(int) * MAX);

  int* largest_root_factor = malloc(MAX * sizeof(int));
  for (int i = 0; i < MAX; i++) {
    largest_root_factor[i] = 1;
  }

  // find minimum increments, or the largest square factors
  for (int i = 2; i <= sqrt(MAX); i++) {
    int sqr = i * i;
    for (int j = sqr; j < MAX; j += sqr) {
      largest_root_factor[j] = i;
    }
  }


  for (int i = 0; i < totalPrimes - 2; i++) {
    int a = primes[i] + 1;

    // the minimum between numbers to check for ratios that work is
    // n / (n's largest root factor)

    int multiple = a / largest_root_factor[a];

    // check multiples
    for (int b = a + multiple; b < MAX; b += multiple) {
      if (prime[b - 1]) {
        double c = 1.0 * b * b / a - 1;
        if (c >= MAX) {
          break;
        }

        int d = (int) c;

        if (c == d && prime[d]) {
          sum += a + b + d - 2;
        }
      }
    }
  }

  printf ("Sum: %ld\n", sum);

  return 0;
}