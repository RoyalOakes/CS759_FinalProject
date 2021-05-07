cat /* This is a demonstration file that shows how the prime test functions work. */

#include "primetest.cuh"
#include <iostream>

int main() {
    // The known number of primes less than 10,100,1000,10000,100000,1000000
    unsigned int kPrimes[6] = {4,25,168,1229,9592,78498};

    unsigned int pCountN[6]; // Number of primes counted for naive test.
    unsigned int pCountM[6]; // Number of primes counted for Miller-Rabin test.

    float msN[6]; // Time of execution for naive test in ms.
    float msM[6]; // Time of execution for Miller-Rabin test in ms.

    // Compare the naive and Miller-Rabin primality test. k = 1.
    int size = 10;
    unsigned int *out, *in;
    for (int i = 0; i < 6; i++) {
        out = new unsigned int[size];
        in = new unsigned int[size];

        for (int j = 0; j < size; j++)
            in[j] = j;

        // Naive
        msN[i] = primetest_naive(out, in, size, 1);

        pCountN[i] = 0;
        for (int j = 0; j < size; j++)
            pCountN[i] += out[j];

        // Miller Rabin
        msM[i] = primetest_miller(out, in, size, 1, 0, 1);

        pCountM[i] = 0;
        for (int j = 0; j < size; j++)
            pCountM[i] += out[j];

        size *= 10;
    }

    // Print results
    for (int i = 0; i < 6; i++) {
        std::printf("%5u, %5u, %5u, %5f, %5f\n", kPrimes[i], pCountN[i], pCountM[i], msN[i], msM[i]);
    }

    std::printf("\n");

    // Compare the naive and Miller-Rabin primality test. k = 4.
    size = 10;
    for (int i = 0; i < 6; i++) {
        out = new unsigned int[size];
        in = new unsigned int[size];

        for (int j = 0; j < size; j++)
            in[j] = j;

        // Naive
        msN[i] = primetest_naive(out, in, size, 1);

        pCountN[i] = 0;
        for (int j = 0; j < size; j++)
            pCountN[i] += out[j];

        // Miller Rabin
        msM[i] = primetest_miller(out, in, size, 4, 0, 1);

        pCountM[i] = 0;
        for (int j = 0; j < size; j++)
            pCountM[i] += out[j];

        size *= 10;
    }

    // Print results
    for (int i = 0; i < 6; i++) {
        std::printf("%5u, %5u, %5u, %5f, %5f\n", kPrimes[i], pCountN[i], pCountM[i], msN[i], msM[i]);
    }

    return 0;
}