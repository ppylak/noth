unit UChild;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Menus, SynEdit, SynMemo, SynEditHighlighter,
  SynHighlighterMulti, SynUnicode, SynEditTypes, SynEditKeyCmds,
  ExtDlgs, SynEditTextBuffer, SynHighlighterWebMisc,
  SynURIOpener, SynTokenMatch, SynEditAutoComplete, SynCompletionProposal,
  SynHighlighterWeb, WideStrUtils, Generics.Collections, DragDrop, DropTarget,
  DragDropInternet, DragDropText, DragDropFile, DropHandler;

//{$DEFINE DEBUG}

const
  PPWM_CLOSE = WM_USER + 97;

type
  TNCharSet = (ncsUTF8, ncsISO88592, ncsWIN1250);

  TVerifyTokenFunc = function(Token: string; TokenType: Integer): Boolean;

  TFChild = class;

  TChildStateListener = class
  private
    FChildrenList: TList<TFChild>;
  protected
    procedure InternalRegisterFChild(FChild: TFChild; Param: TObject); virtual; abstract;
    procedure InternalFChildActivated(FChild: TFChild; Param: TObject); virtual; abstract;
    procedure InternalFChildClosed(FChild: TFChild; Param: TObject); virtual; abstract;
    procedure InternalFChildChangingFileName(FChild: TFChild; Param: TObject); virtual; abstract;
  public
    constructor Create;
    destructor Destroy; override;
    procedure RegisterFChild(FChild: TFChild; Param: TObject);
    procedure FChildActivated(FChild: TFChild; Param: TObject);
    procedure FChildClosed(FChild: TFChild; Param: TObject);
    procedure FChildChangingFileName(FChild: TFChild; Param: TObject);
  end;

  TChildStateListenerHelper = record
    Listener: TChildStateListener;
    Param: TObject;
  end;

  TChildStateListenerList = class(TList<TChildStateListenerHelper>);

  TSelBlock = record
    Caret: TBufferCoord;
    BlockBegin: TBufferCoord;
    BlockEnd: TBufferCoord;
  end;

  TSelBlockStack = class(TStack<TSelBlock>)
  public
    //Clears stack and pushes SelBlock to it
    procedure ClearAndPushSelBlock(SynEdit: TSynEdit);
    //Pushes SelBlock to stack (if different)
    procedure PushSelBlock(SynEdit: TSynEdit);
    //Pops SelBlock from stack and sets SynEdit
    procedure PopAndSetSelBlock(SynEdit: TSynEdit);
  end;

  TFChild = class(TForm)
    SaveDialog1: TSaveDialog;
    SynMemo: TSynMemo;
    StatusBar1: TStatusBar;
    Memo1: TMemo;
    ODInsertFileName: TOpenDialog;
    OPDInsertFileName: TOpenPictureDialog;
    SynCompletionProposal: TSynCompletionProposal;
    SynURIOpener1: TSynURIOpener;
    DropTextTarget1: TDropTextTarget;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SynMemoChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SynMemoStatusChange(Sender: TObject;
      Changes: TSynStatusChanges);
    procedure SynMemoDropFiles(Sender: TObject; X, Y: Integer;
      AFiles: TStrings);
    procedure SynMemoReplaceText(Sender: TObject;
      const ASearch, AReplace: string; Line, Column: Integer;
      var Action: TSynReplaceAction);
    procedure FormActivate(Sender: TObject);
    procedure SynMemoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SynMemoExit(Sender: TObject);
    procedure SynMemoKeyPress(Sender: TObject; var Key: char);
    procedure SynMemoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure SynCompletionProposalAfterCodeCompletion(Sender: TObject;
      const Value: string; Shift: TShiftState; Index: Integer;
      EndToken: char);
    procedure SynCompletionProposalExecute(Kind: SynCompletionType;
      Sender: TObject; var CurrentInput: string; var x, y: Integer;
      var CanExecute: Boolean);
    procedure SynMemoPaintTransient(Sender: TObject; Canvas: TCanvas;
      TransientType: TTransientType);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DropTextTarget1Drop(Sender: TObject; ShiftState: TShiftState;
      APoint: TPoint; var Effect: Integer);
  private
    { Private declarations }
    FModified: Boolean;
    FFileName: string;
    FOnChange: TNotifyEvent;
    FOnCaretPosChanged: TNotifyEvent;
    FNewName: Boolean;
    FCharSet: TNCharSet;
    FLeadingChar: string;
    //FAssociatedTreeNode: TTreeNode;
    FPaintUpdating: Boolean;
    FAutoComplete: TSynAutoComplete; //SynEditAutoComplete.TSynAutoComplete;
    FChildStateListeners: TChildStateListenerList;
    FSelBlockStack: TSelBlockStack;
    FIgnoreSelChanges: Boolean;
    procedure SetTitle;
    procedure Changed;
    procedure SetCharSet(const Value: TNCharSet);
    procedure SetLeadingChar(const Value: string);
    procedure SetFileName(AFileName: string);
    function GetFileFormat: TSynEditFileFormat;
    procedure SetFileFormat(const Value: TSynEditFileFormat);
    function GetFileExt: string;
    procedure Init;
    procedure PPWM_Close(var Msg: TMessage); message PPWM_CLOSE;
    procedure SetModified(const Value: Boolean);
  public
    { Public declarations }
    property LeadingChar: string read FLeadingChar write SetLeadingChar;
    property CharSet: TNCharSet read FCharSet write SetCharSet;
    property FileFormat: TSynEditFileFormat read GetFileFormat write SetFileFormat;
    property Modified: Boolean read FModified write SetModified;
    property FileName: string read FFileName;
    property FileExt: string read GetFileExt;
    property NewName: Boolean read FNewName;
    property AutoComplete: TSynAutoComplete read FAutoComplete;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnCaretPosChanged: TNotifyEvent read FOnCaretPosChanged write FOnCaretPosChanged;
    constructor CreateNew(AOwner: TComponent; NewName: string); reintroduce;
    constructor CreateOpen(AOwner: TComponent; FileName: string);
    //constructor CreateNew(AOwner: TComponent; NewName: string; AssociatedTreeNode: TTreeNode); reintroduce;
    //constructor CreateOpen(AOwner: TComponent; FileName: string; AssociatedTreeNode: TTreeNode);
    function SaveDoc: Boolean;
    function SaveDocAs: Boolean;
    procedure SaveWithCharset(FileName: string);
    function IsSelected: Boolean;
    procedure Print;
    procedure CheckHighlighter;
    procedure InsertFileName(Picture: Boolean);
    function MovePosition(var BC: TBufferCoord; Step: Integer): Boolean;
    function FindNextToken(BC: TBufferCoord; var Before, After: TBufferCoord;
               var Token: string; VerifyTokenFunc: TVerifyTokenFunc): Boolean;
    function FindPrevToken(BC: TBufferCoord; var Before, After: TBufferCoord;
               var Token: string; VerifyTokenFunc: TVerifyTokenFunc): Boolean;
    function FindNextTagEnd(const BC: TBufferCoord; var Before, After: TBufferCoord; var Token: string): Boolean;
    function FindPrevTagBegin(const BC: TBufferCoord; var Before, After: TBufferCoord; var Token: string): Boolean;
    function FindMatchingTag(BC: TBufferCoord;
                             var OriginalBefore, OriginalAfter, MatchingBefore, MatchingAfter: TBufferCoord;
                             var Token: string): Boolean;
    procedure AddChildStateListener(const ChildStateListenerHelper: TChildStateListenerHelper);
    procedure AddStateListeners(StateListeners: array of TChildStateListenerHelper);
    procedure RemoveChildStateListener(const ChildStateListener: TChildStateListener);
    procedure ChildActivated;
    procedure UndoSelBlock;
  end;


function CheckTagEnd(Token: string; TokenType: Integer): Boolean;
function CheckTagBegin(Token: string; TokenType: Integer): Boolean;
function CompareCoords(const BC1, BC2: TBufferCoord): Integer;
function CreateListenerHelper(AListener: TChildStateListener; AParam: TObject = nil): TChildStateListenerHelper;
function CreateSelBlock(ACaret, ABlockBegin, ABlockEnd: TBufferCoord): TSelBlock;


const
  CharSetNames: array[TNCharSet] of string = ('utf-8', 'iso-8859-2', 'windows-1250');

implementation

uses UMain, UnitHighlighterProcs, UnitCharsets, dlgConfirmReplace, SynHighlighterWebData,
  UnitDMHighlighters, UnitCommands;

{$R *.DFM}

function CheckTagEnd(Token: string; TokenType: Integer): Boolean;
begin
  Result := (TokenType = 5) and (Token <> '') and (Token[Length(Token)] = '>');
end;

function CheckTagBegin(Token: string; TokenType: Integer): Boolean;
begin
  Result := (TokenType = 5) and (Token <> '') and (Token[1] = '<');
end;

function CompareCoords(const BC1, BC2: TBufferCoord): Integer;
begin
  Result := BC1.Line - BC2.Line;
  if Result = 0 then
    Result := BC1.Char - BC2.Char;
end;

//Czy tag jest "obejmuj¹cy" - czy ma postaæ <xxx> ... </xxx>
function IsPairTag(HTMLTag: string): Boolean;
var i: Integer;
begin
  for i := Low(TSynWeb_Tags) to High(TSynWeb_Tags) do
    if HTMLTag = TSynWeb_Tags[i] then
    begin
      Result := (TSynWeb_TagsData[i] and $80000000) = 0;
      Exit;
    end;
  Result := False;
end;

function CreateListenerHelper(AListener: TChildStateListener; AParam: TObject): TChildStateListenerHelper;
begin
  Result.Listener := AListener;
  Result.Param := AParam;
end;

function CreateSelBlock(ACaret, ABlockBegin, ABlockEnd: TBufferCoord): TSelBlock;
begin
  Result.Caret := ACaret;
  Result.BlockBegin := ABlockBegin;
  Result.BlockEnd := ABlockEnd;
end;

{ TFChild }

constructor TFChild.CreateNew(AOwner: TComponent; NewName: string);
begin
  inherited Create(AOwner);
  Init;
  FNewName := True;
  SynMemo.Modified := False;
  SetFileName(NewName);
  CheckHighlighter;
  NotHMainForm.RefreshCommandBox(Self);
  OnActivate := FormActivate;
  StatusBar1.Panels[2].Text := CharSetNames[FCharSet];
end;

constructor TFChild.CreateOpen(AOwner: TComponent; FileName: string);
var i: Integer;
    s: AnsiString;
    ff: TSynEditFileFormat;
    WithBOM: Boolean;
begin
  inherited Create(AOwner);
  FFileName := FileName;
  Screen.Cursor := crHourglass;
  Init;
  try
    case LoadFromFile(SynMemo.Lines, FileName, WithBOM) of
      seUTF8, seUTF16LE, seUTF16BE:
        FCharSet := ncsUTF8;
      seAnsi:
        begin
          //SynMemo.Clear;
          FCharSet := ncsISO88592;
          s := SynMemo.Lines.Text;
          for i := 1 to Length(s) do
            if s[i] in [#140,#143,#156,#159,#165,#185] then
            begin
              FCharSet := ncsWIN1250;
              //SynMemo.Lines.Text := s;
              Break;
            end;
          if FCharSet = ncsISO88592 then
          begin
            ff := FileFormat;
            SynMemo.Lines.Text := AnsiStringToUnicodeString(s, 28592); //ISO88592ToWin1250(s);
            FileFormat := ff;
          end;
        end;
    end;
  finally
    Screen.Cursor := crDefault;
    OnActivate := FormActivate;
  end;
  SynMemo.Modified := False;
  FNewName := False;
  SetFileName(FileName);
  CheckHighlighter;
  NotHMainForm.RefreshCommandBox(Self);
  StatusBar1.Panels[2].Text := CharSetNames[FCharSet];
end;

procedure TFChild.DropTextTarget1Drop(Sender: TObject; ShiftState: TShiftState;
  APoint: TPoint; var Effect: Integer);
begin
  SynMemo.SelText := DropTextTarget1.Text;
end;

procedure TFChild.FormClose(Sender: TObject; var Action: TCloseAction);
var
  ListenerHelper: TChildStateListenerHelper;
begin
  Action := caFree;
  if NotHMainForm.ActiveMDIChild = Self then
    NotHMainForm.RefreshCommandBox(nil);
  for ListenerHelper in FChildStateListeners do
    ListenerHelper.Listener.FChildClosed(Self, ListenerHelper.Param);
end;

procedure TFChild.SetTitle;
var
  ListenerHelper: TChildStateListenerHelper;
begin
  if SynMemo.Modified then
  begin
    Caption := FileName + ' (zmodyfikowany)';
    StatusBar1.Panels[3].Text := 'MODYFIKOWANY';
  end
  else
  begin
    Caption := FileName;
    StatusBar1.Panels[3].Text := '';
  end;
  for ListenerHelper in FChildStateListeners do
    ListenerHelper.Listener.FChildChangingFileName(Self, ListenerHelper.Param);
end;

procedure TFChild.AddChildStateListener(const ChildStateListenerHelper: TChildStateListenerHelper);
begin
  FChildStateListeners.Add(ChildStateListenerHelper);
  ChildStateListenerHelper.Listener.RegisterFChild(Self, ChildStateListenerHelper.Param);
end;

procedure TFChild.Changed;
begin
  if Assigned(FOnChange) then
    FOnChange(Self);
end;

procedure TFChild.SynMemoChange(Sender: TObject);
begin
  Modified := SynMemo.Modified;
  //SetTitle;
  //Changed;
  FSelBlockStack.ClearAndPushSelBlock(SynMemo);
end;

procedure TFChild.SaveWithCharset(FileName: string);
var s: AnsiString;
    ws: string;
    FS: TWideFileStream;
begin
  ws := SynMemo.Lines.Text;
  if (CharSet in [ncsWIN1250, ncsISO88592]) and
     not IsWideStringMappableToAnsi(ws) then
  begin
    case Application.MessageBox(PChar('Tekst zawiera znaki, które przy zapisie z kodowaniem "' + CharSetNames[CharSet] + '" mog¹ byæ bezpowrotnie utracone. Czy przed zapisem zmieniæ kodowanie na "utf-8"?'), 'UWAGA', MB_ICONSTOP or MB_YESNOCANCEL) of
      IDYES: CharSet := ncsUTF8;
      IDCANCEL: Abort;
    end
  end;
  if CharSet in [ncsWIN1250, ncsISO88592] then
  begin
    FS := TWideFileStream.Create(FileName, fmCreate);
    try
      if CharSet = ncsISO88592 then
        s := UnicodeStringToAnsiString(ws, 28592) //Win1250ToISO88592(s)
      else
        s := UnicodeStringToAnsiString(ws, 1250);
      if s <> '' then
        FS.Write(s[1], Length(s));
    finally
      FS.Free;
    end;
  end
  else
    SaveToFile(SynMemo.Lines, FileName, seUTF8, False);
end;

function TFChild.SaveDoc: Boolean;
begin
  if FNewName then
    Result := SaveDocAs
  else
  begin
    SaveWithCharset(FileName);
    SynMemo.Modified := False;
    FModified := False;
    SetTitle;
    Changed;
    Result := True;
  end;
end;

function TFChild.SaveDocAs: Boolean;
begin
  SaveDialog1.FileName := FileName;
  SaveDialog1.Filter := NotHMainForm.FileOpen1.Dialog.Filter;
  Result := SaveDialog1.Execute;
  if Result then
  begin
    SetFileName(SaveDialog1.FileName);
    SaveWithCharset(FileName);
    SynMemo.Modified := False;
    FModified := False;
    SetTitle;
    Changed;
    FNewName := False;
    CheckHighlighter;
    NotHMainForm.RefreshCommandBox(Self);
  end;
end;

procedure TFChild.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var i: integer;
begin
  if SynMemo.Modified then
  begin
    i := Application.MessageBox(PChar('Zapisaæ dokument "' + FileName + '"?'), 'PotwierdŸ', MB_YESNOCANCEL or MB_ICONQUESTION or MB_APPLMODAL);
    if i = IDYES then
      CanClose := SaveDoc
    else
      CanClose := i = IDNO;
  end;
  if CanClose and not FNewName then
    NotHMainForm.JvMRUManager1.Add(FileName, 0);
end;

procedure TFChild.FormCreate(Sender: TObject);
begin
  //SynMemo.CodeFolding.Enabled := True;
  //SynMemo.CodeFolding.FolderBarColor := clBtnFace;
  FChildStateListeners := TChildStateListenerList.Create;
  FSelBlockStack := TSelBlockStack.Create;
end;

procedure TFChild.FormDestroy(Sender: TObject);
begin
  FChildStateListeners.Free;
  FSelBlockStack.Free;
end;

function TFChild.IsSelected: Boolean;
begin
  Result := SynMemo.SelLength <> 0;
end;

procedure TFChild.PPWM_Close(var Msg: TMessage);
begin
  Close;
end;

procedure TFChild.Print;
begin
  //SynMemo.Print(FileName);
end;

procedure TFChild.RemoveChildStateListener(const ChildStateListener: TChildStateListener);
var
  i: Integer;
begin
  for i := 0 to FChildStateListeners.Count - 1 do
    if FChildStateListeners[i].Listener = ChildStateListener then
    begin
      FChildStateListeners.Delete(i);
      Exit;
    end;
end;

procedure TFChild.SynMemoStatusChange(Sender: TObject;
  Changes: TSynStatusChanges);
var
  t: TSynWebHighlighterTypes;
  h: string;
begin
  if Changes * [scAll, scCaretX, scCaretY] <> [] then
    StatusBar1.Panels[1].Text := Format('Ln:%3d, Kol:%3d', [SynMemo.CaretY, SynMemo.CaretX]);
  if scInsertMode in Changes then
    if SynMemo.InsertMode then
      StatusBar1.Panels[4].Text := 'Wstawianie'
    else
      StatusBar1.Panels[4].Text := 'Zastêpowanie';
  NotHMainForm.ActiveControl := nil;
  if not FIgnoreSelChanges and (scSelection in Changes) then
    FSelBlockStack.PushSelBlock(SynMemo);

  if (Changes-[scCaretX, scCaretY] <> Changes) and (SynMemo.Highlighter is TSynWebBase) then
  begin
    t := SynWebUpdateActiveHighlighter(SynMemo, TSynWebBase(SynMemo.Highlighter));
    h := '';
    if shtML in t then
      h := h + 'HTML/WML,';
    if shtCss in t then
      h := h + 'CSS,';
    if shtES in t then
      h := h + 'JS,';
    if t-[shtPhpInML, shtPhpInCss, shtPhpInES] <> t then
      h := h + 'PHP,';
    StatusBar1.Panels[5].Text := h;
  end;
end;

procedure TFChild.UndoSelBlock;
begin
  FIgnoreSelChanges := True;
  try
    FSelBlockStack.PopAndSetSelBlock(SynMemo);
  finally
    FIgnoreSelChanges := False;
  end;
end;

procedure TFChild.CheckHighlighter;
var
  Highlighter: TSynCustomHighlighter;
  WS: TStringList;
  i: Integer;
begin
  Highlighter := GetHighlighterFromFileExt(NotHMainForm.HighlighterList, ExtractFileExt(FileName));
  if Highlighter <> SynMemo.Highlighter then
  begin
    SynMemo.Highlighter := Highlighter;
    if SynMemo.Highlighter = nil then
      SynMemo.Highlighter := DMHighlighters.TXT;
  end;
  WS := TStringList.Create;
  try
    GetCommandsSetsForExt(FileExt, WS);
    AutoComplete.AutoCompleteList.Clear;
    for i := 0 to WS.Count-1 do
      AutoComplete.AutoCompleteList.AddStrings(TCommandsSet(WS.Objects[i]).AutoCompleteList);
  finally
    WS.Free;
  end;
  //SynMemo.InitCodeFolding;
end;

procedure TFChild.ChildActivated;
var
  ListenerHelper: TChildStateListenerHelper;
begin
  NotHMainForm.RefreshCommandBox(Self);
  for ListenerHelper in FChildStateListeners do
    ListenerHelper.Listener.FChildActivated(Self, ListenerHelper.Param);
end;

procedure TFChild.SynMemoDropFiles(Sender: TObject; X, Y: Integer;
  AFiles: TStrings);
var idx, i: Integer;
    ws: string;
begin
  idx := SynMemo.RowColToCharIndex(SynMemo.DisplayToBufferPos(SynMemo.PixelsToRowColumn(X, Y)));
  ws := '';
  for i := 0 to AFiles.Count-1 do
  begin
    if ws <> '' then ws := ws + WideCRLF;
    ws := ws + ExtractRelativePath(FileName, AFiles[i]);
  end;
  SynMemo.SelStart := idx;
  SynMemo.SelLength := 0;
  SynMemo.SelText := StringReplace(ws, '\', '/', [rfReplaceAll]);
end;

procedure TFChild.SetCharSet(const Value: TNCharSet);
begin
  if FCharSet <> Value then
  begin
    FCharSet := Value;
    SynMemo.Modified := True;
    Modified := True;
    //SetTitle;
    //Changed;
    StatusBar1.Panels[2].Text := CharSetNames[Value];
  end;
end;

procedure TFChild.SynMemoReplaceText(Sender: TObject;
  const ASearch, AReplace: string; Line, Column: Integer;
  var Action: TSynReplaceAction);
var
  APos: TPoint;
  EditRect: TRect;
begin
  if ASearch = AReplace then
    Action := raSkip
  else begin
    APos := SynMemo.ClientToScreen(
      SynMemo.RowColumnToPixels(
      SynMemo.BufferToDisplayPos(
        BufferCoord(Column, Line) ) ) );
    EditRect := ClientRect;
    EditRect.TopLeft := ClientToScreen(EditRect.TopLeft);
    EditRect.BottomRight := ClientToScreen(EditRect.BottomRight);

    if ConfirmReplaceDialog = nil then
      ConfirmReplaceDialog := TConfirmReplaceDialog.Create(Application);
    ConfirmReplaceDialog.PrepareShow(EditRect, APos.X, APos.Y,
      APos.Y + SynMemo.LineHeight, ASearch);
    case ConfirmReplaceDialog.ShowModal of
      mrYes: Action := raReplace;
      mrYesToAll: Action := raReplaceAll;
      mrNo: Action := raSkip;
      else Action := raCancel;
    end;
  end;
end;

procedure TFChild.FormActivate(Sender: TObject);
begin
  //Nie pod³¹czaæ tej metody od razu - jest pod³¹czona w konstruktorze
  ChildActivated;
end;

procedure TFChild.SynMemoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((Ord('A')<=Key) and (Key<=Ord('Z')) or (Ord('0')<=Key) and (Key<=Ord('9'))) then
  begin
    if (Shift = [ssCtrl]) and (SynMemo.Keystrokes.FindShortcut(ShortCut(Key, Shift)) = -1) then
      LeadingChar := Char(Key)
    else
    if Shift <> [] then
      LeadingChar := '';
  end
  else
    LeadingChar := '';
end;

procedure TFChild.SetLeadingChar(const Value: string);
begin
  FLeadingChar := Value;
  if Value = '' then
    StatusBar1.Panels[0].Text := ''
  else
    StatusBar1.Panels[0].Text := '^' + Value;
end;

procedure TFChild.SetModified(const Value: Boolean);
begin
  if FModified <> Value then
  begin
    FModified := Value;
    SetTitle;
    Changed;
  end;
end;

procedure TFChild.SynMemoExit(Sender: TObject);
begin
  LeadingChar := '';
end;

procedure TFChild.SynMemoKeyPress(Sender: TObject; var Key: char);
begin
  if SynIsCharAlphaNumeric(Key) and (LeadingChar <> '') then
  begin
    LeadingChar := LeadingChar + AnsiUpperCase(Key);
    NotHMainForm.ApplyCommandByShortcut(Self, LeadingChar);
    Key := #0;
    LeadingChar := '';
  end
  else
  if Key >= ' ' then
    LeadingChar := '';
end;

procedure TFChild.SynMemoMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
{$IFDEF DEBUG}
var BC: TBufferCoord;
    Token: string;
    Attri: TSynHighlighterAttributes;
    TokenType, Start: Integer;
    s: string;
{$ENDIF}
begin
{$IFDEF DEBUG}
  if SynMemo.GetPositionOfMouse(BC) then
  begin
    SynMemo.GetHighlighterAttriAtRowColEx(BC, Token, TokenType, Start, Attri);
    Memo1.Clear;
    Memo1.Lines.Add('Line: ' + IntToStr(BC.Line) + ', char: ' + IntToStr(BC.Char));
    Memo1.Lines.Add('Token: ' + Token);
    Memo1.Lines.Add('TokenType: ' + IntToStr(TokenType));
    Memo1.Lines.Add('Start: ' + IntToStr(Start));
    s := Token + ' | ';
    if Attri <> nil then
    begin
      Memo1.Lines.Add('Name: ' + Attri.Name);
      Memo1.Lines.Add('FriendlyName: ' + Attri.FriendlyName);
    end;
  end;
{$ENDIF}
end;

procedure TFChild.SetFileName(AFileName: string);
begin
  FFileName := AFileName;
  SetTitle;
end;

procedure TFChild.FormShow(Sender: TObject);
begin
  SynMemoStatusChange(Self, [scAll..scReadOnly]); //Wszystko
{$IFDEF DEBUG}
  Memo1.Visible := True;
{$ENDIF}
end;

function TFChild.MovePosition(var BC: TBufferCoord; Step: Integer): Boolean;
var n,len: Integer;
begin
  Result := True;
  Dec(BC.Line);
  Dec(BC.Char);
  if Step > 0 then
  begin
    n := Length(SynMemo.Lines[BC.Line]) - BC.Char;
    if n >= Step then
      Inc(BC.Char, Step)
    else
      if BC.Line+1 < SynMemo.Lines.Count then
      begin
        BC.Char := 0;
        Inc(BC.Line);
        Dec(Step, n+2);
        while Step > 0 do
        begin
          len := Length(SynMemo.Lines[BC.Line]);
          if Step > len then
            if BC.Line+1 < SynMemo.Lines.Count then
            begin
              Inc(BC.Line);
              Dec(Step, len+2);
            end
            else
            begin
              BC.Char := Length(SynMemo.Lines[BC.Line])-1;
              Step := 0;
              Result := False;
            end
          else
          begin
            BC.Char := Step;
            Step := 0;
          end;
        end;
      end
      else
      begin
        BC.Char := Length(SynMemo.Lines[BC.Line])-1;
        Result := False;
      end;
  end
  else
  begin
    Step := -Step;
    n := BC.Char;
    if n >= Step then
      Dec(BC.Char, Step)
    else
      if BC.Line > 0 then
      begin
        Dec(BC.Line);
        Dec(Step, n+2);
        if Step <= 0 then
          BC.Char := Length(SynMemo.Lines[BC.Line])
        else
        begin
          BC.Char := 0;
          while Step > 0 do
          begin
            len := Length(SynMemo.Lines[BC.Line]);
            if Step > len then
              if BC.Line > 0 then
              begin
                Dec(BC.Line);
                Dec(Step, len+2);
              end
              else
              begin
                BC.Char := 0;
                Step := 0;
                Result := False;
              end
            else
            begin
              BC.Char := len-Step;
              Step := 0;
            end;
          end;
        end;
      end
      else
      begin
        BC.Char := 0;
        Result := False;
      end;
  end;
  Inc(BC.Line);
  Inc(BC.Char);
end;

function TFChild.FindNextToken(BC: TBufferCoord; var Before, After: TBufferCoord;
                                var Token: string; VerifyTokenFunc: TVerifyTokenFunc): Boolean;
var Attri: TSynHighlighterAttributes;
    TokenType, Start: Integer;
begin
  if BC.Char-1 > Length(SynMemo.Lines[BC.Line-1]) then
    BC.Char := Length(SynMemo.Lines[BC.Line-1])+1;
  TokenType := 0;
  Start := 0;
  repeat
    SynMemo.GetHighlighterAttriAtRowColEx(BC, Token, TokenType, Start, Attri);
    if (Start <> 0) and (Token <> '') then
      BC.Char := Start;
    Result := (Token <> '') and VerifyTokenFunc(Token, TokenType);
    if not Result then
    begin
      if Token <> '' then //Czy nie pusty obszar
        MovePosition(BC, Length(Token))
      else
        if not MovePosition(BC, 2) then Break;
    end;
  until Result;
  if Result then
  begin
    Before := BC;
    After := BC;
    MovePosition(After, Length(Token));
  end;
end;

function TFChild.FindPrevToken(BC: TBufferCoord; var Before, After: TBufferCoord;
                               var Token: string; VerifyTokenFunc: TVerifyTokenFunc): Boolean;
var Attri: TSynHighlighterAttributes;
    TokenType, Start: Integer;
begin
  if BC.Char-1 > Length(SynMemo.Lines[BC.Line-1]) then
    BC.Char := Length(SynMemo.Lines[BC.Line-1])+1;
  if not MovePosition(BC, -1) then
  begin
    Result := False;
    Exit;
  end;
  TokenType := 0;
  Start := 0;
  repeat
    SynMemo.GetHighlighterAttriAtRowColEx(BC, Token, TokenType, Start, Attri);
    if (Start <> 0) and (Token <> '') then
      BC.Char := Start;
    Result := VerifyTokenFunc(Token, TokenType);
    if not Result then
    begin
      if not MovePosition(BC, -1) then Break;
    end;
  until Result;
  if Result then
  begin
    Before := BC;
    After := BC;
    MovePosition(After, Length(Token));
  end;
end;

function TFChild.FindNextTagEnd(const BC: TBufferCoord; var Before, After: TBufferCoord; var Token: string): Boolean;
begin
  Result := FindNextToken(BC, Before, After, Token, CheckTagEnd);
end;

function TFChild.FindPrevTagBegin(const BC: TBufferCoord; var Before, After: TBufferCoord; var Token: string): Boolean;
begin
  Result := FindPrevToken(BC, Before, After, Token, CheckTagBegin);
end;

var CheckTagToken: string;

function CheckExactTag(tkn: string; TokenType: Integer): Boolean;
begin
  Result := (TokenType = 6) and (LowerCase(tkn) = CheckTagToken);
end;

function CheckTag(tkn: string; TokenType: Integer): Boolean;
begin
  Result := (TokenType = 6);
end;


function TFChild.FindMatchingTag(BC: TBufferCoord;
  var OriginalBefore, OriginalAfter, MatchingBefore, MatchingAfter: TBufferCoord;
  var Token: string): Boolean;
var Attri: TSynHighlighterAttributes;
    TokenType, Start, n: Integer;
    tok, tmp: string;
    BC_tmp, BC_sta, BC_end: TBufferCoord;
    Match, Match2: TSynTokenMatched;
    res: Integer;
const
  BeginToken:array[0..0] of TSynTokenMatch=(
    (OpenToken: '<'; CloseToken: '>'; TokenKind: Integer(stkMLTag))
  );
  EndToken:array[0..0] of TSynTokenMatch=(
    (OpenToken: '</'; CloseToken: '>'; TokenKind: Integer(stkMLTag))
  );
begin
  Result := False;

  SynMemo.GetHighlighterAttriAtRowColEx(BC, Token, TokenType, Start, Attri);

  if TokenType = 5 then //If we have "<" or "</" we should move position
    if Token = '>' then
    begin
      if not MovePosition(BC, -Length(Token)) then Exit;
    end
    else
    begin
      if not MovePosition(BC, Length(Token)) then Exit;
    end;

  res := SynEditGetMatchingTagEx(SynMemo, BC, Match);
  if (res = 2) or (res = -2) then
  begin
    BC_tmp := Match.OpenTokenPos;
    Dec(BC_tmp.Char);
    res := SynEditGetMatchingTokenEx(SynMemo, BC_tmp, BeginToken, Match2);
    if (res = 2) or (res = -2) then
    begin
      OriginalBefore := Match2.OpenTokenPos;
      OriginalAfter := Match2.CloseTokenPos;
      OriginalAfter.Char := OriginalAfter.Char + Length(Match2.CloseToken);
    end
    else
    begin
      OriginalBefore := Match.OpenTokenPos;
      OriginalAfter := OriginalBefore;
      OriginalAfter.Char := OriginalAfter.Char + Length(Match.OpenToken);
    end;
    BC_tmp := Match.CloseTokenPos;
    Dec(BC_tmp.Char);
    res := SynEditGetMatchingTokenEx(SynMemo, BC_tmp, EndToken, Match2);
    if (res = 2) or (res = -2) then
    begin
      MatchingBefore := Match2.OpenTokenPos;
      MatchingAfter := Match2.CloseTokenPos;
      MatchingAfter.Char := MatchingAfter.Char + Length(Match2.CloseToken);
    end
    else
    begin
      MatchingBefore := Match.CloseTokenPos;
      MatchingAfter := MatchingBefore;
      MatchingAfter.Char := MatchingAfter.Char + Length(Match.CloseToken);
    end;
    Token := Match.OpenToken;
    Result := True;
  end;

{  if BC.Char-1 > Length(SynMemo.Lines[BC.Line-1]) then
    BC.Char := Length(SynMemo.Lines[BC.Line-1])+1;
  Result := False;
  SynMemo.GetHighlighterAttriAtRowColEx(BC, Token, TokenType, Start, Attri);

  if (TokenType <> 5) and (TokenType <> 6) then
  begin
    if not MovePosition(BC, -1) then Exit;
    SynMemo.GetHighlighterAttriAtRowColEx(BC, Token, TokenType, Start, Attri);
  end;

  if (TokenType <> 5) and (TokenType <> 6) then
    if FindPrevTagBegin(BC, BC_sta, BC_tmp, Token) then
      if FindNextTagEnd(BC_tmp, BC_tmp, BC_end, tmp) then
        if (CompareCoords(BC, BC_sta) >= 0) and (CompareCoords(BC, BC_end) <= 0) then
        begin
          BC := BC_sta;
          SynMemo.GetHighlighterAttriAtRowColEx(BC, Token, TokenType, Start, Attri);
        end;

  if TokenType = 5 then
    if (Token = '<') or (Token = '</') then
    begin
      if not FindNextToken(BC, BC, BC_tmp, Token, CheckTag) then
        Exit;
      TokenType := 6;
    end
    else
    if Token = '>' then
    begin
      if not FindPrevToken(BC, BC, BC_tmp, Token, CheckTag) then
        Exit;
      TokenType := 6;
    end;

  if (TokenType = 6) and IsPairTag(Token) then
  begin
    if not FindPrevTagBegin(BC, OriginalBefore, BC_tmp, tok) then
      Exit; // Na wszelki wypadek
    if not FindNextTagEnd(BC, BC_tmp, OriginalAfter, tmp) then
      Exit; // Na wszelki wypadek
    if tok = '<' then
    begin // Szukamy znacznika koñcz¹cego
      n := 1;
      CheckTagToken := LowerCase(Token);
      BC := OriginalAfter;
      while FindNextToken(BC, BC, BC_end, tmp, CheckExactTag) do
      begin
        if not FindPrevTagBegin(BC, MatchingBefore, BC_tmp, tmp) then
          Exit; // Na wszelki wypadek
        if tmp = '<' then
        begin
          BC := BC_end;
          Inc(n);
        end
        else
          if tmp = '</' then
          begin
            Dec(n);
            if n > 0 then
              BC := BC_end;
          end;
        if n = 0 then
        begin
          if not FindNextTagEnd(BC, BC_tmp, MatchingAfter, tmp) then
            Exit; // Na wszelki wypadek
          Result := True;
          Exit;
        end;
      end
    end
    else
    if tok = '</' then
    begin // Szukamy znacznika pocz¹tkowego
      n := 1;
      CheckTagToken := Token;
      BC := OriginalBefore;
      while FindPrevToken(BC, BC, BC_end, tmp, CheckExactTag) do
      begin
        if not FindPrevTagBegin(BC, MatchingBefore, BC_tmp, tmp) then
          Exit; // Na wszelki wypadek
        if tmp = '</' then
          Inc(n)
        else
          if tmp = '<' then
            Dec(n);
        if n = 0 then
        begin
          if not FindNextTagEnd(BC, BC_tmp, MatchingAfter, tmp) then
            Exit; // Na wszelki wypadek
          Result := True;
          Exit;
        end;
      end
    end
  end;}
end;

procedure TFChild.InsertFileName(Picture: Boolean);
var OpenDialog: TOpenDialog;
begin
  if Picture then
    OpenDialog := OPDInsertFileName
  else
    OpenDialog := ODInsertFileName;
  if (OpenDialog.InitialDir = '') and not NewName then
    OpenDialog.InitialDir := ExtractFilePath(FileName);
  if OpenDialog.Execute then
    SynMemo.SelText := StringReplace(ExtractRelativePath(FileName, OpenDialog.FileName), '\', '/', [rfReplaceAll]);
end;

function TFChild.GetFileFormat: TSynEditFileFormat;
begin
  Result := (SynMemo.Lines as TSynEditStringList).FileFormat;
end;

procedure TFChild.SetFileFormat(const Value: TSynEditFileFormat);
begin
  (SynMemo.Lines as TSynEditStringList).FileFormat := Value;
end;

//Following procedures are from SynWebTest program from SynWeb:
procedure TFChild.SynCompletionProposalAfterCodeCompletion(Sender: TObject;
  const Value: string; Shift: TShiftState; Index: Integer;
  EndToken: char);

  function CaretBetween(AStr: String): Boolean;
  var
    i: Integer;
  begin
    i := Pos(AStr, Value);
    Result := i > 0;
    if Result then
      SynMemo.CaretX := SynMemo.CaretX - (Length(Value) - i);
  end;

var b: Boolean;
begin
  b := CaretBetween('()') or CaretBetween('><') or CaretBetween('""') or CaretBetween(' ;');
end;

procedure TFChild.SynCompletionProposalExecute(Kind: SynCompletionType;
  Sender: TObject; var CurrentInput: string; var x, y: Integer;
  var CanExecute: Boolean);
begin
  SynWebFillCompletionProposal(SynMemo, DMHighlighters.WebHtml, SynCompletionProposal, CurrentInput);
end;

procedure TFChild.SynMemoPaintTransient(Sender: TObject; Canvas: TCanvas;
  TransientType: TTransientType);
const
  Tokens:array[0..17] of TSynTokenMatch=(
    (OpenToken: '('; CloseToken: ')'; TokenKind: Integer(stkCssSymbol)),
    (OpenToken: '{'; CloseToken: '}'; TokenKind: Integer(stkCssSymbol)),
    (OpenToken: '['; CloseToken: ']'; TokenKind: Integer(stkCssSymbol)),
    (OpenToken: '('; CloseToken: ')'; TokenKind: Integer(stkEsSymbol)),
    (OpenToken: '{'; CloseToken: '}'; TokenKind: Integer(stkEsSymbol)),
    (OpenToken: '['; CloseToken: ']'; TokenKind: Integer(stkEsSymbol)),
    (OpenToken: '('; CloseToken: ')'; TokenKind: Integer(stkPhpSymbol)),
    (OpenToken: '['; CloseToken: ']'; TokenKind: Integer(stkPhpSymbol)),
    (OpenToken: '{'; CloseToken: '}'; TokenKind: Integer(stkPhpSymbol)),
    (OpenToken: '<'; CloseToken: '>'; TokenKind: Integer(stkMLTag)),
    (OpenToken: '<'; CloseToken: '/>'; TokenKind: Integer(stkMLTag)),
    (OpenToken: '</'; CloseToken: '>'; TokenKind: Integer(stkMLTag)),
    (OpenToken: '<!'; CloseToken: '>'; TokenKind: Integer(stkMLTag)),
    (OpenToken: '<![cdata['; CloseToken: ']]>'; TokenKind: Integer(stkMLTag)),
    (OpenToken: '<?'; CloseToken: '?>'; TokenKind: Integer(stkMLTag)),
    (OpenToken: '<%'; CloseToken: '%>'; TokenKind: Integer(stkMLTag)),
    (OpenToken: 'try'; CloseToken: 'catch'; TokenKind: Integer(stkPhpKeyword)),
    (OpenToken: 'do'; CloseToken: 'while'; TokenKind: Integer(stkPhpKeyword)));

  Tokens2:array[0..7] of TSynTokenMatch=(
    (OpenToken: 'if'; CloseToken: 'else'; TokenKind: Integer(stkPhpKeyword)),
//    (OpenToken: 'if'; CloseToken: 'elseif'; TokenKind: Integer(stkPhpKeyword)),
    (OpenToken: 'if'; CloseToken: 'endif'; TokenKind: Integer(stkPhpKeyword)),
//    (OpenToken: 'elseif'; CloseToken: 'else'; TokenKind: Integer(stkPhpKeyword)),
//    (OpenToken: 'elseif'; CloseToken: 'elseif'; TokenKind: Integer(stkPhpKeyword)),
//    (OpenToken: 'elseif'; CloseToken: 'endif'; TokenKind: Integer(stkPhpKeyword)),
    (OpenToken: 'for'; CloseToken: 'endfor'; TokenKind: Integer(stkPhpKeyword)),
    (OpenToken: 'foreach'; CloseToken: 'endforeach'; TokenKind: Integer(stkPhpKeyword)),
    (OpenToken: 'while'; CloseToken: 'endforeach'; TokenKind: Integer(stkPhpKeyword)),
    (OpenToken: 'foreach'; CloseToken: 'endforeach'; TokenKind: Integer(stkPhpKeyword)),
    (OpenToken: 'switch'; CloseToken: 'endswitch'; TokenKind: Integer(stkPhpKeyword)),
    (OpenToken: 'declare'; CloseToken: 'enddeclare'; TokenKind: Integer(stkPhpKeyword)));
var
  Editor : TSynEdit;
  Pix: TPoint;
  Match: TSynTokenMatched;
  I: Integer;
  bSingle: Boolean;

  function CharToPixels(P: TBufferCoord): TPoint;
  begin
    Result:=Editor.RowColumnToPixels(Editor.BufferToDisplayPos(P));
  end;

  function TryMatch: Integer;
  begin
    bSingle := False;
    Result := SynEditGetMatchingTagEx(Editor, Editor.CaretXY, Match);
    if Result = 0 then
    begin
      Result := SynEditGetMatchingTokenEx(Editor, Editor.CaretXY, Tokens, Match);
      if (Result = -1) and (Match.CloseToken = 'while') then
        Result := 0;
      if Result = 0 then
      begin
        bSingle := True;
        Result := SynEditGetMatchingTokenEx(Editor, Editor.CaretXY, Tokens2, Match);
      end;
    end;
  end;

begin
  if FPaintUpdating then
    Exit;

  Editor := TSynEdit(Sender);

  if TransientType = ttBefore then
  begin
    I := TryMatch;
    if I = 0 then
      Exit;

    FPaintUpdating := True;

    if I <> -1 then
      Editor.InvalidateLines(Match.OpenTokenPos.Line, Match.OpenTokenPos.Line);

    if I <> 1 then
      Editor.InvalidateLines(Match.CloseTokenPos.Line, Match.CloseTokenPos.Line);

    FPaintUpdating := False;
    Exit;
  end;

  if Editor.SelAvail then
    Exit;

  I := TryMatch;

  if I = 0 then
    Exit;

  Canvas.Brush.Style := bsSolid;

  if Abs(I) = 2 then
    Canvas.Brush.Color := clAqua // matched color
  else
    if bSingle then
      Exit
    else
      Canvas.Brush.Color := clYellow; // unmatched color

  if I <> -1 then
  begin
    Pix := CharToPixels(Match.OpenTokenPos);
    Canvas.Font.Color := Editor.Font.Color;
    Canvas.Font.Style := Match.TokenAttri.Style;
    Canvas.TextOut(Pix.X, Pix.Y, Match.OpenToken);
  end;

  if I <> 1 then
  begin
    Pix := CharToPixels(Match.CloseTokenPos);
    Canvas.Font.Color := Editor.Font.Color;
    Canvas.Font.Style := Match.TokenAttri.Style;
    Canvas.TextOut(Pix.X, Pix.Y, Match.CloseToken);
  end;
end;
//End of procedures from SynWebTest program

function TFChild.GetFileExt: string;
begin
  Result := ExtractFileExtN(FFileName);
end;

procedure TFChild.Init;
begin
  if not Assigned(FAutoComplete) then
    FAutoComplete := TSynAutoComplete.Create(Self);
  FAutoComplete.Editor := SynMemo;

  AssignSynMemo(SynMemo, NotHMainForm.SynMemoTmp);
end;

procedure TFChild.AddStateListeners(StateListeners: array of TChildStateListenerHelper);
var
  i: Integer;
begin
  for i := 0 to High(StateListeners) do
  begin
    AddChildStateListener(StateListeners[i]);
    StateListeners[i].Listener.FChildActivated(Self, StateListeners[i].Param);
  end;
end;

{ TChildStateListener }

constructor TChildStateListener.Create;
begin
  inherited;
  FChildrenList := TList<TFChild>.Create;
end;

destructor TChildStateListener.Destroy;
var
  Child: TFChild;
begin
  for Child in FChildrenList do
    Child.RemoveChildStateListener(Self);
  FChildrenList.Free;
  inherited;
end;

procedure TChildStateListener.FChildActivated(FChild: TFChild; Param: TObject);
begin
  InternalFChildActivated(FChild, Param);
end;

procedure TChildStateListener.FChildChangingFileName(FChild: TFChild;
  Param: TObject);
begin
  InternalFChildChangingFileName(FChild, Param);
end;

procedure TChildStateListener.FChildClosed(FChild: TFChild; Param: TObject);
begin
  FChildrenList.Remove(FChild);
  InternalFChildClosed(FChild, Param);
end;

procedure TChildStateListener.RegisterFChild(FChild: TFChild; Param: TObject);
begin
  InternalRegisterFChild(FChild, Param);
  if not FChildrenList.Contains(FChild) then
    FChildrenList.Add(FChild);
end;

{ TSelBlockStack }

procedure TSelBlockStack.ClearAndPushSelBlock(SynEdit: TSynEdit);
begin
  Clear;
  Push(CreateSelBlock(SynEdit.CaretXY, SynEdit.BlockBegin, SynEdit.BlockEnd));
end;

procedure TSelBlockStack.PopAndSetSelBlock(SynEdit: TSynEdit);
var
  SB: TSelBlock;
begin
  if Count > 0 then
  begin
    SB := Pop;
    if (CompareCoords(SB.Caret, SynEdit.CaretXY) = 0) and
       (CompareCoords(SB.BlockBegin, SynEdit.BlockBegin) = 0) and
       (CompareCoords(SB.BlockEnd, SynEdit.BlockEnd) = 0) then
    begin
      if Count > 0 then
        SB := Pop;
    end;
    SynEdit.SetCaretAndSelection(SB.Caret, SB.BlockBegin, SB.BlockEnd);
    PushSelBlock(SynEdit);
  end;
end;

procedure TSelBlockStack.PushSelBlock(SynEdit: TSynEdit);
var
  SB: TSelBlock;
  CanPush: Boolean;
begin
  if SynEdit.SelAvail then
  begin
    if Count > 0 then
    begin
      SB := Peek;
      CanPush := (CompareCoords(SB.Caret, SynEdit.CaretXY) <> 0) or
                 (CompareCoords(SB.BlockBegin, SynEdit.BlockBegin) <> 0) or
                 (CompareCoords(SB.BlockEnd, SynEdit.BlockEnd) <> 0);
    end
    else
      CanPush := True;

    if CanPush then
      Push(CreateSelBlock(SynEdit.CaretXY, SynEdit.BlockBegin, SynEdit.BlockEnd));
  end
  else
    ClearAndPushSelBlock(SynEdit)
end;

end.
