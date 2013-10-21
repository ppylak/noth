unit UAbout;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, JvaScrollText, JvExControls, JvComponent, JvScrollText,
  JvLinkLabel, ShellAPI, JclFileUtils;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    OKButton: TButton;
    JvLinkLabel1: TJvLinkLabel;
    JvLinkLabel2: TJvLinkLabel;
    procedure JvLinkLabel1LinkClick(Sender: TObject; LinkNumber: Integer;
      LinkText, LinkParam: String);
    procedure JvLinkLabel2LinkClick(Sender: TObject; LinkNumber: Integer;
      LinkText, LinkParam: String);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation

{$R *.DFM}

procedure TAboutBox.JvLinkLabel1LinkClick(Sender: TObject;
  LinkNumber: Integer; LinkText, LinkParam: String);
begin
  if LinkNumber = 0 then
    ShellExecute(0, 'open', 'http://www.gajdaw.pl', '', '', SW_SHOWNORMAL);
end;

procedure TAboutBox.JvLinkLabel2LinkClick(Sender: TObject;
  LinkNumber: Integer; LinkText, LinkParam: String);
var s: string;
begin
  s := '';
  if LinkText = 'SynEdit' then
    s := 'http://synedit.sourceforge.net/'
  else
  if LinkText = 'UniSynEdit' then
    s := 'http://mh-nexus.de/unisynedit.htm'
  else
  if LinkText = 'SynWeb' then
    s := 'http://flatdev.ovh.org/index.php?project=2'
  else
  if LinkText = 'JCL' then
    s := 'http://homepages.borland.com/jedi/jcl/'
  else
  if LinkText = 'JVCL' then
    s := 'http://homepages.borland.com/jedi/jvcl/'
  else
  if LinkText = 'PNG Image' then
    s := 'http://pngdelphi.sourceforge.net/'
  else
  if LinkText = 'ThemeManager' then
    s := 'http://www.soft-gems.net/index.php?option=com_content&task=view&id=17&Itemid=33'
  else
  if LinkText = 'Delphi DOM HTML parser and converter' then
    s := 'http://htmlp.sourceforge.net';

  if s <> '' then
    ShellExecute(0, 'open', PChar(s), '', '', SW_SHOWNORMAL);
end;

procedure TAboutBox.FormCreate(Sender: TObject);
var
  FixedInfo: TVSFixedFileInfo;
begin
  VersionFixedFileInfo(Application.ExeName, FixedInfo);
  Version.Caption := Format(Version.Caption, [FormatVersionString(FixedInfo)]);
end;

end.
 
