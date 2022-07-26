program RemoveDiacriticsAndSpecialCharacters;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
  Param, Result: string;
  I: integer;

procedure RemoveDiacritics(var AString: string);
var
  ConvertedString: TBytes;
begin
  ConvertedString := TEncoding.Convert(TEncoding.Unicode, TEncoding.ASCII, TEncoding.Unicode.GetBytes(AString));
  AString := StringOf(ConvertedString);
end;

procedure RemoveSpecialCharacters(var AString: string);
var
  I: integer;
begin
  for I := Low(AString) to High(AString) do
    if CharInSet(AString[I], ['/', '\', '|', '<', '>', '*', ':', '"', '?', '#', '.']) then
      AString[I] := ' ';
end;

begin
    { TODO -oUser -cConsole Main : Insert code here }
  Result := EmptyStr;
  for I := 1 to ParamCount do
  begin
    Param := ParamStr(I);
    RemoveDiacritics(param);
    RemoveSpecialCharacters(param);
    Result := Result + ' ' + param;
  end;
  WriteLn(Trim(Result));
end.
