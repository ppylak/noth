object FChild: TFChild
  Left = 549
  Top = 186
  ClientHeight = 408
  ClientWidth = 623
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Position = poDefault
  Scaled = False
  ShowHint = True
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnDeactivate = SynMemoExit
  OnShow = FormShow
  DesignSize = (
    623
    408)
  PixelsPerInch = 96
  TextHeight = 13
  object SynMemo: TSynMemo
    Left = 0
    Top = 0
    Width = 623
    Height = 389
    Align = alClient
    ActiveLineColor = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    PopupMenu = NotHMainForm.PopupMenu1
    TabOrder = 0
    OnExit = SynMemoExit
    OnKeyDown = SynMemoKeyDown
    OnKeyPress = SynMemoKeyPress
    OnMouseMove = SynMemoMouseMove
    BookMarkOptions.DrawBookmarksFirst = False
    BookMarkOptions.EnableKeys = False
    BookMarkOptions.GlyphsVisible = False
    BookMarkOptions.Xoffset = 0
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
    WantTabs = True
    WordWrapGlyph.Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33333333333333333333333333333333333333FF333333333333300333333333
      33333773FF33333333333090033333333333373773FF33333333330990033333
      3333337F3773FF33333333099990033333333373F33773FFF333333099999007
      33333337F33337773333333099999903333333373F3333733333333309999033
      333333337F3337F333333333099990733333333373F3F77F3333333330900907
      3333333337F77F77F33333333003709073333333377377F77F33333337333709
      073333333733377F77F33333333333709033333333333377F7F3333333333337
      0733333333333337773333333333333333333333333333333333}
    WordWrapGlyph.MaskColor = clOlive
    OnChange = SynMemoChange
    OnDropFiles = SynMemoDropFiles
    OnReplaceText = SynMemoReplaceText
    OnStatusChange = SynMemoStatusChange
    OnPaintTransient = SynMemoPaintTransient
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 389
    Width = 623
    Height = 19
    Color = clInfoBk
    Panels = <
      item
        Alignment = taCenter
        Width = 30
      end
      item
        Alignment = taCenter
        Width = 100
      end
      item
        Alignment = taCenter
        Width = 100
      end
      item
        Alignment = taCenter
        Width = 100
      end
      item
        Width = 90
      end
      item
        Width = 50
      end>
  end
  object Memo1: TMemo
    Left = 412
    Top = 276
    Width = 193
    Height = 93
    Anchors = [akRight, akBottom]
    TabOrder = 2
    Visible = False
  end
  object SaveDialog1: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 228
    Top = 64
  end
  object ODInsertFileName: TOpenDialog
    Filter = 'Wszystkie pliki (*.*)|*.*'
    Title = 'Wybierz plik'
    Left = 104
    Top = 100
  end
  object OPDInsertFileName: TOpenPictureDialog
    Filter = 
      'Wszystkie (*.png;*.gif;*.jpg;*.jpeg)|*.png;*.gif;*.jpg;*.jpeg|Ob' +
      'razki PNG (*.png)|*.png|Obrazki GIF (*.gif)|*.gif|Obrazki JPEG (' +
      '*.jpg)|*.jpg|Obrazki JPEG (*.jpeg)|*.jpeg|Wszystkie pliki (*.*)|' +
      '*.*'
    Title = 'Wybierz plik obrazka'
    Left = 104
    Top = 148
  end
  object SynCompletionProposal: TSynCompletionProposal
    Options = [scoLimitToMatchedText, scoUseInsertList, scoUsePrettyText, scoEndCharCompletion, scoCompleteWithTab, scoCompleteWithEnter]
    Width = 340
    EndOfTokenChr = ';>()[] .'
    TriggerChars = '.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBtnText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        BiggestWord = 's'#322'owo kluczowe'
      end>
    OnExecute = SynCompletionProposalExecute
    ShortCut = 16416
    Editor = SynMemo
    TimerInterval = -1
    OnAfterCodeCompletion = SynCompletionProposalAfterCodeCompletion
    Left = 328
    Top = 36
  end
  object SynURIOpener1: TSynURIOpener
    Editor = SynMemo
    URIHighlighter = DMHighlighters.SynURISyn1
    Left = 328
    Top = 88
  end
  object DropTextTarget1: TDropTextTarget
    DragTypes = [dtCopy, dtLink]
    OnDrop = DropTextTarget1Drop
    Target = SynMemo
    Left = 288
    Top = 232
  end
end
