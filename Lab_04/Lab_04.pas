Program Lab_04;

//подключение консольного приложения
{$APPTYPE CONSOLE}

{X - элементы двумерного массива
 Y - элементы одномерного массива
 N - количество элементов массива
 i - номер строки
 j - номер столбца
 k - номер строки, определяющий центр
 t - номер столбца, определяющий центр
 m - номер элемента одномерного массива
 pbeg - номер строки, с которой начинается считывание
        элементов по столбцу
 pend - номер последней строки, до которой идет
        считывание элементов по столбцу
 gleft - номер столбца, с которого начинается
         считывание элементов по строке
 gright - номер последнего столбца, до которого идет
          считывание элементов по строке}

Const
  N=5;

Var
  X:array[1..N,1..N] of Integer;
  Y:array[1..N*N] of Integer;
  i, j, k, t: Integer;
  m, pbeg, pend, qleft, qright: Integer;

Begin
//заполнение матрицы
  Randomize;
  for i:=1 to N do
    for j:=1 to N do
      X[i,j]:=Random(100);

//вывод исходной матрицы
  Writeln('Исходная матрица:');
  for i:=1 to N do
  begin
    for j:=1 to N do
      write(X[i,j]:5);
    writeln;
    writeln
  end;
  writeln;

// находим центр (для нечетной матрицы) или смещенный центр (для четной матрицы)
  if odd(N) then
  begin
    k:=(N div 2) +1;
    t:=(N div 2) +1
  end
  else
  begin
    k:=(N div 2)+1;
    t:=N div 2
  end;

//инициализация начальной точки раскрутки
  m:=0;
  pbeg:=1;
  pend:=N;
  qleft:=1;
  qright:=N;

//считывание расположения элементов массива Х и вывод их в массив Y
  While (pbeg<>k+1) and (qleft<>t+1) do
  begin

//элементы массива считываются слева направо
    for j:=qleft to qright do
    begin
      m:=m+1;
      Y[m]:=X[pbeg,j]
    end;

//элементы массива считываются сверху вниз
    for i:=pbeg+1 to pend do
    begin
      m:=m+1;
      Y[m]:=X[i,qright]
    end;

//элементы массива считываются справа налево
    for j:=qright-1 downto qleft do
    begin
      m:=m+1;
      Y[m]:=X[pend,j]
    end;

//элементы массива считываются снизу вверх
    for i:=pend-1 downto pbeg+1 do
    begin
      m:=m+1;
      Y[m]:=X[i,qleft]
    end;

//модификация переменных для того, чтобы считывание элементов массива шло по спирали к центру
    inc(pbeg);
    dec(pend);
    inc(qleft);
    dec(qright);
  end;

//вывод полученного массива
  Writeln('Полученный массив:');
  for i:=1 to m do
    write(Y[i]:4,' ');
    Readln
end.

