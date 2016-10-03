program main_program;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,classes,
  Z_class_u in 'Z_class_u.pas',
  math,
  Equation_Solver in 'Equation_Solver.pas';

var
  za,zb,zc,zd:double;
  arr:TrootsEquation;
  eq3:TEquation3;
  x1:TZNumber;
  count:integer;
  stringlits:TStringList;
  root,resultVal:TZNumber;
begin
///program for test

  za:=3;
  zb:=2;
  zc:=2;
  zd:=3;
  eq3:=TEquation3.create(za,zb,zc,zd);
try
      try
        arr:=eq3.getRoots();
        writeln('--------------------------------------------------------------------');
        writeln;
        writeln;
        writeln('The  roots:');
          for count := Low(arr) to High(arr) do
            begin
             root:=arr[count];
             writeln(' X',count+1,'  -->'+root.ToString);
            end;
        writeln('--------------------------------------------------------------------');
        writeln;
        writeln;
        writeln('--------------------------------------------------------------------');
        writeln;
        writeln;
        writeln('test equation root result:');
        for count := Low(arr) to High(arr) do
            begin
             root:=arr[count];
             resultVal:=(za*root.PowerTo(3)+zb*root.PowerTo(2)+zc*root+zd);
             writeln(' f(X',count+1,')  -->'+resultVal.ToString);
            end;

        writeln('--------------------------------------------------------------------');
        writeln;
        writeln;
        writeln('--------------------------------------------------------------------');
        writeln;
        writeln;
        writeln('Staps:');
        stringlits:=eq3.getStaps;
          for count := 0 to stringlits.Count-1 do
            begin
             writeln(stringlits[count]);
            end;
          writeln('--------------------------------------------------------------------');
      except
        on e:TComplixNumberZeroExcepion do
          writeln(e.Message);

      end;
finally
  FreeAndNil(eq3);//free object from memory
end;
readln;
end.

