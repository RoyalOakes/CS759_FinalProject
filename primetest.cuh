#ifndef SRO_PRIMETEST
#define SRO_PRIMETEST

/* This function implements the naive primality test on a list of integers and
 * stores the result of the test in a list. Primality is assessed by dividing
 * an input number N by all prime numbers <= N^(1/2). If N is divisible by at
 * least one prime number, it is not prime. Otherwise, it is prime.
 *
 * This function assumes that the output array has been allocated beforehand
 * and has the same length as the input array.
 *
 * out: The output array. A value of one means the corresponding element in
 *      input is prime, zero means the corresponding element is not prime.
 * in:  Array of input numbers.
 * n:   The length of the input array.
 * tpn: Number of threads per input.
 */
void primetest_naive(unsigned int *out, const unsigned int *in,
                     const unsigned int n, const unsigned int tpn);

/* This function implements the Miller-Rabin primality test on an array of
 * integers and stores the result in an array. This is a probabilistic test.
 *
 * This function assumes that the out and in arrays are allocated on the host
 * beforehand.
 *
 * out:  Output array. Value of 1 implies prime, 0 implies composite.
 * in:   Input array.
 * n:    Lenth of input and output arrays
 * k:    Number of times the Miller-Rabin test will be done.
 * seed: Seed for random number generator.
 */
void primetest_miller(unsigned int *out, const unsigned int *in,
                      const unsigned int n, const unsigned int k,
                      const unsigned int seed);


/* The naive prime factorization algorithm. Accepts an array of input values
 * and divides by primes. Because the number of prime factors may vary between
 * inputs, this function allocates memory on the heap for the prime factors.
 *
 * out: Array for output.
 * in:  Array of values to be factorized.
 * n:   Number of elements for input and output arrays.
 */
void factor_naive(unsigned int **out, const unsigned int *in, const unsigned int n);

#endif