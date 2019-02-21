go :-	write('Enter first no :- '),
		  read(X),
		  write('Enter second no :- '),
		  read(Y),
		  gcd(X,Y,R),
		  write('GCD is '),
		  write(R).

gcd(X,0,X) :-	!.
gcd(X,Y,R) :-	Y > 0,
			      	K is mod(X,Y),
				      gcd(Y,K,R).