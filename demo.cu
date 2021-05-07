/* This is a demonstration file that shows how the prime test functions work. */

#include "primetest.cuh"
#include <iostream>
#include <random>
#include <chrono>

int main() {
    // Initialize RNG.
    auto seed = std::chrono::system_clock::now().time_since_epoch().count();
    std::mt19937 generator(seed);
    std::uniform_int_distribution<unsigned int> dist(0, 100);

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
        msM[i] = primetest_miller(out, in, size, 4, dist(generator), 1);

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

    // Demonstrate factorization.
    size = 10;
    in = new unsigned int[size];
    unsigned int **fout = new unsigned int*[size];

    for (int i = 0; i < size; i++) {
        in[i] = dist(generator);
    }

    float msF = factor_naive(fout, in, size);

    // Print results
    for (int i = 0; i < size; i++) {
        std::printf("Value: %u\n", in[i]);
        unsigned int nFact = fout[i][0];
        for (unsigned int j = 0; j < nFact; j++) {
            std::printf("  %u, %u\n", fout[i][2*j+1], fout[i][2*j+2]);
        }
        std::printf("--------------\n");
    }

    std::printf("\n");

    // Scaling analysis of factorization.
    float msFarr[3];
    for (int i = 0; i < 3; i++) {
        fout = new unsigned int*[size];
        in = new unsigned int[size];

        for (int j = 0; j < size; j++)
            in[j] = j;

        msFarr[i] = factor_naive(fout, in, size);

        size *= 10;
    }


    // Print results
    for (int i = 0; i < 3; i++) {
        std::printf("%f\n", msFarr[i]);
    }

    delete(fout);
    delete(out);
    delete(in);

    return 0;
}