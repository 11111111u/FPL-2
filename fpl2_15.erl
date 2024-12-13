-module(fpl2_15).
-export([task/2]).

% Написати функцію-реплікатор всіх елементів вхідного списку:
task(List, N) when N >= 0 ->
    replicate_helper(List, N, []).

% Рекурсивна допоміжна функція
replicate_helper([], _, Acc) ->
    % Повертає результат у правильному порядку
    lists:reverse(Acc); 
replicate_helper([H | T], N, Acc) ->
    replicate_helper(T, N, add(repeat(H, N), Acc)).

% Функція для повторення елемента задану кількість разів
repeat(_, 0) ->
    [];
repeat(Element, Count) ->
    [Element | repeat(Element, Count - 1)].

% Функція для об'єднання двох списків
add([], L) ->
    L;
add([H | T], L) ->
    [H | add(T, L)].