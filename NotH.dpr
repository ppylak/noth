program NotH;

uses
  Forms,
  Windows,
  UMain in 'UMain.pas' {NotHMainForm},
  UChild in 'UChild.pas' {FChild},
  UAbout in 'UAbout.pas' {AboutBox},
  UnitCharsets in 'UnitCharsets.pas',
  dlgConfirmReplace in 'dlgConfirmReplace.pas' {ConfirmReplaceDialog},
  dlgReplaceText in 'dlgReplaceText.pas',
  dlgSearchText in 'dlgSearchText.pas' {TextSearchDialog},
  UnitCommands in 'UnitCommands.pas',
  UnitCommandBox in 'UnitCommandBox.pas' {FormCommandBox},
  UnitSelectCommand in 'UnitSelectCommand.pas' {FormSelectCommand},
  UnitToolbox in 'UnitToolbox.pas' {FormToolbox},
  UnitFileBox in 'UnitFileBox.pas' {FormFileBox},
  UnitVersions in 'UnitVersions.pas' {FormVersions},
  UnitDMHighlighters in 'UnitDMHighlighters.pas' {DMHighlighters: TDataModule},
  UnitCommandInfo in 'UnitCommandInfo.pas' {FormCommandInfo},
  UnitHighlighterProcs in 'UnitHighlighterProcs.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'NotH';
  Application.ShowMainForm := CheckSingleInstance();
  if Application.ShowMainForm then
  begin
    Application.CreateForm(TDMHighlighters, DMHighlighters);
    Application.CreateForm(TNotHMainForm, NotHMainForm);
    Application.CreateForm(TFormCommandBox, FormCommandBox);
    Application.CreateForm(TFormSelectCommand, FormSelectCommand);
    Application.CreateForm(TFormFileBox, FormFileBox);
    Application.CreateForm(TFormVersions, FormVersions);
    Application.CreateForm(TFormCommandInfo, FormCommandInfo);
    Application.Run;
  end
  else
    Application.Terminate;
end.
