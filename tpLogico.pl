%pareja(Persona, Persona)
pareja(marsellus, mia).
pareja(pumkin,honeyBunny).
pareja(bernardo,bianca).
pareja(bernardo,charo).
 
%trabajaPara(Empleador, Empleado)
trabajaPara(marsellus, vincent).
trabajaPara(marsellus, jules).
trabajaPara(marsellus, winston).

%encargo(Solicitante, Encargado, Tarea)
encargo(marsellus, vincent,   cuidar(mia)).
encargo(vincent,  elVendedor, cuidar(mia)).
encargo(marsellus, winston, ayudar(jules)).
encargo(marsellus, winston, ayudar(vincent)).
encargo(marsellus, vincent, buscar(butch, losAngeles)).
encargo(bernardo, vincent, buscar(jules, fuerteApache)).
encargo(bernardo, winston, buscar(jules, sanMartin)).
encargo(bernardo, winston, buscar(jules, lugano)).

%personaje(Nombre, Ocupacion)
personaje(pumkin,     ladron([estacionesDeServicio, licorerias])).
personaje(honeyBunny, ladron([licorerias, estacionesDeServicio])).
personaje(vincent,    mafioso(maton)).
personaje(jules,      mafioso(maton)).
personaje(marsellus,  mafioso(capo)).
personaje(winston,    mafioso(resuelveProblemas)).
personaje(mia,        actriz([foxForceFive])).
personaje(butch,      boxeador).
personaje(bernardo,   mafioso(cerebro)).
personaje(bianca,     actriz([elPadrino1])).
personaje(elVendedor, vender([humo, iphone])).
personaje(jimmie,     vender([auto])).

%tarea(Accion,Detalle)
tarea(cuidar(mia)).
tarea(ayudar(jules)).
tarea(ayudar(vincent)).
tarea(buscar(butch, losAngeles)).
tarea(buscar(jules, fuerteApache)).
tarea(buscar(jules, sanMartin)).
tarea(buscar(jules, lugano)).

%amigo(persona, otraPersona)
amigo(vincent, jules).
amigo(jules, jimmie).
amigo(vincent, elVendedor).

trabajaPara(Empleado2,bernardo):-
	trabajaPara(marsellus,Empleador2),
	trabajaPara(Empleador2,bernardo),
	Empleador2 \= jules.
	
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
	
esPeligroso(Personaje):-
	personaje(Personaje,Ocupacion),
	malaOcupacion(Ocupacion).

esPeligroso(Personaje):-
	trabajaPara(Empleador,Personaje),
	jefePeligroso(Empleador).

malaOcupacion(mafioso(maton)).

malaOcupacion(ladron(Lugares)):-
	member(licorerias,Lugares).

jefePeligroso(Personaje):-
	esPeligroso(Personaje).

sanCayetano(Personaje):-
	estaCerca(Personaje, Cercano),
	forall(encargo(Personaje, Cercano, _), estaCerca(Personaje, Cercano)).

estaCerca(Personaje, Cercano):-
	estanRelacionados(Personaje, Cercano),
	estanRelacionados(Cercano, Personaje).

nivelRespeto(Personaje,Nivel):-
	personaje(Personaje,Ocupacion),
	respetoPorOcupacion(Ocupacion,Nivel).

respetoPorOcupacion(actriz(Peliculas),Nivel):-
	length(Peliculas, CantPeliculas),
	Nivel is CantPeliculas/10.

respetoPorOcupacion(mafioso(Tipo),Nivel):-
	tipoDeMafioso(Tipo,Nivel).

tipoDeMafioso(capo,20).
tipoDeMafioso(resuelveProblemas,10).

nivelRespeto(vincent, 15).

respetibilidad(CantRespetables, CantNoRespetables):-
	nivelRespeto(Personaje, Nivel),
	findall(Personaje, Nivel>9, Respetables),
	findall(Personaje, Nivel<10, NoRespetables),
	length(Respetables, CantRespetables),
	length(Respetables, CantNoRespetables).
