program Lab_06;

{$mode objfpc}{$H+}

// Объявление переменных
Var
  x, y, ch, zn, El, Eps: Real;
  k: Integer;

Begin
  Eps := 0.0001;

// Запуск цикла А1 по точности Eps
  while Eps>=0.000001 do
  Begin
    x := -0.5;

// Запуск цикла А2 по х от -0.5 до 0.5 с шагом 0.1
    While x <= 0.5 do
    begin
      y := 0;
      ch := -x*x*x;
      zn := 1;
      k := 1;
      El := Eps + 1;

{Запуск цикла А3. Вычисление значения ряда,пока не будет достигнута требуемая точность}
      While abs(El) > Eps do
      begin
        El := ch/zn;
        ch := ch*(-x);
        k := k + 1;
        zn := zn * (2 * k - 2) * (2 * k - 1);
        y := y + El;
      end;

// Вывод результатов
      Writeln(' x=',x:5:1,'  y=',y:10:7,'  k=',k,'  Eps=',Eps:7:6);

//наращиваем х на шаг
      x := x + 0.1;
    end;
    Writeln;

//изменяем точность
  Eps := Eps/10;
  end;
  readln;
end.
