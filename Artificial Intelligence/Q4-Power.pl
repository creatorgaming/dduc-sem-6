go :- write("Enter number :- "),
      read(N),
      write("Enter value of power :- "),
      read(Power),
      write("Power of no. is :- "),
      power(N,Power,Result),
      write(Result).

power(1,Power,Result):- Result is 1, !.
power(0,Power,Result):- Result is 0, !.
power(-1,Power,Result):- Power/2 == 0, Result is 1, !.
power(-1,Power,Result):- Power/2 != 0, Result is -1, !.
power(N,1,Result):- Result is N, !.
power(N,Power,Result):- N > 0, 
                        N1 is Power - 1,
                        power(N, N1 ,Temp),
                        Result is N * Temp.