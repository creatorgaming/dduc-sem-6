go :-
    nl,
    write('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'),
    nl,
    write('0.  EXIT'),
    nl,
    write('1.  Sum of numbers'),
    nl,
    write('2.  Maximum of two numbers'),
    nl,
    write('3.  Factorial'),
    nl,
    write('4.  Fibonacci'),
    nl,
    write('5.  GCD of two numbers'),
    nl,
    write('6.  Power of a number upto an exponent'),
    nl,
    write('7.  Multiply two numbers'),
    nl,
    write('8.  Tower of hanio'),
    nl,
    write('9.  Graph (Check path between two nodes)'),
    nl,
    write('10. Check if element is member of list/not'),
    nl,
    write('11. Append two List'),
    nl,
    write('12. Reversal of list'),
    nl,
    write('13. Check if number is pallindrome or not'),
    nl,
    write('14. Sum of the elements of list'),
    nl,
    write('15. Check if list is even/odd length'),
    nl,
    write('16. Find nth element in list'),
    nl,
    write('17. Remove duplicate elements from list'),
    nl,
    write('18. Find maximum element in list'),
    nl,
    write('19. Insert nth element in list'),
    nl,
    write('20. Find all sublist of a list'),
    nl,
    write('21. Delete nth element in list'),
    nl,
    write('22. Delete all occerences of an element in list'),
    nl,
    write('23. Merge two list'),
    nl,
    write('24. NLP sentence checking'),
    nl,
    write('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'),
    nl,
    read(Option),
    run_opt(Option),
    go.

run_opt(0) :-
    halt.

run_opt(1) :-
    write("Enter the first no.  : "),
    read(Term1),
    write("Enter the second no. : "),
    read(Term2),
    sum_two(Term1, Term2, Result),
    write("Sum is : "),
    write(Result).

run_opt(2) :-
    write("Enter the first no.  : "),
    read(Term1),
    write("Enter the second no. : "),
    read(Term2),
    max_two(Term1, Term2, Result),
    write("Maximum is : "),
    write(Result).

run_opt(3) :-
    write("Enter number :- "),
    read(N),
    write("Factorial of no. is :- "),
    factorial(N, Result),
    write(Result).

run_opt(4) :-
    write('Enter no of terms to print : '),
    read(N),
    write('Fibonacci Series :- '),
    fibo(N, R),
    write(R).

run_opt(5) :-
    nl,
    write('Enter first no :- '),
    read(X),
    write('Enter second no :- '),
    read(Y),
    gcd(X, Y, R),
    write('GCD is '),
    write(R),
    !.

run_opt(_) :-
    write('Invalid Option').

% Option 1
sum_two(Term1, Term2, Result) :-
    Result is Term1+Term2.

% Option 2
max_two(Term1, Term2, Term1) :-
    Term1>Term2,
    !.
max_two(Term1, Term2, Term2) :-
    Term1=<Term2.

% Option 3
factorial(0, 1) :-
    !.
factorial(N, R) :-
    N1 is N-1,
    factorial(N1, R1),
    R is N*R1.

% Option 4
fibo(1, 0) :-
    !.
fibo(2, 1) :-
    !.
fibo(N, R) :-
    N1 is N-1,
    N2 is N-2,
    fibo(N1, R1),
    fibo(N2, R2),
    R is R1+R2.

% Option 5
gcd(X, 0, X) :-
    !.
gcd(X, Y, R) :-
    Y>0,
    K is X mod Y,
    gcd(Y, K, R).

:- (initialization go).