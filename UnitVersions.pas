unit UnitVersions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, JvComponentBase,
  JvFormPlacement, SynHighlighterWebData;

type
  TFormVersions = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    RGHtml: TRadioGroup;
    RGCss: TRadioGroup;
    RGPhp: TRadioGroup;
    TabSheet4: TTabSheet;
    RGWml: TRadioGroup;
    JvFormStorage1: TJvFormStorage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RGHtmlClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormVersions: TFormVersions;

implementation

uses UMain, UnitDMHighlighters;

{$R *.dfm}

function UpperFirstWord(s: string): string;
var n: Integer;
begin
  n := Pos(' ', s);
  if n > 0 then
    Result := AnsiUpperCase(Copy(s, 1, n-1)) + Copy(s, n, Length(s))
  else
    Result := s;
end;

procedure TFormVersions.FormCreate(Sender: TObject);
var ih: TSynWebHtmlVersion;
    iw: TSynWebWMLVersion;
    ip: TSynWebPHPVersion;
    ic: TSynWebCssVersion;
begin
  for ih := Low(TSynWebHtmlVersion) to High(TSynWebHtmlVersion) do
    RGHtml.Items.Add(UpperFirstWord(TSynWebHtmlVersionStr[ih]));

  for iw := Low(TSynWebWMLVersion) to High(TSynWebWMLVersion) do
    RGWml.Items.Add(UpperFirstWord(TSynWebWMLVersionStr[iw]));

  for ip := Low(TSynWebPHPVersion) to High(TSynWebPHPVersion) do
    RGPhp.Items.Add(UpperFirstWord(TSynWebPhpVersionStr[ip]));

  for ic := Low(TSynWebCssVersion) to High(TSynWebCssVersion) do
    RGCss.Items.Add(UpperFirstWord(TSynWebCssVersionStr[ic]));
end;

procedure TFormVersions.FormShow(Sender: TObject);
begin
  RGHtml.ItemIndex := Ord(DMHighlighters.SynWebEngine1.Options.HtmlVersion);
  RGWml.ItemIndex := Ord(DMHighlighters.SynWebEngine1.Options.WmlVersion);
  RGPhp.ItemIndex := Ord(DMHighlighters.SynWebEngine1.Options.PhpVersion);
  RGCss.ItemIndex := Ord(DMHighlighters.SynWebEngine1.Options.CssVersion);
end;

procedure TFormVersions.RGHtmlClick(Sender: TObject);
begin
  DMHighlighters.SynWebEngine1.Options.HtmlVersion := TSynWebHtmlVersion(RGHtml.ItemIndex);
  DMHighlighters.SynWebEngine1.Options.WmlVersion := TSynWebWMLVersion(RGWml.ItemIndex);
  DMHighlighters.SynWebEngine1.Options.PhpVersion := TSynWebPhpVersion(RGPhp.ItemIndex);
  DMHighlighters.SynWebEngine1.Options.CssVersion := TSynWebCssVersion(RGCss.ItemIndex);
end;

end.
