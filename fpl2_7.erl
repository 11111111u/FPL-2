-module(fpl2_7).
-export([task/1]).

% Вирівняти структуру із вкладеними списками:
task(List) ->
    % helper(List, []).

    % Через використання акумулятора результат буде у зворотному порядк
    lists:reverse(helper(List, [])). 

% Допоміжна функція, яка використовує акумулятор
helper([], Acc) -> 
    % Якщо список порожній, повертається акумулятор
    Acc; 
helper([H | T], Acc) when is_list(H) -> 
    % Якщо елемент список, то він розгортається
    helper(T, helper(H, Acc)); 
helper([H | T], Acc) -> 
    helper(T, [H | Acc]); 
    % Якщо елемент не список, то елемент додаэться до акумулятора
helper(NonList, Acc) -> 
    % Якщо наданий не список
    [NonList | Acc]. 