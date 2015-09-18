#include <stdlib.h>
#include <stdbool.h>
#include <math.h>
#include <stdio.h>
#include <string.h>

int primes_under(int total, int* primes, int n) {
  for (int i = 0; i <= total; i++) {
    if (primes[i] >= n) {
      return i;
    }
  }

  return primes[0];
}

int main(void) {
  int max = 1e8;

  // sieve
  bool* prime = malloc(max * sizeof(bool));
  memset(prime, true, sizeof(bool) * max);

  prime[0] = false;
  prime[1] = false;

  for (int i = 2; i < sqrt(max); i++) {
    if (prime[i]) {
      for (int n = i * i; n < max; n += i) {
        prime[n] = false;
      }
    }
  }

  // put primes in a list
  int total_primes = 0;
  for (int i = 0; i < max; i++) {
    if (prime[i]) {
      total_primes++;
    }
  }

  int* primes = malloc(total_primes * sizeof(int));
  int c = 0;
  for (int i = 0; i < max; i++) {
    if (prime[i]) {
      primes[c] = i;
      c++;
    }
  }

  long sum = 0;

  // primes_under(total_primes, primes, 100)

  // (sum:map 
  //   [- (len:primes<=:div n _) len:primes<=:dec._]
  //   primes<=:floor:sqrt.n)

  // magic

  printf ("%d\n", );

  return 0;
}