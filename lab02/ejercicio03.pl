%verifica que una reina no ataque a otras
seguro(_, []).
seguro(Fila, [FilaExistente|Resto]) :-
    Fila =\= FilaExistente,
    abs(Fila - FilaExistente) =\= length(Resto) + 1,
    seguro(Fila, Resto).

%cenera siguiente estado
siguiente_estado(EstadoActual, [Fila|EstadoActual]) :-
    length(EstadoActual, N),
    N < 8,
    between(1, 8, Fila),
    seguro(Fila, EstadoActual).

%DFS
dfs(Estado, _, Estado) :-
    length(Estado, 8).

dfs(EstadoActual, Visitados, Solucion) :-
    siguiente_estado(EstadoActual, EstadoSiguiente),
    \+ member(EstadoSiguiente, Visitados),
    dfs(EstadoSiguiente,
        [EstadoSiguiente | Visitados],
        Solucion).

solucion(Solucion) :-
    EstadoInicial = [],
    dfs(EstadoInicial, [EstadoInicial], Solucion).


%CONSULTA DE PRUEBA
%solucion(S).
%S = [1,5,8,6,3,7,2,4].
