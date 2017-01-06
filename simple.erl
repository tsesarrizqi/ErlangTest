-module(simple). 
-import(io, [fwrite/2, fwrite/1]).
-import(lists, [merge/1, nthtail/2, sublist/2]).
-compile(export_all).
-define(init(X,Y),sublist(X,Y)).
-define(tail(X,Y),nthtail(X,Y)).

mergeSort([]) -> [];
mergeSort([X|[]]) -> [X];
mergeSort(L) ->
	Mid = length(L) div 2,
	L1 = ?init(L,Mid),
	L2 = ?tail(Mid,L),
	mymerge(mergeSort(L1),mergeSort(L2)).

mymerge(L,[]) -> L;
mymerge([],L) -> L;
mymerge([X|Xs],[Y|Ys]) -> 
	if
		X =< Y -> [X|mymerge(Xs,[Y|Ys])];
		true -> [Y|mymerge([X|Xs],Ys)]
	end.