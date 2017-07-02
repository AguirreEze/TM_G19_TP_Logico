%pareja(Persona, Persona)
pareja(marsellus, mia).
pareja(pumkin,honeyBunny).
pareja(bernardo,bianca).
pareja(bernardo,charo).
 
%trabajaPara(Empleador, Empleado)
trabajaPara(marsellus, vincent).
trabajaPara(marsellus, jules).
trabajaPara(marsellus, winston).

trabajaPara(_,bernardo):-
	trabajaPara(marsellus,Empleador2),
	trabajaPara(Empleador2,bernardo),
	Empleador2 /= jules.
	
trabajaPara(Empleador,george):-
	pareja(bernardo,Empleador).


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
