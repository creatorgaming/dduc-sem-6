:- dynamic initial/1.
:- dynamic goal/1. 
initial([]).
goal([]).

go :- 
	write('-----Eight Puzzle Problem-----'),nl,
	write('Enter Initial/Start state of the puzzle '),nl,
	read(Initial),
	retractall(initial(_)),
	assert(initial(Initial)),
	write('Enter Goal/End state of the puzzle '),nl,
	read(Goal),
	retractall(goal(_)),
	assert(goal(Goal)),
	bfs(Path),
	write('Path is  : '),
	write(Path).

misplace([],[],0):-!.
misplace([HC|TC],[HG|TG],Score):-
	misplace(TC,TG,Score1),
	((HC \= HG->Score is Score1 + 1);(Score is Score1)).

% move_left in the top row
move_left([X1,0,X3, X4,X5,X6, X7,X8,X9],
 [0,X1,X3, X4,X5,X6, X7,X8,X9]).
move_left([X1,X2,0, X4,X5,X6, X7,X8,X9],
 [X1,0,X2, X4,X5,X6, X7,X8,X9]).

% move_left in the middle row
move_left([X1,X2,X3, X4,0,X6, X7,X8,X9],
 [X1,X2,X3, 0,X4,X6, X7,X8,X9]).
move_left([X1,X2,X3, X4,X5,0, X7,X8,X9],
 [X1,X2,X3, X4,0,X5, X7,X8,X9]).

% move_left in the bottom row
move_left([X1,X2,X3, X4,X5,X6, X7,0,X9],
 [X1,X2,X3, X4,X5,X6, 0,X7,X9]).
move_left([X1,X2,X3, X4,X5,X6, X7,X8,0],
 [X1,X2,X3, X4,X5,X6, X7,0,X8]).

% move_right in the top row
move_right([0,X2,X3, X4,X5,X6, X7,X8,X9],
 [X2,0,X3, X4,X5,X6, X7,X8,X9]).
move_right([X1,0,X3, X4,X5,X6, X7,X8,X9],
 [X1,X3,0, X4,X5,X6, X7,X8,X9]).

% move_right in the middle row
move_right([X1,X2,X3, 0,X5,X6, X7,X8,X9],
 [X1,X2,X3, X5,0,X6, X7,X8,X9]).
move_right([X1,X2,X3, X4,0,X6, X7,X8,X9],
 [X1,X2,X3, X4,X6,0, X7,X8,X9]).

% move_right in the bottom row
move_right([X1,X2,X3, X4,X5,X6, 0,X8,X9],
 [X1,X2,X3, X4,X5,X6, X8,0,X9]).
move_right([X1,X2,X3, X4,X5,X6, X7,0,X9],
 [X1,X2,X3, X4,X5,X6, X7,X9,0]).

% move_up from the middle row
move_up([X1,X2,X3, 0,X5,X6, X7,X8,X9],
 [0,X2,X3, X1,X5,X6, X7,X8,X9]).
move_up([X1,X2,X3, X4,0,X6, X7,X8,X9],
 [X1,0,X3, X4,X2,X6, X7,X8,X9]).
move_up([X1,X2,X3, X4,X5,0, X7,X8,X9],
 [X1,X2,0, X4,X5,X3, X7,X8,X9]).

% move_up from the bottom row
move_up([X1,X2,X3, X4,X5,X6, 0,X8,X9],
 [X1,X2,X3, 0,X5,X6, X4,X8,X9]).
move_up([X1,X2,X3, X4,X5,X6, X7,0,X9],
 [X1,X2,X3, X4,0,X6, X7,X5,X9]).
move_up([X1,X2,X3, X4,X5,X6, X7,X8,0],
 [X1,X2,X3, X4,X5,0, X7,X8,X6]).

% move_down from the top row
move_down([0,X2,X3, X4,X5,X6, X7,X8,X9],
 [X4,X2,X3, 0,X5,X6, X7,X8,X9]).
move_down([X1,0,X3, X4,X5,X6, X7,X8,X9],
 [X1,X5,X3, X4,0,X6, X7,X8,X9]).
move_down([X1,X2,0, X4,X5,X6, X7,X8,X9],
 [X1,X2,X6, X4,X5,0, X7,X8,X9]).

% move_down from the middle row
move_down([X1,X2,X3, 0,X5,X6, X7,X8,X9],
 [X1,X2,X3, X7,X5,X6, 0,X8,X9]).
move_down([X1,X2,X3, X4,0,X6, X7,X8,X9],
 [X1,X2,X3, X4,X8,X6, X7,0,X9]).
move_down([X1,X2,X3, X4,X5,0, X7,X8,X9],
 [X1,X2,X3, X4,X5,X9, X7,X8,0]). 

apply(left,S1,S2) :- move_left(S1,S2).
apply(right,S1,S2) :- move_right(S1,S2).
apply(up,S1,S2) :- move_up(S1,S2).
apply(down,S1,S2) :- move_down(S1,S2). 


selectNode([],A,B,Checked):-!.

selectNode([node(ChildNode,Moves)|T],PrvsScore,Select,Queue) :-
	goal(G), 
	misplace(ChildNode,G,Score),
	(
	(((PrvsScore > Score),not(member(node(ChildNode,_),Queue))
	),
		append(Queue,[node(ChildNode,Moves)],Checked),
		selectNode(T,Score,[ChildNode,Moves],Checked),Select = [ChildNode,Moves])
		;
		(selectNode(T,PrvsScore,Select,Queue))
	).

	
operators([left, right, up, down]).
% main procedure for breadth first search
bfs(Path) :-
	initial(X),
	bfs_path([node(X,[])], Path).

% breadth_first search
bfs_path([node(State,Path) | _], Path) :-
		goal(State).

bfs_path([node(State, Path) | Queue], GoalPath) :-
		findall(node(Child,PathToChild),
		(
		apply(Operator, State, Child),
		append(Path,[Operator],PathToChild)
		), ChildNodes),
		selectNode(ChildNodes,100,[ChildNode,Move|_],Queue),
		append([node(ChildNode,Move)],[node(State,Path)], NewQueue),
		bfs_path(NewQueue, GoalPath). 
