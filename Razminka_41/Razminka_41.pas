program Summa;
// Подключаем консольное приложение
{$APPTYPE CONSOLE}

// characters - все возможные символы числа
// firstNumber, secondNumber - переменные для хранения чисел
// arrayNum - используется для запуска массива заполнения с правильной позицией
// currentNum - используется для хранения текущей суммы двух чисел
// isOkay - используется для проверки символа в данной системе счисления
// dataCorrect - показывает корректность введенных данных

var
  characters: array[0..15] of char = ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F');
  firstNumber, secondNumber: String;
  firstNumberArr, secondNumberArr, result: array of Byte;
  i, j, currentNum, arrayNum, numeralSystem: Integer;
  isOkay: Boolean = False;
  dataCorrect: Boolean = True;

Begin
// Ввод данных
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
    SetLength(result, length(secondNumber) + 1);
    if length(firstNumber) > length(secondNumber) then
    begin
      SetLength(firstNumberArr, length(firstNumber));
      SetLength(secondNumberArr, length(firstNumber));
      SetLength(result, length(firstNumber) + 1)
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

// Сложение
    for i := 0 to (length(result) - 2) do
    begin
      currentNum := secondNumberArr[i] + firstNumberArr[i] + result[i];
      result[i] := currentNum mod numeralSystem;
      result[i + 1] := currentNum div numeralSystem
    end;

// Вывод первого числа
    Writeln;
    Write('   ');
    for i := 1 to (length(secondNumber) - length(firstNumber)) do
      Write(' ');
    for i := length(firstNumber) - 1 downto 0  do
      write(characters[firstNumberArr[i]]);
    Writeln;
    Write('  +');
    Writeln;

// Вывод второго числа
    Write('   ');
    for i := 1 to (length(firstNumber) - length(secondNumber)) do
      Write(' ');
    for i := length(secondNumber) - 1 downto 0  do
      write(characters[secondNumberArr[i]]);

    Writeln;
    Write('  ');
    for i := (length(result) - 1) downto 0 do
      write('-');
    Writeln;
    Write('  ');
    if (result[length(result) - 1] = 0) then
    begin
      SetLength(result, length(result) - 1);
      Write(' ');
    end;
    for i := (length(result) - 1) downto 0 do
      write(characters[result[i]]);
    WriteLn;
  end
  else
    Write('Были введены неверные данные: данная система счисления не содержит некоторых символов');
  ReadLn;
end.

