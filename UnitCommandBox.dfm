inherited FormCommandBox: TFormCommandBox
  Left = 247
  Top = 110
  Caption = 'Szablony'
  ClientHeight = 416
  ClientWidth = 231
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  ExplicitWidth = 239
  ExplicitHeight = 444
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl [0]
    Left = 0
    Top = 24
    Width = 231
    Height = 392
    Align = alClient
    MultiLine = True
    TabOrder = 0
    ExplicitHeight = 386
  end
  object ToolBar1: TToolBar [1]
    Left = 0
    Top = 0
    Width = 231
    Height = 24
    AutoSize = True
    Caption = 'ToolBar1'
    Images = NotHMainForm.ImageList2
    TabOrder = 1
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Action = NotHMainForm.ActionCommandsExpand
    end
    object ToolButton2: TToolButton
      Left = 23
      Top = 0
      Action = NotHMainForm.ActionCommandsCollapse
    end
    object ToolButton3: TToolButton
      Left = 46
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 54
      Top = 0
      Action = NotHMainForm.ActionShowAllCommands
    end
    object ToolButton5: TToolButton
      Left = 77
      Top = 0
      Action = NotHMainForm.ActionShowCmdWithShortcut
    end
    object ToolButton6: TToolButton
      Left = 100
      Top = 0
      Action = NotHMainForm.ActionShowCmdWithoutShortcut
    end
  end
  inherited JvDockClient1: TJvDockClient
    Left = 48
    Top = 40
  end
end
