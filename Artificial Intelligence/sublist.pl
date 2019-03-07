% sublist(sublist_to_check S, given list L1)

sublist([],L1) :- !.
sublist([H1|T1],L1) :- member(H1,L1),
                       sublist(T1,L1).
