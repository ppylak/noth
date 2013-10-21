unit UnitHTMLParser;

interface

uses HtmlParser, DomCore, Formatter; //B³êdnie formatuj¹!!!

function FormatHTML(html: WideString; Ident: Integer): WideString;

implementation

function FormatHTML(html: WideString; Ident: Integer): WideString;
var
  HtmlParser: THtmlParser;
  HtmlFormatter: THtmlFormatter;
  Document: TDocument;
begin
  HtmlParser := THtmlParser.Create;
  try
    Document := HtmlParser.parseString(html);
    HtmlFormatter := THtmlFormatter.Create;
    try
      Result := HtmlFormatter.getText(Document);
    finally
      HtmlFormatter.Free;
    end;
  finally
    HtmlParser.Free;
  end;
end;

end.
