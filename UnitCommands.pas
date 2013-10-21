unit UnitCommands;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  SynUnicode, ComCtrls, ComStrs;

type
  TBLMode = (blmNormal, blmAlwaysBlock, blmAlwaysLines);

  TCommand = class
  public
    CommandID: string;
    CommandText: string;
    CommandDescription: string;
    Group: string;
    BLMode: TBLMode;
    function GetCommandName: string;
    constructor Create(ACommandID, ACommandText, AGroup: string; ABLMode: TBLMode);
  end;

  TCommandsShowMode = (csmAll, csmWithShortcuts, csmWithoutShortcuts);

  TCommandsSet = class
  private
    FName: string;
    FPrefix: string; //prefiks do nazw plików
    FFileExts: TStringList;
    FCommands, FShortcuts, FTree, FAutoCompleteList: TStringList;
    function GetCommand(Index: Integer): TCommand;
    function GetCount: Integer;
  public
    property Name: string read FName;
    property Prefix: string read FPrefix;
    property Count: Integer read GetCount;
    property Command[Index: Integer]: TCommand read GetCommand; default;
    property AutoCompleteList: TStringList read FAutoCompleteList;
    constructor Create(AName, APrefix: string; AFileExts: TStrings; Path: string = '');
    destructor Destroy; override;
    procedure FillTreeView(TreeView: TTreeView; CommandsShowMode: TCommandsShowMode);
    function FindCommand(CommandID: string): TCommand;
    procedure FindCommandsByShortcut(Shortcut: string; CommandsList: TStringList; ClearList: Boolean = False);
    function GetShortcutsForCommand(Command: TCommand): string; //Zwraca skróty dla komendy, np. (^AS) lub (^AS, ^D4);
    procedure LoadConf(Path: string); //£aduje pliki konfiguracyjne z podanego katalogu
    function UseForExt(Ext: string): Boolean; //Czy ten TCommandsSet jest u¿ywany do tego typu plików
  end;

function GetCommandsSetList: TStringList;
procedure RegisterCommandsSet(CommandsSet: TCommandsSet); overload;
procedure RegisterCommandsSet(FileName, ConfPath: string); overload;
procedure UnregisterCommandsSet();
procedure GetCommandsSetsForExt(Ext: string; CommandsSets: TStringList);
//Extracts file extension without dot
function ExtractFileExtN(const FileName: string): string;

implementation

const
  SCommandsFile = '-commands.txt';
  SShortcutsFile = '-shortcuts.txt';
  STreeFile = '-tree.txt';
  SAutoCompleteFile = '-autocomplete.txt';

var CommandsSetList: TStringList = nil;

procedure RemoveUnwantedLines(Strings: TStrings);
var i: Integer;
    ws: string;
begin
  i := 0;
  while (i < Strings.Count) do
  begin
    ws := TrimLeft(Strings[i]);
    if (ws = '') or (ws[1] = '#') then
      Strings.Delete(i)
    else
      Inc(i);
  end;
end;

function GetCommandsSetList: TStringList;
begin
  if CommandsSetList = nil then
    CommandsSetList := TStringList.Create;
  Result := CommandsSetList;
end;

procedure RegisterCommandsSet(CommandsSet: TCommandsSet); overload;
begin
  if GetCommandsSetList.IndexOf(CommandsSet.Name) = -1 then
    CommandsSetList.AddObject(CommandsSet.Name, CommandsSet);
end;

procedure RegisterCommandsSet(FileName, ConfPath: string); overload;
var i,n: Integer;
    SL,SLE: TStringList;
    s,name,prefix: string;
begin
  if FileExists(FileName) then
  begin
    SL := TStringList.Create;
    SLE := TStringList.Create;
    try
      SL.LoadFromFile(FileName);
      RemoveUnwantedLines(SL);
      for i := 0 to SL.Count-1 do
      begin
        s := SL[i];
        n := Pos(#9, s);
        if n = 0 then Continue;
        name := Copy(s, 1, n-1);
        Delete(s, 1, n);
        n := Pos(#9, s);
        if n = 0 then Continue;
        prefix := Copy(s, 1, n-1);
        Delete(s, 1, n);
        SLE.CommaText := s;
        RegisterCommandsSet(TCommandsSet.Create(name, prefix, SLE, ConfPath));
      end;
    finally
      SL.Free;
      SLE.Free;
    end;
  end;
end;

procedure UnregisterCommandsSet();
var i: Integer;
begin
  for i := 0 to CommandsSetList.Count-1 do
    CommandsSetList.Objects[i].Free;
  CommandsSetList.Clear;
end;

procedure GetCommandsSetsForExt(Ext: string; CommandsSets: TStringList);
var i: Integer;
begin
  CommandsSets.Clear;
  GetCommandsSetList;
  for i := 0 to CommandsSetList.Count-1 do
    if TCommandsSet(CommandsSetList.Objects[i]).UseForExt(Ext) then
      CommandsSets.AddObject(CommandsSetList[i], CommandsSetList.Objects[i]);
end;

function ExtractFileExtN(const FileName: string): string;
begin
  Result := ExtractFileExt(FileName);
  if (Result <> '') and (Result[1] = '.') then
    Delete(Result, 1, 1);
end;

{ TCommand }

constructor TCommand.Create(ACommandID, ACommandText, AGroup: string; ABLMode: TBLMode);
begin
  CommandID := ACommandID;
  CommandText := ACommandText;
  Group := AGroup;
  BLMode := ABLMode;
end;

function TCommand.GetCommandName: string;
begin
  if CommandDescription <> '' then
    Result := CommandDescription
  else
    Result := CommandID;
  Result := Group + ': ' + Result;
end;

{ TCommandsSet }

constructor TCommandsSet.Create(AName, APrefix: string; AFileExts: TStrings; Path: string = '');
begin
  inherited Create;
  FName := AName;
  FPrefix := APrefix;
  FFileExts := TStringList.Create;
  FFileExts.AddStrings(AFileExts);
  FCommands := TStringList.Create;
  FShortcuts := TStringList.Create;
  FTree := TStringList.Create;
  FAutoCompleteList := TStringList.Create;
  FCommands.Sorted := True;
  FShortcuts.Sorted := True;
  FShortcuts.Duplicates := dupAccept;
  if Path <> '' then
    LoadConf(Path);
end;

destructor TCommandsSet.Destroy;
var i: Integer;
begin
  FShortcuts.Free;
  FTree.Free;
  for i := 0 to FCommands.Count-1 do
    if FCommands.Objects[i] <> nil then
      FCommands.Objects[i].Free;
  FCommands.Free;
  FFileExts.Free;
  FAutoCompleteList.Free;
  inherited;
end;

//Przerobiona TTntTreeStrings.SaveToTree z TntComCtrls:
procedure TCommandsSet.FillTreeView(TreeView: TTreeView; CommandsShowMode: TCommandsShowMode);

  function GetBufStart(Buffer: PWideChar; var Level: Integer): PWideChar;
  begin
    Level := 0;
    while Buffer^ in [' ', #9] do
    begin
      Inc(Buffer);
      Inc(Level);
    end;
    Result := Buffer;
  end;

  //Wynik: czy zostawiæ ten element
  function CheckNode(Node: TTreeNode): Boolean;
  var TmpNode, OldTmpNode: TTreeNode;
  begin
    if Node.Data = nil then
      Result := False
    else
      if GetShortcutsForCommand(TCommand(Node.Data)) = '' then
        Result := CommandsShowMode <> csmWithShortcuts
      else
        Result := CommandsShowMode <> csmWithoutShortcuts;
    TmpNode := Node.getFirstChild;
    while TmpNode <> nil do
    begin
      OldTmpNode := TmpNode;
      TmpNode := Node.GetNextChild(OldTmpNode);
      if CheckNode(OldTmpNode) then
        Result := True
      else
        OldTmpNode.Delete;
    end;
  end;

var
  ANode, NextNode: TTreeNode;
  ALevel, i: Integer;
  CurrStr: string;
  Owner: TTreeNodes;
begin
  Owner := TreeView.Items;
  Owner.BeginUpdate;
  try
    try
      Owner.Clear;
      ANode := nil;
      for i := 0 to FTree.Count - 1 do
      begin
        CurrStr := GetBufStart(PWideChar(FTree[i]), ALevel);
        if ANode = nil then
          ANode := Owner.AddChild(nil, CurrStr)
        else if ANode.Level = ALevel then
          ANode := Owner.AddChild(ANode.Parent, CurrStr)
        else if ANode.Level = (ALevel - 1) then
          ANode := Owner.AddChild(ANode, CurrStr)
        else if ANode.Level > ALevel then
        begin
          NextNode := ANode.Parent;
          while NextNode.Level > ALevel do
            NextNode := NextNode.Parent;
          ANode := Owner.AddChild(NextNode.Parent, CurrStr);
        end
        else
          raise ETreeViewError.CreateFmt(sInvalidLevelEx, [ALevel, CurrStr]);
        ANode.Data := TCommand(FTree.Objects[i]);
      end;
      if CommandsShowMode in [csmWithShortcuts, csmWithoutShortcuts] then
      begin
        ANode := TreeView.Items.GetFirstNode;
        while ANode <> nil do
        begin
          NextNode := ANode.getNextSibling;
          if not CheckNode(ANode) then
            ANode.Delete;
          ANode := NextNode;
        end;
      end;
    finally
      Owner.EndUpdate;
    end;
  except
    Owner.Owner.Invalidate;  // force repaint on exception
    raise;
  end;
end;


function TCommandsSet.FindCommand(CommandID: string): TCommand;
var n: Integer;
begin
  n := FCommands.IndexOf(CommandID);
  if n >= 0 then
    Result := TCommand(FCommands.Objects[n])
  else
    Result := nil;
end;

procedure TCommandsSet.FindCommandsByShortcut(Shortcut: string;
            CommandsList: TStringList; ClearList: Boolean = False);
var i: Integer;
begin
  if ClearList then
    CommandsList.Clear;
  for i := 0 to FShortcuts.Count-1 do
    if FShortcuts[i] = Shortcut then
      CommandsList.AddObject(TCommand(FShortcuts.Objects[i]).CommandID, FShortcuts.Objects[i]);
end;

function TCommandsSet.GetCommand(Index: Integer): TCommand;
begin
  Result := TCommand(FCommands.Objects[Index]);
end;

function TCommandsSet.GetCount: Integer;
begin
  Result := FCommands.Count;
end;

function TCommandsSet.GetShortcutsForCommand(
  Command: TCommand): string;
var i: Integer;
begin
  Result := '';
  //if Command = nil then Exit;
  for i := 0 to FShortcuts.Count-1 do
    if FShortcuts.Objects[i] = Command then
      if Result = '' then
        Result := '^' + FShortcuts[i]
      else
        Result := Result + ', ^' + FShortcuts[i];
  if Result <> '' then
    Result := '(' + Result + ')';
end;

procedure TCommandsSet.LoadConf(Path: string);
var s,t,fn: string;
    SL: TStringList;
    i,n,k: Integer;
    Command: TCommand;
    blm: TBLMode;
begin
  if (Path <> '') and not (Path[Length(Path)] = '\') then
    Path := Path + '\';
  SL := TStringList.Create;
  try
    fn := Path + FPrefix + SCommandsFile;
    if FileExists(fn) then
    begin
      SL.LoadFromFile(fn);
      RemoveUnwantedLines(SL);
      for i := 0 to SL.Count-1 do
      begin
        s := SL[i];
        n := Pos(#9, s);
        if n > 0 then
        begin
          blm := blmNormal;
          t := Trim(Copy(s, 1, n-1));
          Delete(s, 1, n);
          k := Pos(#9, s);
          if k > 0 then
          begin
            if k < Length(s) then
              case s[k+1] of
                'B','b': blm := blmAlwaysBlock;
                'L','l': blm := blmAlwaysLines;
              end;
            s := Copy(s, 1, k-1);
          end;
          s := StringReplace(s, '\n', WideCRLF, [rfReplaceAll, rfIgnoreCase]);
          s := StringReplace(s, '\t', #9, [rfReplaceAll, rfIgnoreCase]);
          FCommands.AddObject(t, TCommand.Create(t, s, FPrefix, blm));
        end;
      end;
    end;
    fn := Path + FPrefix + SShortcutsFile;
    if FileExists(fn) then
    begin
      SL.LoadFromFile(fn);
      RemoveUnwantedLines(SL);
      for i := 0 to SL.Count-1 do
      begin
        s := SL[i];
        n := Pos(#9, s);
        if n > 0 then
        begin
          Command := FindCommand(Trim(Copy(s, n+1, Length(s))));
          t := Trim(Copy(s, 1, n-1));
          if (Command <> nil) and (Length(t) = 2) then
            FShortcuts.AddObject(t, Command);
        end;
      end;
    end;
    fn := Path + FPrefix + STreeFile;
    if FileExists(fn) then
    begin
      FTree.LoadFromFile(fn);
      RemoveUnwantedLines(FTree);
      for i := 0 to FTree.Count-1 do
      begin
        s := FTree[i];
        n := Pos('|', s);
        if n > 0 then
        begin
          Command := FindCommand(Trim(Copy(s, n+1, Length(s))));
          FTree[i] := Copy(s, 1, n-1);
          if Command <> nil then
          begin
            Command.CommandDescription := Trim(FTree[i]);
            s := FTree[i] + ' ' + GetShortcutsForCommand(Command);
            case Command.BLMode of
              blmAlwaysBlock: s := s + ' [B]';
              blmAlwaysLines: s := s + ' [L]'
            end;
            FTree[i] := TrimRight(s);
            FTree.Objects[i] := Command;
          end;
        end;
      end;
    end;
  finally
    SL.Free;
  end;
  fn := Path + FPrefix + SAutoCompleteFile;
  if FileExists(fn) then
    FAutoCompleteList.LoadFromFile(fn);
end;

function TCommandsSet.UseForExt(Ext: string): Boolean;
begin
  Result := FFileExts.IndexOf(Ext) >= 0;
end;

initialization
finalization
  if CommandsSetList <> nil then
  begin
    UnregisterCommandsSet;
    FreeAndNil(CommandsSetList);
  end;
end.
