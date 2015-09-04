#include <stdlib.h>
#include <stdbool.h>
#include <math.h>
#include <stdio.h>

int fast_exp_mod(int base, int power, int divisor) {
	if (power == 0) {
		return 1;
	} else if (power % 2 == 0) {
		return fast_exp_mod((long) base * base % divisor, power / 2, divisor) % divisor;
	} else {
		return (long) base * fast_exp_mod(base, power - 1, divisor) % divisor;
	}
}

int mod_inverse(int n, int divisor) {
	return fast_exp_mod(n, divisor - 2, divisor);
}

int specific_factorial_sum_mod(int p) {
	return ((mod_inverse(8, p) * -3) + p * 3) % p;
}

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

  for (int i = 5; i < MAX; i++) {
    if (prime[i]) {
      sum += specific_factorial_sum_mod(i);
    }
  }

  // doesn't work?!
  printf ("Sum: %ld\n", sum);

  return 0;
}