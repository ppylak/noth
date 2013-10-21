inherited FormFileBox: TFormFileBox
  Caption = 'Pliki'
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object TreeView1: TTreeView [0]
    Left = 0
    Top = 0
    Width = 242
    Height = 406
    Align = alClient
    HideSelection = False
    Indent = 19
    ReadOnly = True
    SortType = stText
    TabOrder = 0
    OnChange = TreeView1Change
    OnDblClick = TreeView1DblClick
    OnKeyPress = TreeView1KeyPress
    Items.NodeData = {
      0301000000280000001B0000001B000000FFFFFFFFFFFFFFFF00000000000000
      0000000000010550006C0069006B006900}
  end
end
