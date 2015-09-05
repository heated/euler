#include <stdlib.h>
#include <stdbool.h>
#include <math.h>
#include <stdio.h>

bool perfect_square(int n) {
  int m = sqrt(n);
  return m * m == n;
}

int gcd(int a, int b) {
    int temp;
    while (b != 0) {
        temp = a % b;

        a = b;
        b = temp;
    }

    return a;
}

int main(void) {
  int MAX = 100;
  int latice_triangle[MAX + 1][MAX + 1];
  int total = 0;

  for (int x = 1; x <= MAX; x++) {
    for (int y = 1; y <= MAX; y++) {
      latice_triangle[x][y] = ((x - 1) * (y - 1) - gcd(x, y) + 1) / 2;
    }
  }

  for (int a = 1; a <= MAX; a++) {
    for (int b = 1; b <= MAX; b++) {
      for (int c = 1; c <= MAX; c++) {
        for (int d = 1; d <= MAX; d++) {
          int total_latice_points = -3 + a + b + c + d +
            latice_triangle[a][b] +
            latice_triangle[b][c] +
            latice_triangle[c][d] +
            latice_triangle[d][a];

          if (perfect_square(total_latice_points)) {
            total++;
          }
        }
      }
    }
  }

  printf ("quadrilaterals: %d\n", total);

  return 0;
}
