perm([],[]) :- !.
perm(L,[H|T]) :- append(V,[H|U],L),
                 append(V,U,W),
                 perm(W,T).