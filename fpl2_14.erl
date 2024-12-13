-module(fpl2_14).
-export([task/1]).

% Написати дублікатор усіх елементів списку:
task(List) ->
    duplicate(List, []).

% Рекурсивна допоміжна функція
duplicate([], Acc) ->
    % Повертає результат у правильному порядку
    lists:reverse(Acc); 
duplicate([H | T], Acc) ->
    % Додає елемент двічі до акумулятора
    duplicate(T, [H, H | Acc]). 