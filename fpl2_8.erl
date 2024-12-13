-module(fpl2_8).
-export([task/1]).

% Видалити послідовні дублікати:
task(List) ->
    helper(List, []).

% Допоміжна функція, яка використовує акумулятор
helper([], Acc) ->
    % Повертається результат у правильному порядку
    lists:reverse(Acc); 
helper([H | T], []) ->
    % Перший елемент завжди додається до акумулятора
    helper(T, [H]); 
helper([H | T], [Prev | _] = Acc) when H =:= Prev ->
    % Пропускає дублікати
    helper(T, Acc); 
helper([H | T], Acc) ->
    % Додається унікальний елемент до акумулятора
    helper(T, [H | Acc]). 