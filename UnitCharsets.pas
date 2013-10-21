unit UnitCharsets;

interface

uses
  Windows, Messages, SysUtils, Classes;

function ISO88592ToWin1250(s: AnsiString): AnsiString;
function Win1250ToISO88592(s: AnsiString): AnsiString;

function IsWideStringMappableToAnsi(const WS: UnicodeString): Boolean;
function UnicodeStringToAnsiString(s: UnicodeString; cp: Integer): RawByteString;
function AnsiStringToUnicodeString(s: RawByteString; cp: Integer): UnicodeString;

implementation

const tab_win2iso:array[AnsiChar] of AnsiChar =
  (#0,#1,#2,#3,#4,#5,#6,#7,#8,#9,#10,#11,#12,#13,#14,#15,#16,#17,#18,#19,#20,#21,
  #22,#23,#24,#25,#26,#27,#28,#29,#30,#31,#32,#33,#34,#35,#36,#37,#38,#39,#40,#41,
  #42,#43,#44,#45,#46,#47,#48,#49,#50,#51,#52,#53,#54,#55,#56,#57,#58,#59,#60,#61,
  #62,#63,#64,#65,#66,#67,#68,#69,#70,#71,#72,#73,#74,#75,#76,#77,#78,#79,#80,#81,
  #82,#83,#84,#85,#86,#87,#88,#89,#90,#91,#92,#93,#94,#95,#96,#97,#98,#99,#100,#101,
  #102,#103,#104,#105,#106,#107,#108,#109,#110,#111,#112,#113,#114,#115,#116,#117,
  #118,#119,#120,#121,#122,#123,#124,#125,#126,#127,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,
  #169,#0,#166,#171,#174,#172,#0,#0,#0,#0,#0,#0,#0,#0,#0,#0,#185,#0,#182,#187,#190,
  #188,#160,#183,#162,#163,#164,#161,#0,#167,#168,#0,#170,#0,#0,#173,#0,#175,#176,
  #0,#178,#179,#180,#0,#0,#0,#184,#177,#186,#0,#165,#189,#181,#191,#192,#193,#194,
  #195,#196,#197,#198,#199,#200,#201,#202,#203,#204,#205,#206,#207,#208,#209,#210,
  #211,#212,#213,#214,#215,#216,#217,#218,#219,#220,#221,#222,#223,#224,#225,#226,
  #227,#228,#229,#230,#231,#232,#233,#234,#235,#236,#237,#238,#239,#240,#241,#242,
  #243,#244,#245,#246,#247,#248,#249,#250,#251,#252,#253,#254,#255);

var
  tab_iso2win:array[AnsiChar] of AnsiChar;

function IsWideStringMappableToAnsi(const WS: UnicodeString): Boolean;
var
  UsedDefaultChar: BOOL;
begin
  WideCharToMultiByte(DefaultSystemCodePage, 0, PWideChar(WS), Length(WS), nil, 0, nil, @UsedDefaultChar);
  Result := not UsedDefaultChar;
end;

function UnicodeStringToAnsiString(s: UnicodeString; cp: Integer): RawByteString;
var
  size, ssize: Integer;
  DefChar: AnsiChar;
begin
  ssize := Length(s);
  SetLength(Result, ssize);
  if ssize = 0 then Exit;
  DefChar := '?';
  size := WideCharToMultiByte(cp, 0, PWideChar(s), ssize, PAnsiChar(Result), ssize, @DefChar, nil);
  SetLength(Result, size);
end;

function AnsiStringToUnicodeString(s: RawByteString; cp: Integer): UnicodeString;
var
  size, ssize: Integer;
begin
  ssize := Length(s);
  SetLength(Result, ssize*2);
  if ssize = 0 then Exit;
  size := MultiByteToWideChar(cp, 0, PAnsiChar(s), ssize, PWideChar(Result), ssize*2);
  SetLength(Result, size);
end;

function ISO88592ToWin1250(s: AnsiString): AnsiString;
var i: Integer;
begin
  Result := s;
  for i := 1 to Length(Result) do
    Result[i] := tab_iso2win[Result[i]];
end;

function Win1250ToISO88592(s: AnsiString): AnsiString;
var i: Integer;
begin
  Result := s;
  for i := 1 to Length(Result) do
    Result[i] := tab_win2iso[Result[i]];
end;


var i: AnsiChar;
initialization
  for i := #0 to #255 do
    tab_iso2win[tab_win2iso[i]] := i;
end.

