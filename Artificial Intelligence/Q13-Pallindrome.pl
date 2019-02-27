reversal([],[]) :- !.
reversal([X],[X]) :- !.
reversal([H|T],L) :- reversal(T, R),
                     append(R, [H], L).

go:- pallindrome([1,2,2,2,2,1]).

pallindrome(L1) :- reversal(L1,L1).