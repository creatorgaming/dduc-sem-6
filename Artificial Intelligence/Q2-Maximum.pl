go :- write("Enter the first no.  : "),
      read(Term1),
      write("Enter the second no. : "),
      read(Term2),
      maximum(Term1,Term2, Result),
      write("Maximum No. is : "),
      write(Result).

maximum(Term1, Term2, Term1) :- Term1 > Term2, !.   % Green Cut
maximum(Term1, Term2, Term2) :- Term1 =< Term2.     % Term1 is Less than equal to Term2