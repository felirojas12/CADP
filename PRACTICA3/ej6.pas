{Una empresa importadora de microprocesadores desea implementar un 
sistema de software para analizar la información de los productos que 
mantiene actualmente en stock. Para ello, se conoce la siguiente 
información de los microprocesadores: marca (Intel, AMD, NVidia, etc), 
línea (Xeon, Core i7, Opteron, Atom,Centrino, etc.), cantidad de cores 
o núcleos de procesamiento (1, 2, 4, 8), velocidad del reloj (medida en 
Ghz) y tamaño en nanómetros (nm) de los transistores (14, 22, 32, 45, 
etc.). La información de los microprocesadores se lee de forma 
consecutiva por marca de procesador y la lectura finaliza al ingresar 
un procesador con 0 cores (que no debe procesarse). Se pide implementar 
un programa que lea información de los microprocesadores de la empresa 
importadora e informe: 
● Marca y línea de todos los procesadores de más 
de 2 cores con transistores de a lo sumo 22 nm. 
● Las dos marcas con 
mayor cantidad de procesadores con transistores de 14 nm. 
● Cantidad de procesadores multicore (de más de un core), cuyos relojes alcancen 
velocidades de al menos 2 Ghz.}
program ej6;
type
	cpu = record
		marca: string;
		linea: string;
		nucleos: integer;
		velocidad: real;
		tamaño: integer
	end;
procedure leer(var c: cpu);
	begin
		write('Ingrese la marca del microprocesador: ');
		readln(c.marca);
		writeln('Ingrese la linea a la que pertenece el microprocesador ',c.marca,': ');
		readln(c.linea);
		write('Ingrese la cantidad de nucleos del microprocesador: ');
		readln(c.nucleos);
		write('Ingrese la velocidad en GHz del microprocesador : ');
		readln(c.velocidad);
		write('Ingrese el tamaño en nanometros de los transistores del procesador: ');
		readln(c.tamaño);
	end;
var
	c: cpu;
	actual: string;
BEGIN
	leer(c);
	while (c <> 0) do begin
		actual:=c.marca;
		while ((c <> 0) and (actual = c.marca)) do begin
			
		end;
	end;
END.

