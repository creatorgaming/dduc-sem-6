go :- conc([1,2,3,4,5],[7,8,9],R),
      write('Appended List is : '), 
      write(R),nl.

conc(L1,[],R) :- !.
conc([],[H2|T2],R) :- conc(_,T2,[H2]).
conc([H1|T1],L2,R) :- conc(T1,L2,[H1]).