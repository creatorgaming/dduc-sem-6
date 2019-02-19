go :- write('Enter number :- '),
      read(N),
      write('Sum of digits of the no. is :- '),
      sum_of_digits(N,Result),
      write(Result).

sum_of_digits(N,N) :- N < 9, !.
sum_of_digits(N,S) :- N >= 9,
            R is mod(N,10),
            N1 is floor(N/10),
            sum_of_digits(N1, S1),
            S is S1 + R.