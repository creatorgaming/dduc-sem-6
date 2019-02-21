go :- write('Enter element : '),
	    read(E),
      isMember([1,2,6,9,8],E),
      write('Is member of L');write('Is not member of L').
	
isMember([H|_],E) :- E == H.
isMember([H|T],E) :- E \= H,isMember(T,E).  % if E != H then run is Member Again of T,E