-module(fpl2_11).
-export([task/1]).

% Закодувати список за допомогою модифікованого алгоритму RLE:
task(List) ->
    Packed = pack(List),
    encode_packed_modified(Packed).

% Функція для пакування послідовних дублікатів
pack(List) ->
    pack_helper(List, [], []).

% Рекурсивна допоміжна функція для пакування
pack_helper([], [], Acc) ->
    lists:reverse(Acc);
pack_helper([], Group, Acc) ->
    lists:reverse([lists:reverse(Group) | Acc]);
pack_helper([H | T], [H | Group], Acc) ->
    pack_helper(T, [H | Group], Acc);
pack_helper([H | T], Group, Acc) ->
    pack_helper(T, [H], [lists:reverse(Group) | Acc]).

% Перетворення упакованих даних у модифікований RLE формат
encode_packed_modified([]) ->
    [];
encode_packed_modified([[H | T] | Rest]) ->
    case length([H | T]) of
        1 -> [H | encode_packed_modified(Rest)]; % Якщо довжина групи 1, додається сам елемент
        Count -> [{Count, H} | encode_packed_modified(Rest)] % Інакше додається кортеж
    end.