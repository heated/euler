#include <stdlib.h>
#include <stdbool.h>
#include <math.h>
#include <stdio.h>

bool odd(int n) {
  return n % 2 == 1;
}

bool odd_digits(int n) {
  if (n < 10) {
    return odd(n);
  } else {
    return odd(n) && odd_digits(n / 10);
  }
}

int magnitude(int n) {
  if (n < 10) {
    return 1;
  } else {
    return 10 * magnitude(n / 10);
  }
}

int main(void) {
  int MAX = 1e9;
  int count = 0;
  int* reverse = malloc(MAX * sizeof(int));

  for (int n = 0; n < 10; n++) {
    reverse[n] = n;
  }

  for (int n = 10; n < MAX; n++) {
    int digit = n % 10;

    int reverse_int = digit * magnitude(n) + reverse[n / 10];
    reverse[n] = reverse_int;
    
    if (n % 10 != 0 && odd_digits(n + reverse_int)) {
      count++;
    }
  }

  printf ("Reversible numbers under %d: %d\n", MAX, count);

  return 0;
}