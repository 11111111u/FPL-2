-module(fpl2_9).
-export([task/1]).

% Запакувати послідовні дублікати у вкладені списки:
task(List) ->
    helper(List, [], []).

    % Якщо список порожній, то додається остання група до результату
helper([], [], Acc) ->
    lists:reverse(Acc); % Якщо список і група порожні результат повертається
helper([], Group, Acc) ->
    % Додаємо останню групу і повертаємо результат
    lists:reverse([lists:reverse(Group) | Acc]); 
    % Якщо елемент належить до поточної групи
helper([H | T], [H | Group], Acc) ->
    helper(T, [H | Group], Acc);
    % Якщо елемент не належить до поточної групи, то група завершується і починається нова
helper([H | T], Group, Acc) ->
    helper(T, [H], [lists:reverse(Group) | Acc]).