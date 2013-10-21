unit ContMain64;

{$MODE Delphi}

interface

uses Windows, ComObj, ShlObj, ActiveX, Classes;

type
  TContextMenu = class(TComObject, IContextMenu, IShellExtInit)
  private
    FFileNameList: TStringList;
    FMenuIdx: UINT;
  protected
    // metody interfejsu IContextMenu
    function QueryContextMenu(Menu: HMENU; indexMenu, idCmdFirst, idCmdLast,
      uFlags: UINT): HResult; stdcall;
    function InvokeCommand(var lpici: TCMInvokeCommandInfo): HResult; stdcall;
    //function GetCommandString(idCmd, uType: UINT; pwReserved: PUINT; pszName: LPSTR; cchMax: UINT): HResult; stdcall;
    function GetCommandString(idcmd: UINT_Ptr; uType:UINT; pwreserved: puint; pszName: LPStr; cchMax: uint):HResult; StdCall;
    // metody interfejsu IShellExtInit
    function Initialize(pidlFolder: PItemIDList; lpdobj: IDataObject;
      hKeyProgID: HKEY): HResult; reintroduce; stdcall;
  public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
  end;

  TContextMenuFactory = class(TComObjectFactory)
  protected
    {function GetProgID: string; override;}
    procedure ApproveShellExtension(Register: Boolean; const ClsID: string);
      virtual;
  public
    procedure UpdateRegistry(Register: Boolean); override;
  end;

implementation

uses ComServ, SysUtils, ShellAPI, Registry;

procedure ExecuteNotH(const FileNameList: TStringList; ParentWnd: HWND);
const
  SPackInfoApp = '%snoth.exe';
  SCmdLine = '"%s" %s';
  SErrorStr = 'B³¹d podczas uruchamiania NotH:'#13#10#13#10;
var
  PI: TProcessInformation;
  SI: TStartupInfo;
  ExeName, ExeCmdLine: string;
  Buffer: array[0..MAX_PATH] of char;
  i: Integer;
begin
  // pobierz katalog, w którym zlokalizowana jest biblioteka DLL.
  // zak³adamy, ¿e plik *.EXE znajduje siê w tym samym katalogu.

  GetModuleFileName(HInstance, Buffer, SizeOf(Buffer));
  ExeName := Format(SPackInfoApp, [ExtractFilePath(Buffer)]);
  ExeCmdLine := ExeName;
  for i := 0 to FileNameList.Count-1 do
    ExeCmdLine := ExeCmdLine + ' "' + FileNameList[i] + '"';
  FillChar(SI, SizeOf(SI), 0);
  SI.cb := SizeOf(SI);
  if not CreateProcess(PChar(ExeName), PChar(ExeCmdLine), nil, nil, False,
    0, nil, nil, SI, PI) then
    MessageBox(ParentWnd, PChar(SErrorStr + SysErrorMessage(GetLastError)),
      'B³¹d', MB_OK or MB_ICONERROR);
end;

{ TContextMenu }

{ TContextMenu.IContextMenu }

function TContextMenu.QueryContextMenu(Menu: HMENU; indexMenu, idCmdFirst,
  idCmdLast, uFlags: UINT): HResult;
begin
  FMenuIdx := indexMenu;
  // Dodaj jedn¹ opcjê do menu kontekstowego
  InsertMenu (Menu, FMenuIdx, MF_STRING or MF_BYPOSITION, idCmdFirst,
    'NotH');
  // Zwróc indeks pierwszej wolnej pozycji
  Result := FMenuIdx + 1;
end;

function TContextMenu.InvokeCommand(var lpici: TCMInvokeCommandInfo): HResult;
begin
  Result := S_OK;
  try
    // Upewnij siê, ¿e wywo³anie pochodzi z serwera, nie z aplikacji
    if HiWord(DWORD(lpici.lpVerb)) <> 0 then
    begin
      Result := E_FAIL;
      Exit;
    end;
    // Wykonaj polecenie okreœlone przez lpici.lpVerb.
    // Zwróc E_INVALIDARG jeœli przekazano niew³aœciw¹ liczbê parametrów
    if LoWord(DWORD(lpici.lpVerb)) = FMenuIdx then
      ExecuteNotH(FFileNameList, lpici.hwnd)
    else
      Result := E_INVALIDARG;
  except
    MessageBox(lpici.hwnd, 'B³¹d podczas uruchamiania programu NotH.',
                           'B³¹d',
                           MB_OK or MB_ICONERROR);
    Result := E_FAIL;
  end;
end;

function TContextMenu.GetCommandString(idcmd: UINT_Ptr; uType:UINT; pwreserved: puint; pszName: LPStr; cchMax: uint): HRESULT;
const
  SCmdStrA: String = 'Uruchomienie programu NotH';
  SCmdStrW: WideString = 'Uruchomienie programu NotH';
begin
  Result := S_OK;
  try
    // upewnij siê, ¿e indeks menu jest poprawny, a pow³oka ¿¹da
    // tekstu pomocy
    if (idCmd = FMenuIdx) and ((uType and GCS_HELPTEXT) <> 0) then
    begin
      // zwróæ ³añcuch pomocy dla opcji menu

      // traktuj jako Unicode w Windows 2000 i nowszych
      if Win32MajorVersion >= 5 then
        Move(SCmdStrW[1], pszName^,
          Min(cchMax, Length(SCmdStrW) + 1) * SizeOf(WideChar))
      else                            // traktuj jako ANSI
        StrLCopy(pszName, PChar(SCmdStrA), Min(cchMax, Length(SCmdStrA) + 1));
    end
    else
      Result := E_INVALIDARG;
  except
    Result := E_UNEXPECTED;
  end;
end;

{ TContextMenu.IShellExtInit }

function TContextMenu.Initialize(pidlFolder: PItemIDList; lpdobj: IDataObject;
  hKeyProgID: HKEY): HResult;
var
  Medium: TStgMedium;
  FE: TFormatEtc;
  FFileName: array[0..MAX_PATH] of char;
  n, i: Integer;
begin
  try
    // B³¹d jeœli lpdobj = nil.
    if lpdobj = nil then
    begin
      Result := E_FAIL;
      Exit;
    end;
    with FE do
    begin
      cfFormat := CF_HDROP;
      ptd := nil;
      dwAspect := DVASPECT_CONTENT;
      lindex := -1;
      tymed := TYMED_HGLOBAL;
    end;

    // zapisz informacjê w medium globalnym w formacie CF_HDROP

    Result := lpdobj.GetData(FE, Medium);
    if Failed(Result) then Exit;
    try
      FFileNameList.Clear;
      n := DragQueryFile(Medium.hGlobal, $FFFFFFFF, nil, 0);
      for i := 0 to n-1 do
      begin
        DragQueryFile(Medium.hGlobal, i, FFileName, SizeOf(FFileName));
        FFileNameList.Add(FFileName);
      end;
      Result := NOERROR;
    finally
      ReleaseStgMedium(medium);
    end;
  except
    Result := E_UNEXPECTED;
  end;
end;

procedure TContextMenu.AfterConstruction;
begin
  FFileNameList := TStringList.Create;
end;

procedure TContextMenu.BeforeDestruction;
begin
  FFileNameList.Free;
end;


{ TContextMenuFactory }

{function TContextMenuFactory.GetProgID: string;
begin
  // ProgID nie jest wymagany dla serwera rozszerzaj¹cego
  Result := '';
end;}

procedure TContextMenuFactory.UpdateRegistry(Register: Boolean);
var
  ClsID: string;
begin
  ClsID := GUIDToString(ClassID);
  inherited UpdateRegistry(Register);
  ApproveShellExtension(Register, ClsID);
  if Register then
  begin
    // rejestruj niniejsz¹ biblitoekê DLL jako rozszerzenie menu kontekstowego
    // dla plików *.*
    CreateRegKey('*\shellex\ContextMenuHandlers\' +
      'RunNotH', '', ClsID);
  end
  else begin
    DeleteRegKey('.bpl');
    DeleteRegKey('*\shellex\ContextMenuHandlers\' +
      'RunNotH');
  end;
end;

procedure TContextMenuFactory.ApproveShellExtension(Register: Boolean;
  const ClsID: string);

// niniejsza metoda wykonuje czynnoœci rejestracyjne niezbêdne w Windows NT
const
  SApproveKey = 'SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Approved';
begin
  with TRegistry.Create do
    try
      RootKey := HKEY_LOCAL_MACHINE;
      if not OpenKey(SApproveKey, True) then Exit;
      if Register then WriteString(ClsID, Description)
      else DeleteValue(ClsID);
    finally
      Free;
    end;
end;

const
  CLSID_CopyHook: TGUID = '{75258D8E-51F7-4B76-9527-9F41ACD1812E}';

initialization
  TContextMenuFactory.Create(ComServer, TContextMenu, CLSID_CopyHook,
    'RunNotH_ContextMenu', 'Run NotH Context Menu Shell Extension',
    ciMultiInstance, tmApartment);
end.
