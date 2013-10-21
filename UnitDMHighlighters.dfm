object DMHighlighters: TDMHighlighters
  OldCreateOrder = False
  Height = 482
  Width = 664
  object SynInnoSyn1: TSynInnoSyn
    Left = 160
    Top = 340
  end
  object CS: TSynCSSyn
    DefaultFilter = 'Pliki C# (*.cs)|*.cs'
    Left = 164
    Top = 20
  end
  object Cpp: TSynCppSyn
    DefaultFilter = 'Pliki C/C++ (*.c;*.cpp;*.h;*.hpp)|*.c;*.cpp;*.h;*.hpp'
    CommentAttri.Foreground = clNavy
    DirecAttri.Foreground = clTeal
    StringAttri.Foreground = clGreen
    Left = 224
    Top = 240
  end
  object Java: TSynJavaSyn
    DefaultFilter = 'Pliki Java (*.java)|*.java'
    Left = 164
    Top = 64
  end
  object VB: TSynVBSyn
    DefaultFilter = 'Pliki Visual Basic (*.bas)|*.bas'
    Left = 164
    Top = 108
  end
  object JScript: TSynJScriptSyn
    DefaultFilter = 'Pliki Javascript (*.js)|*.js'
    CommentAttri.Foreground = clNavy
    StringAttri.Foreground = clGreen
    Left = 164
    Top = 152
  end
  object VBScript: TSynVBScriptSyn
    DefaultFilter = 'Pliki VBScript (*.vbs)|*.vbs'
    Left = 160
    Top = 240
  end
  object XML: TSynXMLSyn
    DefaultFilter = 
      'Pliki XML (*.xml;*.xsd;*.xsl;*.xslt;*.dtd)|*.xml;*.xsd;*.xsl;*.x' +
      'slt;*.dtd'
    Enabled = False
    WantBracesParsed = False
    Left = 160
    Top = 196
  end
  object Perl: TSynPerlSyn
    DefaultFilter = 'Pliki Perla (*.pl;*.pm;*.cgi)|*.pl;*.pm;*.cgi'
    Left = 224
    Top = 20
  end
  object Python: TSynPythonSyn
    DefaultFilter = 'Pliki Pythona (*.py)|*.py'
    Left = 224
    Top = 64
  end
  object SQL: TSynSQLSyn
    DefaultFilter = 'Pliki SQL'#39'a (*.sql)|*.sql'
    CommentAttri.Foreground = clNavy
    StringAttri.Foreground = clGreen
    TableNameAttri.Foreground = clPurple
    Left = 224
    Top = 108
  end
  object Ini: TSynIniSyn
    DefaultFilter = 'Pliki INI (*.ini)|*.ini'
    Left = 224
    Top = 152
  end
  object TeX: TSynTeXSyn
    DefaultFilter = 'Pliki TeX'#39'a (*.tex)|*.tex'
    Left = 224
    Top = 196
  end
  object Vrml97: TSynVrml97Syn
    Left = 224
    Top = 288
  end
  object Dfm: TSynDfmSyn
    CommentAttri.Foreground = clGreen
    KeyAttri.Foreground = clNavy
    NumberAttri.Foreground = clBlue
    StringAttri.Foreground = clGreen
    Left = 304
    Top = 20
  end
  object Pas: TSynPasSyn
    DefaultFilter = 
      'Pliki Pascala (*.pas;*.pp;*.dpr;*.dpk;*.inc)|*.pas;*.pp;*.dpr;*.' +
      'dpk;*.inc'
    CommentAttri.Foreground = clGreen
    DirectiveAttri.Foreground = clTeal
    IdentifierAttri.Foreground = clBlack
    KeyAttri.Foreground = clNavy
    NumberAttri.Foreground = clBlue
    StringAttri.Foreground = clGreen
    CharAttri.Foreground = clGreen
    Left = 304
    Top = 64
  end
  object AWK: TSynAWKSyn
    DefaultFilter = 'Skrypty AWK (*.awk)|*.awk'
    Left = 304
    Top = 108
  end
  object Bat: TSynBatSyn
    Left = 304
    Top = 152
  end
  object TclTk: TSynTclTkSyn
    OptionsAttri.Background = clNone
    OptionsAttri.Foreground = clNone
    PathAttri.Background = clNone
    PathAttri.Foreground = clNone
    VariableAttri.Background = clNone
    VariableAttri.Foreground = clNone
    Left = 304
    Top = 196
  end
  object AsmFile: TSynAsmSyn
    DefaultFilter = 'Pliki asemblera x86 (*.asm)|*.asm'
    Left = 392
    Top = 64
  end
  object DOT: TSynDOTSyn
    Left = 392
    Top = 108
  end
  object UNIXShellScript: TSynUNIXShellScriptSyn
    Left = 392
    Top = 20
  end
  object TXT: TSynGeneralSyn
    DefaultFilter = 'Pliki tekstowe (*.txt)|*.txt'
    Comments = []
    DetectPreprocessor = False
    IdentifierChars = '_0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'
    Left = 160
    Top = 284
  end
  object SynURISyn1: TSynURISyn
    Left = 304
    Top = 288
  end
  object Eiffel: TSynEiffelSyn
    DefaultFilter = 'Pliki Eiffel (*.e;*.ace)|*.e;*.ace'
    Left = 224
    Top = 340
  end
  object Fortran: TSynFortranSyn
    DefaultFilter = 'Pliki Fortrana (*.for)|*.for'
    Left = 224
    Top = 396
  end
  object M3: TSynM3Syn
    DefaultFilter = 'Pliki Modula-3 (*.m3)|*.m3'
    Left = 160
    Top = 396
  end
  object Cobol: TSynCobolSyn
    DefaultFilter = 'Pliki COBOLa (*.cbl;*.cob)|*.cbl;*.cob'
    AreaAStartPos = 7
    AreaBStartPos = 11
    CodeEndPos = 71
    Left = 304
    Top = 248
  end
  object Kix: TSynKixSyn
    DefaultFilter = 'Skrypty KiXtart (*.kix)|*.kix'
    Left = 304
    Top = 340
  end
  object GWScript: TSynGWScriptSyn
    DefaultFilter = 'Skrypty GW-TEL (*.gws)|*.gws'
    Left = 304
    Top = 392
  end
  object Ruby: TSynRubySyn
    DefaultFilter = 'Pliki Ruby (*.rb;*.rbw)|*.rb;*.rbw'
    Left = 392
    Top = 196
  end
  object CAC: TSynCACSyn
    DefaultFilter = 'Pliki CA-Clipper (*.prg;*.ch;*.inc)|*.prg;*.ch;*.inc'
    Left = 392
    Top = 152
  end
  object Cache: TSynCacheSyn
    DefaultFilter = 'Pliki Cache (*.mac;*.inc;*.int)|*.mac;*.inc;*.int'
    Left = 392
    Top = 296
  end
  object Foxpro: TSynFoxproSyn
    DefaultFilter = 'Pliki Foxpro (*.prg)|*.prg'
    Left = 392
    Top = 248
  end
  object SDD: TSynSDDSyn
    DefaultFilter = 'Pliki Semanta DD (*.sdd)|*.sdd'
    Left = 392
    Top = 340
  end
  object ADSP21xx: TSynADSP21xxSyn
    DefaultFilter = 'Pliki DSP (*.dsp;*.inc)|*.dsp;*.inc'
    Left = 392
    Top = 392
  end
  object HC11: TSynHC11Syn
    DefaultFilter = 'Pliki Asemblera 68HC11 (*.hc11;*.asc)|*.hc11;*.asc'
    Left = 468
    Top = 20
  end
  object ST: TSynSTSyn
    DefaultFilter = 'Tekst strukturalny (*.st)|*.st'
    Left = 468
    Top = 64
  end
  object Dml: TSynDmlSyn
    DefaultFilter = 'Pliki GEMBASE (*.dml;*.gem)|*.dml;*.gem'
    Left = 468
    Top = 108
  end
  object Modelica: TSynModelicaSyn
    DefaultFilter = 'Pliki Modelica (*.mo)|*.mo'
    Left = 468
    Top = 152
  end
  object SML: TSynSMLSyn
    DefaultFilter = 'Pliki Standard ML (*.sml)|*.sml'
    Left = 468
    Top = 200
  end
  object Baan: TSynBaanSyn
    DefaultFilter = 'Pliki Baan 4GL (*.cln)|*.cln'
    Left = 468
    Top = 248
  end
  object Galaxy: TSynGalaxySyn
    DefaultFilter = 'Pliki Galaxy (*.gtv;*.galrep;*.txt)|*.gtv;*.galrep;*.txt'
    KeyWords.Strings = (
      '#end'
      '#galaxy'
      'a'
      'anonymous'
      'autounload'
      'b'
      'battleprotocol'
      'c'
      'cap'
      'cargo'
      'col'
      'compress'
      'd'
      'drive'
      'e'
      'emp'
      'f'
      'fleet'
      'fleettables'
      'g'
      'galaxytv'
      'gplus'
      'groupforecast'
      'h'
      'i'
      'j'
      'l'
      'm'
      'machinereport'
      'mat'
      'n'
      'namecase'
      'no'
      'o'
      'options'
      'p'
      'planetforecast'
      'prodtable'
      'produce'
      'q'
      'r'
      'routesforecast'
      's'
      'send'
      'shields'
      'shiptypeforecast'
      'sortgroups'
      't'
      'twocol'
      'u'
      'underscores'
      'v'
      'w'
      'war'
      'weapons'
      'x'
      'y'
      'z')
    Left = 468
    Top = 296
  end
  object Progress: TSynProgressSyn
    DefaultFilter = 'Pliki Progress (*.w;*.p;*.i)|*.w;*.p;*.i'
    Left = 468
    Top = 340
  end
  object Msg: TSynMsgSyn
    DefaultFilter = 'Pliki Msg (*.msg)|*.msg'
    Left = 468
    Top = 388
  end
  object Idl: TSynIdlSyn
    DefaultFilter = 'Pliki CORBA IDL (*.idl)|*.idl'
    Left = 540
    Top = 20
  end
  object CPM: TSynCPMSyn
    DefaultFilter = 'Raporty CPM (*.rdf;*.rif;*.rmf;*.rxf)|*.rdf;*.rif;*.rmf;*.rxf'
    Left = 540
    Top = 64
  end
  object Haskell: TSynHaskellSyn
    DefaultFilter = 'Pliki Haskell (*.hs;*.lhs)|*.hs;*.lhs'
    Left = 540
    Top = 108
  end
  object LDR: TSynLDRSyn
    DefaultFilter = 'Pliki LEGO LDraw (*.ldr)|*.ldr'
    Left = 540
    Top = 156
  end
  object RC: TSynRCSyn
    DefaultFilter = 'Pliki zasob'#243'w (*.rc)|*.rc'
    Left = 540
    Top = 204
  end
  object WebXML: TSynWebXmlSyn
    DefaultFilter = 
      'Pliki XML (*.xml;*.xsd;*.xsl;*.xslt;*.dtd)|*.xml;*.xsd;*.xsl;*.x' +
      'slt;*.dtd'
    ActiveHighlighterSwitch = False
    Engine = SynWebEngine1
    Options.PhpVersion = spvPhp5
    Options.PhpShortOpenTag = True
    Options.PhpAspTags = True
    Options.PhpEmbeded = True
    Options.UseEngineOptions = True
    Left = 36
    Top = 276
  end
  object SynWebEngine1: TSynWebEngine
    InactiveAttri.Foreground = clGrayText
    Options.HtmlVersion = shvXHtml10Transitional
    Options.WmlVersion = swvWml13
    Options.XsltVersion = swvXslt20
    Options.CssVersion = scvCss21
    Options.PhpVersion = spvPhp5
    Options.PhpShortOpenTag = True
    Options.PhpAspTags = True
    SpecialAttri.InactiveOptions = []
    Left = 36
    Top = 20
  end
  object WebSmarty: TSynWebSmartySyn
    ActiveHighlighterSwitch = False
    Engine = SynWebEngine1
    Options.SmartyLDelim = '{'
    Options.SmartyRDelim = '}'
    Options.HtmlVersion = shvXHtml10Transitional
    Options.CssVersion = scvCss21
    Options.PhpVersion = spvPhp5
    Options.CssEmbeded = True
    Options.EsEmbeded = True
    Options.UseEngineOptions = True
    Left = 36
    Top = 376
  end
  object WebWml: TSynWebWmlSyn
    DefaultFilter = 'Pliki WML (*.wml)|*.wml'
    ActiveHighlighterSwitch = False
    Engine = SynWebEngine1
    Options.WmlVersion = swvWml13
    Options.PhpVersion = spvPhp5
    Options.PhpShortOpenTag = True
    Options.PhpAspTags = True
    Options.AllowASPTags = True
    Options.PhpEmbeded = True
    Options.UseEngineOptions = True
    Left = 36
    Top = 168
  end
  object WebCss: TSynWebCssSyn
    DefaultFilter = 'Arkusze styl'#243'w kaskadowych (*.css)|*.css'
    ActiveHighlighterSwitch = False
    Engine = SynWebEngine1
    Options.HtmlVersion = shvXHtml10Transitional
    Options.CssVersion = scvCss21
    Options.PhpVersion = spvPhp5
    Options.PhpShortOpenTag = True
    Options.PhpAspTags = True
    Options.PhpEmbeded = True
    Options.UseEngineOptions = True
    Left = 36
    Top = 220
  end
  object WebEs: TSynWebEsSyn
    DefaultFilter = 'Pliki Javascript (*.js)|*.js'
    ActiveHighlighterSwitch = False
    Engine = SynWebEngine1
    Options.PhpVersion = spvPhp5
    Options.PhpShortOpenTag = True
    Options.PhpAspTags = True
    Options.PhpEmbeded = True
    Options.UseEngineOptions = True
    Left = 36
    Top = 116
  end
  object WebHtml: TSynWebHtmlSyn
    DefaultFilter = 
      'Dokumenty HTML (*.htm;*.html;*.shtml;*.xhtml;*.mhtml;*.php;*.php' +
      '3;*.php4;*.php5;*.phtml;*.inc)|*.htm;*.html;*.shtml;*.xhtml;*.mh' +
      'tml;*.php;*.php3;*.php4;*.php5;*.phtml;*.inc'
    ActiveHighlighterSwitch = False
    Engine = SynWebEngine1
    Options.HtmlVersion = shvXHtml10Transitional
    Options.CssVersion = scvCss21
    Options.PhpVersion = spvPhp5
    Options.PhpShortOpenTag = True
    Options.PhpAspTags = True
    Options.AllowASPTags = True
    Options.CssEmbeded = True
    Options.PhpEmbeded = True
    Options.EsEmbeded = True
    Options.UseEngineOptions = True
    Left = 36
    Top = 324
  end
  object WebPhpCli: TSynWebPhpCliSyn
    ActiveHighlighterSwitch = False
    Engine = SynWebEngine1
    Options.PhpVersion = spvPhp5
    Options.PhpShortOpenTag = True
    Options.PhpAspTags = True
    Options.UseEngineOptions = True
    Left = 36
    Top = 420
  end
  object WebPhpPlain: TSynWebPhpPlainSyn
    ActiveHighlighterSwitch = False
    Engine = SynWebEngine1
    Options.PhpVersion = spvPhp5
    Options.UseEngineOptions = True
    Left = 100
    Top = 424
  end
end
