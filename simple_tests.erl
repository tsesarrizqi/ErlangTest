-module(simple_tests). 
-include_lib("eunit/include/eunit.hrl").
-define(setup(F), {setup, fun start/0, fun stop/1, F}).

start() ->
	[lists:sort(X) || 
		X <- [[],
			  [3],
			  [3,3],
			  [1,2,4,4,5],
			  [2,3,3,5,6],
			  [10,9,8,7,6,5,4,3,2,1]]].
stop(_) ->
	ok.

mergeSort_test_() -> 
	[{"Is the order of elements same with the order of elements from default sort function", 
	 ?setup(fun([A|[B|[C|[D|[E|[F|_]]]]]]) -> 
	 	{inparallel, 
	 	 [sortTest1(A),
	 	  sortTest2(B),
	 	  sortTest3(C),
	 	  sortTest4(D),
	 	  sortTest5(E),
	 	  sortTest6(F)
	 	 ]} end)}].
sortTest1(List) -> [?_assertEqual(List, simple:mergeSort([]))].
sortTest2(List) -> [?_assertEqual(List, simple:mergeSort([3]))].
sortTest3(List) -> [?_assertEqual(List, simple:mergeSort([3,3]))].
sortTest4(List) -> [?_assertEqual(List, simple:mergeSort([1,2,4,4,5]))].
sortTest5(List) -> [?_assertEqual(List, simple:mergeSort([2,3,3,5,6]))].
sortTest6(List) -> [?_assertEqual(List, simple:mergeSort([10,9,8,7,6,5,4,3,2,1]))].
