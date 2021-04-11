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
 *
 * in:  Array of input numbers.
 *
 * n:   The length of the input array.
 */
void primetest_naive(unsigned int *out, const unsigned int *in,
                     const unsigned int n);

#endif
