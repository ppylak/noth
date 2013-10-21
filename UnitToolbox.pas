unit UnitToolbox;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvComponentBase, JvDockControlForm;

type
  TFormToolbox = class(TForm)
    JvDockClient1: TJvDockClient;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormToolbox: TFormToolbox;

implementation

uses UMain;

{$R *.dfm}

end.
