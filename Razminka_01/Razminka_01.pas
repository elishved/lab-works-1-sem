program  monahi;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, SysUtils, CustApp
  { you can add units after this };
Var
  m,resh,m3,m1,m2:integer;
  n,n1,n2,n3:real;

Begin
  //Ввод исходных данных
  Write('Введите кол-во всех монахов: m= ');
  ReadLn(m);
  Write('Введите кол-во всех пирогов: n=');
  ReadLn(n);
  Write('Введите кол-во пирогов, съедаемых ведущим монахом: n1=');
  ReadLn(n1);
  Write('Введите кол-во пирогов, съедаемых простым монахом: n2=');
  ReadLn(n2);
  Write('Введите кол-во пирогов, съедаемых учеником: n3=');
  ReadLn(n3);

  resh := 0;
  If n2 = n1 then
  WriteLn('Получается деление на ноль. Операция невозможна.');

  //Запуск цикла от 0 до m монахов, где находим количество монахов по чину
  For m3 := 0 to m do
  begin
    m2 := trunc((n - m3*n3 + m3*n1 - m*n1) / (n2 - n1));
    m1 := m - m2 - m3;
    //Проверка числа монахов на неотрицательность, а сумма съеденных пирогов должна равняться их исходгому количеству
    If (m2 >= 0) and (m1 >= 0) and (n = m1*n1 + m2*n2 + m3*n3) then
    begin
      resh := resh + 1;
      //Вывод результатов
      WriteLn('Решение № ',resh);
      WriteLn('Количество ведущих монахов - ',m1:4);
      WriteLn('Количество простых монахов - ',m2:4);
      WriteLn('Количество монахов-учеников - ',m3:3);
    end;
  end;

  if resh = 0 then
  WriteLn('Нет решений.');
  ReadLn;
End.
