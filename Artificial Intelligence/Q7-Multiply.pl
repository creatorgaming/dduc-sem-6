go :- write("Enter the first no.  : "),
      read(Term1),
      write("Enter the second no. : "),
      read(Term2),
      mul_two(Term1,Term2, Result),
      write("Multiplication Result is : "),
      write(Result).

mul_two(Term1, Term2, Result) :- Result is Term1 * Term2.