if (M >= 1 && N >= 3)
  for (int c0 = -1; c0 <= (3 * M + N - 5) / 100; c0 += 1) {
    for (int c1 = max(max(0, c0 - (2 * M + N + 95) / 100 + 1), floord(-N + 100 * c0 + 106, 300)); c1 <= min(min(c0, M / 100), (c0 + 1) / 3); c1 += 1)
      for (int c2 = max(200 * c1 - 3, 100 * c0 - 100 * c1); c2 <= min(min(2 * M + N - 5, 100 * c0 - 100 * c1 + 99), N + 200 * c1 + 193); c2 += 1) {
        if (c1 >= 1 && N + 200 * c1 >= c2 + 7)
          S3(c0 - c1, c1 - 1, c1, 100 * c1 - 1, -200 * c1 + c2 + 6);
        for (int c3 = max(max(1, 100 * c1), -N + (N + c2) / 2 + 3); c3 <= min(min(M, 100 * c1 + 99), c2 / 2 + 1); c3 += 1)
          S1(c0 - c1, c1, c3, c2 - 2 * c3 + 4);
        if (M >= 100 * c1 + 100 && c2 >= 200 * c1 + 197)
          S2(c0 - c1, c1, c1 + 1, 100 * c1 + 99, -200 * c1 + c2 - 194);
      }
    S4(c0);
  }
