go :- write("Enter number :- "),
      read(N),
      write("Factorial of no. is :- "),
      factorial(N,Result),
      write(Result).

factorial(0,1) :- !.
factorial(N,Result) :- N > 0,
                       N1 is N - 1,
                       factorial(N1, Temp),
                       Result is N * Temp.