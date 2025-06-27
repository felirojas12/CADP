{Una empresa de transporte de caudales desea optimizar el servicio que brinda a sus clientes. Para ello,
cuenta con información sobre todos los viajes realizados durante el mes de marzo. De cada viaje se cuenta
con la siguiente información: día del mes (de 1 a 31), monto de dinero transportado y distancia recorrida por
el camión (medida en kilómetros).
a. Realizar un programa que lea y almacene la información de los viajes (a lo sumo 200). La lectura finaliza
cuando se ingresa una distancia recorrida igual a 0 km, que no debe procesarse. LISTO
b. Realizar un módulo que reciba el vector generado en a) e informe:
- El monto promedio transportado de los viajes realizados. LISTO
- La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero. LISTO
- La cantidad de viajes realizados cada día del mes. LISTO
c. Realizar un módulo que reciba el vector generado en a) y elimine todos los viajes cuya distancia
recorrida sea igual a 100 km.
Nota: para realizar el inciso b, el vector debe recorrerse una única vez.}

{declaracion de constantes y tipos:}
program ej3;
const
	df = 3;
	d = 31;
type
	mes = 1..d;
	viaje = record
		dia: mes;
		dinero: real;
		distancia: real;
	end;
	vmes = array [mes] of integer;
	vrecorridos = array [1..df] of viaje;

{declaracion de modulos:}
procedure inicializar (var v: vmes);
	var
		i: mes;
	begin
		for i:= 1 to d do
			v[i]:=0;
	end;
	
procedure leerRegistro (var v: viaje);
	begin
		write('Ingrese el dia del mes en que se realizo el viaje (del 1 al 31): ');
		readln(v.dia);
		write('Ingrese el dinero que se transporto en ese viaje: ');
		readln(v.dinero);
		write('Ingrese la distancia recorrida en kilometros: ');
		readln(v.distancia);
	end;

procedure cargarViajes(var v: vrecorridos; var dimL: integer);
	var
		vi: viaje;
	begin
		dimL:=0;
		writeln('========== Ingrese la informacion del servicio realizado ==========');
		leerRegistro(vi);
		while ((dimL<df) and ((vi.distancia)<>0)) do begin
			dimL+=1;
			v[dimL]:=vi;
			writeln('========== Ingrese la informacion del siguiente servicio realizado ==========');
			leerRegistro(vi);
		end;
	end;
	
procedure imprimirDias (dias: vmes);
	var
		i: mes;
	begin
		for i:= 1 to d do begin
			if (dias[i]<>0) then
				writeln('Dia ',i,': ',dias[i],' viajes.');
		end;
	end;
	
procedure maximo(dist: real; dia: mes; var min: real; var distmenos: real; var diamenos: mes);
	begin
		if (dist<min) then begin
			min:=dist;
			distmenos:= dist;
			diamenos:= dia;
		end;
	end;
	
procedure recorrer (var v: vrecorridos; var dimL: integer);
	var
		cantViajes: integer;
		monto,min,distmenos: real;
		i,diamenos: mes;
		y: vmes;
	begin
		min:=9999;
		monto:=0;
		cantViajes:= 0;
		inicializar(y);
		for i:= 1 to dimL do begin
			y[v[i].dia]+=1;
			monto+=v[i].dinero;
			cantViajes+=1;
			maximo(v[i].distancia,v[i].dia,min,distmenos,diamenos);
		end;
		imprimirDias(y);
		writeln('El monto promedio entre todos los viajes fue de ',(monto/cantViajes):0:2);
		writeln('El dia ',diamenos,' se recorrio la menor cantidad de km: ',distmenos:0:2);
	end;
	
procedure eliminar (var v: vrecorridos; var dimL: integer);
	var
		i,y: integer;
	begin
		for i:=1 to dimL do begin
			if (v[i].distancia = 100) then begin
				if ((i>=1) and (i<=df)) then begin
					for y:= i to (dimL-1) do begin
						v[y]:=v[y+1];
					end;
					dimL:=dimL-1;
				end;
			end;
		end;
	end;
	
procedure imprimirRegistro(vi: viaje);
	begin
		writeln('Viaje del dia ',vi.dia,':');
		writeln('Dinero recolectado: ',vi.dinero:0:2,'.');
		writeln('Kilometros recorridos: ',vi.distancia:0:2,'.');
	end;
	
procedure imprimir (v: vrecorridos; dimL: integer);
	var
		i: integer;
	begin
		for i:=1 to dimL do
			imprimirRegistro(v[i]);
	end;

{programa principal}
var
	v: vrecorridos;
	dimL: integer;
BEGIN
	cargarViajes(v,dimL);
	recorrer(v,dimL);
	eliminar(v,dimL);
	imprimir(v,dimL);
END.

