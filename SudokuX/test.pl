
:- use_module(library(clpfd)).

matrizPistas(R):-
        crearLista1_9(2,P1),
        crearLista1_9(2,P2),
        crearLista1_9(2,P3),
        crearLista1_9(2,P4),
        crearLista1_9(2,P5),
        crearLista1_9(2,P6),
        crearLista1_9(2,P7),
        crearLista1_9(2,P8),
        crearLista1_9(2,P9),
        R = [P1,P2,P3,P4,P5,P6,P7,P8,P9].

crearLista1_9(I,R):-
        randseq(I, 9, R).

sudoku(Rowx) :-
        length(Rowx, 9),
        maplist(same_length(Rowx), Rowx),!,
        append(Rowx, Vs), Vs ins 1..9,
        maplist(all_distinct, Rowx),!,
        transpose(Rowx, Columns),
        maplist(all_distinct, Columns),!,
        Rowx = [As,Bs,Cs,Ds,Es,Fs,Gs,Hs,Is],

        obtenerElemento(As,1,1,P1),
        obtenerElemento(Bs,2,1,P2),
        obtenerElemento(Cs,3,1,P3),

        obtenerElemento(Ds,4,1,P4),
        obtenerElemento(Es,5,1,P5),
        obtenerElemento(Fs,6,1,P6),

        obtenerElemento(Gs,7,1,P7),
        obtenerElemento(Hs,8,1,P8),
        obtenerElemento(Is,9,1,P9),

        Lista=[P1,P2,P3,P4,P5,P6,P7,P8,P9],

        obtenerElemento(As,9,1,Q9),
        obtenerElemento(Bs,8,1,Q8),
        obtenerElemento(Cs,7,1,Q7),

        obtenerElemento(Ds,6,1,Q6),
        obtenerElemento(Es,5,1,Q5),
        obtenerElemento(Fs,4,1,Q4),

        obtenerElemento(Gs,3,1,Q3),
        obtenerElemento(Hs,2,1,Q2),
        obtenerElemento(Is,1,1,Q1),

        Lista2=[Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9],
        all_different(Lista),
        all_different(Lista2),
        validarX(Lista,Lista2),
        blocks(As, Bs, Cs),
        blocks(Ds, Es, Fs),
        blocks(Gs, Hs, Is).

obtenerElemento([_|L],Pos,PosAct,R):-
     Pos =\= PosAct,
     Pos1 is PosAct+1,
     obtenerElemento(L,Pos,Pos1,R).

obtenerElemento([H|_],Pos,PosAct,R):-
     Pos = PosAct,
     label([H]),
     write(H),
     R is H.

blocks([], [], []):-!.

blocks([N1,N2,N3|Ns1], [N4,N5,N6|Ns2], [N7,N8,N9|Ns3]) :-
        all_different([N1,N2,N3,N4,N5,N6,N7,N8,N9]),
        blocks(Ns1, Ns2, Ns3).




validarX([A,B,C,D,_,F,G,H,I|_] ,Lista2):-
     validarPos(A,1,Lista2,1),
     validarPos(A,9,Lista2,1),
     validarPos(B,2,Lista2,1),
     validarPos(B,8,Lista2,1),
     validarPos(C,3,Lista2,1),
     validarPos(C,7,Lista2,1),
     validarPos(D,4,Lista2,1),
     validarPos(D,6,Lista2,1),
     validarPos(F,4,Lista2,1),
     validarPos(F,6,Lista2,1),
     validarPos(G,3,Lista2,1),
     validarPos(G,7,Lista2,1),
     validarPos(H,2,Lista2,1),
     validarPos(H,8,Lista2,1),
     validarPos(I,1,Lista2,1),
     validarPos(I,9,Lista2,1),

     !.

validarPos(Num,Pos,[_|X],PosAct):-
     Pos =\= PosAct,
     Pos1 is PosAct+1,
     validarPos(Num,Pos,X,Pos1).

validarPos(Num,Pos,[L|_],PosAct):-
     Pos = PosAct,
     Num =\= L,!.

validarPos(Num,Pos,[L|_],PosAct) :-
     Pos = PosAct,
     Num = L,fail.

/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   Matrices Disponibles para jugar con soluciones posiblemente diferentes
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

problem(1, P) :-
        P = [[1,3,5,4,_,_,2,8,7],
             [_,_,_,_,_,_,_,6,9],
             [_,_,6,_,_,_,1,_,3],
             [_,_,_,_,1,_,_,_,_],
             [_,1,7,_,3,_,_,4,5],
             [_,_,_,_,_,8,_,_,_],
             [_,_,4,8,_,_,5,_,2],
             [_,8,1,_,2,_,_,_,6],
             [2,_,_,_,9,_,_,_,4]],!.

problem1(1, P) :-
        P = [[1,2,3,4,5,_,_,_,9],
             [_,_,_,_,_,_,_,_,_],
             [_,_,6,_,_,_,1,_,3],
             [_,_,_,_,1,7,9,4,5],
             [_,1,_,_,3,_,_,6,8],
             [_,_,_,_,_,8,_,3,_],
             [_,_,4,8,_,_,5,1,_],
             [_,8,1,_,_,_,_,9,_],
             [2,_,_,9,7,_,_,_,4]],!.


problem2(2,P) :-
        P = [[6,4,7,2,9,_,1,_,_],
             [9,_,2,_,_,8,_,_,7],
             [_,_,_,4,1,_,_,2,_],
             [_,_,_,9,6,_,_,_,_],
             [2,_,1,5,_,_,6,8,9],
             [_,_,6,_,_,3,_,_,4],
             [_,2,_,8,_,6,5,_,_],
             [_,_,_,7,_,_,_,_,_],
             [4,8,9,_,5,1,_,_,2]],!.

problem3(1, P) :-
        P = [[4,2,_,1,_,7,5,9,_],
             [_,_,_,_,_,3,_,2,_],
             [_,_,_,9,_,_,4,6,_],
             [1,_,6,_,_,5,_,_,_],
             [2,_,3,_,_,6,1,_,_],
             [5,_,_,8,1,_,_,_,_],
             [_,_,1,_,_,_,7,_,_],
             [_,6,_,_,_,_,3,8,_],
             [7,3,_,_,_,_,_,1,6]],!.

problem4(1, P) :-
        P = [[1,4,5,_,3,_,7,_,9],
             [_,8,_,_,_,_,2,_,6],
             [6,3,2,9,7,_,1,_,5],
             [_,9,1,3,_,_,5,_,8],
             [3,_,8,_,5,_,_,_,4],
             [_,_,7,4,8,9,_,_,2],
             [9,_,_,8,_,_,4,_,3],
             [2,_,3,5,9,_,_,6,1],
             [_,_,_,6,_,_,_,_,7]],!.

problem5(5, P) :-
        P = [[9,_,_,_,3,4,_,_,8],
             [8,7,_,_,5,_,_,_,4],
             [2,3,4,_,_,_,5,_,_],
             [4,_,_,5,_,_,1,_,3],
             [_,6,_,4,_,3,_,8,_],
             [_,_,3,6,_,_,_,4,_],
             [6,_,_,8,_,_,_,_,9],
             [_,_,9,_,_,5,_,2,7],
             [_,_,_,3,_,_,_,1,6]],!.

problem6(6, P) :-
        P = [[8,1,_,_,3,6,_,_,4],
             [7,4,_,_,1,_,_,_,6],
             [5,6,_,4,_,_,1,_,_],
             [2,_,_,1,_,_,3,_,9],
             [_,9,_,7,_,3,_,1,_],
             [_,_,1,2,_,_,_,7,_],
             [3,_,7,_,_,4,_,_,1],
             [1,_,4,_,_,7,_,2,_],
             [_,_,6,3,_,_,_,4,7]],!.


problem7(7, P) :-
        P = [[5,1,_,_,7,6,_,_,9],
             [9,2,_,_,8,_,_,5,_],
             [4,8,_,5,_,_,1,_,_],
             [2,4,_,3,_,_,6,_,8],
             [_,6,5,_,_,1,_,3,_],
             [_,7,9,_,_,_,5,4,_],
             [1,_,8,_,_,2,_,_,4],
             [7,_,2,_,_,4,_,_,5],
             [_,_,4,8,_,_,_,2,7]],!.
