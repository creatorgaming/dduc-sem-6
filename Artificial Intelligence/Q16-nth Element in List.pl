go :- 
      write('Enter list :- '),
      read(L),
      write('Enter position of element you want to search :- '),
      read(N),
      write('nth Element is :- '),
      n_element(N,L,Result),
      write(Result).

n_element(1,[],X) :- fail.
n_element(1,[H|_],H) :- !.
n_element(N,[H|T],R) :- N1 is N - 1,
                        n_element(N1,T,R).