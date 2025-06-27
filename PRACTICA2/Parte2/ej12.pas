{a. Realizar un módulo que calcule el rendimiento económico de una plantación de soja. El módulo debe
recibir la cantidad de hectáreas (ha) sembradas, el tipo de zona de siembra (1: zona muy fértil, 2: zona
estándar, 3: zona árida) y el precio en U$S de la tonelada de soja; y devolver el rendimiento económico
esperado de dicha plantación. Para calcular el rendimiento económico esperado debe considerar el siguiente
rendimiento por tipo de zona:
Tipo de zona Rendimiento por ha
		1: 6   toneladas por ha
		2: 2,6 toneladas por ha
		3: 1,4 toneladas por ha
b. ARBA desea procesar información obtenida de imágenes satelitales de campos sembrados con soja en la
provincia de Buenos Aires. De cada campo se lee: localidad, cantidad de hectáreas sembradas y el tipo de
zona (1, 2 ó 3). La lectura finaliza al leer un campo de 900 ha en la localidad ‘Saladillo’, que debe procesarse.
El precio de la soja es de U$S320 por tn. Informar:
● La cantidad de campos de la localidad Tres de Febrero con rendimiento estimado superior a U$S
10.000.
● La localidad del campo con mayor rendimiento económico esperado.
● La localidad del campo con menor rendimiento económico esperado.
● El rendimiento económico promedio.}
program ej12;
type
	unoatres = 1..3;
function rendimiento (cantidadha:integer;zona:unoatres): real;
	var
		aux:real;
	begin
		case zona of
			1: aux:= 6 * 320 * (cantidadha);
			2: aux:= 2.6 * 320 * (cantidadha);
			3: aux:= 1.4 * 320 * (cantidadha);
		end;
		rendimiento:=aux;
	end;
function condicionfinal (ha:integer; localidad:string): boolean;
	begin
		condicionfinal:= ((ha=900) and (localidad='Saladillo'));
	end;
function promedio (total,cant: real):real;
	begin
		promedio:=total/cant;
	end;
procedure tdf (hectareas:integer;rendimiento: real;var cantidad: integer);
	begin
		if (rendimiento>10000) then
			cantidad+=hectareas;
	end;
procedure maximo (localidad: string;rendimiento: real;var locmax: string; var max: real);
	begin
		if (rendimiento>max) then begin
			max:=rendimiento;
			locmax:=localidad;
		end;
	end;
procedure minimo (localidad: string;rendimiento: real;var locmin: string; var min: real);
	begin
		if (rendimiento<min) then begin
			min:=rendimiento;
			locmin:=localidad;
		end;
	end;
var
	localidad,localidadmax,localidadmin:string;
	total,cant,max,min: real;
	hectareas,tresdefebrero: integer;
	zona: unoatres;
BEGIN
	total:=0;
	cant:=0;
	max:=-1;
	min:=32000;
	tresdefebrero:=0;
	repeat
		writeln('Ingrese la localidad:');
		readln(localidad);
		writeln ('Ingrese la cantidad de hectareas sembradas:');
		readln(hectareas);
		writeln ('Ingrese el tipo de zona de siembra (1,2 o 3):');
		readln(zona);
		writeln('En ',localidad,' se ganaron ',rendimiento(hectareas,zona):0:2,' dolares.');
		total+=rendimiento(hectareas,zona);
		if (localidad = 'Tres de Febrero') then
			tdf(hectareas,rendimiento(hectareas,zona),tresdefebrero);
		maximo(localidad,rendimiento(hectareas,zona),localidadmax,max);
		minimo(localidad,rendimiento(hectareas,zona),localidadmin,min);
		cant+=1;
	until(condicionfinal(hectareas,localidad));
		writeln('La cantidad de hectareas de campos de Tres de Febrero con rendimiento estimado superior a U$S 10.000 es de ',tresdefebrero,'.');
		writeln('Localidad del campo con mejor rendimiento economico: ',localidadmax);
		writeln('Localidad del campo con menor rendimiento economico: ',localidadmin);
		writeln('Rendimiento promedio general: ',promedio(total,cant):0:2);
END.
