-module(fpl2_13).
-export([task/1]).

% Написати декодер для стандартного алгоритму RLE:
task(Encoded) ->
    decode_helper(Encoded, []).

% Рекурсивна допоміжна функція
decode_helper([], Acc) ->
    % Повертає результат у правильному порядку
    lists:reverse(Acc); 
decode_helper([{Count, Element} | T], Acc) ->
    decode_helper(T, add(repeat(Element, Count), Acc)).

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