/*
Autor : Yuri Domingos 
Data  : 13 - 11 - 2020
Objectivo : Resolver o clássico problema da arvore geneologica
Linguagem  : Prolog
*/


/*
Problema : 
O clássico  problema da familia pinheiro
*/

/* PROGENITORES EXISTENTES DA FAMÍLIA PINHEIRO */







progenitor(jose,joao).
progenitor(jose,ana).
progenitor(maria,joao).
progenitor(maria,ana).
progenitor(ana,helena).
progenitor(ana,joana).
progenitor(joao,mario).
progenitor(helena,carlos).
progenitor(mario,carlos).
progenitor(carlos,yuri).


/*------------ SEXO DAS PESSOAS  EXISTENTE NA FAMILIA PINHEIRO----*/

homem(jose).
homem(joao).
homem(carlos).
homem(mario).
homem(yuri). 


mulher(ana).
mulher(maria).
mulher(helena).
mulher(joana).



sexo(jose,masculino).
sexo(joao,masculino).
sexo(carlos,masculino).
sexo(mario,masculino).
sexo(yuri,masculino).

sexo(ana,feminino).
sexo(maria,feminino).
sexo(helena,feminino).
sexo(joana,feminino).



/* ------------- CONSTRUCAO DE REGRAS  ---------------------*/

pai(X,Y) :- sexo(X,masculino), progenitor(X,Y).

mae(X,Y) :- sexo(X,feminino), progenitor(X,Y).


/* ------------ A regra filho não foi solicitada, mas para facilitar a lógica do velho programdor, foi implementada */

filho(X,Y) :- sexo(X,masculino) , progenitor(Y,X).

filha(X,Y) :- sexo(X,feminino), progenitor(Y,X).

/*------------------------------------------------------------------------------------- */


irmao(X,Y) :- sexo(X,masculino), progenitor(Z,Y), progenitor(Z,X) , X \== Y.

irma(X,Y) :- sexo(X,feminino), progenitor(Z,Y),progenitor(Z,X), X \== Y.

primo(X,Y) :- sexo(X,masculino), progenitor(Z,X), irmao(Z,P), progenitor(P,Y).

prima(X,Y) :- sexo(X, feminino), progenitor(Z,X), irmao(Z,P), progenitor(P,Y).

tio(X,Y)   :- sexo(X,masculino) ,  progenitor(P,Y),  irmao(P,X). 

tia(X,Y)   :- sexo(X,feminino), progenitor(P,Y),  irma(P,X).


avo(X,Y)   :- sexo(X,masculino), progenitor(X,P), progenitor(P,Y).

bisavoHomem(X,Y) :- sexo(X,masculino), progenitor(X,P), avo(P,Y).

/*--------------- Clássica regra do descendente ( pesquisa recursiva com caso base    --------------------------------*/


descendente(X,Y):- progenitor(X,Y).

descendente(X,Y) :- progenitor(X,P) , descendente(P,Y).







