{-------------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: uHighlighterProcs.pas, released 2000-06-23.

The Initial Author of the Original Code is Michael Hieke.
All Rights Reserved.

Contributors to the SynEdit project are listed in the Contributors.txt file.

Alternatively, the contents of this file may be used under the terms of the
GNU General Public License Version 2 or later (the "GPL"), in which case
the provisions of the GPL are applicable instead of those above.
If you wish to allow use of your version of this file only under the terms
of the GPL and not to allow others to use your version of this file
under the MPL, indicate your decision by deleting the provisions above and
replace them with the notice and other provisions required by the GPL.
If you do not delete the provisions above, a recipient may use your version
of this file under either the MPL or the GPL.

$Id: uHighlighterProcs.pas,v 1.3 2002/06/15 06:57:24 etrusco Exp $

You may retrieve the latest version of this file at the SynEdit home page,
located at http://SynEdit.SourceForge.net

Known Issues:
-------------------------------------------------------------------------------}

//PP - based on uHighlighterProcs from SynEdit

unit UnitHighlighterProcs;

interface

uses
  Classes, SynEditHighlighter, SynUnicode;

procedure GetHighlighters(AOwner: TComponent; AHighlighters: TStringList;
  AppendToList: boolean);
procedure SetHighlighterFiltersFromFile(AHighlighters: TStringList; FileName: string);
function GetHighlightersFilter(AHighlighters: TStringList; AAddAll: Boolean = True): string;
function GetHighlighterFromFileExt(AHighlighters: TStringList;
  Extension: string): TSynCustomHighlighter;
function GetHighlighterFromFileName(AHighlighters: TStringList;
  FileName: string): TSynCustomHighlighter;

implementation

uses
  SysUtils;

procedure GetHighlighters(AOwner: TComponent; AHighlighters: TStringList;
  AppendToList: boolean);
var
  i: integer;
  Highlighter: TSynCustomHighlighter;
begin
  if Assigned(AOwner) and Assigned(AHighlighters) then begin
    if not AppendToList then
      AHighlighters.Clear;
    for i := AOwner.ComponentCount - 1 downto 0 do begin
      if not (AOwner.Components[i] is TSynCustomHighlighter) then
        continue;
      Highlighter := AOwner.Components[i] as TSynCustomHighlighter;
      // only one highlighter for each language
      if Highlighter.Enabled and (AHighlighters.IndexOf(Highlighter.GetLanguageName) = -1) then
        AHighlighters.AddObject(Highlighter.GetLanguageName, Highlighter);
    end;
    //AHighlighters.Sort;
  end;
end;

procedure SetHighlighterFiltersFromFile(AHighlighters: TStringList; FileName: string);
var SL, SL1: TStringList;
    i,n,k: Integer;
    s,df: string;
    Highlighter: TSynCustomHighlighter;
begin
  SL := TStringList.Create;
  SL1 := TStringList.Create;
  try
    SL.LoadFromFile(FileName);
    for i := 0 to AHighlighters.Count-1 do
    begin
      Highlighter := AHighlighters.Objects[i] as TSynCustomHighlighter;
      s := SL.Values[Highlighter.Name];
      if s <> '' then
      begin
        SL1.CommaText := s;
        if SL1.Count > 0 then
        begin
          df := Highlighter.DefaultFilter;
          n := Pos('(', df);
          if n > 0 then
            df := Trim(Copy(df, 1, n-1));
          n := Pos('|', df);
          if n > 0 then
            df := Trim(Copy(df, 1, n-1));
          s := '*.' + SL1[0];
          for k := 1 to SL1.Count-1 do
            s := s + ';*.' + SL1[k];
          df := df + ' (' + s + ')|' + s;
          Highlighter.DefaultFilter := df;
        end;
      end;
    end;
  finally
    SL.Free;
    SL1.Free;
  end;
end;

function GetHighlightersFilter(AHighlighters: TStringList; AAddAll: Boolean = True): string;
var
  i, n: integer;
  Highlighter: TSynCustomHighlighter;
  s: string;
begin
  Result := '';
  //if AAddAll then //PP
  begin
    Result := Result + 'Wszystkie pliki (*.*)|*.*|';
  end;
  if Assigned(AHighlighters) then
  begin
    if AAddAll then
    begin
      s := '';
      for i := 0 to AHighlighters.Count - 1 do
      begin
        if not (AHighlighters.Objects[i] is TSynCustomHighlighter) then
          continue;
        Highlighter := TSynCustomHighlighter(AHighlighters.Objects[i]);
        if Highlighter.DefaultFilter = '' then
          continue;
        n := Pos('|', Highlighter.DefaultFilter);
        if n > 0 then
        begin
          if s = '' then
            s := Copy(Highlighter.DefaultFilter, n+1, Length(Highlighter.DefaultFilter))
          else
            s := s + ';' + Copy(Highlighter.DefaultFilter, n+1, Length(Highlighter.DefaultFilter));
        end;
      end;
      if s <> '' then
        s := 'Wszystkie rozpoznawane formaty|' + s + '|'; //PP
      Result := Result + s;
    end;
    for i := 0 to AHighlighters.Count - 1 do
    begin
      if not (AHighlighters.Objects[i] is TSynCustomHighlighter) then
        continue;
      Highlighter := TSynCustomHighlighter(AHighlighters.Objects[i]);
      if Highlighter.DefaultFilter = '' then
        continue;
      Result := Result + Highlighter.DefaultFilter;
      if Result[Length(Result)] <> '|' then
        Result := Result + '|';
    end;
  end;
end;

function GetHighlighterFromFileExt(AHighlighters: TStringList;
  Extension: string): TSynCustomHighlighter;
var
  ExtLen: integer;
  i, j: integer;
  Highlighter: TSynCustomHighlighter;
  Filter: string;
begin
  Extension := LowerCase(Extension);
  ExtLen := Length(Extension);
  if Assigned(AHighlighters) and (ExtLen > 0) then begin
    for i := 0 to AHighlighters.Count - 1 do begin
      if not (AHighlighters.Objects[i] is TSynCustomHighlighter) then
        continue;
      Highlighter := TSynCustomHighlighter(AHighlighters.Objects[i]);
      Filter := LowerCase(Highlighter.DefaultFilter);
      j := Pos('|', Filter);
      if j > 0 then begin
        Delete(Filter, 1, j);
        j := Pos(Extension, Filter);
        if (j > 0) and
           ((j + ExtLen > Length(Filter)) or (Filter[j + ExtLen] = ';'))
        then begin
          Result := Highlighter;
          exit;
        end;
      end;
    end;
  end;
  Result := nil;
end;

// Derived from StrMatches from JclStrings
function StrMatches(const Substr, S: string): Boolean;
var
  StringPtr: PWideChar;
  PatternPtr: PWideChar;
  StringRes: PWideChar;
  PatternRes: PWideChar;
begin
  if SubStr = '' then
    raise Exception.Create('Poszukiwany ³añcuch nie mo¿e byæ pusty');

  Result := SubStr = '*';

  if Result or (S = '') then
    Exit;

  StringPtr := PWideChar(@S[1]);
  PatternPtr := PWideChar(SubStr);
  StringRes := nil;
  PatternRes := nil;

  repeat
    repeat
      case PatternPtr^ of
        #0:
          begin
            Result := StringPtr^ = #0;
            if Result or (StringRes = nil) or (PatternRes = nil) then
              Exit;

            StringPtr := StringRes;
            PatternPtr := PatternRes;
            Break;
          end;
        '*':
          begin
            Inc(PatternPtr);
            PatternRes := PatternPtr;
            Break;
          end;
        '?':
          begin
            if StringPtr^ = #0 then
              Exit;
            Inc(StringPtr);
            Inc(PatternPtr);
          end;
        else
          begin
            if StringPtr^ = #0 then
              Exit;
            if StringPtr^ <> PatternPtr^ then
            begin
              if (StringRes = nil) or (PatternRes = nil) then
                Exit;
              StringPtr := StringRes;
              PatternPtr := PatternRes;
              Break;
            end
            else
            begin
              Inc(StringPtr);
              Inc(PatternPtr);
            end;
          end;
      end;
    until False;

    repeat
      case PatternPtr^ of
        #0:
          begin
            Result := True;
            Exit;
          end;
        '*':
          begin
            Inc(PatternPtr);
            PatternRes := PatternPtr;
          end;
        '?':
          begin
            if StringPtr^ = #0 then
              Exit;
            Inc(StringPtr);
            Inc(PatternPtr);
          end;
        else
          begin
            repeat
              if StringPtr^ = #0 then
                Exit;
              if StringPtr^ = PatternPtr^ then
                Break;
              Inc(StringPtr);
            until False;
            Inc(StringPtr);
            StringRes := StringPtr;
            Inc(PatternPtr);
            Break;
          end;
      end;
    until False;
  until False;
end;

// Derived from IsFileNameMatch from JclFileUtils
function IsFileNameMatch(FileName: string; const Mask: string): Boolean;
begin
  Result := True;
  if (Mask = '') or (Mask = '*') or (Mask = '*.*') then
    Exit;
  if Pos('.', FileName) = 0 then
    FileName := FileName + '.';  // file names w/o extension match '*.'
  Result := StrMatches(WideUpperCase(Mask), WideUpperCase(FileName));
end;


function GetHighlighterFromFileName(AHighlighters: TStringList;
  FileName: string): TSynCustomHighlighter;
var
  i, j: integer;
  Highlighter: TSynCustomHighlighter;
  Filter: string;
begin
  if Assigned(AHighlighters) and (FileName <> '') then
  begin
    for i := 0 to AHighlighters.Count - 1 do
    begin
      if not (AHighlighters.Objects[i] is TSynCustomHighlighter) then
        Continue;
      Highlighter := TSynCustomHighlighter(AHighlighters.Objects[i]);
      Filter := WideLowerCase(Highlighter.DefaultFilter);
      j := Pos('|', Filter);
      if j > 0 then
      begin
        Delete(Filter, 1, j);
        repeat
          j := Pos(';', Filter);
          if ((j = 0) and IsFileNameMatch(FileName, Filter)) or
             ((j > 0) and IsFileNameMatch(FileName, Copy(Filter, 1, j-1))) then
          begin
            Result := Highlighter;
            Exit;
          end;
        until j = 0;
      end;
    end;
  end;
  Result := nil;
end;

end.
