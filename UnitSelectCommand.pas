unit UnitSelectCommand;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, JvComponentBase,
  JvFormPlacement;

type
  TFormSelectCommand = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    TntListBox1: TListBox;
    JvFormStorage1: TJvFormStorage;
    procedure FormShow(Sender: TObject);
    procedure TntListBox1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSelectCommand: TFormSelectCommand;

implementation

uses UMain;

{$R *.dfm}

procedure TFormSelectCommand.FormShow(Sender: TObject);
begin
  TntListBox1.ItemIndex := 0;
end;

procedure TFormSelectCommand.TntListBox1DblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
