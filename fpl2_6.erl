-module(fpl2_6).
-export([task/1]).

% Визначити, чи є список паліндромом:
task(List) ->
    List =:= reverse(List).

% Функція для перевертання списку
reverse(List) -> 
    reverse2(List, []).

% Рекурсивне перевертання списку
reverse2([], Acc) -> 
    Acc;
reverse2([H | T], Acc) -> 
    reverse2(T, [H | Acc]).