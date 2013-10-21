unit UMain;

interface

{$R windowsxp.res}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ComCtrls, ToolWin, StdCtrls, Spin, ImgList,
  UChild, UnitCommands,
  StdActns, ExtActns, ActnList, ShellAPI,
  ExtCtrls, ExtDlgs, JPEG, StrUtils, AppEvnts,

  JclSysinfo, JclAppInst,
  JvAppStorage, JvAppRegistryStorage, JvMRUManager, JvExExtCtrls,
  JvComponent, JvFormPlacement, JvComponentBase, JvDialogActns,
  JvDockTree, JvDockControlForm, JvDockVIDStyle, JvDockVSNetStyle,
  JvBalloonHint, JvDockVCStyle, JvDockDelphiStyle, JvTabBarXPPainter,
  JvDockVIDVCStyle, JvExComCtrls, JvToolBar, JvShape, JvTabBar,

  SynEditPrint, SynEdit, SynMemo, SynHighlighterDfm,
  SynExportRTF, SynEditExport, SynExportHTML, SynEditOptionsDialog,
  SynEditMiscClasses, SynEditSearch, SynHighlighterWeb,
  SynEditTextBuffer, SynEditKeyCmds, SynColorDlg,
  SynEditRegexSearch, SynEditHighlighter, SynUnicode,

  DragDrop, DropTarget, DragDropInternet, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

const
  WMX_CONFIRMREADY = WM_USER + 1000;
  WMX_AFTERSHOW = WM_USER + 1001;

type
  TJvTabBarPP = class(TJvTabBar)
  private
    { Private declarations }
    type
      TTabBarCSListener = class(TChildStateListener)
      protected
        procedure InternalRegisterFChild(FChild: TFChild; Param: TObject); override;
        procedure InternalFChildActivated(FChild: TFChild; Param: TObject); override;
        procedure InternalFChildClosed(FChild: TFChild; Param: TObject); override;
        procedure InternalFChildChangingFileName(FChild: TFChild; Param: TObject); override;
      end;
  private
    FChildListener: TTabBarCSListener;
  public
    property ChildListener: TTabBarCSListener read FChildListener;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

  TNotHMainForm = class(TForm)
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    ImageList2: TImageList;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    EditSelectAll1: TEditSelectAll;
    EditUndo1: TEditUndo;
    EditDelete1: TEditDelete;
    WindowCascade1: TWindowCascade;
    WindowTileHorizontal1: TWindowTileHorizontal;
    WindowTileVertical1: TWindowTileVertical;
    WindowMinimizeAll1: TWindowMinimizeAll;
    FileOpen1: TFileOpen;
    FilePrintSetup1: TFilePrintSetup;
    FileExit1: TFileExit;
    FontEdit1: TFontEdit;
    PrintDlg1: TPrintDlg;
    FileNew1: TAction;
    FileSave1: TAction;
    FileSaveAs1: TAction;
    WindowClose1: TWindowClose;
    JvFormStorage1: TJvFormStorage;
    JvAppRegistryStorage1: TJvAppRegistryStorage;
    SynEditSearch: TSynEditSearch;
    SynEditOptionsDialog1: TSynEditOptionsDialog;
    SynEditPrint1: TSynEditPrint;
    EditRedo1: TAction;
    PageSetupDialog1: TPageSetupDialog;
    PageDlg1: TAction;
    SettingsShortCuts: TAction;
    SynMemoTmp: TSynMemo;
    SettingsSynMemoOptions: TAction;
    SettingsMargins: TAction;
    SynExporterHTML1: TSynExporterHTML;
    SynExporterRTF1: TSynExporterRTF;
    SynEditRegexSearch: TSynEditRegexSearch;
    ActionUTF8: TAction;
    ActionWIN1250: TAction;
    ActionISO88592: TAction;
    ActionKodowanie: TAction;
    JvMRUManager1: TJvMRUManager;
    actSearch: TAction;
    actSearchNext: TAction;
    actSearchPrev: TAction;
    actSearchReplace: TAction;
    JvDockServer1: TJvDockServer;
    JvDockVSNetStyle1: TJvDockVSNetStyle;
    ActionEveryLine: TAction;
    CoolBar1: TCoolBar;
    TBFile: TToolBar;
    BNew: TToolButton;
    BOpen: TToolButton;
    BSave: TToolButton;
    ToolButton4: TToolButton;
    BPrint: TToolButton;
    ToolButton1: TToolButton;
    ToolButton7: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    JvBalloonHint1: TJvBalloonHint;
    ActionInsertFileName: TAction;
    ActionInsertPictFileName: TAction;
    ActionViewCommandBox: TAction;
    ActionReloadCommands: TAction;
    ActionPreviewWeb: TAction;
    ActionHelpDocs: TAction;
    ActionHelpHomepage: TAction;
    ActionHelpAbout: TAction;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ActionChangeFocus: TAction;
    ActionCommandsExpand: TAction;
    ActionCommandsCollapse: TAction;
    ActionShowCmdWithShortcut: TAction;
    ActionShowCmdWithoutShortcut: TAction;
    ActionShowAllCommands: TAction;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    ToolButton21: TToolButton;
    ToolButton22: TToolButton;
    ToolButton23: TToolButton;
    ActionShowToolbar: TAction;
    ActionViewFileBox: TAction;
    ActionCitation: TAction;
    ActionDecitation: TAction;
    ActionShowVersionForm: TAction;
    ActionHTMLSelNextTag: TAction;
    ActionHTMLSelPrevTag: TAction;
    ActionSwitch: TAction;
    ActionHTMLDelPairTags: TAction;
    ActionHTMLSelectBlock: TAction;
    ApplicationEvents1: TApplicationEvents;
    ToolButton24: TToolButton;
    ToolButton25: TToolButton;
    ToolButton26: TToolButton;
    ColorDialog1: TColorDialog;
    JvShape1: TJvShape;
    ActionSpecialChars: TAction;
    ActionProcessEmptyLines: TAction;
    ToolButton27: TToolButton;
    ActionIgnoreFileExt: TAction;
    ToolButton28: TToolButton;
    ActionParagraphsToLines: TAction;
    ActionHelpShortcuts: TAction;
    ActionHelpBook: TAction;
    ActionDOS: TAction;
    ActionUNIX: TAction;
    ActionMac: TAction;
    ActionUNICODE: TAction;
    ActionShowCommInfo: TAction;
    MainMenu1: TMainMenu;
    Plik1: TMenuItem;
    Nowy1: TMenuItem;
    Otwrz1: TMenuItem;
    Zapisz1: TMenuItem;
    Zapiszjako1: TMenuItem;
    Zamknij1: TMenuItem;
    Ostatniootwierane1: TMenuItem;
    N10: TMenuItem;
    Zobaczwprzegldarce1: TMenuItem;
    N1: TMenuItem;
    Ustawieniastrony1: TMenuItem;
    Ustawieniamarginesw1: TMenuItem;
    Ustawieniadrukarki1: TMenuItem;
    Drukuj1: TMenuItem;
    N2: TMenuItem;
    Koniec1: TMenuItem;
    Edycja1: TMenuItem;
    Cofnij1: TMenuItem;
    Ponw1: TMenuItem;
    N3: TMenuItem;
    Wytnij1: TMenuItem;
    Kopiuj1: TMenuItem;
    Wklej1: TMenuItem;
    Usu1: TMenuItem;
    Usuznaczniki1: TMenuItem;
    N4: TMenuItem;
    Zaznaczenie1: TMenuItem;
    ZaznacznastpnytagHTML1: TMenuItem;
    ZaznaczpoprzednitagHTML1: TMenuItem;
    Przeczpocztkowykocowy1: TMenuItem;
    ZaznaczograniczonyznacznikiemblokHTML1: TMenuItem;
    ZaznaczWszystko1: TMenuItem;
    N6: TMenuItem;
    Znajd1: TMenuItem;
    Znajdnastpny1: TMenuItem;
    Znajdpoprzedni1: TMenuItem;
    Zamie1: TMenuItem;
    N13: TMenuItem;
    CytujHTML1: TMenuItem;
    DecytujHTML1: TMenuItem;
    N15: TMenuItem;
    Akapitywlinie1: TMenuItem;
    Widok1: TMenuItem;
    Pokapaseknarzdzi1: TMenuItem;
    N12: TMenuItem;
    Okienkanarzdziowe1: TMenuItem;
    Paletaszablonw1: TMenuItem;
    Pokalistplikw1: TMenuItem;
    Przeczedytorszablony1: TMenuItem;
    N5: TMenuItem;
    Rozwiwszystko1: TMenuItem;
    Zwiwszystko1: TMenuItem;
    Pokazujtreszablonu1: TMenuItem;
    N11: TMenuItem;
    Pokawszystkiekomendy1: TMenuItem;
    Pokatylkokomendyzeskrtami1: TMenuItem;
    Pokatylkokomendybezskrtw1: TMenuItem;
    Pokazujcszablonyignorujrozszerzeniepliku1: TMenuItem;
    N14: TMenuItem;
    Ustawieniawersjijzykw1: TMenuItem;
    Format1: TMenuItem;
    UTF81: TMenuItem;
    ISO885921: TMenuItem;
    WIN12501: TMenuItem;
    N18: TMenuItem;
    Konieclinii1: TMenuItem;
    DOS1: TMenuItem;
    UNIX1: TMenuItem;
    Mac1: TMenuItem;
    Unicode1: TMenuItem;
    Wstaw1: TMenuItem;
    ciekadopliku1: TMenuItem;
    ciekadoplikuobrazka1: TMenuItem;
    Opcje1: TMenuItem;
    Opcjeedytora1: TMenuItem;
    Skrtyklawiszowe1: TMenuItem;
    N8: TMenuItem;
    Stosujoddzielniedokadejliniizaznaczonegotekstu1: TMenuItem;
    Przetwarzajpustelinie1: TMenuItem;
    N9: TMenuItem;
    Odwieszablony1: TMenuItem;
    Okna1: TMenuItem;
    Kaskada1: TMenuItem;
    Rozmiewszystkie1: TMenuItem;
    ileVertically1: TMenuItem;
    MinimizeAll1: TMenuItem;
    N7: TMenuItem;
    Oprogramie1: TMenuItem;
    Opis1: TMenuItem;
    Skrtyklawiszowe2: TMenuItem;
    N16: TMenuItem;
    Stronadomowaprogramu1: TMenuItem;
    Stronadomowaksiki1: TMenuItem;
    N17: TMenuItem;
    Oprogramie2: TMenuItem;
    PopupMenu1: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    ActionSort: TAction;
    Inneoperacje1: TMenuItem;
    Sortujlinie1: TMenuItem;
    SynColorDialog1: TSynColorDialog;
    SettingsColors: TAction;
    Ustawieniakolorw1: TMenuItem;
    JvTabBarXPPainter1: TJvTabBarXPPainter;
    DropURLTarget1: TDropURLTarget;
    IdHTTP1: TIdHTTP;
    ActionHTMLSelUpTag: TAction;
    ZaznacznadrzdnyznacznikXHTML1: TMenuItem;
    ActionUndoSelBlock: TAction;
    Wrdopoprzedniegozaznaczenia1: TMenuItem;
    ToolButton29: TToolButton;
    ToolButton30: TToolButton;
    ActionActivateWebHSwitch: TAction;
    procedure FormCreate(Sender: TObject);
    procedure Plik1Click(Sender: TObject);
    procedure Edycja1Click(Sender: TObject);
    procedure Zapiszjako1Click(Sender: TObject);
    procedure Zamknij1Click(Sender: TObject);
    procedure Drukuj1Click(Sender: TObject);
    procedure Koniec1Click(Sender: TObject);
    procedure Cofnij1Click(Sender: TObject);
    procedure Wytnij1Click(Sender: TObject);
    procedure Kopiuj1Click(Sender: TObject);
    procedure Wklej1Click(Sender: TObject);
    procedure Usu1Click(Sender: TObject);
    procedure ZaznaczWszystko1Click(Sender: TObject);
    procedure Kaskada1Click(Sender: TObject);
    procedure Rozmiewszystkie1Click(Sender: TObject);
    procedure ActionHelpAboutExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FileOpen1Accept(Sender: TObject);
    procedure FileSave1Execute(Sender: TObject);
    procedure FileSaveAs1Execute(Sender: TObject);
    procedure FontEdit1BeforeExecute(Sender: TObject);
    procedure FontEdit1Accept(Sender: TObject);
    procedure EditRedo1Update(Sender: TObject);
    procedure EditRedo1Execute(Sender: TObject);
    procedure PrintDlg1BeforeExecute(Sender: TObject);
    procedure PrintDlg1Accept(Sender: TObject);
    procedure PageDlg1Execute(Sender: TObject);
    procedure SearchFind1Accept(Sender: TObject);
    procedure SettingsShortCutsExecute(Sender: TObject);
    procedure SettingsSynMemoOptionsExecute(Sender: TObject);
    procedure SettingsMarginsExecute(Sender: TObject);
    procedure JvFormStorage1RestorePlacement(Sender: TObject);
    procedure JvFormStorage1SavePlacement(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActionUTF8Execute(Sender: TObject);
    procedure ActionUTF8Update(Sender: TObject);
    procedure ActionKodowanieExecute(Sender: TObject);
    procedure JvMRUManager1Click(Sender: TObject; const RecentName,
      Caption: String; UserData: Integer);
    procedure actSearchExecute(Sender: TObject);
    procedure actSearchNextExecute(Sender: TObject);
    procedure actSearchPrevExecute(Sender: TObject);
    procedure actSearchReplaceExecute(Sender: TObject);
    procedure actSearchNextUpdate(Sender: TObject);
    procedure actSearchReplaceUpdate(Sender: TObject);
    procedure _IsThereAnyDocument(Sender: TObject);
    procedure Okna1Click(Sender: TObject);
    procedure TntTreeViewDblClick(Sender: TObject);
    procedure ActionEveryLineExecute(Sender: TObject);
    procedure ActionInsertFileNameExecute(Sender: TObject);
    procedure ActionViewCommandBoxUpdate(Sender: TObject);
    procedure ActionViewCommandBoxExecute(Sender: TObject);
    procedure ActionReloadCommandsExecute(Sender: TObject);
    procedure ActionPreviewWebExecute(Sender: TObject);
    procedure ActionHelpDocsExecute(Sender: TObject);
    procedure ActionHelpHomepageExecute(Sender: TObject);
    procedure TntTreeViewKeyPress(Sender: TObject; var Key: Char);
    procedure ActionChangeFocusExecute(Sender: TObject);
    procedure TntTreeViewExit(Sender: TObject);
    procedure ActionEveryLineUpdate(Sender: TObject);
    procedure ActionCommandsExpandUpdate(Sender: TObject);
    procedure ActionCommandsExpandExecute(Sender: TObject);
    procedure ActionCommandsCollapseExecute(Sender: TObject);
    procedure ActionShowCmdWithShortcutExecute(Sender: TObject);
    procedure ActionShowToolbarExecute(Sender: TObject);
    procedure FileSave1Update(Sender: TObject);
    procedure ActionViewFileBoxUpdate(Sender: TObject);
    procedure ActionViewFileBoxExecute(Sender: TObject);
    procedure _IsThereAnySelBlock(Sender: TObject);
    procedure ActionCitationExecute(Sender: TObject);
    procedure ActionDecitationExecute(Sender: TObject);
    procedure ActionShowVersionFormExecute(Sender: TObject);
    procedure _IsThereAnyWebDocument(Sender: TObject);
    procedure ActionHTMLSelNextTagExecute(Sender: TObject);
    procedure ActionHTMLSelPrevTagExecute(Sender: TObject);
    procedure ActionSwitchExecute(Sender: TObject);
    procedure ActionHTMLDelPairTagsExecute(Sender: TObject);
    procedure ActionHTMLSelectBlockExecute(Sender: TObject);
    procedure JvShape1DblClick(Sender: TObject);
    procedure JvShape1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ActionSpecialCharsExecute(Sender: TObject);
    procedure ActionSpecialCharsUpdate(Sender: TObject);
    procedure ActionProcessEmptyLinesExecute(Sender: TObject);
    procedure ActionIgnoreFileExtExecute(Sender: TObject);
    procedure ActionParagraphsToLinesExecute(Sender: TObject);
    procedure ActionHelpShortcutsExecute(Sender: TObject);
    procedure ActionHelpBookExecute(Sender: TObject);
    procedure ActionDOSUpdate(Sender: TObject);
    procedure ActionDOSExecute(Sender: TObject);
    procedure TntTreeViewMouseLeave(Sender: TObject);
    procedure TntTreeViewMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ActionShowCommInfoExecute(Sender: TObject);
    procedure ActionSortExecute(Sender: TObject);
    procedure SettingsColorsExecute(Sender: TObject);
    procedure Otwrz1Click(Sender: TObject);
    procedure JvTabBar1TabCloseQuery(Sender: TObject; Item: TJvTabBarItem;
      var CanClose: Boolean);
    procedure JvTabBar1TabSelected(Sender: TObject; Item: TJvTabBarItem);
    procedure DropURLTarget1Drop(Sender: TObject; ShiftState: TShiftState;
      APoint: TPoint; var Effect: Integer);
    procedure FileNew1Execute(Sender: TObject);
    procedure ActionHTMLSelUpTagExecute(Sender: TObject);
    procedure ActionUndoSelBlockExecute(Sender: TObject);
    procedure ActionActivateWebHSwitchExecute(Sender: TObject);
  private
    { Private declarations }
    FUpdating: Boolean;
    FSettingsPath: string;
    FApplicationPath: string;
    FConfPath: string;
    FCommandsSets: TStringList;
    FLast_ext: string;

    gbSearchBackwards: boolean;
    gbSearchCaseSensitive: boolean;
    gbSearchFromCaret: boolean;
    fSearchFromCaret: boolean;
    gbSearchSelectionOnly: boolean;
    gbSearchTextAtCaret: boolean;
    gbSearchWholeWords: boolean;
    gbSearchRegex: boolean;

    gsSearchText: string;
    gsSearchTextHistory: string;
    gsReplaceText: string;
    gsReplaceTextHistory: string;

    procedure WMDropFiles(var Msg: TMessage); message WM_DROPFILES;
    procedure WMCopyData(var Msg: TWMCopyData); message WM_COPYDATA;
    procedure WMXConfirmReady(var Msg: TMessage); message WMX_CONFIRMREADY;
    procedure WMXAfterShow(var Msg: TMessage); message WMX_AFTERSHOW;
    procedure ShowHint(Sender: TObject);
    procedure ActiveFormChange(Sender: TObject);
    procedure CheckButtons;
    procedure ChildChanged(Sender: TObject);
    procedure CaretPosChanged(Sender: TObject);
    procedure DispatchOptions;
    procedure OpenFile(FileName: string);
    function NewFile: TFChild;
    procedure DoSearchReplaceText(AReplace: boolean;
      ABackwards: boolean);
    procedure ShowSearchReplaceDialog(AReplace: boolean);
    procedure OknoItemClick(Sender: TObject);
    procedure SetFocusToChild(Child: TFChild = nil);
  public
    { Public declarations }
    HighlighterList: TStringList;
    TabBar: TJvTabBarPP;
    property SettingsPath: string read FSettingsPath;
    procedure RefreshCommandBox(Child: TFChild; ForceRefresh: Boolean = False);
    procedure ApplyCommand(Command: TCommand);
    procedure ApplyCommandByShortcut(Child: TFChild; Shortcut: string);
  end;

var
  NotHMainForm: TNotHMainForm;

procedure AssignSynMemo(Dest, Src: TSynMemo);
function CheckSingleInstance: Boolean;

implementation

{$R *.DFM}

uses UAbout, SynEditKeyCmdsEditor, SynEditPrintMarginsDialog,
  dlgConfirmReplace, SynEditTypes, dlgSearchText, dlgReplaceText,
  UnitCommandBox, UnitSelectCommand, UnitFileBox, UnitVersions,
  UnitDMHighlighters, UnitCommandInfo, UnitHighlighterProcs;

resourcestring
  STextNotFound = 'Tekstu nie znaleziono';

var
  MutexHandle: THandle = 0;

procedure AssignSynMemo(Dest, Src: TSynMemo);
begin
  Dest.Options := Src.Options;
  Dest.Keystrokes := Src.Keystrokes;
  //Dest.Gutter := Src.Gutter;
  Dest.Font := Src.Font;
  Dest.BookMarkOptions.EnableKeys := Src.BookMarkOptions.EnableKeys;
  Dest.BookMarkOptions.GlyphsVisible := Src.BookMarkOptions.GlyphsVisible;
  //Dest.ActiveLineColor := Src.ActiveLineColor;
  Dest.ExtraLineSpacing := Src.ExtraLineSpacing;
  Dest.RightEdge := Src.RightEdge;
  Dest.RightEdgeColor := Src.RightEdgeColor;
  Dest.WantReturns := Src.WantReturns;
  Dest.WantTabs := Src.WantTabs;
  Dest.TabWidth := Src.TabWidth;
  Dest.InsertCaret := Src.InsertCaret;
  Dest.OverwriteCaret := Src.OverwriteCaret;
end;

function CheckSingleInstance: Boolean;
var hWnd: THandle;
    i: Integer;
    s: string;
    data: TCopyDataStruct;
begin
  MutexHandle := CreateMutex(nil, FALSE, 'NotH Mutex'); //Tylko do synchronizacji z instalatorem
  hWnd := FindWindowEx(0, 0, 'TNotHMainForm', nil); //'NotH');
  Result := (hWnd = 0) or (ParamCount = 0);
  if not Result then
  begin
    if SendMessage(hWnd, WMX_CONFIRMREADY, 0, 0) = 1000 then
      for i := 1 to ParamCount do
      begin
        s := ParamStr(i);
        if s <> '' then
        begin
          data.cbData := Length(s)*SizeOf(s[1]);
          data.lpData := @s[1];
          SendMessage(hWnd, WM_COPYDATA, Application.Handle, Integer(@data));
        end;
      end
    else
      Result := True;
  end
end;

{  TNotHMainForm  }

procedure TNotHMainForm.FormCreate(Sender: TObject);
begin
  FSettingsPath := GetAppdataFolder + '\Noth2\';
  FApplicationPath := ExtractFilePath(Application.ExeName);
  FConfPath := FApplicationPath + 'conf\';
  HighlighterList := TStringList.Create;
  GetHighlighters(DMHighlighters, HighlighterList, False);
  SetHighlighterFiltersFromFile(HighlighterList, FConfPath + 'highlighters.txt');
  FileOpen1.Dialog.Filter := GetHighlightersFilter(HighlighterList, False);
  FCommandsSets := TStringList.Create;
  Screen.OnActiveFormChange := ActiveFormChange;
  Application.OnHint := ShowHint;
  ActiveFormChange(Self);
  DragAcceptFiles(Handle, True);
  RegisterCommandsSet(FConfPath + 'commands.txt', FConfPath);
  ActionShowToolbarExecute(nil);
  DropURLTarget1.Target := Self;

  TabBar := TJvTabBarPP.Create(Self);
  with TabBar do
  begin
    Name := 'TabBar';
    Parent := Self;
    Left := 0;
    Top := 26;
    Width := 694;
    HotTracking := True;
    AllowTabMoving := True;
    Painter := JvTabBarXPPainter1;
    OnTabCloseQuery := JvTabBar1TabCloseQuery;
    OnTabSelected := JvTabBar1TabSelected;
  end;
end;

procedure TNotHMainForm.FormDestroy(Sender: TObject);
begin
  HighlighterList.Free;
  FCommandsSets.Free;
  Screen.OnActiveFormChange := nil;
end;

procedure TNotHMainForm.ShowHint(Sender: TObject);
begin
  StatusBar1.SimpleText := Application.Hint;
end;

procedure TNotHMainForm.ActiveFormChange(Sender: TObject);
var
  any: Boolean;
begin
  any := ActiveMDIChild <> nil;
  //Edycja1.Enabled := any;
  //Format1.Enabled := any;
  //Okna1.Enabled := any;
  //SetToolBarEnabled(TBEdit, any);
  FileSave1.Enabled := any;
  FileSaveAs1.Enabled := FileSave1.Enabled;
  BPrint.Enabled := any;
  CheckButtons;
  FontEdit1.Enabled := any;
  PrintDlg1.Enabled := any;
  //SynMemoTmp.AddKey();
  if (ActiveMDIChild = nil) or Assigned(ActiveMDIChild.OnActivate) then
    RefreshCommandBox(ActiveMDIChild as TFChild);
end;

procedure TNotHMainForm.CheckButtons;
var Child: TFChild;
begin
  if ActiveMDIChild <> nil then
  try
    FUpdating := True;
    Child := TFChild(ActiveMDIChild);
    FileSave1.Enabled := Child.SynMemo.Modified or Child.NewName;
  finally
    FUpdating := False;
  end;
end;

procedure TNotHMainForm.ChildChanged(Sender: TObject);
begin
  CheckButtons;
end;

procedure TNotHMainForm.Plik1Click(Sender: TObject);
var any: Boolean;
begin
  any := ActiveMDIChild <> nil;
  Zapisz1.Enabled := BSave.Enabled;
  Zapiszjako1.Enabled := any;
  Zamknij1.Enabled := any;
  Drukuj1.Enabled := any;
  JvMRUManager1.RemoveInvalid;
end;

procedure TNotHMainForm.Edycja1Click(Sender: TObject);
begin
  //Cofnij1.Enabled := BUndo.Enabled;
  //Wytnij1.Enabled := BCut.Enabled;
  //Kopiuj1.Enabled := BCopy.Enabled;
  //Wklej1.Enabled := BPaste.Enabled;
  //Usu1.Enabled := BDel.Enabled;
  //Zaznaczwszystko1.Enabled :=
end;

procedure TNotHMainForm.Zapiszjako1Click(Sender: TObject);
begin
  TFChild(ActiveMDIChild).SaveDocAs;
end;

procedure TNotHMainForm.Zamknij1Click(Sender: TObject);
begin
  if ActiveMDIChild <> nil then
    ActiveMDIChild.Close;
end;

procedure TNotHMainForm.DropURLTarget1Drop(Sender: TObject;
  ShiftState: TShiftState; APoint: TPoint; var Effect: Integer);
begin
  OpenFile(DropURLTarget1.URL);
end;

procedure TNotHMainForm.Drukuj1Click(Sender: TObject);
begin
  TFChild(ActiveMDIChild).Print;
end;

procedure TNotHMainForm.Koniec1Click(Sender: TObject);
begin
  Close;
end;

procedure TNotHMainForm.Cofnij1Click(Sender: TObject);
begin
  TFChild(ActiveMDIChild).SynMemo.Undo;
end;

procedure TNotHMainForm.Wytnij1Click(Sender: TObject);
begin
  TFChild(ActiveMDIChild).SynMemo.CutToClipboard;
end;

procedure TNotHMainForm.Kopiuj1Click(Sender: TObject);
begin
  TFChild(ActiveMDIChild).SynMemo.CopyToClipboard;
end;

procedure TNotHMainForm.Wklej1Click(Sender: TObject);
begin
  TFChild(ActiveMDIChild).SynMemo.PasteFromClipboard;
end;

procedure TNotHMainForm.Usu1Click(Sender: TObject);
begin
  TFChild(ActiveMDIChild).SynMemo.ClearSelection;
end;

procedure TNotHMainForm.ZaznaczWszystko1Click(Sender: TObject);
begin
  TFChild(ActiveMDIChild).SynMemo.SelectAll;
end;

procedure TNotHMainForm.Kaskada1Click(Sender: TObject);
begin
  Cascade;
end;

procedure TNotHMainForm.Rozmiewszystkie1Click(Sender: TObject);
begin
  Tile;
end;

procedure TNotHMainForm.ActionHelpAboutExecute(Sender: TObject);
begin
  with TAboutBox.Create(Application) do
    try
      ShowModal;
     finally
      Free;
     end;
end;

procedure TNotHMainForm.OpenFile(FileName: string);
var i,n: Integer;
    fn: string;
    Child: TFChild;
    page: string;
begin
  if FileName <> '' then
  begin
    if StartsText('file://', FileName) then
      Delete(FileName, 1, 7);

    if StartsText('http://', FileName) then
    begin
      page := IdHTTP1.Get(FileName);
      Child := NewFile;
      Child.SynMemo.Text := page;
    end
    else
      if Pos('://', FileName) = 0 then
      begin
        fn := WideUpperCase(FileName);
        for i := 0 to MDIChildCount-1 do
          if (MDIChildren[i] is TFChild) and (WideUpperCase(TFChild(MDIChildren[i]).FileName) = fn) then
          begin
            MDIChildren[i].BringToFront;
            Exit;
          end;
        Child := TFChild.CreateOpen(Self, FileName);
        Child.AddChildStateListener(CreateListenerHelper(FormFileBox.ChildListener, FormFileBox.CreateFileNode(FileName)));
        Child.AddChildStateListener(CreateListenerHelper(TabBar.ChildListener, TabBar.AddTab(FileName)));
        with Child do
        begin
          OnChange := ChildChanged;
          OnCaretPosChanged := CaretPosChanged;
        end;
        ChildChanged(Child);
        Child.ChildActivated;
      end;
  end;
end;

procedure TNotHMainForm.FileNew1Execute(Sender: TObject);
begin
  NewFile;
end;

procedure TNotHMainForm.FileOpen1Accept(Sender: TObject);
begin
  OpenFile(FileOpen1.Dialog.FileName);
end;

function TNotHMainForm.NewFile: TFChild;

  function FindChild(FileName: string): Boolean;
  var i: Integer;
  begin
    for i := 0 to MDIChildCount-1 do
      if (MDIChildren[i] is TFChild) and (TFChild(MDIChildren[i]).FileName = FileName) then
      begin
        Result := True;
        Exit;
      end;
    Result := False;
  end;

var i: Integer;
    s: string;
    Child: TFChild;
begin
  i := 0;
  repeat
    Inc(i);
    s := 'nowy-' + IntToStr(i) + '.html';
  until not FindChild(s);

  Child := TFChild.CreateNew(Self, s);
  Child.AddChildStateListener(CreateListenerHelper(FormFileBox.ChildListener, FormFileBox.CreateFileNode(s)));
  Child.AddChildStateListener(CreateListenerHelper(TabBar.ChildListener, TabBar.AddTab(s)));
  with Child do
  begin
    OnChange := ChildChanged;
    OnCaretPosChanged := CaretPosChanged;
  end;
  ChildChanged(Child);
  Child.ChildActivated;
  Result := Child;
end;

procedure TNotHMainForm.FileSave1Execute(Sender: TObject);
begin
  TFChild(ActiveMDIChild).SaveDoc;
end;

procedure TNotHMainForm.FileSaveAs1Execute(Sender: TObject);
begin
  TFChild(ActiveMDIChild).SaveDocAs;
end;

procedure TNotHMainForm.CaretPosChanged(Sender: TObject);
begin
end;

procedure TNotHMainForm.FontEdit1BeforeExecute(Sender: TObject);
begin
  FontEdit1.Dialog.Font.Assign(SynMemoTmp.Font);
end;

procedure TNotHMainForm.FontEdit1Accept(Sender: TObject);
begin
  SynMemoTmp.Font.Assign(FontEdit1.Dialog.Font);
  DispatchOptions;
end;

procedure TNotHMainForm.EditRedo1Update(Sender: TObject);
begin
  EditRedo1.Enabled := (ActiveMDIChild <> nil) and TFChild(ActiveMDIChild).SynMemo.CanRedo;
end;

procedure TNotHMainForm.EditRedo1Execute(Sender: TObject);
begin
  TFChild(ActiveMDIChild).SynMemo.Redo;
end;

procedure TNotHMainForm.PrintDlg1BeforeExecute(Sender: TObject);
var pdo: TPrintDialogOptions;
begin
  //SynEditPrint1.Lines.Assign(TFChild(ActiveMDIChild).SynMemo.Lines);
  //SynEditPrint1.Highlighter := TFChild(ActiveMDIChild).SynMultiSyn1;
  SynEditPrint1.SynEdit := TFChild(ActiveMDIChild).SynMemo;
  pdo := [poPageNums];
  PrintDlg1.Dialog.MinPage := 1;
  PrintDlg1.Dialog.FromPage := 1;
  PrintDlg1.Dialog.MaxPage := SynEditPrint1.PageCount;
  PrintDlg1.Dialog.ToPage := SynEditPrint1.PageCount;
  if TFChild(ActiveMDIChild).SynMemo.SelLength > 0 then
    pdo := pdo + [poSelection];
  PrintDlg1.Dialog.Options := pdo;
end;

procedure TNotHMainForm.PrintDlg1Accept(Sender: TObject);
begin
  SynEditPrint1.DocTitle := TFChild(ActiveMDIChild).FileName;
  SynEditPrint1.Copies := PrintDlg1.Dialog.Copies;
  SynEditPrint1.SelectedOnly := PrintDlg1.Dialog.PrintRange = prSelection;
  case PrintDlg1.Dialog.PrintRange of
    prAllPages, prSelection: SynEditPrint1.Print;
    prPageNums: SynEditPrint1.PrintRange(PrintDlg1.Dialog.FromPage, PrintDlg1.Dialog.ToPage);
  end;
end;

procedure TNotHMainForm.PageDlg1Execute(Sender: TObject);
begin
  PageSetupDialog1.MarginLeft := Round(SynEditPrint1.Margins.Left*100);
  PageSetupDialog1.MarginRight := Round(SynEditPrint1.Margins.Right*100);
  PageSetupDialog1.MarginTop := Round(SynEditPrint1.Margins.Top*100);
  PageSetupDialog1.MarginBottom := Round(SynEditPrint1.Margins.Bottom*100);
  if PageSetupDialog1.Execute then
  begin
    SynEditPrint1.Margins.Left := PageSetupDialog1.MarginLeft/100;
    SynEditPrint1.Margins.Right := PageSetupDialog1.MarginRight/100;
    SynEditPrint1.Margins.Top := PageSetupDialog1.MarginTop/100;
    SynEditPrint1.Margins.Bottom := PageSetupDialog1.MarginBottom/100;
  end;
end;

procedure TNotHMainForm.SearchFind1Accept(Sender: TObject);
begin
//  TFChild(ActiveMDIChild).SynMemo.
end;

procedure TNotHMainForm.SettingsShortCutsExecute(Sender: TObject);
begin
  with TSynEditKeystrokesEditorForm.Create(Application) do
    try
      Keystrokes := SynMemoTmp.Keystrokes;
      if ShowModal = mrOk then
      begin
        SynMemoTmp.Keystrokes := Keystrokes;
        DispatchOptions;
      end;
    finally
      Free;
    end;
end;

procedure TNotHMainForm.DispatchOptions;
var i: Integer;
begin
  for i := 0 to MDIChildCount-1 do
    AssignSynMemo(TFChild(MDIChildren[i]).SynMemo, SynMemoTmp);
end;

procedure TNotHMainForm.SettingsSynMemoOptionsExecute(Sender: TObject);
var cont: TSynEditorOptionsContainer;
begin
  cont := TSynEditorOptionsContainer.Create(Self);
  try
    cont.Assign(SynMemoTmp);
    if SynEditOptionsDialog1.Execute(cont) then
    begin
      SynMemoTmp.Assign(cont);
      DispatchOptions;
    end;
  finally
    cont.Free;
  end;
end;

procedure TNotHMainForm.SettingsColorsExecute(Sender: TObject);
begin
  if (MDIChildren[0] is TFChild) then
    SynColorDialog1.Execute(TFChild(MDIChildren[0]).SynMemo);
end;

procedure TNotHMainForm.SettingsMarginsExecute(Sender: TObject);
begin
  with TSynEditPrintMarginsDlg.Create(Application) do
    try
      SetMargins(SynEditPrint1.Margins);
      if ShowModal = mrOk then
        GetMargins(SynEditPrint1.Margins);
    finally
      Free;
    end;
end;

procedure TNotHMainForm.JvFormStorage1RestorePlacement(Sender: TObject);
var
  s: string;
  FS: TFileStream;
  i: Integer;
begin
  s := SettingsPath + 'Shortcuts.ini';
  if FileExists(s) then
  begin
    FS := TFileStream.Create(s, fmOpenRead);
    try
      SynMemoTmp.Keystrokes.LoadFromStream(FS);
    finally
      FS.Free;
    end;
  end;
  if SynMemoTmp.Keystrokes.FindCommand(ecAutoCompletion) = -1 then
    SynMemoTmp.AddKey(ecAutoCompletion, word('J'), [ssCtrl], 0, []);
  SynMemoTmp.Options := SynMemoTmp.Options + [eoDropFiles, eoScrollHintFollows];
  for i := 0 to HighlighterList.Count - 1 do
    try
      s := SettingsPath + TSynCustomHighlighter(HighlighterList.Objects[i]).Name + '.cfg';
      if FileExists(s) then
        TSynCustomHighlighter(HighlighterList.Objects[i]).LoadFromFile(s);
    except
    end;
end;

procedure TNotHMainForm.JvFormStorage1SavePlacement(Sender: TObject);
var
  s: string;
  FS: TFileStream;
  i: Integer;
begin
  if ForceDirectories(SettingsPath) then
  begin
    s := SettingsPath + 'Shortcuts.ini';
    FS := TFileStream.Create(s, fmCreate);
    try
      SynMemoTmp.Keystrokes.SaveToStream(FS);
    finally
      FS.Free;
    end;
    for i := 0 to HighlighterList.Count - 1 do
      try
        TSynCustomHighlighter(HighlighterList.Objects[i]).SaveToFile(SettingsPath + TSynCustomHighlighter(HighlighterList.Objects[i]).Name + '.cfg');
      except
      end;
  end;
  try
    Visible := True;
    SaveDockTreeToAppStorage(JvAppRegistryStorage1);
  except
  end;
end;

procedure TNotHMainForm.FormShow(Sender: TObject);
var i: Integer;
begin
  if ParamCount = 0 then
    FileNew1.Execute
  else
    for i := 1 to ParamCount do
      OpenFile(ParamStr(i));
      {with TFChild.CreateOpen(Self, ParamStr(i), FormFileBox.CreateFileNode(ParamStr(i))) do
      begin
        OnChange := ChildChanged;
        OnCaretPosChanged := CaretPosChanged;
        CheckButtons;
      end;}
  PostMessage(Handle, WMX_AFTERSHOW, 0, 0);
end;

procedure TNotHMainForm.WMDropFiles(var Msg: TMessage);
var
  i, iNumberDropped: Integer;
  FileNameA: array[0..MAX_PATH - 1] of AnsiChar;
  FileNameW: array[0..MAX_PATH - 1] of WideChar;
  //Point: TPoint;
begin
  try
    iNumberDropped := DragQueryFile(THandle(Msg.wParam), Cardinal(-1), nil, 0);
    //DragQueryPoint(THandle(Msg.wParam), Point);

    if Win32PlatformIsUnicode then
      for i := 0 to iNumberDropped - 1 do
      begin
        DragQueryFileW(THandle(Msg.wParam), i, FileNameW, sizeof(FileNameW) div 2);
        OpenFile(FileNameW);
      end
    else
      for i := 0 to iNumberDropped - 1 do
      begin
        DragQueryFileA(THandle(Msg.wParam), i, FileNameA, sizeof(FileNameA));
        OpenFile(FileNameA);
      end;
  finally
    Msg.Result := 0;
    DragFinish(THandle(Msg.wParam));
  end;
end;


procedure TNotHMainForm.ActionUndoSelBlockExecute(Sender: TObject);
begin
  if (ActiveMDIChild <> nil) and (ActiveMDIChild is TFChild) then
    TFChild(ActiveMDIChild).UndoSelBlock;
end;

procedure TNotHMainForm.ActionUTF8Execute(Sender: TObject);
begin
  if (MDIChildren[0] is TFChild) and (Sender is TAction) then
    TFChild(MDIChildren[0]).CharSet := TNCharSet(TAction(Sender).Tag);
end;

procedure TNotHMainForm.ActionUTF8Update(Sender: TObject);
begin
  if Sender is TAction then
    with TAction(Sender) do
    begin
      Enabled := MDIChildCount > 0;
      if Enabled and (MDIChildren[0] is TFChild) then
        Checked := (Tag = Integer(TFChild(MDIChildren[0]).CharSet));
    end;
end;

procedure TNotHMainForm.ActionKodowanieExecute(Sender: TObject);
begin
  //
end;

procedure TNotHMainForm.JvMRUManager1Click(Sender: TObject; const RecentName,
  Caption: String; UserData: Integer);
begin
  OpenFile(RecentName);
  JvMRUManager1.Remove(RecentName);
end;

procedure TNotHMainForm.Otwrz1Click(Sender: TObject);
begin

end;

{ TSearchReplaceDemoForm }

procedure TNotHMainForm.DoSearchReplaceText(AReplace: boolean;
  ABackwards: boolean);
var
  Options: TSynSearchOptions;
  Child: TFChild;
begin
  if (ActiveMDIChild = nil) or not(ActiveMDIChild is TFChild) then Exit;
  Child := ActiveMDIChild as TFChild;
  StatusBar1.SimpleText := '';
  if AReplace then
    Options := [ssoPrompt, ssoReplace, ssoReplaceAll]
  else
    Options := [];
  if ABackwards then
    Include(Options, ssoBackwards);
  if gbSearchCaseSensitive then
    Include(Options, ssoMatchCase);
  if not fSearchFromCaret then
    Include(Options, ssoEntireScope);
  if gbSearchSelectionOnly then
    Include(Options, ssoSelectedOnly);
  if gbSearchWholeWords then
    Include(Options, ssoWholeWord);
  if gbSearchRegex then
    Child.SynMemo.SearchEngine := SynEditRegexSearch
  else
    Child.SynMemo.SearchEngine := SynEditSearch;
  if Child.SynMemo.SearchReplace(gsSearchText, gsReplaceText, Options) = 0 then
  begin
    //MessageBeep(MB_ICONASTERISK);
    StatusBar1.SimpleText := STextNotFound;
    Windows.MessageBox(0, PChar(STextNotFound), 'UWAGA', MB_ICONERROR);
    if ssoBackwards in Options then
      Child.SynMemo.BlockEnd := Child.SynMemo.BlockBegin
    else
      Child.SynMemo.BlockBegin := Child.SynMemo.BlockEnd;
    Child.SynMemo.CaretXY := Child.SynMemo.BlockBegin;
  end;

  if ConfirmReplaceDialog <> nil then
    FreeAndNil(ConfirmReplaceDialog);
end;

procedure TNotHMainForm.ShowSearchReplaceDialog(AReplace: boolean);
var
  dlg: TTextSearchDialog;
  Child: TFChild;
begin
  if (ActiveMDIChild = nil) or not(ActiveMDIChild is TFChild) then Exit;
  Child := ActiveMDIChild as TFChild;
  StatusBar1.SimpleText := '';
  if AReplace then
    dlg := TTextReplaceDialog.Create(Self)
  else
    dlg := TTextSearchDialog.Create(Self);
  with dlg do try
    // assign search options
    SearchBackwards := gbSearchBackwards;
    SearchCaseSensitive := gbSearchCaseSensitive;
    SearchFromCursor := gbSearchFromCaret;
    SearchInSelectionOnly := gbSearchSelectionOnly;
    SearchRegularExpression := gbSearchRegex;
    // start with last search text
    SearchText := gsSearchText;
    if gbSearchTextAtCaret then begin
      // if something is selected search for that text
      if Child.SynMemo.SelAvail and (Child.SynMemo.BlockBegin.Line = Child.SynMemo.BlockEnd.Line)
      then
        SearchText := Child.SynMemo.SelText
      else
        SearchText := Child.SynMemo.GetWordAtRowCol(Child.SynMemo.CaretXY);
    end;
    SearchTextHistory := gsSearchTextHistory;
    if AReplace then with dlg as TTextReplaceDialog do begin
      ReplaceText := gsReplaceText;
      ReplaceTextHistory := gsReplaceTextHistory;
    end;
    SearchWholeWords := gbSearchWholeWords;
    if ShowModal = mrOK then begin
      gbSearchBackwards := SearchBackwards;
      gbSearchCaseSensitive := SearchCaseSensitive;
      gbSearchFromCaret := SearchFromCursor;
      gbSearchSelectionOnly := SearchInSelectionOnly;
      gbSearchWholeWords := SearchWholeWords;
      gbSearchRegex := SearchRegularExpression;
      gsSearchText := SearchText;
      gsSearchTextHistory := SearchTextHistory;
      if AReplace then with dlg as TTextReplaceDialog do begin
        gsReplaceText := ReplaceText;
        gsReplaceTextHistory := ReplaceTextHistory;
      end;
      fSearchFromCaret := gbSearchFromCaret;
      if gsSearchText <> '' then begin
        DoSearchReplaceText(AReplace, gbSearchBackwards);
        fSearchFromCaret := TRUE;
      end;
    end;
  finally
    dlg.Free;
  end;
end;

{ event handler }

procedure TNotHMainForm.actSearchExecute(Sender: TObject);
begin
  ShowSearchReplaceDialog(FALSE);
end;

procedure TNotHMainForm.actSearchNextExecute(Sender: TObject);
begin
  DoSearchReplaceText(FALSE, FALSE);
end;

procedure TNotHMainForm.actSearchPrevExecute(Sender: TObject);
begin
  DoSearchReplaceText(FALSE, TRUE);
end;

procedure TNotHMainForm.actSearchReplaceExecute(Sender: TObject);
begin
  ShowSearchReplaceDialog(TRUE);
end;

procedure TNotHMainForm.actSearchNextUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (gsSearchText <> '') and (ActiveMDIChild <> nil);
end;

procedure TNotHMainForm.actSearchReplaceUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (ActiveMDIChild <> nil) and
    (ActiveMDIChild is TFChild) and not TFChild(ActiveMDIChild).SynMemo.ReadOnly;
end;

procedure TNotHMainForm._IsThereAnyDocument(Sender: TObject);
begin
  (Sender as TAction).Enabled := (ActiveMDIChild <> nil) and (ActiveMDIChild is TFChild);
end;

procedure TNotHMainForm._IsThereAnySelBlock(Sender: TObject);
begin
  (Sender as TAction).Enabled := (ActiveMDIChild <> nil) and (ActiveMDIChild is TFChild) and
                                  TFChild(ActiveMDIChild).SynMemo.SelAvail;
end;

procedure TNotHMainForm.Okna1Click(Sender: TObject);
var MIOkna, MI: TMenuItem;
    n,i: Integer;
begin
  MIOkna := TMenuItem(Sender);
  n := MIOkna.IndexOf(N7)+1;
  if n > 0 then
    while n < MIOkna.Count do
      MIOkna.Items[n].Free;
  for i := 0 to MDIChildCount-1 do
  begin
    MI := TMenuItem.Create(Self);
    MI.Caption := TFChild(MDIChildren[i]).FileName;
    MI.OnClick := OknoItemClick;
    MI.Tag := Integer(MDIChildren[i]);
    MIOkna.Add(MI);
    //if i >= 10 then Break;
  end;
end;

procedure TNotHMainForm.OknoItemClick(Sender: TObject);
begin
  if (Sender is TMenuItem) and (TMenuItem(Sender).Tag <> 0) then
    with TFChild(TMenuItem(Sender).Tag) do
    begin
      if WindowState = wsMinimized then
        WindowState := wsNormal;
      Show;
    end;
end;

procedure TNotHMainForm.RefreshCommandBox(Child: TFChild; ForceRefresh: Boolean);
var s,TSName: string;
    i,j: Integer;
    TS: TTabSheet;
    TV: TTreeView;
    csm: TCommandsShowMode;
begin
  TV := nil;
  if Child <> nil then
    s := ExtractFileExtN(Child.FileName)
  else
    s := '';
  if (s = FLast_ext) and not ForceRefresh then Exit;
  if FCommandsSets = nil then Exit;
  FLast_ext := s;
  //if (s <> '') and (s[1] = '.') then
  //  Delete(s, 1, 1);
  if ActionShowCmdWithShortcut.Checked then
    csm := csmWithShortcuts
  else
  if ActionShowCmdWithoutShortcut.Checked then
    csm := csmWithoutShortcuts
  else
    csm := csmAll;
  if ActionIgnoreFileExt.Checked then
    FCommandsSets.Assign(GetCommandsSetList)
  else
    GetCommandsSetsForExt(s, FCommandsSets);
  //while FormCommandBox.PageControl1.PageCount > 0 do
  //  FormCommandBox.PageControl1.Pages[0].Free;

  for i := 0 to FormCommandBox.PageControl1.PageCount-1 do
    FormCommandBox.PageControl1.Pages[i].Tag := 1;
  for i := 0 to FCommandsSets.Count-1 do
  begin
    TSName := 'TS' + TCommandsSet(FCommandsSets.Objects[i]).Prefix;
    TS := nil;
    for j := 0 to FormCommandBox.PageControl1.PageCount-1 do
      if FormCommandBox.PageControl1.Pages[j].Name = TSName then
      begin
        TS := FormCommandBox.PageControl1.Pages[j];
        TV := TS.FindChildControl('TV' + TCommandsSet(FCommandsSets.Objects[i]).Prefix) as TTreeView;
        TS.Tag := 0;
        Break;
      end;
    if TS = nil then
    begin
      TS := TTabSheet.Create(FormCommandBox);
      TS.PageControl := FormCommandBox.PageControl1;
      TS.Name := 'TS' + TCommandsSet(FCommandsSets.Objects[i]).Prefix;
      TS.Caption := FCommandsSets[i];
      TV := TTreeView.Create(TS);
      TV.Name := 'TV' + TCommandsSet(FCommandsSets.Objects[i]).Prefix;
      TV.ReadOnly := True;
      TV.Align := alClient;
      TV.Parent := TS;
      //TV.FullExpand;
      TV.OnDblClick := TntTreeViewDblClick;
      TV.OnKeyPress := TntTreeViewKeyPress;
      TV.OnMouseLeave := TntTreeViewMouseLeave;
      TV.OnMouseMove := TntTreeViewMouseMove;
      TV.OnExit := TntTreeViewExit;
      TV.HideSelection := False;
    end;
    TCommandsSet(FCommandsSets.Objects[i]).FillTreeView(TV, csm);
  end;

  for i := FormCommandBox.PageControl1.PageCount-1 downto 0 do
    if FormCommandBox.PageControl1.Pages[i].Tag = 1 then
      FormCommandBox.PageControl1.Pages[i].Free;

  (*
  while FormCommandBox.PageControl1.PageCount > 0 do
    FormCommandBox.PageControl1.Pages[0].Free;
  for i := 0 to FCommandsSets.Count-1 do
  begin
    TS := TTabSheet.Create(FormCommandBox);
    TS.PageControl := FormCommandBox.PageControl1;
    TS.Name := 'TS' + TCommandsSet(FCommandsSets.Objects[i]).Prefix;
    TS.Caption := FCommandsSets[i];
    TV := TTntTreeViewN.Create(FormCommandBox);
    TV.ReadOnly := True;
    TV.Align := alClient;
    TV.Parent := TS;
    TCommandsSet(FCommandsSets.Objects[i]).FillTreeView(TV, csm);
    //TV.FullExpand;
    TV.OnDblClick := TntTreeViewDblClick;
    TV.OnKeyPress := TntTreeViewKeyPress;
    TV.OnMouseLeave := TntTreeViewMouseLeave;
    TV.OnMouseMove := TntTreeViewMouseMove;
    TV.OnExit := TntTreeViewExit;
    TV.HideSelection := False;
  end;
  *)
end;

procedure TNotHMainForm.TntTreeViewDblClick(Sender: TObject);
begin
  if (Sender is TTreeView) and (TTreeView(Sender).Selected <> nil) and
     (TTreeView(Sender).Selected.Data <> nil) then
  begin
    ApplyCommand(TCommand(TTreeView(Sender).Selected.Data));
  end;
end;

procedure TNotHMainForm.ApplyCommand(Command: TCommand);
var Child: TFChild;
    curpos, cp, i, n, k, DX, DY: Integer;
    s, t, ct: string;
    opt: TSynEditorOptions;
    ind: string;
    BufferCoord: TBufferCoord;
    block: Boolean;

  function ProcessText(Text, CommandText: string; indent: string; var CurPos: Integer): string;
  var i,j: Integer;
      indb: string;
  begin
    Result := '';
    CurPos := 0;
    for i := 1 to Length(CommandText) do
      case CommandText[i] of
        '|': CurPos := Length(Result);
        '^':
          begin
            indb := '';
            j := i-1;
            while (j > 0) and (CommandText[j] <> #10) do
            begin
              if CommandText[j] = #9 then
                indb := #9 + indb
              else
              if (CommandText[j] >= ' ') and (CommandText[j] <> '|') and (CommandText[j] <> '^') then
                indb := ' ' + indb;
              Dec(j);
            end;
            if j <= 0 then
              indb := '';
            Result := Result + StringReplace(Text, #10, #10 + indent + indb, [rfReplaceAll, rfIgnoreCase]);
          end;
        #10: Result := Result + #10 + indent;
      else
        Result := Result + CommandText[i];
      end;
  end;

  function ProcessTextLine(Text, CommandText: string; indent: string; var CurPos: Integer): string;
  begin
    if ActionProcessEmptyLines.Checked or (Trim(Text) <> '') then
      Result := ProcessText(Text, CommandText, indent, CurPos)
    else
      Result := '';
  end;

begin
  if (ActiveMDIChild <> nil) and (ActiveMDIChild is TFChild) then
  begin
    Child := TFChild(ActiveMDIChild);

    Child.SynMemo.UndoList.AddGroupBreak;
    opt := Child.SynMemo.Options;
    Child.SynMemo.Options := Child.SynMemo.Options - [eoTrimTrailingSpaces];
    curpos := 0;
    n := Child.SynMemo.SelStart;
    block := Child.SynMemo.SelAvail;
    if block then
    begin
      BufferCoord := Child.SynMemo.CharIndexToRowCol(n);
      ind := Copy(Child.SynMemo.Lines[BufferCoord.Line-1], 1, BufferCoord.Char-1);
      for i := 1 to Length(ind) do
        if ind[i] <> #9 then
           ind[i] := ' ';
    end
    else
    begin
      DY := Child.SynMemo.DisplayY-1;
      DX := Child.SynMemo.DisplayX-1;
      ind := Copy(Child.SynMemo.Lines[DY], 1, DX);
      k := 0;
      for i := 1 to Length(ind) do
        if ind[i] = #9 then
           Inc (k, Child.SynMemo.TabWidth)
         else
         begin
           ind[i] := ' ';
           Inc(k);
         end;
      if DX > k then
        ind := ind + StringOfChar(' ', DX-k);
    end;

    s := Child.SynMemo.SelText;

    if (ActionEveryLine.Checked or (Command.BLMode = blmAlwaysLines)) and (s <> '')
       and (Command.BLMode <> blmAlwaysBlock) then
    begin
      t := '';
      i := Pos(#13#10, s);
      ct := Command.CommandText;
      if i > 0 then
      begin
        t := t + ProcessTextLine(Copy(s, 1, i-1), ct, ind, curpos) + WideCRLF;
        ct := ind + Command.CommandText;
        Delete(s, 1, i+1);
        i := Pos(#13#10, s);
      end;
      while i > 0 do
      begin
        t := t + ProcessTextLine(Copy(s, 1, i-1), ct, ind, cp) + WideCRLF;
        Delete(s, 1, i+1);
        i := Pos(#13#10, s);
      end;
      if s <> '' then
      begin
        t := t + ProcessTextLine(s, ct, ind, cp);
        if curpos = 0 then
          curpos := cp;
      end;
      Child.SynMemo.SelText := t;
    end
    else
    begin
      if (s <> '') and (s[Length(s)] = #10) then Delete(s, Length(s), 1);
      if (s <> '') and (s[Length(s)] = #13) then Delete(s, Length(s), 1);
      Child.SynMemo.SelText := ProcessText(s, Command.CommandText, ind, curpos);
    end;

    if block then
    begin
      k := Child.SynMemo.SelStart;
      Child.SynMemo.SelStart := n;
      Child.SynMemo.SelLength := k-n;
    end
    else
    begin
      Child.SynMemo.SelLength := 0;
      Child.SynMemo.SelStart := n + curpos;
    end;

    Child.SynMemo.Options := opt;

    SetFocusToChild(Child);
  end;
end;

procedure TNotHMainForm.ActionEveryLineExecute(Sender: TObject);
begin
  // Nie usuwaæ tego komentarza!!!
end;

procedure TNotHMainForm.ApplyCommandByShortcut(Child: TFChild;
  Shortcut: string);
var SL: TStringList;
    i: Integer;
begin
  SL := TStringList.Create;
  try
    for i := 0 to FCommandsSets.Count-1 do
      TCommandsSet(FCommandsSets.Objects[i]).FindCommandsByShortcut(Shortcut, SL);
    if SL.Count = 1 then
      ApplyCommand(TCommand(SL.Objects[0]))
    else
    if SL.Count > 1 then
    begin
      FormSelectCommand.TntListBox1.Clear;
      for i := 0 to SL.Count-1 do
        FormSelectCommand.TntListBox1.Items.AddObject(TCommand(SL.Objects[i]).GetCommandName, SL.Objects[i]);
      if (FormSelectCommand.ShowModal = mrOk) and
         (FormSelectCommand.TntListBox1.ItemIndex >= 0) then
      begin
        ApplyCommand(TCommand(FormSelectCommand.TntListBox1.Items.Objects[FormSelectCommand.TntListBox1.ItemIndex]));
      end;
    end;
  finally
    SL.Free;
  end;

end;

procedure TNotHMainForm.ActionInsertFileNameExecute(Sender: TObject);
begin
  if (ActiveMDIChild <> nil) and (ActiveMDIChild is TFChild) then
    TFChild(ActiveMDIChild).InsertFileName(Sender = ActionInsertPictFileName);
end;

procedure TNotHMainForm.ActionViewCommandBoxUpdate(Sender: TObject);
begin
  ActionViewCommandBox.Checked := GetFormVisible(FormCommandBox);
end;

procedure TNotHMainForm.ActionViewCommandBoxExecute(Sender: TObject);
begin
  if ActionViewCommandBox.Checked then
    HideDockForm(FormCommandBox)
  else
    ShowDockForm(FormCommandBox);
end;

procedure TNotHMainForm.ActionReloadCommandsExecute(Sender: TObject);
begin
  UnregisterCommandsSet;
  RegisterCommandsSet(FConfPath + 'commands.txt', FConfPath);
  FLast_ext := '';
  RefreshCommandBox(ActiveMDIChild as TFChild);
end;

procedure TNotHMainForm.ActionPreviewWebExecute(Sender: TObject);
begin
  if TFChild(ActiveMDIChild).SaveDoc then
    if Win32PlatformIsUnicode then
      ShellExecuteW(0, 'open', PWideChar(TFChild(ActiveMDIChild).FileName), '', '', SW_SHOWNORMAL)
    else
      ShellExecuteA(0, 'open', PAnsiChar(AnsiString(TFChild(ActiveMDIChild).FileName)), '', '', SW_SHOWNORMAL);
end;

procedure TNotHMainForm.ActionHelpDocsExecute(Sender: TObject);
var s: string;
begin
  s := FApplicationPath + 'noth-users-guide\noth-users-guide.html';
  if FileExists(s) then
    ShellExecute(0, 'open', PChar(s), '', '', SW_SHOWNORMAL);
end;

procedure TNotHMainForm.ActionHelpHomepageExecute(Sender: TObject);
begin
  ShellExecute(0, 'open', 'http://noth.gajdaw.pl', '', '', SW_SHOWNORMAL);
end;

procedure TNotHMainForm.TntTreeViewKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then TntTreeViewDblClick(Sender);
end;

procedure TNotHMainForm.ActionActivateWebHSwitchExecute(Sender: TObject);
var
  b: Boolean;
begin
  b := ActionActivateWebHSwitch.Checked;
  if TFChild(ActiveMDIChild).SynMemo.Highlighter is TSynWebBase then
    TSynWebBase(TFChild(ActiveMDIChild).SynMemo.Highlighter).ActiveHighlighterSwitch := b;

  if b then
    with TFChild(ActiveMDIChild) do
    begin
      SynMemoStatusChange(SynMemo, [scCaretX, scCaretY]);
      SynMemo.Repaint;
    end;
end;

procedure TNotHMainForm.ActionChangeFocusExecute(Sender: TObject);
begin
  if (ActiveControl is TTreeView) and (ActiveMDIChild <> nil) then
    SetFocusToChild()
  else
  if FormCommandBox.PageControl1.CanFocus and (FormCommandBox.PageControl1.ActivePage <> nil) and
     (FormCommandBox.PageControl1.ActivePage.Controls[0] is TWinControl) then
    (FormCommandBox.PageControl1.ActivePage.Controls[0] as TWinControl).SetFocus;
end;

procedure TNotHMainForm.SetFocusToChild(Child: TFChild);
begin
  if Child = nil then
    Child := TFChild(ActiveMDIChild);
  if Child <> nil then
  begin
    ActiveControl := nil;
    Windows.SetFocus(Child.SynMemo.Handle);
  end;
end;

procedure TNotHMainForm.TntTreeViewExit(Sender: TObject);
begin
  ActiveControl := nil;
end;

procedure TNotHMainForm.ActionEveryLineUpdate(Sender: TObject);
var i: Integer;
    s: string;
begin
  if ActionEveryLine.Checked then
    if ActionProcessEmptyLines.Checked then
      s := 'wszystkie linie'
    else
      s := 'linie'
  else
    s := 'blok';
  for i := 0 to MDIChildCount-1 do
    if (MDIChildren[i] is TFChild) then
      TFChild(MDIChildren[i]).StatusBar1.Panels[5].Text := 'Szablony: ' + s;
end;

procedure TNotHMainForm.ActionCommandsExpandUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := FormCommandBox.PageControl1.ActivePage <> nil;
end;

procedure TNotHMainForm.ActionCommandsExpandExecute(Sender: TObject);
begin
  if (FormCommandBox.PageControl1.ActivePage.ControlCount > 0) and
     (FormCommandBox.PageControl1.ActivePage.Controls[0] is TTreeView) then
  with (FormCommandBox.PageControl1.ActivePage.Controls[0] as TTreeView) do
  begin
    FullExpand;
    if Selected <> nil then
      TopItem := Selected
    else
      TopItem := Items.GetFirstNode;
  end;
end;

procedure TNotHMainForm.ActionCommandsCollapseExecute(Sender: TObject);
begin
  if (FormCommandBox.PageControl1.ActivePage.ControlCount > 0) and
     (FormCommandBox.PageControl1.ActivePage.Controls[0] is TTreeView) then
  begin
    (FormCommandBox.PageControl1.ActivePage.Controls[0] as TTreeView).FullCollapse;
  end;
end;

procedure TNotHMainForm.ActionShowCmdWithShortcutExecute(Sender: TObject);
begin
  RefreshCommandBox(TFChild(ActiveMDIChild), True);
end;

procedure TNotHMainForm.ActionShowToolbarExecute(Sender: TObject);
begin
  CoolBar1.Visible := ActionShowToolbar.Checked;
end;

procedure TNotHMainForm.FileSave1Update(Sender: TObject);
begin
  FileSave1.Enabled := (ActiveMDIChild <> nil) and (ActiveMDIChild is TFChild) and
                       (TFChild(ActiveMDIChild).SynMemo.Modified or TFChild(ActiveMDIChild).NewName);
end;

procedure TNotHMainForm.WMCopyData(var Msg: TWMCopyData);
var s: string;
    n,len: Integer;
begin
  n := Msg.CopyDataStruct.cbData;
  if (0 < n) and (n < 1024) then
  begin
    len := n div SizeOf(s[1]);
    SetLength(s, len);
    CopyMemory(@s[1], Msg.CopyDataStruct.lpData, n);
    TJclAppInstances.BringAppWindowToFront(Application.Handle);
    if FileExists(s) then
      OpenFile(s)
    else
      Application.MessageBox(PWideChar(Format('Plik "%s" nie istnieje!', [s])), 'Uwaga', MB_ICONERROR);
    //SetActiveWindow(Application.Handle);
    //Application.BringToFront;
    //SetForegroundWindow(Application.Handle);
    Msg.Result := 1;
  end;
end;

procedure TNotHMainForm.ActionViewFileBoxUpdate(Sender: TObject);
begin
  ActionViewFileBox.Checked := GetFormVisible(FormFileBox);
end;

procedure TNotHMainForm.ActionViewFileBoxExecute(Sender: TObject);
begin
  if ActionViewFileBox.Checked then
    HideDockForm(FormFileBox)
  else
    ShowDockForm(FormFileBox);
end;

procedure TNotHMainForm.ActionCitationExecute(Sender: TObject);
var ws: string;
    n,nn: Integer;
begin
  if (ActiveMDIChild <> nil) and (ActiveMDIChild is TFChild) and
     TFChild(ActiveMDIChild).SynMemo.SelAvail then
  with TFChild(ActiveMDIChild).SynMemo do
  begin
    n := SelStart;
    ws := StringReplace(SelText, '&', '&amp;', [rfReplaceAll, rfIgnoreCase]);
    ws := StringReplace(ws, '>', '&gt;', [rfReplaceAll, rfIgnoreCase]);
    ws := StringReplace(ws, '<', '&lt;', [rfReplaceAll, rfIgnoreCase]);
    SelText := ws;
    nn := SelStart;
    SelStart := n;
    SelEnd := nn;
  end;
end;

procedure TNotHMainForm.ActionDecitationExecute(Sender: TObject);
var ws: string;
    n,nn: Integer;
begin
  if (ActiveMDIChild <> nil) and (ActiveMDIChild is TFChild) and
     TFChild(ActiveMDIChild).SynMemo.SelAvail then
  with TFChild(ActiveMDIChild).SynMemo do
  begin
    n := SelStart;
    ws := SelText;
    ws := StringReplace(ws, '&gt;', '>', [rfReplaceAll, rfIgnoreCase]);
    ws := StringReplace(ws, '&lt;', '<', [rfReplaceAll, rfIgnoreCase]);
    ws := StringReplace(ws, '&amp;', '&', [rfReplaceAll, rfIgnoreCase]);
    SelText := ws;
    nn := SelStart;
    SelStart := n;
    SelEnd := nn;
  end;
end;

procedure TNotHMainForm.ActionShowVersionFormExecute(Sender: TObject);
begin
  FormVersions.ShowModal;
end;

procedure TNotHMainForm._IsThereAnyWebDocument(Sender: TObject);
begin
  (Sender as TAction).Enabled := (ActiveMDIChild <> nil) and
                                 (ActiveMDIChild is TFChild) and
                                 (TFChild(ActiveMDIChild).SynMemo.Highlighter is TSynWebBase);
end;

procedure TNotHMainForm.ActionHTMLSelNextTagExecute(Sender: TObject);
var BC, BC1, BC2: TBufferCoord;
    Child: TFChild;
    Token: string;
begin
  if (ActiveMDIChild <> nil) and (ActiveMDIChild is TFChild) then
  with TFChild(ActiveMDIChild).SynMemo do
  begin
    Child := TFChild(ActiveMDIChild);
    if SelAvail then
      BC := BlockEnd
    else
      BC := CaretXY;
    if Child.FindNextTagEnd(BC, BC1, BC2, Token) then
      if Child.FindPrevTagBegin(BC1, BC, BC1, Token) then
        SetCaretAndSelection(BC2, BC, BC2);
  end;
end;

procedure TNotHMainForm.ActionHTMLSelPrevTagExecute(Sender: TObject);
var BC, BC1, BC2: TBufferCoord;
    Child: TFChild;
    Token: string;
begin
  if (ActiveMDIChild <> nil) and (ActiveMDIChild is TFChild) then
  with TFChild(ActiveMDIChild).SynMemo do
  begin
    Child := TFChild(ActiveMDIChild);
    if SelAvail then
      BC := BlockBegin
    else
      BC := CaretXY;
    if Child.FindPrevTagBegin(BC, BC1, BC2, Token) then
      if Child.FindNextTagEnd(BC2, BC, BC2, Token) then
        SetCaretAndSelection(BC1, BC1, BC2);
  end;
end;

procedure TNotHMainForm.ActionHTMLSelUpTagExecute(Sender: TObject);
var BC_Begin, BC_End, BC, BC_b1, BC_b2, BC_e1, BC_e2: TBufferCoord;
    Child: TFChild;
    Token: string;
    len: Integer;
begin
  if (ActiveMDIChild <> nil) and (ActiveMDIChild is TFChild) then
  with TFChild(ActiveMDIChild).SynMemo do
  begin
    Child := TFChild(ActiveMDIChild);
    if SelAvail then
    begin
      BC_Begin := BlockBegin;
      BC_End := BlockEnd;
    end
    else
    begin
      BC_Begin := CaretXY;
      BC_End := BC_Begin;
    end;
    BC := BC_Begin;

    while Child.FindPrevTagBegin(BC, BC, BC_e1, Token) do
      if Child.FindMatchingTag(BC, BC_b1, BC_b2, BC_e1, BC_e2, Token) then
        if (CompareCoords(BC_b1, BC_Begin) <= 0) and (CompareCoords(BC_End, BC_e2) <= 0) then
        begin
          SetCaretAndSelection(BC_b1, BC_b1, BC_e2);
          Break;
        end
        else
        if (CompareCoords(BC_b1, BC_Begin) < 0) and (CompareCoords(BC_e1, BC_Begin) < 0) then
        begin
          BC := BC_b1;
        end;

  end;
end;

procedure TNotHMainForm.ActionSwitchExecute(Sender: TObject);
var BC, BC_b1, BC_b2, BC_e1, BC_e2: TBufferCoord;
    Child: TFChild;
    Token: string;
begin
  if (ActiveMDIChild <> nil) and (ActiveMDIChild is TFChild) then
  with TFChild(ActiveMDIChild).SynMemo do
  begin
    Child := TFChild(ActiveMDIChild);
    if SelAvail then
      BC := BlockBegin
    else
      BC := CaretXY;
    if Child.FindMatchingTag(BC, BC_b1, BC_b2, BC_e1, BC_e2, Token) then
      if CompareCoords(BC, BC_e1) < 0 then
        SetCaretAndSelection(BC_e1, BC_e1, BC_e2)
      else
        SetCaretAndSelection(BC_b1, BC_b1, BC_b2)
    //else
    //  FindMatchingBracket;
  end;
end;

procedure TNotHMainForm.ActionHTMLDelPairTagsExecute(Sender: TObject);
var BC, BC_b1, BC_b2, BC_e1, BC_e2: TBufferCoord;
    Child: TFChild;
    Token: string;
    len: Integer;
begin
  if (ActiveMDIChild <> nil) and (ActiveMDIChild is TFChild) then
  with TFChild(ActiveMDIChild).SynMemo do
  begin
    Child := TFChild(ActiveMDIChild);
    if SelAvail then
      BC := BlockBegin
    else
      BC := CaretXY;
    if Child.FindMatchingTag(BC, BC_b1, BC_b2, BC_e1, BC_e2, Token) then
    begin
      BeginUpdate;
      try
        if CompareCoords(BC_b1, BC_e1) > 0 then
        begin
          BC := BC_b1;
          BC_b1 := BC_e1;
          BC_e1 := BC;
          BC := BC_b2;
          BC_b2 := BC_e2;
          BC_e2 := BC;
        end;
        len := RowColToCharIndex(BC_e1) - RowColToCharIndex(BC_b2);
        BlockBegin := BC_e1;
        BlockEnd := BC_e2;
        ClearSelection;
        BlockBegin := BC_b1;
        BlockEnd := BC_b2;
        ClearSelection;
        if BC_b1.Char-1 > Length(Lines[BC_b1.Line-1]) then
          BC_b1.Char := Length(Lines[BC_b1.Line-1])+1;
        BC_e2 := CharIndexToRowCol(RowColToCharIndex(BC_b1) + len);
        SetCaretAndSelection(BC_e2, BC_b1, BC_e2);
      finally
        EndUpdate;
      end;
      UndoList.AddGroupBreak;
    end;
  end;
end;

procedure TNotHMainForm.ActionHTMLSelectBlockExecute(Sender: TObject);
var BC, BC_b1, BC_b2, BC_e1, BC_e2: TBufferCoord;
    Child: TFChild;
    Token: string;
begin
  if (ActiveMDIChild <> nil) and (ActiveMDIChild is TFChild) then
  with TFChild(ActiveMDIChild).SynMemo do
  begin
    Child := TFChild(ActiveMDIChild);
    BC := CaretXY;
    if Child.FindMatchingTag(BC, BC_b1, BC_b2, BC_e1, BC_e2, Token) then
    begin
      if CompareCoords(BC_b1, BC_e1) > 0 then
      begin
        BC := BC_b1;
        BC_b1 := BC_e1;
        BC_e1 := BC;
        BC := BC_b2;
        BC_b2 := BC_e2;
        BC_e2 := BC;
      end;
      SetCaretAndSelection(BC_e2, BC_b1, BC_e2);
    end;
  end;
end;

procedure TNotHMainForm.WMXAfterShow(var Msg: TMessage);
begin
  try
    LoadDockTreeFromAppStorage(JvAppRegistryStorage1);
  except;
  end;
end;

procedure TNotHMainForm.WMXConfirmReady(var Msg: TMessage);
begin
  Msg.Result := 1000;
end;

procedure TNotHMainForm.JvShape1DblClick(Sender: TObject);
var c: Integer;
    b: Byte;
begin
  if (ActiveMDIChild <> nil) and (ActiveMDIChild is TFChild) then
  with TFChild(ActiveMDIChild).SynMemo do
  begin
    c := ColorToRGB(JvShape1.Brush.Color);
    b := RGBQUAD(c).rgbBlue;
    RGBQUAD(c).rgbBlue := RGBQUAD(c).rgbRed;
    RGBQUAD(c).rgbRed := b;
    SelText := '#' + LowerCase(IntToHex(c, 6));
  end;
end;

procedure TNotHMainForm.JvShape1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
  begin
    ColorDialog1.Color := JvShape1.Brush.Color;
    if ColorDialog1.Execute then
      JvShape1.Brush.Color := ColorDialog1.Color;
  end;
end;

procedure TNotHMainForm.JvTabBar1TabCloseQuery(Sender: TObject;
  Item: TJvTabBarItem; var CanClose: Boolean);
begin
  if Assigned(Item.Data) then
    PostMessage((Item.Data as TFChild).Handle, PPWM_CLOSE, 0, 0);
  CanClose := False;
end;

procedure TNotHMainForm.JvTabBar1TabSelected(Sender: TObject;
  Item: TJvTabBarItem);
begin
  if Assigned(Item) and Assigned(Item.Data) then
    with (Item.Data as TFChild) do
    begin
      if WindowState = wsMinimized then
        WindowState := wsNormal;
      Show;
    end;
end;

procedure TNotHMainForm.ActionSpecialCharsExecute(Sender: TObject);
begin
  with SynMemoTmp do
    if eoShowSpecialChars in Options then
      Options := Options - [eoShowSpecialChars]
    else
      Options := Options + [eoShowSpecialChars];
  {if (ActiveMDIChild <> nil) and (ActiveMDIChild is TFChild) then
  with TFChild(ActiveMDIChild).SynMemo do
    if eoShowSpecialChars in Options then
      Options := Options - [eoShowSpecialChars]
    else
      Options := Options + [eoShowSpecialChars];}
  DispatchOptions;
end;

procedure TNotHMainForm.ActionSpecialCharsUpdate(Sender: TObject);
begin
  {ActionSpecialChars.Enabled :=
    (ActiveMDIChild <> nil) and (ActiveMDIChild is TFChild);
  ActionSpecialChars.Checked := ActionSpecialChars.Enabled and
    (eoShowSpecialChars in TFChild(ActiveMDIChild).SynMemo.Options);}
  ActionSpecialChars.Checked := (eoShowSpecialChars in SynMemoTmp.Options);
end;

procedure TNotHMainForm.ActionProcessEmptyLinesExecute(Sender: TObject);
begin
  // Nie usuwaæ tego komentarza!!!
end;

procedure TNotHMainForm.ActionIgnoreFileExtExecute(Sender: TObject);
begin
  RefreshCommandBox(TFChild(ActiveMDIChild), True);
end;

procedure TNotHMainForm.ActionParagraphsToLinesExecute(Sender: TObject);
var
  WSL: TStringList;
  i: Integer;
  res, ws: string;
  BC: TBufferCoord;
begin
  if (ActiveMDIChild <> nil) and (ActiveMDIChild is TFChild) and
     TFChild(ActiveMDIChild).SynMemo.SelAvail then
  begin
    WSL := TStringList.Create;
    try
      WSL.Text := TFChild(ActiveMDIChild).SynMemo.SelText;
      BC := TFChild(ActiveMDIChild).SynMemo.BlockBegin;
      res := '';
      for i := 0 to WSL.Count-1 do
      begin
        ws := WSL[i];
        if i < WSL.Count-1 then
          ws := TrimRight(ws);
        if i > 0 then
          ws := TrimLeft(ws);
        if (ws = '') and (i > 0) then
          res := res + WideCRLF
        else
          if (res <> '') and (res[Length(res)] <> #10) then
            res := res + ' ' + ws
          else
            res := res + ws;
      end;
      TFChild(ActiveMDIChild).SynMemo.SelText := res;
      TFChild(ActiveMDIChild).SynMemo.BlockBegin := BC;
      TFChild(ActiveMDIChild).SynMemo.BlockEnd := TFChild(ActiveMDIChild).SynMemo.CaretXY;
    finally
      WSL.Free;
    end;
  end;
end;

procedure TNotHMainForm.ActionHelpShortcutsExecute(Sender: TObject);
var s: string;
begin
  s := FApplicationPath + 'shortcuts\index.html';
  if FileExists(s) then
    ShellExecute(0, 'open', PChar(s), '', '', SW_SHOWNORMAL);
end;

procedure TNotHMainForm.ActionHelpBookExecute(Sender: TObject);
begin
  ShellExecute(0, 'open', 'http://helion.pl/ksiazki/htxcsp.htm', '', '', SW_SHOWNORMAL);
end;

procedure TNotHMainForm.ActionDOSUpdate(Sender: TObject);
begin
  if Sender is TAction then
    with TAction(Sender) do
    begin
      Enabled := MDIChildCount > 0;
      if Enabled and (MDIChildren[0] is TFChild) then
        Checked := (Tag = Integer(TFChild(MDIChildren[0]).FileFormat));
    end;
end;

procedure TNotHMainForm.ActionDOSExecute(Sender: TObject);
var
  ff: TSynEditFileFormat;
begin
  if (MDIChildren[0] is TFChild) and (Sender is TAction) then
  begin
    ff := TSynEditFileFormat(TAction(Sender).Tag);
    if TFChild(MDIChildren[0]).FileFormat <> ff then
    begin
      TFChild(MDIChildren[0]).FileFormat := ff;
      TFChild(MDIChildren[0]).SynMemo.Modified := True;
    end;
  end;
end;

procedure TNotHMainForm.TntTreeViewMouseLeave(Sender: TObject);
begin
  FormCommandInfo.Disappear;
end;

procedure TNotHMainForm.TntTreeViewMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  TV: TTreeView;
  Node: TTreeNode;
  ws: string;
  r,r2: TRect;
begin
  if ActionShowCommInfo.Checked then
  begin
    TV := Sender as TTreeView;
    Node := TV.GetNodeAt(X, Y);
    if (Node <> nil) and (Node.Data <> nil) then
    begin
      ws := TCommand(Node.Data).CommandText;
      if not FormCommandInfo.Visible or (FormCommandInfo.Text <> ws) then
      begin
        r := Node.DisplayRect(False);
        r.Left := 0;                                    
        r.Right := TV.Width;
        r.TopLeft := TV.ClientToScreen(r.TopLeft);
        r.BottomRight := TV.ClientToScreen(r.BottomRight);
        r2 := Node.DisplayRect(True);
        r2.TopLeft := TV.ClientToScreen(r2.TopLeft);
        r2.BottomRight := TV.ClientToScreen(r2.BottomRight);
        FormCommandInfo.Text := ws;
        FormCommandInfo.Adjust(r, r2);
        FormCommandInfo.Appear;
      end;                                
    end
    else
      FormCommandInfo.Disappear;
  end;
end;

procedure TNotHMainForm.ActionShowCommInfoExecute(Sender: TObject);
begin
  //Do not remove
end;

procedure TNotHMainForm.ActionSortExecute(Sender: TObject);
var sl: TStringList;
begin
  if (ActiveMDIChild <> nil) and (ActiveMDIChild is TFChild) then
  begin
    sl := TStringList.Create;
    try
      sl.Assign(TFChild(ActiveMDIChild).SynMemo.Lines);
      sl.Sort;
      TFChild(ActiveMDIChild).SynMemo.Lines.Assign(sl);
    finally
      sl.Free;
    end;
  end
end;

{ TJvTabBarPP.TChildListener }

procedure TJvTabBarPP.TTabBarCSListener.InternalFChildActivated(FChild: TFChild;
  Param: TObject);
begin
  inherited;
  if Param is TJvTabBarItem then
    TJvTabBarItem(Param).Selected := True;
  InternalFChildChangingFileName(FChild, Param);
end;

procedure TJvTabBarPP.TTabBarCSListener.InternalFChildChangingFileName(FChild: TFChild;
  Param: TObject);
var s: string;
begin
  inherited;
  if Param is TJvTabBarItem then
  begin
    s := ExtractFileName(FChild.FileName);
    if FChild.SynMemo.Modified then
      s := s + ' *';
    TJvTabBarItem(Param).Caption := s;
    TJvTabBarItem(Param).Hint := FChild.FileName;
  end;
end;

procedure TJvTabBarPP.TTabBarCSListener.InternalFChildClosed(FChild: TFChild;
  Param: TObject);
begin
  inherited;
  if Param is TJvTabBarItem then
    TJvTabBarItem(Param).TabBar.Tabs.Delete(TJvTabBarItem(Param).Index);
end;

procedure TJvTabBarPP.TTabBarCSListener.InternalRegisterFChild(FChild: TFChild; Param: TObject);
begin
  inherited;
  if Param is TJvTabBarItem then
    TJvTabBarItem(Param).Data := FChild;
end;

{ TJvTabBarPP }

constructor TJvTabBarPP.Create(AOwner: TComponent);
begin
  inherited;
  FChildListener := TTabBarCSListener.Create;
end;

destructor TJvTabBarPP.Destroy;
begin
  FChildListener.Free;
  inherited;
end;

initialization
finalization
  if MutexHandle <> 0 then
    CloseHandle(MutexHandle);

end.
