-module(simple_tests). 
-include_lib("eunit/include/eunit.hrl").

call_mergeSort_test() -> simple:mergeSort([]). 
mergeSort_test_() -> 
	[?_assert(simple:mergeSort(X) =:= lists:sort(X)) || 
		X <- [[],
			  [3],
			  [3,3],
			  [1,2,4,4,5],
			  [2,3,3,5,6],
			  [10,9,8,7,6,5,4,3,2,1]]].