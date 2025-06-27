{Un local de ropa desea analizar las ventas realizadas en el último mes. Para ello se lee por cada día del mes,
los montos de las ventas realizadas. La lectura de montos para cada día finaliza cuando se lee el monto 0. Se
asume un mes de 31 días. Informar la cantidad de ventas por cada día, y el monto total acumulado en ventas
de todo el mes.
a. Modifique el ejercicio anterior para que además informe el día en el que se realizó la mayor cantidad
de ventas.}
program punto8;
var
	i,monto,cant,total: integer;
begin
	total:=0;
	for i:=1 to 5 do begin
		cant:=0;
		writeln('Ingrese los montos de las ganancias por cada una de las ventas de este dia:');
		readln(monto);
		while (monto<>0) do begin
			cant+=1;
			total:=total+monto;
			readln(monto);
		end;
		writeln('En el dia ingresado hubo ',cant,' ventas');
	end;
	writeln('El monto total obtenido a lo largo del mes es de ',total,' pesos');
end.
