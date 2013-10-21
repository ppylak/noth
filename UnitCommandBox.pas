unit UnitCommandBox;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvDockTree, JvDockControlForm, JvDockVIDStyle, JvDockVSNetStyle,
  JvComponentBase, ComCtrls, ExtCtrls, StdCtrls, ToolWin, UnitToolbox;

type
  TFormCommandBox = class(TFormToolbox)
    PageControl1: TPageControl;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCommandBox: TFormCommandBox = nil;

implementation

uses UMain;

{$R *.dfm}

end.
