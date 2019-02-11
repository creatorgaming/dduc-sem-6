go :- write("Enter no of disks: "),
      read(N),
      write("Tower of Hanoi is :- "),
      toh(N,'A','B','C').

toh(0,_,_,_) :- write("Number of disk is very less"),!.
toh(1,A,_,C) :- displayOnScreen(A,C),!.
toh(N,A,B,C) :- M is N - 1,
                toh(M,A,C,B),
                displayOnScreen(A,C),
                toh(M,B,A,C).

displayOnScreen(X,Y) :- write("MOVED "),
                        write(X),
                        write(" TO "),
                        write(Y),nl.              
      
