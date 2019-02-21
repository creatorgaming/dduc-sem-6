edge(p,q).
edge(q,r).
edge(r,s).
edge(s,t).


path(S,D) :- edge(S,D),!.
path(S,D) :- edge(S,X),
			       path(X,D).

go :-	write('Enter Source Node : '),
		  read(S),
		  write('Enter Destination Node : '),
		  read(D),
		  path(S,D),
		  write('Path exists');write('Path not exists').