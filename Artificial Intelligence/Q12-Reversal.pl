go:- reversal([1,2,3,4,5,6],R),
     write('Reversal of list is: '),
     write(R).

reversal([],[]) :- !.
reversal([X],[X]) :- !.
reversal([H|T],L) :- reversal(T, R),
                    append(R, [H], L).