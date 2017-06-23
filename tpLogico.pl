%pareja(Persona, Persona)
pareja(marsellus, mia).
pareja(pumkin,honeyBunny).
pareja(bernardo,bianca).
pareja(bernardo,charo).
 
%trabajaPara(Empleador, Empleado)
trabajaPara(marsellus, vincent).
trabajaPara(marsellus, jules).
trabajaPara(marsellus, winston).
trabajaPara(vincent, bernardo).
trabajaPara(winston, bernardo).
trabajaPara(bianca, george).
trabajaPara(charo, george).


saleCon(Quien,Cual):-
	pareja(Quien,Cual).
	
saleCon(Quien,Cual):-
	pareja(Cual,Quien).


esFiel(Persona):-
	saleCon(Persona,_),
	not(tieneDosParejas(Persona)).

tieneDosParejas(Persona):-
	 saleCon(Persona,Pareja1),
	 saleCon(Persona,Pareja2),
	 Pareja1 \= Pareja2.

acataOrden(Empleador,Empleado):-
	estanRelacionados(Empleador,Empleado).

estanRelacionados(Empleador,Empleado):-
	trabajaPara(Empleador, Empleado).

estanRelacionados(Empleador1,Empleado):-
	trabajaPara(Empleador1, Empleador2),
	trabajaPara(Empleador2, Empleado).
