/* Write a program that prints the numbers from 1 to 100. But for multiples of */
/* three print “Fizz” instead of the number and for the multiples of five print */
/* “Buzz”. For numbers which are multiples of both three and five print
 * “FizzBuzz” */

#include <stdio.h>
int main(int argc, char **argv)
{
        int i;
        for (i=0; i<=100; i++) {
                if (i % 15 == 0)
                        printf("FizzBuzz ");
                else if (i % 3 == 0)
                        printf("Fizz ");
                else if (i % 5 == 0)
                        printf("Buzz ");
                else
                        printf("%d ", i);
        }
        printf("\n");
        return 0;
}
