program punto7;
procedure analisis(num:integer;var cantDig,sumaDig:integer);
  var
    resto:integer;
  begin
    while (num<>0) do begin
      resto:=num mod 10;
      sumaDig+=resto;
      cantDig+=1;
      num:=num div 10;
    end;
  end;
var
  digitos,nro,cant1,cant2:integer;
begin
  digitos:=0;
    repeat
      cant1:=0;
      cant2:=0;
      readln(nro);
      analisis(nro,cant1,cant2);
      digitos+=cant1;
    until (cant2=10);
  writeln ('La cantidad de digitos totales que hubo fue de: ',digitos);
end.

