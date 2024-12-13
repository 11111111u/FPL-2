-module(fpl2_12).
-export([task/1]).

% Написати декодер для модифікованого алгоритму RLE:
task(Encoded) ->
    decode_helper(Encoded, []).

% Рекурсивна допоміжна функція
decode_helper([], Acc) ->
    % Повертає результат у правильному порядку
    lists:reverse(Acc); 
decode_helper([{Count, Element} | T], Acc) ->
    % Розгортає кортеж і додає до акумулятора
    decode_helper(T, add(repeat(Element, Count), Acc)); 
decode_helper([Element | T], Acc) ->
    % Додає одиночний елемент до акумулятора
    decode_helper(T, [Element | Acc]). 

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