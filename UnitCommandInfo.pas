unit UnitCommandInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvExControls, JvComponent, JvGradient, StdCtrls,
  ExtCtrls, Math, SynUnicode;

type
  TFormCommandInfo = class(TForm)
    Panel1: TPanel;
    JvGradient1: TJvGradient;
    TntLabel1: TLabel;
    Timer: TTimer;
    procedure TimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FInc: Integer;
    af: TForm;
    function GetText: string;
    procedure SetText(const Value: string);
  protected
    //procedure CreateParams(var Params: TCreateParams); override;
  public
    { Public declarations }
    MaxBV: Byte;
    property Text: string read GetText write SetText;
    procedure Appear;
    procedure Disappear;
    procedure Adjust(ItemRect, SmallItemRect: TRect);
  end;

var
  FormCommandInfo: TFormCommandInfo;

implementation

{$R *.dfm}

{ TFormCommandInfo }

procedure TFormCommandInfo.Appear;
begin
  if not Visible then
  begin
    AlphaBlendValue := 0;
    af := Screen.ActiveForm;
    ShowWindow(Handle, SW_SHOWNOACTIVATE); //Realnie pokazuje okno bez ustawiania focusa
    //SetWindowPos(Handle, HWND_TOP, 0, 0, 0, 0, SWP_NOACTIVATE	or SWP_NOMOVE	or SWP_NOSIZE);
    Visible := True; //Ustawia w³aœciwoœci i pokazuje kontrolki nie windowsowe na oknie
    FInc := 5;
    Timer.Enabled := True;
  end;
end;

procedure TFormCommandInfo.Disappear;
begin
  if Visible then
  begin
    FInc := -5;
    Timer.Enabled := True;
  end;
  af := nil;
end;

procedure TFormCommandInfo.TimerTimer(Sender: TObject);
begin
  if FInc > 0 then
    if AlphaBlendValue >= MaxBV then
      Timer.Enabled := False
    else
      AlphaBlendValue := Min(Integer(AlphaBlendValue) + FInc, 255)
  else
  if FInc < 0 then
    if AlphaBlendValue = 0 then
    begin
      Timer.Enabled := False;
      Visible := False;
    end
    else
      AlphaBlendValue := Max(Integer(AlphaBlendValue) + FInc, 0);
end;

procedure TFormCommandInfo.FormCreate(Sender: TObject);
begin
  MaxBV := 255;
end;

procedure TFormCommandInfo.Adjust(ItemRect, SmallItemRect: TRect);
var
  IsLeft: Boolean;
  MaxWidth: Integer;
  r: TRect;
  s: string;
  cx, cy: Integer;
begin
  s := TntLabel1.Caption;
  r := Rect(0,0,1,1);
  DrawTextW(TntLabel1.Canvas.Handle, PWideChar(s), Length(s), r, DT_CALCRECT	or DT_LEFT or DT_NOPREFIX	or DT_TOP);
  cx := r.Right - r.Left + 4;
  cy := r.Bottom - r.Top + 4;

  IsLeft := ItemRect.Left > (Screen.WorkAreaWidth - ItemRect.Right);
  if IsLeft then
    MaxWidth := ItemRect.Left - Screen.WorkAreaLeft
  else
    MaxWidth := Screen.WorkAreaRect.Right - ItemRect.Right;
  if cx div 2 > MaxWidth then
  begin
    ItemRect := SmallItemRect;
    IsLeft := ItemRect.Left > (Screen.WorkAreaWidth - ItemRect.Right);
    if IsLeft then
      MaxWidth := ItemRect.Left - Screen.WorkAreaLeft
    else
      MaxWidth := Screen.WorkAreaRect.Right - ItemRect.Right;
  end;

  cx := Min(cx, MaxWidth);
  cy := Min(cy, Screen.WorkAreaHeight);
  if IsLeft then
    r.Left := ItemRect.Left - cx
  else
    r.Left := ItemRect.Right;
  r.Right := r.Left + cx;
  r.Top := Min(ItemRect.Top, Screen.WorkAreaRect.Bottom - cy);
  r.Bottom := r.Top + cy;
  BoundsRect := r;
end;

function TFormCommandInfo.GetText: string;
begin
  Result := TntLabel1.Caption;
end;

procedure TFormCommandInfo.SetText(const Value: string);
begin
  TntLabel1.Caption := Value;
end;

{procedure TFormCommandInfo.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
  begin
    Style := WS_POPUP or WS_BORDER;
    WindowClass.Style := WindowClass.Style or CS_SAVEBITS;
    if NewStyleControls then ExStyle := WS_EX_TOOLWINDOW;
    AddBiDiModeExStyle(ExStyle);
  end;
end;}

end.
