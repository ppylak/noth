object FormVersions: TFormVersions
  Left = 247
  Top = 110
  Width = 398
  Height = 399
  Caption = 'Wersje'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 324
    Width = 390
    Height = 41
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      390
      41)
    object BitBtn1: TBitBtn
      Left = 308
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 0
      Kind = bkOK
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 390
    Height = 324
    ActivePage = TabSheet1
    Align = alClient
    TabIndex = 0
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = '&HTML'
      DesignSize = (
        382
        296)
      object RGHtml: TRadioGroup
        Left = 4
        Top = 4
        Width = 373
        Height = 285
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'Wersja HTML'
        TabOrder = 0
        OnClick = RGHtmlClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = '&CSS'
      ImageIndex = 1
      DesignSize = (
        382
        296)
      object RGCss: TRadioGroup
        Left = 4
        Top = 4
        Width = 373
        Height = 285
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'Wersja CSS'
        TabOrder = 0
        OnClick = RGHtmlClick
      end
    end
    object TabSheet3: TTabSheet
      Caption = '&PHP'
      ImageIndex = 2
      DesignSize = (
        382
        296)
      object RGPhp: TRadioGroup
        Left = 4
        Top = 4
        Width = 373
        Height = 285
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'Wersja PHP'
        TabOrder = 0
        OnClick = RGHtmlClick
      end
    end
    object TabSheet4: TTabSheet
      Caption = '&WML'
      ImageIndex = 3
      DesignSize = (
        382
        296)
      object RGWml: TRadioGroup
        Left = 4
        Top = 4
        Width = 373
        Height = 285
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'Wersja WML'
        TabOrder = 0
        OnClick = RGHtmlClick
      end
    end
  end
  object JvFormStorage1: TJvFormStorage
    AppStorage = NotHMainForm.JvAppRegistryStorage1
    AppStoragePath = '%FORM_NAME%\'
    StoredValues = <>
    Left = 252
    Top = 84
  end
end
