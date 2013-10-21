unit UnitFileBox;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitToolbox, ComCtrls, JvComponentBase,
  JvDockControlForm, UChild;

type
  TFormFileBox = class(TFormToolbox)
    TreeView1: TTreeView;
    procedure TreeView1KeyPress(Sender: TObject; var Key: Char);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure TreeView1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }

    type
      TFileBoxCSListener = class(TChildStateListener)
      private
        FormFileBox: TFormFileBox;
      protected
        procedure InternalRegisterFChild(FChild: TFChild; Param: TObject); override;
        procedure InternalFChildActivated(FChild: TFChild; Param: TObject); override;
        procedure InternalFChildClosed(FChild: TFChild; Param: TObject); override;
        procedure InternalFChildChangingFileName(FChild: TFChild; Param: TObject); override;
      public
        constructor Create(AFormFileBox: TFormFileBox);
      end;

  private
    FChildListener: TFileBoxCSListener;
  public
    { Public declarations }
    property ChildListener: TFileBoxCSListener read FChildListener;
    function CreateFileNode(AFileName: string): TTreeNode;
  end;

var
  FormFileBox: TFormFileBox;

implementation

uses UMain;

{$R *.dfm}

function TFormFileBox.CreateFileNode(AFileName: string): TTreeNode;
var ParentNode: TTreeNode;
begin
  ParentNode := TreeView1.Items.GetFirstNode;
  Result := TreeView1.Items.AddChild(ParentNode, AFileName) as TTreeNode;
  Result.ImageIndex := -1;
  Result.SelectedIndex := -1;
  if ParentNode <> nil then
    ParentNode.Expand(False);
end;

procedure TFormFileBox.TreeView1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
    if (TreeView1.Selected <> nil) and (TreeView1.Selected.Data <> nil) then
      TForm(TreeView1.Selected.Data).Show;
end;

procedure TFormFileBox.FormCreate(Sender: TObject);
begin
  inherited;
  FChildListener := TFileBoxCSListener.Create(Self);
end;

procedure TFormFileBox.FormDestroy(Sender: TObject);
begin
  inherited;
  FChildListener.Free;
end;

procedure TFormFileBox.TreeView1Change(Sender: TObject;
  Node: TTreeNode);
begin
  inherited;
  //if (Node <> nil) and (Node.Data <> nil) then
  //  PostMessage(NotHMainForm.ClientHandle, WM_MDIACTIVATE, TForm(Node.Data).Handle, 0);
end;

procedure TFormFileBox.TreeView1DblClick(Sender: TObject);
begin
  inherited;
  if (TreeView1.Selected <> nil) and (TreeView1.Selected.Data <> nil) then
    with TForm(TreeView1.Selected.Data) do
    begin
      if WindowState = wsMinimized then
        WindowState := wsNormal;
      Show;
    end;
end;

{ TFormFileBox.TChildListener }

constructor TFormFileBox.TFileBoxCSListener.Create(AFormFileBox: TFormFileBox);
begin
  inherited Create;
  FormFileBox := AFormFileBox;
end;

procedure TFormFileBox.TFileBoxCSListener.InternalFChildActivated(FChild: TFChild;
  Param: TObject);
begin
  if Param is TTreeNode then
    TTreeNode(Param).Selected := True;
end;

procedure TFormFileBox.TFileBoxCSListener.InternalFChildChangingFileName(FChild: TFChild;
  Param: TObject);
begin
  if Param is TTreeNode then
    TTreeNode(Param).Text := FChild.FileName;
end;

procedure TFormFileBox.TFileBoxCSListener.InternalFChildClosed(FChild: TFChild;
  Param: TObject);
begin
  if Param is TTreeNode then
    TTreeNode(Param).Delete;
end;

procedure TFormFileBox.TFileBoxCSListener.InternalRegisterFChild(FChild: TFChild;
  Param: TObject);
begin
  if Param is TTreeNode then
    TTreeNode(Param).Data := FChild;
end;

end.
