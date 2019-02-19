go :- write('Enter no of terms to print : '),
      read(N),
      write('Fibonacci Series :- '),
      fibo(N,R),
      write(R).

fibo(N,R) :- N == 1, R = 0, !.
fibo(N,R) :- N == 2, R = 1, !.
fibo(N,R) :- N > 2,
             N1 is N-1,
             N2 is N-2,
             fibo(N1, Temp1),
             fibo(N2, Temp2),
             R is Temp1 + Temp2.