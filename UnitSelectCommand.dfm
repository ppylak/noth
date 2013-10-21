object FormSelectCommand: TFormSelectCommand
  Left = 247
  Top = 110
  BorderIcons = []
  Caption = 'Wybierz szablon'
  ClientHeight = 308
  ClientWidth = 331
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 266
    Width = 331
    Height = 42
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 260
    DesignSize = (
      331
      42)
    object BitBtn1: TBitBtn
      Left = 164
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      DoubleBuffered = True
      Kind = bkOK
      ParentDoubleBuffered = False
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 248
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Anuluj'
      DoubleBuffered = True
      Kind = bkCancel
      ParentDoubleBuffered = False
      TabOrder = 1
    end
  end
  object TntListBox1: TListBox
    Left = 0
    Top = 0
    Width = 331
    Height = 266
    Align = alClient
    ItemHeight = 13
    TabOrder = 0
    OnDblClick = TntListBox1DblClick
  end
  object JvFormStorage1: TJvFormStorage
    AppStorage = NotHMainForm.JvAppRegistryStorage1
    AppStoragePath = '%FORM_NAME%\'
    StoredValues = <>
    Left = 252
    Top = 84
  end
end
