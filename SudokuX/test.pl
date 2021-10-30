:- use_module(library(clpfd)).



%objetivo: Obtener una lista de 2 numeros entre 1 y 9, una posición xy
%entrada:Un almacenador de lista
%salida:Una lista de 2 digitos random
%restricciones:NA

randomSugerencia(R):-
        randseq(1,9,R1),
        randseq(1,9,R2),
        my_append(R1,R2,R).

%objetivo:Copiar 2 listas en una sola lista
%entrada:2 listas y un resultado
%salida:una lista con los elementos de las 2 listas
%restricciones:que las entradas sean 2 listas


my_append([], Cs, Cs).

my_append([A|As],Bs,[A|Cs]):-
          my_append(As, Bs, Cs).

%objetivo:verificar que 2 numeros sean iguales o diferentes
%entrada:2 numeros y un almacenador
%salida:1 si los numeros son iguales 0 si son diferentes
%restricciones:NA


iguales(A,B,R):-
        A =\= B,
        R is 0.
iguales(A,B,R):-
        A=B,
        R is 1.

%objetivo:Verificar cuantos elementos de 2 listas son iguales
%entrada:2 listas de 9 elementos
%salida:un numero con la cantidad de elementos iguales entre las dos
%listas restricciones:que las dos listas tengan 9 elementos


similitudFilas([A,B,C,D,E,F,G,H,I],[A1,B1,C1,D1,E1,F1,G1,H1,I1],R):-
        iguales(A,A1,Q1),
        iguales(B,B1,Q2),
        iguales(C,C1,Q3),
        iguales(D,D1,Q4),
        iguales(E,E1,Q5),
        iguales(F,F1,Q6),
        iguales(G,G1,Q7),
        iguales(H,H1,Q8),
        iguales(I,I1,Q9),
        R is Q1+Q2+Q3+Q4+Q5+Q6+Q7+Q8+Q9.

%objetivo:Obtener el numero de elementos similares entre 2 matrices 9x9
%entrada:2 matrices 9x9
%salida:un numero con la cantidad de elementos iguales en ambas matrices
%restricciones:que las entradas sean 2 matrices 9x9


similitudMatrices([A,B,C,D,E,F,G,H,I],[A1,B1,C1,D1,E1,F1,G1,H1,I1],R):-
        similitudFilas(A,A1,Q1),
        similitudFilas(B,B1,Q2),
        similitudFilas(C,C1,Q3),
        similitudFilas(D,D1,Q4),
        similitudFilas(E,E1,Q5),
        similitudFilas(F,F1,Q6),
        similitudFilas(G,G1,Q7),
        similitudFilas(H,H1,Q8),
        similitudFilas(I,I1,Q9),
        R is Q1+Q2+Q3+Q4+Q5+Q6+Q7+Q8+Q9.

 /*----------------------------------------------------*/

%objetivo:Verificar cuantos ceros hay en una matriz
%entrada:una lista
%salida:la cantidad de ceros dentro de la lista
%restricciones:que la entrada sea unamatriz 9x9

verificarEspaciosLibres([A,B,C,D,E,F,G,H,I],R):-
        verificaListaCero(A,P1),
        verificaListaCero(B,P2),
        verificaListaCero(C,P3),
        verificaListaCero(D,P4),
        verificaListaCero(E,P5),
        verificaListaCero(F,P6),
        verificaListaCero(G,P7),
        verificaListaCero(H,P8),
        verificaListaCero(I,P9),
        R is P1+P2+P3+P4+P5+P6+P7+P8+P9.

%objetivo:Verificar cuantos ceros tiene una lista
%entrada:Una lista
%salida:Cantidad de ceros de la lista
%restricciones:Que la entrada sea de 9 elementos


verificaListaCero([A,B,C,D,E,F,G,H,I],R):-
        esCero(A,R1),
        esCero(B,R2),
        esCero(C,R3),
        esCero(D,R4),
        esCero(E,R5),
        esCero(F,R6),
        esCero(G,R7),
        esCero(H,R8),
        esCero(I,R9),
        R is R1+R2+R3+R4+R5+R6+R7+R8+R9.

%objetivo:Verificar si un numero es cero
%entrada:un numero
%salida:Si el numero es un cero devuelve un 1 sino un 0
%restricciones:NA


esCero(A,R):-
        A =\= 0,
        R is 0.

esCero(A,R):-
        A = 0,
        R is 1.

/*------------------------------------------------------*/

%objetivo:Generar una matriz con las pistas para el tablero
%entrada:NA
% salida:Devuelve una matriz de 9 listas cada lista con 3 numeros del 1
% al 9
%restricciones:NA


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

%objetivo:crear una lista de n elementos del 1 al 9
%entrada:un n
%salida:una lista con 3 elementos del 1 al 9
%restricciones:que la entrada sea un numero


crearLista1_9(I,R):-
        randseq(I, 9, R).

%objetivo:Solucionar matrices de sudoku X
%entrada:Una matriz de elementos
%salida:Una matriz de numeros de tipo sudoku X
%restricciones:NA


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

%objetivo:Obtener un elemento Pos de una lista
%entrada:Una lista 2 posiciones
%salida:El elemento de la posicion de la lista
%restricciones:que sus entradas sean una lista de numeros y 2 posiciones


obtenerElemento([_|L],Pos,PosAct,R):-
     Pos =\= PosAct,
     Pos1 is PosAct+1,
     obtenerElemento(L,Pos,Pos1,R).

obtenerElemento([H|_],Pos,PosAct,R):-
     Pos = PosAct,
     label([H]),
     write(H),
     R is H.

%objetivo:Verificar que los elementos de una cuadricula no se repitan,
%así como los elementos de una lista y una columna
%entrada:3 listas
%salida:True si todos los elementos son distintos
%restricciones:Que las listas sean de 9 elementos cada una.


blocks([], [], []):-!.

blocks([N1,N2,N3|Ns1], [N4,N5,N6|Ns2], [N7,N8,N9|Ns3]) :-
        all_different([N1,N2,N3,N4,N5,N6,N7,N8,N9]),
        blocks(Ns1, Ns2, Ns3).



%objetivo:Validar las posiciones de la X de una matriz de sudoku
%entrada:Dos matrices
%salida:True si lasvalidaciones están bien y los numeros no chocan
%restricciones:Que las dos matrices sean 9x9

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

% objetivo:Validar que un numero en x posicion de una lista no esté en
% la misma posicion que otra lista
% entrada: salida: restricciones:Que las entradas sean un numero una
% posicion, una lista y una posicion pibote


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
   Se utilizan estas plantillas para acelerar el proceso de aleatoriedad.
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

problem8(8, P) :-
        P = [[3,1,_,_,8,9,_,_,7],
             [5,9,_,1,_,7,_,2,_],
             [7,_,2,_,6,_,4,_,9],
             [8,_,1,_,2,_,_,9,_],
             [_,7,_,_,1,_,2,5,_],
             [_,6,_,9,7,_,3,8,_],
             [1,3,_,7,_,2,_,4,_],
             [_,_,9,8,_,6,_,7,_],
             [6,_,7,_,5,_,_,3,_]],!.

problem9(9, P) :-
        P = [[6,7,_,_,8,4,_,_,3],
             [5,1,_,6,_,7,_,8,_],
             [8,_,9,_,2,_,6,_,7],
             [1,_,7,_,6,_,_,_,5],
             [_,3,_,_,5,_,7,6,_],
             [_,6,_,4,7,_,1,2,_],
             [3,5,_,7,_,2,_,9,_],
             [_,_,8,9,_,6,_,7,_],
             [7,_,6,_,1,_,_,3,_]],!.

problem10(10, P) :-
        P = [[2,9,_,_,7,4,_,_,3],
             [3,4,_,1,_,2,_,8,_],
             [1,_,8,_,3,_,6,_,2],
             [8,_,1,_,4,_,_,7,_],
             [_,3,_,_,5,_,8,6,_],
             [_,6,_,7,8,_,9,2,_],
             [6,5,_,4,_,7,_,3,_],
             [_,_,3,5,_,8,_,9,_],
             [4,_,9,_,1,_,_,5,_]],!.

problem11(11, P) :-
        P = [[3,5,_,9,_,4,_,_,7],
             [1,9,_,_,5,_,4,6,_],
             [7,4,_,6,_,_,5,_,9],
             [2,1,_,_,3,_,6,_,5],
             [_,6,3,_,1,_,_,8,_],
             [_,8,7,_,_,6,3,9,_],
             [6,_,4,_,_,5,2,_,3],
             [8,_,_,_,_,2,_,_,6],
             [_,_,5,1,_,_,_,7,_]],!.

problem12(12, P) :-
        P = [[7,8,9,_,_,2,_,_,_],
             [5,1,_,_,4,_,7,8,_],
             [3,4,_,_,_,9,5,_,2],
             [2,5,_,_,_,1,4,_,_],
             [_,3,4,_,2,_,_,9,_],
             [_,9,1,_,_,5,8,_,7],
             [_,6,3,_,_,4,_,5,_],
             [4,_,5,_,_,8,_,_,1],
             [9,_,8,1,_,_,_,7,_]],!.


problem13(13, P) :-
        P = [[8,1,2,_,_,5,_,6,_],
             [3,7,_,_,_,_,2,_,8],
             [5,9,_,_,_,2,4,1,_],
             [2,4,_,_,_,3,5,_,_],
             [6,_,_,8,2,_,_,4,_],
             [_,_,9,_,_,4,1,_,2],
             [_,6,_,5,_,8,_,2,_],
             [9,_,5,_,1,7,_,_,4],
             [1,_,3,4,_,_,_,7,_]],!.