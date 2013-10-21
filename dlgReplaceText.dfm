inherited TextReplaceDialog: TTextReplaceDialog
  Left = 130
  Top = 252
  Caption = 'Zamie'#324' tekst'
  ClientHeight = 210
  OldCreateOrder = True
  ExplicitHeight = 236
  PixelsPerInch = 96
  TextHeight = 13
  inherited Label1: TLabel
    Width = 35
    Caption = '&Szukaj:'
    ExplicitWidth = 35
  end
  object Label2: TLabel [1]
    Left = 8
    Top = 41
    Width = 53
    Height = 13
    Caption = 'Zamie'#324' &na:'
  end
  inherited gbSearchOptions: TGroupBox
    Top = 70
    Width = 157
    TabOrder = 2
    ExplicitTop = 70
    ExplicitWidth = 157
    inherited cbSearchCaseSensitive: TCheckBox
      Width = 145
      ExplicitWidth = 145
    end
  end
  inherited rgSearchDirection: TRadioGroup
    Left = 184
    Top = 70
    Width = 140
    TabOrder = 3
    ExplicitLeft = 184
    ExplicitTop = 70
    ExplicitWidth = 140
  end
  inherited btnOK: TButton
    Top = 179
    TabOrder = 4
    ExplicitTop = 179
  end
  inherited btnCancel: TButton
    Top = 179
    TabOrder = 5
    ExplicitTop = 179
  end
  object cbReplaceText: TComboBox
    Left = 96
    Top = 37
    Width = 228
    Height = 21
    TabOrder = 1
  end
end
