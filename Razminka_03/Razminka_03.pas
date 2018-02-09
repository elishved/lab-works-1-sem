program Ready;

{$APPTYPE CONSOLE}

const
  // количество дискет:
  KCount = 12; //в коробке
  YaCount = 144; //в ящике
  //Cтоимость:
  StD = 11.5; //одной дискеты
  StK = 114.5; //коробки дискет
  StYa = 1255; //ящика дискет

var
  N, K, Ya: integer;
  Cost: Real;  //стоимость n дискет, выгодная для покупки
  MaxSt, bonus: real;

Begin
  WriteLn('Введите количество дискет,которое необходимо купить: ');
  ReadLn(N);
  //Проверка корректности введённых данных
  if N <= 0 then writeln ('Некорректно введены данные')
  else
  begin
    MaxSt := StD * N ;
    Writeln('Максимальная стоимость - ', MaxSt:1:2, ' p. ');
    Write('______________________________');
    WriteLn;

    //Колиество ящиков, коробок и дискет при выгодной покупке
    Ya := N div YaCount;
    N := N mod YaCount;
    K := N div KCount;
    N := N mod KCount;
    WriteLn('Для экономии можно приобрести: ', Ya,' ящиков(а), ', K, ' коробок(и), ', N, ' дискет(ы)');
    WriteLn('Их общая стоимоть составит: ', (Ya*StYa + K*StK  + N*StD):1:2, ' р.');
    WriteLn;

    //Количество коробок и ящиков, которые можно купить при наличии бонусных дискет
    if N*StD >= StK then
    begin
      N := 0;
      K := K + 1;
    end;

    if StK*K >= StYa then
    begin
      K := 0;
      N := 0;
      Ya := Ya + 1;
    end;

    //Стоимоть покупки с бонусами,вывод результата
    Cost := StD*N + StK*K + StYa*Ya;
    WriteLn('В другом случае: ', Ya,' ящиков(а), ', K, ' коробок(и), ', N, ' дискет(ы)');
    WriteLn('Стоимоть cоставит:', Cost:1:2, 'руб');
    WriteLn('Экономия при совершении данной покупки равна ',(MaxSt - Cost):1:2, ' руб');

    //Количество бонусных дискет, если таковые имеются}
    bonus := (Ya*YaCount + K*KCount) - (MaxSt / StD);
    if bonus > 0 then
    WriteLn('Ваш бонус ',bonus:1:0, ' дискет(ы)')
    else WriteLn('Бонуса нет.');
  end;
ReadLn
End.
