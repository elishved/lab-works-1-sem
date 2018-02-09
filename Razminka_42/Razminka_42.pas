program Difference;

// Подключение консольного приложения
{$APPTYPE CONSOLE}

{characters-все возможные символы числа;
 firstNumber,secondNumber-переменные для хранения
 чисел;
 arrayNum-используется для запуска массива заполнения
 с правильной позицией;
 currentNum-используется для хранения текущей суммы
 двух чисел;
 isOkay-используется для проверки символа в данной
 системе счисления;
 dataCorrect-показывает корректность введенных данных
 firstBigger-показывает, что первое число больше второго}

var
  characters: array[0..15] of char = ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F');
  firstNumber, secondNumber: String;
  firstNumberArr, secondNumberArr, result: array of Integer;
  i, j, currentNum, arrayNum, numeralSystem: Integer;
  firstBigger: Boolean = True;
  wasNotPrinted: Boolean = True;
  isOkay: Boolean = False;
  dataCorrect: Boolean = True;

begin
// Ввод
  WriteLn('Введите первое число:');
  ReadLn(firstNumber);
  WriteLn('Введите второе число:');
  ReadLn(secondNumber);
  WriteLn('Введите систему счисления:');
  ReadLn(numeralSystem);

// Проверка ввода
  for i := 1 to length(firstNumber) do
  begin
    isOkay := False;
    for j := 0 to numeralSystem - 1 do
      if (copy(firstNumber, i, 1) = characters[j]) then
         isOkay := True;
      if not isOkay then
         dataCorrect := False;
  end;
  for i := 1 to length(secondNumber) do
  begin
    isOkay := False;
    for j := 0 to numeralSystem - 1 do
      if (copy(secondNumber, i, 1) = characters[j]) then
         isOkay := True;
      if not isOkay then
         dataCorrect := False;
  end;

// Если данные корректны, подготовим их к решению
  if dataCorrect then
  begin
// Устанавливаем длину массивов
    SetLength(firstNumberArr, length(secondNumber));
    SetLength(secondNumberArr, length(secondNumber));
    SetLength(result, length(secondNumber));
    if length(firstNumber) > length(secondNumber) then
    begin
      SetLength(firstNumberArr, length(firstNumber));
      SetLength(secondNumberArr, length(firstNumber));
      SetLength(result, length(firstNumber))
    end;

// Заполняем массивы для первого и второго числа
    arrayNum := length(firstNumber) - 1;
    for i := 1 to length(firstNumber) do
      for j := 0 to (numeralSystem - 1) do
        if (copy(firstNumber, i, 1) = characters[j]) then
        begin
          firstNumberArr[arrayNum] := j;
          arrayNum := arrayNum - 1
        end;
    arrayNum := length(secondNumber) - 1;
    for i := 1 to length(secondNumber) do
      for j := 0 to (numeralSystem - 1) do
        if (copy(secondNumber, i, 1) = characters[j]) then
        begin
          secondNumberArr[arrayNum] := j;
          arrayNum := arrayNum - 1
        end;

// Вывод первого числа
    Writeln;
    Write('   ');
    for i := 1 to (length(secondNumber) - length(firstNumber)) do
      Write(' ');
    for i := length(firstNumber) - 1 downto 0  do
      Write(characters[firstNumberArr[i]]);
    Writeln;
    Write('  -');
    Writeln;

// Вывод второго числа
    Write('   ');
    for i := 1 to (length(firstNumber) - length(secondNumber)) do
      Write(' ');
    for i := length(secondNumber) - 1 downto 0  do
      write(characters[secondNumberArr[i]]);

// Определяем какое число больше
    i := (length(result) - 1);
    while (i >= 0) do
    begin
      if firstNumberArr[i] < secondNumberArr[i] then
      begin
        firstBigger := False;
        i := 0
      end
      else
        if not (firstNumberArr[i] = secondNumberArr[i]) then
           i := 0;
      i := i - 1
    end;

// Разность
    for i := 0 to (length(result) - 1) do
      if firstBigger then
      begin
        if (firstNumberArr[i] < secondNumberArr[i]) then
        begin
          result[i] := firstNumberArr[i] - secondNumberArr[i] + numeralSystem;
          firstNumberArr[i + 1] := firstNumberArr[i + 1] - 1
        end
        else
          result[i] := firstNumberArr[i] - secondNumberArr[i]
      end
      else
      begin
        if (secondNumberArr[i] < firstNumberArr[i]) then
        begin
          result[i] := secondNumberArr[i] - firstNumberArr[i] + numeralSystem;
          secondNumberArr[i + 1] := secondNumberArr[i + 1] - 1;
        end
        else
          result[i] := secondNumberArr[i] - firstNumberArr[i]
      end;

// Вывод результата
    Writeln;
    Write('  ');
    for i := length(result) downto 0 do
      Write('-');
    Writeln;
    if firstBigger then
       Write('   ')
    else
      Write('  -');
    for i := (length(result) - 1) downto 0 do
      if not ((result[i] = 0) and wasNotPrinted) then
      begin
        write(characters[result[i]]);
        wasNotPrinted := false;
      end
      else
        Write(' ');
    WriteLn;
  end
  else
    WriteLn('Были введены неверные данные: данная система счисления не содержит некоторых символов');
  ReadLn;
end.

