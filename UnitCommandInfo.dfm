object FormCommandInfo: TFormCommandInfo
  Left = 247
  Top = 110
  AlphaBlend = True
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Informacja o komendzie'
  ClientHeight = 238
  ClientWidth = 338
  Color = clBtnFace
  Enabled = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 338
    Height = 238
    Align = alClient
    BevelInner = bvLowered
    Enabled = False
    TabOrder = 0
    object JvGradient1: TJvGradient
      Left = 2
      Top = 2
      Width = 334
      Height = 234
      Style = grVertical
      StartColor = clWindow
      EndColor = clInfoBk
    end
    object TntLabel1: TLabel
      Left = 2
      Top = 2
      Width = 334
      Height = 234
      Align = alClient
      Caption = 'Label1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      Transparent = True
      ExplicitWidth = 42
      ExplicitHeight = 14
    end
  end
  object Timer: TTimer
    Interval = 5
    OnTimer = TimerTimer
    Left = 200
    Top = 44
  end
end
