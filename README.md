The FizzBuzz test has become popular as a way to weed out the 99.5% of
programmers who apparently can't program. The problem is simple:

> Write a program that prints the numbers from 1 to 100. But for multiples of
> three print “Fizz” instead of the number and for the multiples of five print
> “Buzz”. For numbers which are multiples of both three and five print
> “FizzBuzz”

Personally FizzBuzz is a little programming activity when I want to do some
quick hacking that isn't necessarily involved with any of my actual
projects. It's also a neat little beginning exercise when I'm learning a new
language.

## Some changes

I've made some changes to the original fizzbuzz problem. First each solution must
be a complete executable that can be run directly from the command line. Second,
I've allowed some leeway as to how exactly the output is formatted. In
particular, it doesn't matter if each entry is printed on the same lines or on
different lines.

## Running the solutions

The point of the exercise isn't really to create useful programs. In fact, the
code is probably only very useful if you're trying to learn one of the languages
described here. But I wanted to make it easy to compile and run the solutions
(partly as a challenge to myself to create some clean packaging).

The provided Makefile handles compiling the files and giving execute permissions
to the resultant executables. The Makefile always creates a `bin/` directory
where all the executables get stored. By default the Makefile compiles and moves
all the solutions but can also be used to compile a single solution at a time.

For example, running:

    make haskell

will compile the Haskell solution and produce an executable in the `bin/`
subdirectory named `fizzbuzz-hs` which can be run directly with

    bin/fizzbuzz-hs

The other supported languages will produce
similarly named executables. The `bin/` directory and all its contents can be
deleted by running `make clean`.

## Some References:

[Using FizzBuzz to find developers who grok coding](http://imranontech.com/2007/01/24/using-fizzbuzz-to-find-developers-who-grok-coding/)

[Don't Overthink Fizzbuzz](http://weblog.raganwald.com/2007/01/dont-overthink-fizzbuzz.html)

[Why Can't Programmers... Program?](http://www.codinghorror.com/blog/2007/02/why-cant-programmers-program.html)
