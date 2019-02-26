% sublist(L, S) :-
%     length(L, N),
%     between(1, N, M),
%     length(S, M),
%     append([_, S, _], L).

sublist(S,L) :- append(L1, L2, L),
               append(S, L3, L2).