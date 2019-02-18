go :- write("Enter the first no.  : "),
      read(Term1),
      write("Enter the second no. : "),
      read(Term2),
      sum_two(Term1,Term2, Result),
      write("Sum is : "),
      write(Result).

sum_two(Term1, Term2, Result) :- Result is Term1 + Term2.