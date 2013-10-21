object AboutBox: TAboutBox
  Left = 200
  Top = 108
  BorderStyle = bsDialog
  Caption = 'O programie'
  ClientHeight = 263
  ClientWidth = 324
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  Scaled = False
  OnCreate = FormCreate
  DesignSize = (
    324
    263)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 307
    Height = 209
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = clWindow
    TabOrder = 0
    object ProgramIcon: TImage
      Left = 8
      Top = 8
      Width = 65
      Height = 54
      Center = True
      Picture.Data = {
        055449636F6E0000010001002020100000000000E80200001600000028000000
        2000000040000000010004000000000080020000000000000000000000000000
        0000000000000000000080000080000000808000800000008000800080800000
        80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
        FFFFFF0000000000000000000000000000000000000000000000000000000000
        0000000000000000000777777777777777770000000000000088888888888888
        88877000000000000FFFFFFFFFFFFFFFFF88700000000000088888888888FFFF
        FFF87000000000000777777777777777777870000000000008888888888888FF
        FFF870000000000008888888888888FFFFF87000000000000777777777777777
        7778700000000000088888888888888FFFF8700000000000000000000008888F
        FFF87000066666666666666666607777777870000E8E8E8E8E8E8E8E8E608888
        FFF8700008E8E8E8E8E8E8E8E8E60888FFF87000008E8E8E8E8E8E8E8E860777
        7778700000E8E8E80008E80008E860888FF87000000E8E8E000E8E000E8E6088
        8FF870000008E8E80008E80008E8E6077778700000008E8E000000000E8E8608
        88F870000000E8E80000000008E8E86088F8700000000E8E000000000E8E8E60
        77787000000008E8000000000E88E8E6088870000000008E000E8E000E8E8E86
        08887000000000E80008E80008E8E8E8608870000000000E000E8E000E8E8E8E
        6088700000000008E8E8E8E8E8E8E8E8E6087000000000008E8E8E8E8E8E8E8E
        8608700000000000E0E808E0E808E0E808600000000000000F00F00F00F00F00
        F000000000000000000000000000000000000000000000000000000000000000
        00000000FFFFFFFFFFE0000FFFC00007FF800003FF000003FF000003FF000003
        FF000003FF000003FF000003FF00000380000003000000030000000300000003
        8000000380000003C0000003C0000003E0000003E0000003F0000003F0000003
        F8000003F8000003FC000003FC000003FE000003FE000007FF00000FFF92493F
        FFFFFFFF}
      IsControl = True
    end
    object ProductName: TLabel
      Left = 88
      Top = 8
      Width = 36
      Height = 16
      Caption = 'NotH'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      IsControl = True
    end
    object Version: TLabel
      Left = 88
      Top = 30
      Width = 167
      Height = 13
      Caption = 'Wersja %s (freeware & opensource)'
      ShowAccelChar = False
      IsControl = True
    end
    object JvLinkLabel1: TJvLinkLabel
      Left = 88
      Top = 49
      Width = 165
      Height = 13
      Caption = '<link>W'#322'odzimierz Gajda</link> & Pawe'#322' Pylak'#13#10
      Text.Strings = (
        '<link>W'#322'odzimierz Gajda</link> & Pawe'#322' Pylak'#13#10)
      LinkColor = clWindowText
      LinkColorHot = clBlue
      LinkStyle = []
      HotLinks = True
      OnLinkClick = JvLinkLabel1LinkClick
    end
    object JvLinkLabel2: TJvLinkLabel
      Left = 8
      Top = 72
      Width = 265
      Height = 78
      Caption = 
        '<b>U'#380'yte pakiety:</b><br>'#13#10'  <link>SynEdit</link><br>'#13#10'  <link>S' +
        'ynWeb</link><br>'#13#10'  <link>JCL</link><br>'#13#10'  <link>JVCL</link><br' +
        '>'#13#10'  <link>Delphi DOM HTML parser and converter</link>'
      Text.Strings = (
        
          '<b>U'#380'yte pakiety:</b><br>'#13#10'  <link>SynEdit</link><br>'#13#10'  <link>S' +
          'ynWeb</link><br>'#13#10'  <link>JCL</link><br>'#13#10'  <link>JVCL</link><br' +
          '>'#13#10'  <link>Delphi DOM HTML parser and converter</link>')
      LinkColor = clWindowText
      LinkColorHot = clBlue
      LinkStyle = []
      HotLinks = True
      OnLinkClick = JvLinkLabel2LinkClick
    end
  end
  object OKButton: TButton
    Left = 125
    Top = 228
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
end
