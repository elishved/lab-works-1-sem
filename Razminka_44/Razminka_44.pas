program division;

// Подключение консольного приложения
{$APPTYPE CONSOLE}

{characters-все возможные символы числа;
 firstNumber,secondNumber-переменные для хранения
 чисел;
 arrayNum-используется для запуска массива заполнения
 с правильной позицией;
 currentNum-используется для хранения текущего частного
 двух чисел;
 firstBigger-первое число больше второго}


var
  characters: array[0..15] of char = ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F');
  firstNumber, secondNumber: String;
  firstNumberArr, secondNumberArr, result: array of Integer;
  i, j, numeralSystem: Integer;
  bigger: Boolean = True;
  wasNotPrinted: Boolean = True;
  resultInd: Integer;

Begin
// Ввод данных
  WriteLn('Введите первое число:');
  ReadLn(firstNumber);
  WriteLn('Введите второе число:');
  ReadLn(secondNumber);
  WriteLn('Введите систему счисления:');
  ReadLn(numeralSystem);

// Устанавливаем длину массивов
  SetLength(firstNumberArr, length(firstNumber));
  SetLength(secondNumberArr, length(firstNumber));
  SetLength(result, length(firstNumber));

// Заполняем массивы для первого и второго числа
  for i := 1 to length(firstNumber) do
    for j := 0 to (numeralSystem - 1) do
      if (copy(firstNumber, i, 1) = characters[j]) then
        firstNumberArr[i - 1] := j;

  for i := 1 to length(secondNumber) do
    for j := 0 to (numeralSystem - 1) do
      if (copy(secondNumber, i, 1) = characters[j]) then
        secondNumberArr[i - 1] := j;

// Вывод первого числа
  Writeln;
  Write('   ');
  for i := 1 to (length(secondNumber) -
length(firstNumber)) do
    Write(' ');
  for i := 0 to length(firstNumber) - 1 do
    write(characters[firstNumberArr[i]]);
  Writeln;
  Write('  /');
  Writeln;

// Вывод первого числа
  Write('   ');
  for i := 1 to (length(firstNumber) -
length(secondNumber)) do
    Write(' ');
  for i := 0 to length(secondNumber) - 1 do
    write(characters[secondNumberArr[i]]);


// Решение
  resultInd := 0;
  for i := 0 to length(firstNumber) -
length(SecondNumber) do
  begin
    bigger := true;
    While bigger do
    begin
      if i <> 0 then
        for j := 0 to firstNumberArr[i - 1] - 1 do
        begin
          firstNumberArr[i] := firstNumberArr[i] +
numeralSystem;
          firstNumberArr[i - 1] := firstNumberArr[i - 1] - 1;
        end;
// Проверяем больше ли число
      j := 0;
      while (j <= length(secondNumber) - 1) do
      begin
        if firstNumberArr[j + i] < secondNumberArr[j] then
        begin
          bigger := False;
          j := length(secondNumber)
        end
        else
          if not (firstNumberArr[j] = secondNumberArr[j]) then
            j := length(secondNumber);
        j := j + 1
      end;

      while bigger do
      begin
// Находим разность
        for j := 0 to (length(secondNumber) - 1) do
          if (firstNumberArr[j + i] < secondNumberArr[j]) then
          begin
            firstNumberArr[j + i] := firstNumberArr[j + i] - secondNumberArr[j] + numeralSystem;
            firstNumberArr[j + i - 1] := firstNumberArr[j + i - 1] - 1
          end
          else
            firstNumberArr[j + i] := firstNumberArr[j + i] - secondNumberArr[j];
        result[resultInd] := result[resultInd] + 1;

// Проверка: все еще больше
        j := 0;
        while (j <= length(secondNumber) - 1) do
        begin
          if firstNumberArr[j + i] < secondNumberArr[j] then
          begin
            bigger := False;
            j := length(secondNumber);
          end
          else
            if not (firstNumberArr[j] = secondNumberArr[j]) then
              j := length(secondNumber);
          j := j + 1
        end;
      end;
    end;

// Размер массива - 1
    SetLength(secondNumberArr, length(secondNumberArr) - 1);
    inc(resultInd);
  end;

// Вывод результата
  Writeln;
  Write('  ');
  for i := length(result) downto 0 do
    write('-');
  Writeln;
  Write('Результат:    ');
  for i := 0 to resultInd - 1  do
    if (not ((result[i] = 0) and wasNotPrinted)) or
(i = resultInd - 1) then
    begin
      write(characters[result[i]]);
      wasNotPrinted := false;
    end
    else
      Write(' ');
  wasNotPrinted := true;
  WriteLn;
  Write('Остаток: ');
  for i := 0 to length(firstNumberArr) - 1 do
    if not ((firstNumberArr[i] = 0) and wasNotPrinted) then
    begin
      write(characters[firstNumberArr[i]]);
      wasNotPrinted := false;
    end
    else
      Write(' ');

  WriteLn;
  ReadLn;
end.

