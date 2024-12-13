-module(fpl2_2).
-export([task/1]).

% Знайти два останніх елементи списку:
task([A, B]) -> 
    % Якщо список має лише два елементи - це два останніх елемента
    [A, B];
task([_ | T]) -> 
    % Рекурсивно обходимо список
    task(T); 
task([]) -> 
    error(empty_list).