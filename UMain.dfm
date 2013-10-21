object NotHMainForm: TNotHMainForm
  Left = 243
  Top = 276
  Caption = 'NotH'
  ClientHeight = 416
  ClientWidth = 719
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Scaled = False
  ShowHint = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 397
    Width = 719
    Height = 19
    Panels = <>
    ParentColor = True
    ParentFont = True
    SimplePanel = True
    UseSystemFont = False
  end
  object SynMemoTmp: TSynMemo
    Left = 13
    Top = 232
    Width = 240
    Height = 135
    ActiveLineColor = 11206655
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    TabOrder = 1
    Visible = False
    Gutter.AutoSize = True
    Gutter.Font.Charset = DEFAULT_CHARSET
    Gutter.Font.Color = clWindowText
    Gutter.Font.Height = -11
    Gutter.Font.Name = 'Courier New'
    Gutter.Font.Style = []
    Gutter.LeftOffset = 2
    Gutter.ShowLineNumbers = True
    Gutter.Gradient = True
    Options = [eoAutoIndent, eoAutoSizeMaxScrollWidth, eoDragDropEditing, eoDropFiles, eoGroupUndo, eoScrollHintFollows, eoShowScrollHint]
    ScrollHintFormat = shfTopToBottom
    SearchEngine = SynEditSearch
    WantTabs = True
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 719
    Height = 26
    AutoSize = True
    Bands = <
      item
        Control = TBFile
        ImageIndex = -1
        MinHeight = 22
        Width = 713
      end>
    object TBFile: TToolBar
      Left = 11
      Top = 0
      Width = 704
      Height = 22
      AutoSize = True
      Images = ImageList2
      TabOrder = 0
      Transparent = True
      object BNew: TToolButton
        Left = 0
        Top = 0
        Action = FileNew1
      end
      object BOpen: TToolButton
        Left = 23
        Top = 0
        Action = FileOpen1
      end
      object BSave: TToolButton
        Left = 46
        Top = 0
        Action = FileSave1
      end
      object ToolButton4: TToolButton
        Left = 69
        Top = 0
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object BPrint: TToolButton
        Left = 77
        Top = 0
        Action = PrintDlg1
      end
      object ToolButton1: TToolButton
        Left = 100
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 15
        Style = tbsSeparator
      end
      object ToolButton7: TToolButton
        Left = 108
        Top = 0
        Action = EditRedo1
      end
      object ToolButton2: TToolButton
        Left = 131
        Top = 0
        Action = EditUndo1
      end
      object ToolButton3: TToolButton
        Left = 154
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 16
        Style = tbsSeparator
      end
      object ToolButton5: TToolButton
        Left = 162
        Top = 0
        Action = EditCut1
      end
      object ToolButton6: TToolButton
        Left = 185
        Top = 0
        Action = EditCopy1
      end
      object ToolButton8: TToolButton
        Left = 208
        Top = 0
        Action = EditPaste1
      end
      object ToolButton9: TToolButton
        Left = 231
        Top = 0
        Action = EditDelete1
      end
      object ToolButton10: TToolButton
        Left = 254
        Top = 0
        Width = 8
        Caption = 'ToolButton10'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object ToolButton11: TToolButton
        Left = 262
        Top = 0
        Action = actSearch
        Down = True
      end
      object ToolButton12: TToolButton
        Left = 285
        Top = 0
        Action = actSearchNext
      end
      object ToolButton13: TToolButton
        Left = 308
        Top = 0
        Action = actSearchPrev
      end
      object ToolButton14: TToolButton
        Left = 331
        Top = 0
        Action = actSearchReplace
      end
      object ToolButton15: TToolButton
        Left = 354
        Top = 0
        Width = 8
        Caption = 'ToolButton15'
        ImageIndex = 14
        Style = tbsSeparator
      end
      object ToolButton16: TToolButton
        Left = 362
        Top = 0
        Action = ActionEveryLine
      end
      object ToolButton27: TToolButton
        Left = 385
        Top = 0
        Action = ActionProcessEmptyLines
      end
      object ToolButton23: TToolButton
        Left = 408
        Top = 0
        Width = 8
        Caption = 'ToolButton23'
        ImageIndex = 25
        Style = tbsSeparator
      end
      object ToolButton17: TToolButton
        Left = 416
        Top = 0
        Action = ActionCommandsExpand
      end
      object ToolButton18: TToolButton
        Left = 439
        Top = 0
        Action = ActionCommandsCollapse
      end
      object ToolButton22: TToolButton
        Left = 462
        Top = 0
        Width = 8
        Caption = 'ToolButton22'
        ImageIndex = 25
        Style = tbsSeparator
      end
      object ToolButton19: TToolButton
        Left = 470
        Top = 0
        Action = ActionShowAllCommands
      end
      object ToolButton20: TToolButton
        Left = 493
        Top = 0
        Action = ActionShowCmdWithShortcut
      end
      object ToolButton21: TToolButton
        Left = 516
        Top = 0
        Action = ActionShowCmdWithoutShortcut
      end
      object ToolButton28: TToolButton
        Left = 539
        Top = 0
        Action = ActionIgnoreFileExt
      end
      object ToolButton24: TToolButton
        Left = 562
        Top = 0
        Width = 8
        Caption = 'ToolButton24'
        ImageIndex = 25
        Style = tbsSeparator
      end
      object ToolButton25: TToolButton
        Left = 570
        Top = 0
        Action = ActionSpecialChars
      end
      object ToolButton26: TToolButton
        Left = 593
        Top = 0
        Width = 8
        Caption = 'ToolButton26'
        ImageIndex = 26
        Style = tbsSeparator
      end
      object JvShape1: TJvShape
        Left = 601
        Top = 0
        Width = 23
        Height = 22
        Hint = 'Wybierz kolor'
        Pen.Style = psInsideFrame
        Pen.Width = 2
        OnMouseUp = JvShape1MouseUp
        OnDblClick = JvShape1DblClick
      end
      object ToolButton29: TToolButton
        Left = 624
        Top = 0
        Width = 8
        Caption = 'ToolButton29'
        ImageIndex = 27
        Style = tbsSeparator
      end
      object ToolButton30: TToolButton
        Left = 632
        Top = 0
        Action = ActionActivateWebHSwitch
      end
    end
  end
  object ActionList1: TActionList
    Images = ImageList2
    Left = 508
    Top = 100
    object EditCut1: TEditCut
      Category = 'Edit'
      Caption = '&Wytnij'
      Hint = 'Wytnij|Wycina zaznaczony tekst i umieszcza w schowku'
      ImageIndex = 0
      ShortCut = 16472
    end
    object EditCopy1: TEditCopy
      Category = 'Edit'
      Caption = '&Kopiuj'
      Hint = 'Kopiuj|Kopiuje zaznaczony tekst do schowka'
      ImageIndex = 1
      ShortCut = 16451
    end
    object EditPaste1: TEditPaste
      Category = 'Edit'
      Caption = 'Wkl&ej'
      Hint = 'Wklej|Wkleja tekst ze schowka'
      ImageIndex = 2
      ShortCut = 16470
    end
    object EditSelectAll1: TEditSelectAll
      Category = 'Edit'
      Caption = 'Zaznacz &wszystko'
      Hint = 'Zaznacz wszystko|Zaznacza ca'#322'y dokument'
      ShortCut = 16449
    end
    object EditUndo1: TEditUndo
      Category = 'Edit'
      Caption = '&Cofnij'
      Hint = 'Cofnij|Cofa ostatni'#261' operacj'#281
      ImageIndex = 3
      ShortCut = 16474
    end
    object EditDelete1: TEditDelete
      Category = 'Edit'
      Caption = '&Usu'#324
      Hint = 'Usu'#324'|Usuwa zaznaczony tekst'
      ImageIndex = 4
      ShortCut = 46
    end
    object WindowCascade1: TWindowCascade
      Category = 'Window'
      Caption = 'Rozmie'#347#263' &kaskadowo'
      Enabled = False
      Hint = 'Cascade'
      ImageIndex = 5
    end
    object WindowTileHorizontal1: TWindowTileHorizontal
      Category = 'Window'
      Caption = 'Rozmie'#347#263' &poziomo'
      Enabled = False
      Hint = 'Tile Horizontal'
      ImageIndex = 6
    end
    object WindowTileVertical1: TWindowTileVertical
      Category = 'Window'
      Caption = '&Rozmie'#347#263' pionowo'
      Enabled = False
      Hint = 'Tile Vertical'
      ImageIndex = 7
    end
    object WindowMinimizeAll1: TWindowMinimizeAll
      Category = 'Window'
      Caption = '&Minimalizuj wszystkie'
      Enabled = False
      Hint = 'Minimize All'
    end
    object FileOpen1: TFileOpen
      Category = 'File'
      Caption = '&Otw'#243'rz...'
      Dialog.FilterIndex = 0
      Dialog.Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
      Hint = 'Otw'#243'rz|Otwiera istniej'#261'cy plik'
      ImageIndex = 15
      ShortCut = 16463
      OnAccept = FileOpen1Accept
    end
    object FilePrintSetup1: TFilePrintSetup
      Category = 'File'
      Caption = '&Ustawienia drukarki'
      Hint = 'Ustawienia drukarki'
    end
    object FileExit1: TFileExit
      Category = 'File'
      Caption = '&Zako'#324'cz program'
      Hint = 'Wyj'#347'cie|Wychodzi z aplikacji'
      ImageIndex = 10
    end
    object ActionHTMLSelectBlock: TAction
      Category = 'Edit'
      Caption = 'Zaznacz element XHTML'
      Hint = 'Zaznacz element XHTML'
      ShortCut = 16500
      OnExecute = ActionHTMLSelectBlockExecute
      OnUpdate = _IsThereAnyWebDocument
    end
    object FontEdit1: TFontEdit
      Category = 'Dialog'
      Caption = 'Wybierz &czcionk'#281'...'
      Dialog.Font.Charset = DEFAULT_CHARSET
      Dialog.Font.Color = clWindowText
      Dialog.Font.Height = -11
      Dialog.Font.Name = 'MS Sans Serif'
      Dialog.Font.Style = []
      Dialog.Options = [fdEffects, fdFixedPitchOnly]
      Hint = 'Font Select'
      BeforeExecute = FontEdit1BeforeExecute
      OnAccept = FontEdit1Accept
    end
    object PrintDlg1: TPrintDlg
      Category = 'Dialog'
      Caption = '&Drukuj...'
      Hint = 'Drukuj|Drukuje aktywny dokument'
      ImageIndex = 14
      ShortCut = 16464
      BeforeExecute = PrintDlg1BeforeExecute
      OnAccept = PrintDlg1Accept
    end
    object FileNew1: TAction
      Category = 'File'
      Caption = '&Nowy'
      Hint = 'Nowy|Tworzy nowy dokument'
      ImageIndex = 17
      ShortCut = 16462
      OnExecute = FileNew1Execute
    end
    object FileSave1: TAction
      Category = 'File'
      Caption = '&Zapisz'
      Hint = 'Zapisz|Zapisuje dokument'
      ImageIndex = 16
      ShortCut = 16467
      OnExecute = FileSave1Execute
      OnUpdate = FileSave1Update
    end
    object FileSaveAs1: TAction
      Category = 'File'
      Caption = 'Zapisz &jako...'
      Hint = 'Zapisz jako|Zapisuje dokument pod wybran'#261' nazw'#261
      ImageIndex = 9
      OnExecute = FileSaveAs1Execute
      OnUpdate = _IsThereAnyDocument
    end
    object WindowClose1: TWindowClose
      Category = 'Window'
      Caption = 'Za&mknij'
      Enabled = False
      Hint = 'Zamknij'
    end
    object EditRedo1: TAction
      Category = 'Edit'
      Caption = '&Pon'#243'w'
      Hint = 'Pon'#243'w|Ponawia ostatni'#261' operacj'#281
      ImageIndex = 18
      ShortCut = 16473
      OnExecute = EditRedo1Execute
      OnUpdate = EditRedo1Update
    end
    object PageDlg1: TAction
      Category = 'Dialog'
      Caption = 'Ustawienia strony'
      Hint = 'Ustawienia strony'
      OnExecute = PageDlg1Execute
    end
    object SettingsShortCuts: TAction
      Category = 'Settings'
      Caption = 'Skr'#243'ty klawiszowe'
      OnExecute = SettingsShortCutsExecute
    end
    object SettingsSynMemoOptions: TAction
      Category = 'Settings'
      Caption = 'Opcje edytora'
      ImageIndex = 26
      OnExecute = SettingsSynMemoOptionsExecute
    end
    object SettingsMargins: TAction
      Category = 'Settings'
      Caption = 'Ustawienia margines'#243'w'
      Hint = 'Dok'#322'adne ustawienia margines'#243'w'
      OnExecute = SettingsMarginsExecute
    end
    object ActionUTF8: TAction
      Category = 'Format'
      Caption = 'utf-8'
      Checked = True
      GroupIndex = 1
      OnExecute = ActionUTF8Execute
      OnUpdate = ActionUTF8Update
    end
    object ActionWIN1250: TAction
      Tag = 2
      Category = 'Format'
      Caption = 'windows-1250'
      GroupIndex = 1
      OnExecute = ActionUTF8Execute
      OnUpdate = ActionUTF8Update
    end
    object ActionISO88592: TAction
      Tag = 1
      Category = 'Format'
      Caption = 'iso-8859-2'
      GroupIndex = 1
      OnExecute = ActionUTF8Execute
      OnUpdate = ActionUTF8Update
    end
    object ActionKodowanie: TAction
      Category = 'Format'
      Caption = 'Kodowanie'
      OnExecute = ActionKodowanieExecute
      OnUpdate = _IsThereAnyDocument
    end
    object actSearch: TAction
      Category = 'Search'
      Caption = 'Znajd'#378
      Hint = 'Znajd'#378'|Szuka podanego tekstu'
      ImageIndex = 11
      ShortCut = 16454
      OnExecute = actSearchExecute
      OnUpdate = _IsThereAnyDocument
    end
    object actSearchNext: TAction
      Category = 'Search'
      Caption = 'Znajd'#378' nast'#281'pny'
      Hint = 'Znajd'#378' nast'#281'pny|Szuka kolejnego wyst'#261'pienia podanego tekstu'
      ImageIndex = 12
      ShortCut = 114
      OnExecute = actSearchNextExecute
      OnUpdate = actSearchNextUpdate
    end
    object actSearchPrev: TAction
      Category = 'Search'
      Caption = 'Znajd'#378' poprzedni'
      Hint = 'Znajd'#378' poprzedni|Szuka poprzedniego wyst'#261'pienia podanego tekstu'
      ImageIndex = 12
      ShortCut = 8306
      OnExecute = actSearchPrevExecute
      OnUpdate = actSearchNextUpdate
    end
    object actSearchReplace: TAction
      Category = 'Search'
      Caption = 'Zamie'#324
      Hint = 'Zamie'#324'|Szuka i zamienia podany tekst'
      ImageIndex = 13
      ShortCut = 16456
      OnExecute = actSearchReplaceExecute
      OnUpdate = actSearchReplaceUpdate
    end
    object ActionEveryLine: TAction
      Category = 'Settings'
      AutoCheck = True
      Caption = 'Tryb liniowy'
      Hint = 'Tryb liniowy'
      ImageIndex = 19
      ShortCut = 24652
      OnExecute = ActionEveryLineExecute
      OnUpdate = ActionEveryLineUpdate
    end
    object ActionInsertFileName: TAction
      Category = 'Insert'
      Caption = 'Nazwa pliku'
      Hint = 'Nazwa pliku|Wstawia do dokumentu '#347'cie'#380'k'#281' do pliku'
      ImageIndex = 15
      ShortCut = 119
      OnExecute = ActionInsertFileNameExecute
      OnUpdate = _IsThereAnyDocument
    end
    object ActionInsertPictFileName: TAction
      Category = 'Insert'
      Caption = 'Nazwa pliku (obrazek)'
      Hint = 
        'Nazwa pliku (obrazek)|Wstawia do dokumentu '#347'cie'#380'k'#281' do pliku obra' +
        'zka'
      ImageIndex = 15
      ShortCut = 16503
      OnExecute = ActionInsertFileNameExecute
      OnUpdate = _IsThereAnyDocument
    end
    object ActionViewCommandBox: TAction
      Category = 'View'
      Caption = 'Paleta szablon'#243'w'
      ShortCut = 123
      OnExecute = ActionViewCommandBoxExecute
      OnUpdate = ActionViewCommandBoxUpdate
    end
    object ActionReloadCommands: TAction
      Category = 'Settings'
      Caption = 'Od'#347'wie'#380' szablony'
      OnExecute = ActionReloadCommandsExecute
    end
    object ActionPreviewWeb: TAction
      Category = 'View'
      Caption = 'Zobacz w przegl'#261'darce'
      ShortCut = 120
      OnExecute = ActionPreviewWebExecute
      OnUpdate = _IsThereAnyWebDocument
    end
    object ActionHelpDocs: TAction
      Category = 'Help'
      Caption = 'Opis'
      Hint = 'Opis'
      ShortCut = 112
      OnExecute = ActionHelpDocsExecute
    end
    object ActionHelpHomepage: TAction
      Category = 'Help'
      Caption = 'Strona domowa programu'
      Hint = 'Strona domowa programu'
      OnExecute = ActionHelpHomepageExecute
    end
    object ActionHelpAbout: TAction
      Category = 'Help'
      Caption = 'O programie'
      Hint = 'O programie'
      OnExecute = ActionHelpAboutExecute
    end
    object ActionChangeFocus: TAction
      Category = 'View'
      Caption = 'Prze'#322#261'cz edytor/szablony'
      Hint = 'Prze'#322#261'cz edytor/szablony'
      ShortCut = 16507
      OnExecute = ActionChangeFocusExecute
    end
    object ActionCommandsExpand: TAction
      Category = 'Settings'
      Caption = 'Rozwi'#324' wszystko'
      Hint = 'Rozwi'#324' wszystko'
      ImageIndex = 21
      OnExecute = ActionCommandsExpandExecute
      OnUpdate = ActionCommandsExpandUpdate
    end
    object ActionCommandsCollapse: TAction
      Category = 'Settings'
      Caption = 'Zwi'#324' wszystko'
      Hint = 'Zwi'#324' wszystko'
      ImageIndex = 22
      OnExecute = ActionCommandsCollapseExecute
      OnUpdate = ActionCommandsExpandUpdate
    end
    object ActionShowCmdWithShortcut: TAction
      Category = 'Settings'
      AutoCheck = True
      Caption = 'Poka'#380' tylko komendy ze skr'#243'tami'
      GroupIndex = 10
      Hint = 'Poka'#380' tylko komendy ze skr'#243'tami'
      ImageIndex = 23
      ShortCut = 16505
      OnExecute = ActionShowCmdWithShortcutExecute
    end
    object ActionShowCmdWithoutShortcut: TAction
      Category = 'Settings'
      AutoCheck = True
      Caption = 'Poka'#380' tylko komendy bez skr'#243't'#243'w'
      GroupIndex = 10
      Hint = 'Poka'#380' tylko komendy bez skr'#243't'#243'w'
      ImageIndex = 24
      ShortCut = 8313
      OnExecute = ActionShowCmdWithShortcutExecute
    end
    object ActionShowAllCommands: TAction
      Category = 'Settings'
      AutoCheck = True
      Caption = 'Poka'#380' wszystkie komendy'
      Checked = True
      GroupIndex = 10
      Hint = 'Poka'#380' wszystkie komendy'
      ImageIndex = 25
      ShortCut = 121
      OnExecute = ActionShowCmdWithShortcutExecute
    end
    object ActionShowToolbar: TAction
      Category = 'View'
      AutoCheck = True
      Caption = 'Poka'#380' pasek narz'#281'dzi'
      Checked = True
      Hint = 'Poka'#380' pasek narz'#281'dzi'
      OnExecute = ActionShowToolbarExecute
    end
    object ActionViewFileBox: TAction
      Category = 'View'
      Caption = 'Lista plik'#243'w'
      Hint = 'Lista plik'#243'w'
      OnExecute = ActionViewFileBoxExecute
      OnUpdate = ActionViewFileBoxUpdate
    end
    object ActionCitation: TAction
      Category = 'Edit'
      Caption = 'Cytuj HTML'
      Hint = 'Cytuj XHTML'
      ShortCut = 122
      OnExecute = ActionCitationExecute
      OnUpdate = _IsThereAnySelBlock
    end
    object ActionDecitation: TAction
      Category = 'Edit'
      Caption = 'Decytuj HTML'
      Hint = 'Decytuj XHTML'
      ShortCut = 16506
      OnExecute = ActionDecitationExecute
      OnUpdate = _IsThereAnySelBlock
    end
    object ActionShowVersionForm: TAction
      Category = 'Settings'
      Caption = 'Ustawienia wersji j'#281'zyk'#243'w'
      Hint = 'Ustawienia wersji j'#281'zyk'#243'w'
      OnExecute = ActionShowVersionFormExecute
    end
    object ActionHTMLSelNextTag: TAction
      Category = 'Edit'
      Caption = 'Zaznacz nast'#281'pny znacznik XHTML'
      Hint = 'Zaznacz nast'#281'pny znacznik XHTML'
      ShortCut = 117
      OnExecute = ActionHTMLSelNextTagExecute
      OnUpdate = _IsThereAnyWebDocument
    end
    object ActionHTMLSelPrevTag: TAction
      Category = 'Edit'
      Caption = 'Zaznacz poprzedni znacznik XHTML'
      Hint = 'Zaznacz poprzedni znacznik XHTML'
      ShortCut = 8309
      OnExecute = ActionHTMLSelPrevTagExecute
      OnUpdate = _IsThereAnyWebDocument
    end
    object ActionSwitch: TAction
      Category = 'Edit'
      Caption = 'Prze'#322#261'cz pocz'#261'tkowy/ko'#324'cowy'
      Hint = 'Prze'#322#261'cz pocz'#261'tkowy/ko'#324'cowy'
      ShortCut = 116
      OnExecute = ActionSwitchExecute
      OnUpdate = _IsThereAnyWebDocument
    end
    object ActionHTMLDelPairTags: TAction
      Category = 'Edit'
      Caption = 'Usu'#324' znaczniki HTML'
      Hint = 'Usu'#324' znaczniki HTML'
      ShortCut = 16430
      OnExecute = ActionHTMLDelPairTagsExecute
      OnUpdate = _IsThereAnyWebDocument
    end
    object ActionSpecialChars: TAction
      Category = 'View'
      Caption = 'Poka'#380' znaki specjalne'
      Hint = 
        'Poka'#380' znaki specjalne|Pokazuje znaki specjalne, np. spacja, tabu' +
        'latory, znaki ko'#324'ca linii, itp.'
      ImageIndex = 28
      ShortCut = 8311
      OnExecute = ActionSpecialCharsExecute
      OnUpdate = ActionSpecialCharsUpdate
    end
    object ActionProcessEmptyLines: TAction
      Category = 'Settings'
      AutoCheck = True
      Caption = 'Przetwarzaj puste linie'
      Hint = 
        'Przetwarzaj puste linie|Opcja decyduje czy program powinien uwzg' +
        'l'#281'dnia'#263' puste linie w czasie aplikowania szablon'#243'w do poszczeg'#243'l' +
        'nych linii'
      ImageIndex = 29
      ShortCut = 24656
      OnExecute = ActionProcessEmptyLinesExecute
    end
    object ActionIgnoreFileExt: TAction
      Category = 'Settings'
      AutoCheck = True
      Caption = 'Pokazuj zawsze wszystkie szablony'
      Hint = 'Pokazuj zawsze wszystkie szablony'
      ImageIndex = 30
      ShortCut = 24697
      OnExecute = ActionIgnoreFileExtExecute
    end
    object ActionParagraphsToLines: TAction
      Category = 'Edit'
      Caption = 'Akapity w linie'
      ShortCut = 8314
      OnExecute = ActionParagraphsToLinesExecute
      OnUpdate = _IsThereAnySelBlock
    end
    object ActionHelpShortcuts: TAction
      Category = 'Help'
      Caption = 'Skr'#243'ty klawiszowe'
      Hint = 'Skr'#243'ty klawiszowe'
      ShortCut = 16496
      OnExecute = ActionHelpShortcutsExecute
    end
    object ActionHelpBook: TAction
      Category = 'Help'
      Caption = 'Strona domowa ksi'#261#380'ki'
      Hint = 'Strona domowa ksi'#261#380'ki'
      OnExecute = ActionHelpBookExecute
    end
    object ActionDOS: TAction
      Category = 'Format'
      AutoCheck = True
      Caption = 'DOS'
      GroupIndex = 2
      OnExecute = ActionDOSExecute
      OnUpdate = ActionDOSUpdate
    end
    object ActionUNIX: TAction
      Tag = 1
      Category = 'Format'
      Caption = 'UNIX'
      GroupIndex = 2
      OnExecute = ActionDOSExecute
      OnUpdate = ActionDOSUpdate
    end
    object ActionMac: TAction
      Tag = 2
      Category = 'Format'
      Caption = 'Mac'
      GroupIndex = 2
      OnExecute = ActionDOSExecute
      OnUpdate = ActionDOSUpdate
    end
    object ActionUNICODE: TAction
      Tag = 3
      Category = 'Format'
      Caption = 'Unicode'
      GroupIndex = 2
      OnExecute = ActionDOSExecute
      OnUpdate = ActionDOSUpdate
    end
    object ActionShowCommInfo: TAction
      Category = 'View'
      AutoCheck = True
      Caption = 'Pokazuj tre'#347#263' szablonu'
      Checked = True
      OnExecute = ActionShowCommInfoExecute
    end
    object ActionSort: TAction
      Category = 'Edit'
      Caption = 'Sortuj linie'
      OnExecute = ActionSortExecute
      OnUpdate = _IsThereAnyDocument
    end
    object SettingsColors: TAction
      Category = 'Settings'
      Caption = 'Ustawienia kolor'#243'w'
      OnExecute = SettingsColorsExecute
      OnUpdate = _IsThereAnyDocument
    end
    object ActionHTMLSelUpTag: TAction
      Category = 'Edit'
      Caption = 'Zaznacz nadrz'#281'dny znacznik XHTML'
      ShortCut = 24614
      OnExecute = ActionHTMLSelUpTagExecute
      OnUpdate = _IsThereAnyWebDocument
    end
    object ActionUndoSelBlock: TAction
      Category = 'Edit'
      Caption = 'Wr'#243#263' do poprzedniego zaznaczenia'
      ShortCut = 24616
      OnExecute = ActionUndoSelBlockExecute
      OnUpdate = _IsThereAnyDocument
    end
    object ActionActivateWebHSwitch: TAction
      Category = 'View'
      AutoCheck = True
      Caption = 'Wyr'#243#380'nia w'#322'a'#347'nie edytowany typ kodu'
      Hint = 
        'W dokumentach HTML wyr'#243#380'nia aktualnie'#13#10'edytowany typ kodu, a poz' +
        'osta'#322'e wyszarza.'
      ImageIndex = 31
      OnExecute = ActionActivateWebHSwitchExecute
      OnUpdate = _IsThereAnyWebDocument
    end
  end
  object ImageList2: TImageList
    Left = 568
    Top = 100
    Bitmap = {
      494C010120002800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000009000000001002000000000000090
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000080800000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      000000808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF00000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FF00000000000000FF000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF0000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FF0000000000000000000000FFFF0000FF000000FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FF00000000000000FFFF0000FFFF0000FF000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80000000000000000000FF000000FF000000FFFF0000FF000000FF000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF0000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF00000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000404040004040
      4000404040004040400040404000404040004040400040404000404040004040
      4000404040004040400000000000000000000000000040404000404040004040
      400040404000404040004040400040404000404040002020200000007F000000
      3F00000000000000000000000000000000000000000000000000202020004040
      4000404040000000000020202000606060000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000202020004040400040404000404040004040400040404000404040004040
      40004040400040404000404040006060600030303000CFCFCF00909090008080
      8000808080008080800080808000808080008080800080808000808080008080
      800080808000000080000000000020202000202020007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F003F3F3F0040404000000000000000
      3F0000003F0000000000000000000000000000000000000000007F207F000000
      7F00404040000000000000007F007F207F004040400000000000000000004040
      4000404040004040400000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DFDFDF00DFDFDF00DFDF
      DF00DFDFDF00DFDFDF00000000004040400060606000EFEFEF00CFCFCF000000
      8000000000008080800080808000808080008080800080808000808080008080
      800090909000A0A0A000A0A0A000505050004040400000000000FF7F7F00FF7F
      7F00FF7F7F00FF7F7F00FF7F7F00FFBFBF007F7F7F0040404000000000000000
      7F000000BF0000003F00000000000000000000000000000000007F007F000000
      7F00404040000000000000007F007F007F004040400000000000000000005F5F
      5F00505050004040400080808000202020000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F0050505000404040004040
      40004040400060606000000000004040400060606000C0C0C000000080000000
      80000000800000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000000080000000000090909000404040004040400000000000FF7F7F00FF7F
      7F00FF7F7F00FF7F7F00FF7F7F00FFBFBF007F7F7F0040404000000000000000
      3F000000BF0000000000000000000000000000000000000000007F007F000000
      7F00404040000000000000007F007F007F004040400000000000000000000000
      00009F9F9F00A0A0A00040404000808080000000000000000000000000000000
      0000000000006F6F6F00606060006060600030303000EFEFEF00DFDFDF00C0C0
      C000A0A0A00060606000000000004040400060606000C0C0C000000080000000
      80000000800000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      800000000000A0A0A00080808000404040004040400000000000FF7F7F00FF7F
      7F00FF7F7F00FF7F7F00FF7F7F00FFBFBF007F7F7F0060606000404040004040
      40004040400040404000404040002020200000000000000000003F3F00009F9F
      600060606000202020009F9F5F00505050004040400000000000000000000000
      000000000000DFDFDF00B0B0B000404040000000000000000000000000000000
      0000000000006060600000000000000000007F7F7F007F0000007F3F3F007F7F
      7F006F6F6F00BFBFBF00000000004040400060606000C0C0C000DFDFDF000000
      8000000080000000800000000000C0C0C0007F7F7F00DFDFDF00000080000000
      800000000000A0A0A00080808000404040004040400000000000FF7F7F00FF7F
      7F00FF7F7F00FF7F7F00FF7F7F00FFBFBF007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F003F3F3F00404040004040400040404000404040003F3F
      00006F6F3000BFBF3F00AFAF6F00202020004040400040404000404040004040
      4000202020008080800080808000404040000000000000000000000000000000
      000000000000606060000000000000000000000000007F7F7F00BFBFBF000000
      00000000000000000000000000004040400060606000C0C0C000DFDFDF00C0C0
      C000000080000000800000008000000000000000000000008000000080000000
      0000C0C0C000A0A0A00080808000404040004040400000000000FF7F7F00FF7F
      7F00FF7F7F00FF7F7F00FF7F7F00FFBFBF007F7F7F00BF7F7F00FF7F7F00FF7F
      7F00FF7F7F00BF7FBF007F7F7F0040404000005F5F0030AFAF0030AFAF003050
      5000BFBF3F00EFEF6F003050500060A0A00030AFAF0030AFAF00005F5F00B0B0
      B000B0B0B000C0C0C000C0C0C000404040000000000000000000000000000000
      000000000000606060000000000000000000BFBFBF0060606000606060006060
      60006060600090909000000000004040400060606000C0C0C000DFDFDF00C0C0
      C00000000000000080000000800000008000000080000000800000000000C0C0
      C000C0C0C000A0A0A00080808000404040004040400000000000FF7F7F00FF7F
      7F00FF7F7F00FF7F7F00FF7F7F00FFBFBF007F7F7F00BF7F7F00FF7F7F00FF7F
      7F00BF7FBF00BF7FBF007F7F7F00404040003F3F3F003F7F7F003F7F7F003F7F
      7F007F7F3F006F6F30003F5F5F003F7F7F003F7F7F003F7F7F003F3F3F007F7F
      7F00AFAFAF00B0B0B000C0C0C000404040000000000000000000000000000000
      00000000000030303000606060006060600030303000BFBFBF00A0A0A000A0A0
      A0009090900060606000000000004040400060606000C0C0C000DFDFDF00C0C0
      C000000000006F6F6F0000008000000080000000800000000000C0C0C000C0C0
      C000C0C0C000A0A0A00080808000404040004040400000000000FF7F7F00FF7F
      7F00FF7F7F00FF7F7F0000000000BFBFBF005F5F5F004040BF00BF7FBF00BF7F
      BF003F00BF00FFBFBF007F7F7F00404040000000000000000000000000007F7F
      3F00AFAF30009F9F60006F6F6F00606060000000000000000000000000000000
      000040404000DFDFDF00C0C0C000404040000000000000000000000000000000
      0000000000006060600000000000000000007F7F7F007F7F7F00BFBFBF00DFDF
      DF00BFBFBF006F6F6F00000000004040400060606000C0C0C000DFDFDF00C0C0
      C00000000000000080000000800000008000000080000000800000000000C0C0
      C000C0C0C000A0A0A00080808000404040004040400000000000000000000000
      000000000000000000009F9F9F006F6F6F005F202000BF3F7F000000FF003F00
      BF00FF7F7F00FFBFBF007F7F7F00404040000000000000000000000000003F3F
      00007F7F3F006F6F300060606000303030000000000000000000000000000000
      0000404040005F5F5F0040404000202020000000000000000000000000000000
      00006060600030303000606060006060600030303000400000007F3F3F007F7F
      7F007F7F7F0000000000000000004040400060606000C0C0C000DFDFDF00C0C0
      C00000008000000080000000800000000000606060000000800000000000C0C0
      C000C0C0C000A0A0A00080808000404040004040400000000000000000000000
      00000000000000000000BFBFBF00AFAFAF00FF7F7F003F3FFF003F00BF003F00
      BF00FF7F7F00FFBFBF007F7F7F00404040000000000000000000000000000000
      00003F3F3F003F3F000060606000000000000000000000000000000000000000
      0000404040005F5F5F0040404000202020003F7F7F006FCFCF006FCFCF006FCF
      CF006FCFCF006FCFCF006FCFCF006FCFCF0030AFAF00303030007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F004040400060606000C0C0C000000080000000
      8000000080000000800000000000C0C0C000C0C0C000C0C0C000000080000000
      800000000000A0A0A00080808000404040002020200040404000404040004040
      4000404040004040400060606000BFBFFF000000FF003F00BF00FF7F7F00FF7F
      7F003F00BF00BFBFFF007F7F7F00404040000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F007FFFFF007FFFFF007FFF
      FF007FFFFF007FFFFF007FFFFF007FFFFF006FCFCF00200000007F0000007F00
      00007F0000007F0000007F000000000000006060600000008000000080000000
      80000000800000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      800000008000000000008080800040404000000000000000000000007F000000
      0000000000000000000040404000BFBFFF00BF3F7F00FF7F7F00FF7F7F00FF7F
      7F00000000004040BF005F5F5F00404040000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F007FFFFF007FFFFF007FFF
      FF007FFFFF007FFFFF007FFFFF007FFFFF006FCFCF0000000000000000000000
      0000000000000000000000000000000000006060600000008000000080000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000008000000080000000000040404000000000000000000000003F000000
      3F0000007F0000003F0040404000000000000000000000000000000000000000
      00009F9F9F006F6F6F0020202000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F00BFFFFF00BFFFFF00BFFF
      FF00BFFFFF007FFFFF007FFFFF007FFFFF006FCFCF0000000000000000000000
      000000000000000000000000000000000000000000009F9F9F00DFDFDF00DFDF
      DF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDF
      DF00DFDFDF00DFDFDF009F9F9F00000000000000000000000000000000000000
      3F000000BF000000BF0040404000000000000000000000000000000000000000
      0000BFBFBF007070700000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005F3F0000BF7F0000BF7F0000BF7F
      00005F3F3F007F7F7F007F7F7F007F7F7F003F7F7F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000003F000000000020202000404040004040400040404000404040004040
      4000404040000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003F3F00007F7F00007F7F00007F7F
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000404040004040
      4000404040004040400040404000404040004040400040404000404040004040
      4000404040004040400000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000030303000CFCFCF00909090008080
      8000808080008080800080808000808080008080800080808000808080008080
      80008080800090909000A0A0A000202020000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000060606000EFEFEF00CFCFCF009090
      9000808080008080800080808000808080008080800080808000808080008080
      800090909000A0A0A000A0A0A000505050000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000060606000C0C0C00000000000CFCF
      CF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000B0B0B000A0A0A00090909000404040000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000060606000C0C0C000DFDFDF00C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000A0A0A00080808000404040000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000060606000C0C0C000DFDFDF00C0C0
      C0007F7F7F00DFDFDF00C0C0C000C0C0C0007F7F7F00DFDFDF00C0C0C000C0C0
      C000C0C0C000A0A0A00080808000404040000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000060606000C0C0C000DFDFDF00C0C0
      C00000000000DFDFDF00C0C0C000C0C0C00000000000DFDFDF00C0C0C000C0C0
      C000C0C0C000A0A0A00080808000404040000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000060606000C0C0C000DFDFDF00C0C0
      C000000000007F7F7F00DFDFDF00C0C0C00000000000DFDFDF00C0C0C000C0C0
      C000C0C0C000A0A0A00080808000404040000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      00000000000000000000000000000000000060606000C0C0C000DFDFDF00C0C0
      C000000000006F6F6F00CFCFCF00CFCFCF0000000000DFDFDF00C0C0C000C0C0
      C000C0C0C000A0A0A00080808000404040000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000060606000C0C0C000DFDFDF00C0C0
      C000000000007F7F7F00AFAFAF006060600000000000DFDFDF00C0C0C000C0C0
      C000C0C0C000A0A0A00080808000404040000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000060606000C0C0C000DFDFDF00C0C0
      C00060606000606060009F9F9F00C0C0C00060606000CFCFCF00C0C0C000C0C0
      C000C0C0C000A0A0A00080808000404040000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000060606000C0C0C000DFDFDF00C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000A0A0A00080808000404040000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000060606000C0C0C00000000000CFCF
      CF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000CFCFCF00CFCFCF0080808000404040000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000060606000EFEFEF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BFBFBF00404040000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009F9F9F00DFDFDF00DFDF
      DF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDF
      DF00DFDFDF00DFDFDF009F9F9F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000008484000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000008484000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000008484000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000BF00
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      840000848400008484000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000080808000BF00
      00000000000000000000000000000000000000000000BF000000BF000000BF00
      0000BF000000BF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      000000848400008484000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000BF0000000000
      0000000000000000000000000000000000000000000000000000BF000000BF00
      0000BF000000BF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000008484000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000BF0000000000
      000000000000000000000000000000000000000000000000000000000000BF00
      0000BF000000BF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000008484000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000BF0000000000
      0000000000000000000000000000000000000000000000000000BF0000000000
      0000BF000000BF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000008484000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000080808000BF00
      000000000000000000000000000000000000BF000000BF000000000000000000
      000000000000BF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000008484000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000BF000000BF000000BF000000BF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60000FFFF0000FFFF0000FFFF00C6C6C600C6C6
      C600000000000000000000000000000000000000000000FFFF00000000000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600848484008484840084848400C6C6C600C6C6
      C60000000000C6C6C600000000000000000000000000FFFFFF0000FFFF000000
      0000008484000084840000848400008484000084840000848400008484000084
      840000848400000000000000000000000000000000000000000000000000C6C6
      C60000000000000000000000000000000000000000000000000000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600000000000000000000FFFF00FFFFFF0000FF
      FF00000000000084840000848400008484000084840000848400008484000084
      8400008484000084840000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000084848400000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C60000000000000000000000000000000000000000000000000000000000C6C6
      C6000000000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000C6C6C60000000000C6C6C6000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C60000000000C6C6C60000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C60000000000000000000000000000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000C6C6C60000000000C6C6C6000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C60000000000000000000000000000000000C6C6C60000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C60000000000000000000000000000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C60000000000000000000000000000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400FFFFFF00C6C6
      C60084848400C6C6C600FFFFFF00C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      840084848400848484008484840084848400848484008484840084848400FFFF
      FF0084848400FFFFFF0084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      00000000000000000000848484008484840084848400FFFFFF00FFFFFF00FFFF
      FF00840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000008484000084840000000000000000000000000000000000C6C6C6000000
      0000008484000000000000000000000000000000000000000000000000008400
      0000FF00000084000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF008400000000000000000000000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000008484000084840000000000000000000000000000000000C6C6C6000000
      0000008484000000000000000000000000000000000000000000000000008400
      000084000000FF0000008400000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008400000000000000000000000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000008484000084840000000000000000000000000000000000000000000000
      0000008484000000000000000000000000000000000000000000000000008400
      0000FF00000084000000FF00000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000000000000000000000000000000000000000000000
      0000008484000084840000848400008484000084840000848400008484000084
      8400008484000000000000000000000000000000000000000000000000008400
      000084000000FF0000008400000000000000FFFFFF00FFFF0000FFFFFF00FFFF
      0000840000000000000000000000000000000000000000000000FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000008484000084840000000000000000000000000000000000000000000000
      0000008484000084840000000000000000000000000000000000000000000084
      8400008484000000000000000000000000000000000000000000000000008400
      0000FF00000084000000FF00000000000000FFFF0000FFFFFF00FFFF0000FFFF
      FF00840000000000000000000000000000000000000000000000FFFFFF000000
      00000000000000000000C6C6C6000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      00000084840000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000008484000000000000000000000000000000000000000000000000008400
      000084000000FF0000008400000000000000FFFFFF00FFFF0000FFFFFF00FFFF
      0000840000000000000000000000000000000000000000000000FFFFFF000000
      00000000000000000000C6C6C6000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      00000084840000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000008484000000000000000000000000000000000000000000000000008400
      0000FF00000084000000FF00000000000000FFFF0000FFFFFF00FFFF0000FFFF
      FF00840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      00000084840000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000008400000084000000840000008400000084000000840000008400
      000084000000000000000000000000000000000000000000000000000000FFFF
      FF000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      00000084840000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000840000008400000084000000840000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000FFFFFF00FFFFFF0084000000840000008400000084000000840000008400
      00008400000084000000FFFFFF00840000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000FFFFFF00FFFFFF0084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000FFFFFF008400
      000084000000840000008400000084000000840000008400000084000000FFFF
      FF00840000000000000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000FFFFFF008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00840000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000FFFFFF008400000000000000000000000000000084000000840000008400
      00008400000084000000FFFFFF00840000008400000084000000840000008400
      0000FFFFFF008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      00008400000084000000840000008400000084000000FFFFFF00840000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000840000000000000000000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000840000000000000084000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000084848400008484008484
      8400008484008484840084000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000840000000000000084000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00840000000000000000848400848484000084
      8400848484000084840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000000000000084000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000084848400008484008484
      8400008484008484840084000000FFFFFF00000000000000000000000000FFFF
      FF00840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00840000000000000000848400848484000084
      8400848484000084840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084000000FFFFFF0084000000000000000000000000000000840000008400
      0000840000008400000084000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000000000000084000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000084848400008484008484
      8400008484008484840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000008400000000000000000000000000000000000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF000000000000000000FFFF
      FF00840000008400000084000000840000000000000000848400848484000084
      8400848484000084840084000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000000000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084000000FFFFFF0084000000000000000000000084848400008484008484
      8400008484008484840000848400848484000084840084848400008484008484
      8400008484000000000000000000000000000000000000000000840000008400
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000008400000000000000000000000000000000848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000000000000000000000000000000000000000000840000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000FFFFFF0000000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400848484000084
      84000000000000FFFF00000000000000000000FFFF0000000000848484000084
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000900000000100010000000000800400000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFBFFDFFFF
      FDBFFFFFDFFBFFFFFDBF0003AAD3F80FFDBFFFFFF6C7C007FDBFFFFFF3178003
      FDBFFFFFF537C001F1BF0003F657E000E1BFFFFFF253E002C1BFFFFFF5B7F005
      C1BFFFFFF3D7F40AC1BFFFFFF7EFFD55E1BFFFFFEFF7FFABF00F0003DFFBFFFF
      FFFFFFFFBFFDFFFFFFFFFFFFFFFFFFFF8001800FC4FFE00000020027C463EF82
      08004023C440EF0204044027C460E80204084000C070EB02020840000000EB9E
      011040000000EB02002040000000E80200404200E0F0EB0200207C00E0E00006
      01207C00E1E0000002080000F3FF00000404DC08FFFF003F1FF2C1F1FFFF003F
      0000E1F3FFFF003F8001F407FFFF07FFFFFFFFFFFFFF8001C001FFFFFFFF0000
      8031FFFFFFFF00008031FFFFFFFF20008031FC7FFFFF00008001FC7FFFFF0000
      8001FC7FFFFF00008001E00FE00F00008FF1E00FE00F00008FF1E00FE00F0000
      8FF1FC7FFFFF00008FF1FC7FFFFF00008FF1FC7FFFFF20008FF5FFFFFFFF3FFC
      8001FFFFFFFF0000FFFFFFFFFFFF8001FFFFFFFFFFFFFFFFC001FFFFFFFFFFFF
      8031C007FFFFC0008031C007FFFFFFFF8031C007FFFFC0008001C007E7FFFFFF
      8001C007CF83C0008001C007DFC3FFFF8FF1C007DFE3C0008FF1C007DFD3FFFF
      8FF1C007CF3BC0008FF1C007E0FFFFFF8FF1C00FFFFFC0008FF5C01FFFFFFFFF
      8001C03FFFFFFFFFFFFFFFFFFFFFFFFFFFFFB6E7FFFFFFFFFE49B76BC007FFFF
      FE4984278003001FFFFFB76B0001000FFFFFCEE700010007C7C7FFFF00010003
      C7C7C7C700000001C387C7C700000000C007C3878000001FC007C007C000001F
      C007C007E001001FC007C007E0078FF1C007C007F007FFF9F39FC007F003FF75
      F39FF39FF803FF8FF39FF39FFFFFFFFFFFFFFF7E0000FFFFC001BFFF0000FFFF
      8031F003000007C18031E003E00707C18031E003E00707C18001E003E0070101
      8001E003E007000180012003E00700018FF1E002E00700018FF1E003E0078003
      8FF1E003E007C1078FF1E003FFFFC1078FF1E003F81FE38F8FF5FFFFF81FE38F
      8001BF7DF81FE38FFFFF7F7EFFFFFFFFFFFFFC00FFFFFFFFFFFFFC0080038003
      EFFDFC0080038003C7FFFC0080038003C3FBE00080038003E3F7E00080038003
      F1E7E00080038003F8CFE00780038003FC1F800780038003FE3F800780038003
      FC1F800780038003F8CF801F80038003E1E7801F80038003C3F3801F80038003
      C7FD801FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9FFFFFFFC00FFFF
      F6CFFE008000FFFFF6B7FE000000FFFFF6B7FE000000FFFFF8B780000000FFF7
      FE8F80000001C1F7FE3F80000003C3FBFF7F80000003C7FBFE3F80010003CBFB
      FEBF80030003DCF7FC9F80070FC3FF0FFDDF807F0003FFFFFDDF80FF8007FFFF
      FDDF81FFF87FFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object JvFormStorage1: TJvFormStorage
    AppStorage = JvAppRegistryStorage1
    AppStoragePath = '%FORM_NAME%\'
    Options = []
    OnSavePlacement = JvFormStorage1SavePlacement
    OnRestorePlacement = JvFormStorage1RestorePlacement
    StoredProps.Strings = (
      'SynEditPrint1.Margins'
      'SynMemoTmp.BookMarkOptions'
      'SynMemoTmp.ActiveLineColor'
      'SynMemoTmp.ExtraLineSpacing'
      'SynMemoTmp.Font'
      'SynMemoTmp.Gutter'
      'SynMemoTmp.Options'
      'SynMemoTmp.RightEdge'
      'SynMemoTmp.RightEdgeColor'
      'SynMemoTmp.WantTabs'
      'SynMemoTmp.WantReturns'
      'SynMemoTmp.TabWidth'
      'SynMemoTmp.InsertCaret'
      'SynMemoTmp.OverwriteCaret'
      'ActionEveryLine.Checked'
      'ActionShowToolbar.Checked'
      'ActionProcessEmptyLines.Checked'
      'ActionIgnoreFileExt.Checked'
      'ActionShowCommInfo.Checked')
    StoredValues = <>
    Left = 252
    Top = 84
  end
  object JvAppRegistryStorage1: TJvAppRegistryStorage
    StorageOptions.BooleanStringTrueValues = 'TRUE, YES, Y'
    StorageOptions.BooleanStringFalseValues = 'FALSE, NO, N'
    Root = 'Software\NotH'
    SubStorages = <>
    Left = 252
    Top = 36
  end
  object SynEditSearch: TSynEditSearch
    Left = 20
    Top = 36
  end
  object SynEditOptionsDialog1: TSynEditOptionsDialog
    UseExtendedStrings = False
    Left = 20
    Top = 80
  end
  object SynEditPrint1: TSynEditPrint
    Copies = 1
    Header.DefaultFont.Charset = DEFAULT_CHARSET
    Header.DefaultFont.Color = clBlack
    Header.DefaultFont.Height = -13
    Header.DefaultFont.Name = 'Arial'
    Header.DefaultFont.Style = []
    Footer.DefaultFont.Charset = DEFAULT_CHARSET
    Footer.DefaultFont.Color = clBlack
    Footer.DefaultFont.Height = -13
    Footer.DefaultFont.Name = 'Arial'
    Footer.DefaultFont.Style = []
    Margins.Left = 25.000000000000000000
    Margins.Right = 15.000000000000000000
    Margins.Top = 25.000000000000000000
    Margins.Bottom = 25.000000000000000000
    Margins.Header = 15.000000000000000000
    Margins.Footer = 15.000000000000000000
    Margins.LeftHFTextIndent = 2.000000000000000000
    Margins.RightHFTextIndent = 2.000000000000000000
    Margins.HFInternalMargin = 0.500000000000000000
    Margins.MirrorMargins = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Colors = True
    LineNumbers = True
    LineNumbersInMargin = True
    TabWidth = 8
    Color = clWhite
    Left = 112
    Top = 80
  end
  object PageSetupDialog1: TPageSetupDialog
    MinMarginLeft = 0
    MinMarginTop = 0
    MinMarginRight = 0
    MinMarginBottom = 0
    MarginLeft = 2500
    MarginTop = 2500
    MarginRight = 2500
    MarginBottom = 2500
    PageWidth = 21000
    PageHeight = 29700
    Units = pmMillimeters
    Left = 112
    Top = 128
  end
  object SynExporterHTML1: TSynExporterHTML
    Color = clWindow
    DefaultFilter = 'Dokumenty HTML (*.htm;*.html)|*.htm;*.html'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    Title = 'Dokument'
    UseBackground = False
    Left = 20
    Top = 132
  end
  object SynExporterRTF1: TSynExporterRTF
    Color = clWindow
    DefaultFilter = 'Dokumenty RTF (*.rtf)|*.rtf'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    Title = 'Dokument'
    UseBackground = False
    Left = 20
    Top = 180
  end
  object SynEditRegexSearch: TSynEditRegexSearch
    Left = 96
    Top = 36
  end
  object JvMRUManager1: TJvMRUManager
    Duplicates = dupIgnore
    IniStorage = JvFormStorage1
    RecentMenu = Ostatniootwierane1
    OnClick = JvMRUManager1Click
    Left = 380
    Top = 124
  end
  object JvDockServer1: TJvDockServer
    LeftSplitterStyle.Cursor = crHSplit
    LeftSplitterStyle.ParentColor = False
    LeftSplitterStyle.ResizeStyle = rsUpdate
    RightSplitterStyle.Cursor = crHSplit
    RightSplitterStyle.ParentColor = False
    RightSplitterStyle.ResizeStyle = rsUpdate
    TopSplitterStyle.Cursor = crVSplit
    TopSplitterStyle.ParentColor = False
    TopSplitterStyle.ResizeStyle = rsUpdate
    BottomSplitterStyle.Cursor = crVSplit
    BottomSplitterStyle.ParentColor = False
    BottomSplitterStyle.ResizeStyle = rsUpdate
    DockStyle = JvDockVSNetStyle1
    Left = 420
    Top = 244
  end
  object JvDockVSNetStyle1: TJvDockVSNetStyle
    AlwaysShowGrabber = False
    ConjoinServerOption.GrabbersSize = 20
    ConjoinServerOption.ActiveFont.Charset = DEFAULT_CHARSET
    ConjoinServerOption.ActiveFont.Color = clCaptionText
    ConjoinServerOption.ActiveFont.Height = -12
    ConjoinServerOption.ActiveFont.Name = 'Segoe UI'
    ConjoinServerOption.ActiveFont.Style = []
    ConjoinServerOption.InactiveFont.Charset = DEFAULT_CHARSET
    ConjoinServerOption.InactiveFont.Color = clInactiveCaptionText
    ConjoinServerOption.InactiveFont.Height = -12
    ConjoinServerOption.InactiveFont.Name = 'Segoe UI'
    ConjoinServerOption.InactiveFont.Style = []
    ConjoinServerOption.ActiveTitleStartColor = clActiveCaption
    ConjoinServerOption.ActiveTitleEndColor = clGradientActiveCaption
    ConjoinServerOption.ActiveTitleVerticalGradient = True
    ConjoinServerOption.InactiveTitleStartColor = clInactiveCaption
    ConjoinServerOption.InactiveTitleEndColor = clGradientInactiveCaption
    ConjoinServerOption.InactiveTitleVerticalGradient = True
    ConjoinServerOption.SystemInfo = False
    TabServerOption.HotTrack = True
    TabServerOption.InactiveSheetColor = clWindow
    TabServerOption.ActiveFont.Charset = DEFAULT_CHARSET
    TabServerOption.ActiveFont.Color = clWindowText
    TabServerOption.ActiveFont.Height = -11
    TabServerOption.ActiveFont.Name = 'Arial'
    TabServerOption.ActiveFont.Style = []
    TabServerOption.InactiveFont.Charset = DEFAULT_CHARSET
    TabServerOption.InactiveFont.Color = 5395794
    TabServerOption.InactiveFont.Height = -11
    TabServerOption.InactiveFont.Name = 'Arial'
    TabServerOption.InactiveFont.Style = []
    TabServerOption.ShowCloseButtonOnTabs = True
    Left = 420
    Top = 192
  end
  object JvBalloonHint1: TJvBalloonHint
    DefaultHeader = 'NotH'
    UseBalloonAsApplicationHint = True
    Left = 568
    Top = 32
  end
  object ApplicationEvents1: TApplicationEvents
    Left = 252
    Top = 140
  end
  object ColorDialog1: TColorDialog
    Options = [cdFullOpen]
    Left = 508
    Top = 152
  end
  object MainMenu1: TMainMenu
    Images = ImageList2
    Left = 380
    Top = 36
    object Plik1: TMenuItem
      Caption = 'Plik'
      OnClick = Plik1Click
      object Nowy1: TMenuItem
        Action = FileNew1
      end
      object Otwrz1: TMenuItem
        Action = FileOpen1
      end
      object Zapisz1: TMenuItem
        Action = FileSave1
      end
      object Zapiszjako1: TMenuItem
        Action = FileSaveAs1
      end
      object Zamknij1: TMenuItem
        Action = WindowClose1
      end
      object Ostatniootwierane1: TMenuItem
        Caption = 'Ostatnio otwierane pliki'
        Enabled = False
      end
      object N10: TMenuItem
        Caption = '-'
      end
      object Zobaczwprzegldarce1: TMenuItem
        Action = ActionPreviewWeb
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Ustawieniastrony1: TMenuItem
        Action = PageDlg1
      end
      object Ustawieniamarginesw1: TMenuItem
        Action = SettingsMargins
      end
      object Ustawieniadrukarki1: TMenuItem
        Action = FilePrintSetup1
      end
      object Drukuj1: TMenuItem
        Action = PrintDlg1
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Koniec1: TMenuItem
        Action = FileExit1
      end
    end
    object Edycja1: TMenuItem
      Caption = 'Edycja'
      OnClick = Edycja1Click
      object Cofnij1: TMenuItem
        Action = EditUndo1
      end
      object Ponw1: TMenuItem
        Action = EditRedo1
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Wytnij1: TMenuItem
        Action = EditCut1
      end
      object Kopiuj1: TMenuItem
        Action = EditCopy1
      end
      object Wklej1: TMenuItem
        Action = EditPaste1
      end
      object Usu1: TMenuItem
        Action = EditDelete1
      end
      object Usuznaczniki1: TMenuItem
        Action = ActionHTMLDelPairTags
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Zaznaczenie1: TMenuItem
        Caption = 'Zaznaczenie'
        object ZaznacznastpnytagHTML1: TMenuItem
          Action = ActionHTMLSelNextTag
        end
        object ZaznaczpoprzednitagHTML1: TMenuItem
          Action = ActionHTMLSelPrevTag
        end
        object Przeczpocztkowykocowy1: TMenuItem
          Action = ActionSwitch
        end
        object ZaznaczograniczonyznacznikiemblokHTML1: TMenuItem
          Action = ActionHTMLSelectBlock
        end
        object ZaznacznadrzdnyznacznikXHTML1: TMenuItem
          Action = ActionHTMLSelUpTag
        end
        object Wrdopoprzedniegozaznaczenia1: TMenuItem
          Action = ActionUndoSelBlock
        end
      end
      object ZaznaczWszystko1: TMenuItem
        Action = EditSelectAll1
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object Znajd1: TMenuItem
        Action = actSearch
      end
      object Znajdnastpny1: TMenuItem
        Action = actSearchNext
      end
      object Znajdpoprzedni1: TMenuItem
        Action = actSearchPrev
      end
      object Zamie1: TMenuItem
        Action = actSearchReplace
      end
      object N13: TMenuItem
        Caption = '-'
      end
      object CytujHTML1: TMenuItem
        Action = ActionCitation
      end
      object DecytujHTML1: TMenuItem
        Action = ActionDecitation
      end
      object N15: TMenuItem
        Caption = '-'
      end
      object Akapitywlinie1: TMenuItem
        Action = ActionParagraphsToLines
      end
      object Inneoperacje1: TMenuItem
        Caption = 'Inne operacje'
        object Sortujlinie1: TMenuItem
          Action = ActionSort
        end
      end
    end
    object Widok1: TMenuItem
      Caption = 'Widok'
      object Pokapaseknarzdzi1: TMenuItem
        Action = ActionShowToolbar
        AutoCheck = True
      end
      object N12: TMenuItem
        Caption = '-'
      end
      object Okienkanarzdziowe1: TMenuItem
        Caption = 'Okienka narz'#281'dziowe'
        object Paletaszablonw1: TMenuItem
          Action = ActionViewCommandBox
        end
        object Pokalistplikw1: TMenuItem
          Action = ActionViewFileBox
        end
      end
      object Przeczedytorszablony1: TMenuItem
        Action = ActionChangeFocus
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object Rozwiwszystko1: TMenuItem
        Action = ActionCommandsExpand
      end
      object Zwiwszystko1: TMenuItem
        Action = ActionCommandsCollapse
      end
      object Pokazujtreszablonu1: TMenuItem
        Action = ActionShowCommInfo
        AutoCheck = True
      end
      object N11: TMenuItem
        Caption = '-'
      end
      object Pokawszystkiekomendy1: TMenuItem
        Action = ActionShowAllCommands
        AutoCheck = True
      end
      object Pokatylkokomendyzeskrtami1: TMenuItem
        Action = ActionShowCmdWithShortcut
        AutoCheck = True
      end
      object Pokatylkokomendybezskrtw1: TMenuItem
        Action = ActionShowCmdWithoutShortcut
        AutoCheck = True
      end
      object Pokazujcszablonyignorujrozszerzeniepliku1: TMenuItem
        Action = ActionIgnoreFileExt
        AutoCheck = True
      end
      object N14: TMenuItem
        Caption = '-'
      end
      object Ustawieniawersjijzykw1: TMenuItem
        Action = ActionShowVersionForm
      end
    end
    object Format1: TMenuItem
      Caption = 'Kodowanie'
      object UTF81: TMenuItem
        Action = ActionUTF8
      end
      object ISO885921: TMenuItem
        Action = ActionISO88592
      end
      object WIN12501: TMenuItem
        Action = ActionWIN1250
      end
      object N18: TMenuItem
        Caption = '-'
      end
      object Konieclinii1: TMenuItem
        Caption = 'Koniec linii'
        object DOS1: TMenuItem
          Action = ActionDOS
          AutoCheck = True
        end
        object UNIX1: TMenuItem
          Action = ActionUNIX
        end
        object Mac1: TMenuItem
          Action = ActionMac
        end
        object Unicode1: TMenuItem
          Action = ActionUNICODE
        end
      end
    end
    object Wstaw1: TMenuItem
      Caption = 'Wstaw'
      object ciekadopliku1: TMenuItem
        Action = ActionInsertFileName
      end
      object ciekadoplikuobrazka1: TMenuItem
        Action = ActionInsertPictFileName
      end
    end
    object Opcje1: TMenuItem
      Caption = 'Opcje'
      object Opcjeedytora1: TMenuItem
        Action = SettingsSynMemoOptions
      end
      object Skrtyklawiszowe1: TMenuItem
        Action = SettingsShortCuts
      end
      object Ustawieniakolorw1: TMenuItem
        Action = SettingsColors
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object Stosujoddzielniedokadejliniizaznaczonegotekstu1: TMenuItem
        Action = ActionEveryLine
        AutoCheck = True
      end
      object Przetwarzajpustelinie1: TMenuItem
        Action = ActionProcessEmptyLines
        AutoCheck = True
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object Odwieszablony1: TMenuItem
        Action = ActionReloadCommands
      end
    end
    object Okna1: TMenuItem
      Caption = 'Okna'
      OnClick = Okna1Click
      object Kaskada1: TMenuItem
        Action = WindowCascade1
      end
      object Rozmiewszystkie1: TMenuItem
        Action = WindowTileHorizontal1
      end
      object ileVertically1: TMenuItem
        Action = WindowTileVertical1
      end
      object MinimizeAll1: TMenuItem
        Action = WindowMinimizeAll1
      end
      object N7: TMenuItem
        Caption = '-'
        Enabled = False
      end
    end
    object Oprogramie1: TMenuItem
      Caption = 'Pomoc'
      object Opis1: TMenuItem
        Action = ActionHelpDocs
      end
      object Skrtyklawiszowe2: TMenuItem
        Action = ActionHelpShortcuts
      end
      object N16: TMenuItem
        Caption = '-'
      end
      object Stronadomowaprogramu1: TMenuItem
        Action = ActionHelpHomepage
      end
      object Stronadomowaksiki1: TMenuItem
        Action = ActionHelpBook
      end
      object N17: TMenuItem
        Caption = '-'
      end
      object Oprogramie2: TMenuItem
        Action = ActionHelpAbout
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Images = ImageList2
    MenuAnimation = [maLeftToRight, maRightToLeft, maTopToBottom, maBottomToTop]
    Left = 380
    Top = 76
    object MenuItem1: TMenuItem
      Action = EditCopy1
    end
    object MenuItem2: TMenuItem
      Action = EditCut1
    end
    object MenuItem3: TMenuItem
      Action = EditPaste1
    end
    object MenuItem4: TMenuItem
      Action = EditDelete1
    end
    object MenuItem5: TMenuItem
      Caption = '-'
    end
    object MenuItem6: TMenuItem
      Action = EditSelectAll1
    end
  end
  object SynColorDialog1: TSynColorDialog
    Left = 568
    Top = 152
  end
  object JvTabBarXPPainter1: TJvTabBarXPPainter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    DisabledFont.Charset = DEFAULT_CHARSET
    DisabledFont.Color = clGrayText
    DisabledFont.Height = -11
    DisabledFont.Name = 'Tahoma'
    DisabledFont.Style = []
    SelectedFont.Charset = DEFAULT_CHARSET
    SelectedFont.Color = clWindowText
    SelectedFont.Height = -11
    SelectedFont.Name = 'Tahoma'
    SelectedFont.Style = []
    FixedTabSize = 0
    Left = 436
    Top = 316
  end
  object DropURLTarget1: TDropURLTarget
    DragTypes = [dtCopy, dtLink]
    GetDataOnEnter = True
    OnDrop = DropURLTarget1Drop
    Left = 532
    Top = 264
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 612
    Top = 264
  end
end
