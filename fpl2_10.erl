-module(fpl2_10).
-export([task/1]).

% Закодувати список за допомогою алгоритму RLE:
task(List) ->
    Packed = pack(List),
    packed(Packed).

% Функція для пакування послідовних дублікатів
pack(List) ->
    pack_helper(List, [], []).

% Рекурсивна функція для пакування
pack_helper([], [], Acc) ->
    lists:reverse(Acc);
pack_helper([], Group, Acc) ->
    lists:reverse([lists:reverse(Group) | Acc]);
pack_helper([H | T], [H | Group], Acc) ->
    pack_helper(T, [H | Group], Acc);
pack_helper([H | T], Group, Acc) ->
    pack_helper(T, [H], [lists:reverse(Group) | Acc]).

% Перетворення даних у RLE формат
packed([]) ->
    [];
packed([[H | T] | Rest]) ->
    [{length([H | T]), H} | packed(Rest)].