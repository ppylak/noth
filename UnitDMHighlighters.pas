unit UnitDMHighlighters;

interface

uses
  SysUtils, Classes,
  SynHighlighterWeb, SynHighlighterUNIXShellScript,
  SynHighlighterDOT, SynHighlighterAsm, SynHighlighterURI,
  SynHighlighterTclTk, SynHighlighterBat, SynHighlighterAWK,
  SynHighlighterPas, SynHighlighterDfm, SynHighlighterVrml97,
  SynHighlighterTeX, SynHighlighterIni, SynHighlighterSQL,
  SynHighlighterPython, SynHighlighterPerl, SynHighlighterXML,
  SynHighlighterVBScript, SynHighlighterJScript, SynHighlighterVB,
  SynHighlighterJava, SynHighlighterCpp, SynEditHighlighter,
  SynHighlighterCS, SynHighlighterGeneral, SynHighlighterInno,
  SynHighlighterFoxpro, SynHighlighterCache, SynHighlighterCAC,
  SynHighlighterRuby, SynHighlighterGWS, SynHighlighterKix, SynHighlighterCobol,
  SynHighlighterM3, SynHighlighterFortran, SynHighlighterEiffel,
  SynHighlighterHC11, SynHighlighterADSP21xx,
  SynHighlighterSDD, SynHighlighterModelica,
  SynHighlighterDml, SynHighlighterST, SynHighlighterSml, SynHighlighterMsg,
  SynHighlighterProgress, SynHighlighterGalaxy, SynHighlighterBaan,
  SynHighlighterRC, SynHighlighterLDraw, SynHighlighterHaskell,
  SynHighlighterCPM, SynHighlighterIDL;

type
  TDMHighlighters = class(TDataModule)
    CS: TSynCSSyn;
    Cpp: TSynCppSyn;
    Java: TSynJavaSyn;
    VB: TSynVBSyn;
    JScript: TSynJScriptSyn;
    VBScript: TSynVBScriptSyn;
    XML: TSynXMLSyn;
    Perl: TSynPerlSyn;
    Python: TSynPythonSyn;
    SQL: TSynSQLSyn;
    Ini: TSynIniSyn;
    TeX: TSynTeXSyn;
    Vrml97: TSynVrml97Syn;
    Dfm: TSynDfmSyn;
    Pas: TSynPasSyn;
    AWK: TSynAWKSyn;
    Bat: TSynBatSyn;
    TclTk: TSynTclTkSyn;
    AsmFile: TSynAsmSyn;
    DOT: TSynDOTSyn;
    UNIXShellScript: TSynUNIXShellScriptSyn;
    WebHtml: TSynWebHtmlSyn;
    WebWml: TSynWebWmlSyn;
    WebCss: TSynWebCssSyn;
    WebEs: TSynWebEsSyn;
    SynWebEngine1: TSynWebEngine;
    TXT: TSynGeneralSyn;
    WebXML: TSynWebXmlSyn;
    SynURISyn1: TSynURISyn;
    SynInnoSyn1: TSynInnoSyn;
    WebSmarty: TSynWebSmartySyn;
    Eiffel: TSynEiffelSyn;
    Fortran: TSynFortranSyn;
    M3: TSynM3Syn;
    Cobol: TSynCobolSyn;
    Kix: TSynKixSyn;
    GWScript: TSynGWScriptSyn;
    Ruby: TSynRubySyn;
    CAC: TSynCACSyn;
    Cache: TSynCacheSyn;
    Foxpro: TSynFoxproSyn;
    SDD: TSynSDDSyn;
    ADSP21xx: TSynADSP21xxSyn;
    HC11: TSynHC11Syn;
    ST: TSynSTSyn;
    Dml: TSynDmlSyn;
    Modelica: TSynModelicaSyn;
    SML: TSynSMLSyn;
    Baan: TSynBaanSyn;
    Galaxy: TSynGalaxySyn;
    Progress: TSynProgressSyn;
    Msg: TSynMsgSyn;
    Idl: TSynIdlSyn;
    CPM: TSynCPMSyn;
    Haskell: TSynHaskellSyn;
    LDR: TSynLDRSyn;
    RC: TSynRCSyn;
    WebPhpCli: TSynWebPhpCliSyn;
    WebPhpPlain: TSynWebPhpPlainSyn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMHighlighters: TDMHighlighters;

implementation

{$R *.dfm}

end.
