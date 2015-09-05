#include <stdlib.h>
#include <stdbool.h>
#include <math.h>
#include <stdio.h>

bool odd(int n) {
  return n % 2 == 1;
}

bool odd_digits(int n) {
  return odd(n) && (n < 10 || odd_digits(n / 10));
}

int main(void) {
  int MAX = 1e8;
  int count = 0;
  int* reverse = malloc(MAX * sizeof(int));
  int* magnitude = malloc(MAX * sizeof(int));

  for (int n = 0; n < 10; n++) {
    reverse[n] = n;
    magnitude[n] = 1;
  }

  for (int n = 10; n < MAX; n++) {
    int last_digit = n % 10;

    magnitude[n] = 10 * magnitude[n / 10];
    reverse[n] = last_digit * magnitude[n] + reverse[n / 10];
    
    if (n % 10 != 0 && odd_digits(n + reverse[n])) {
      count++;
    }
  }

  printf ("%d\n", count);

  return 0;
}
