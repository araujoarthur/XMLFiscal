unit XMLFiscal.Utils;

interface
uses
  SysUtils, System.Generics.Collections, System.Classes, IOUtils;
  type TXMLUtils = class
  private
    constructor Create();
  public
    class function CleanNewLine(APath: string; ARemoveDirty:Boolean = False): string; // Became too specific. Keep in XML; Clone it to Utils without specificity;
    class function UFCodeToStr(AUFCode: Integer): string; // Utils Procedure, change unit;
    class function CapitalizeStr(AString: string): string; // Utils Procedure, change unit;
    class procedure AppendToArray<T>(AItem:T; var RArray: TArray<T>);
  end;
  
implementation

{ TXMLUtils }

class procedure TXMLUtils.AppendToArray<T>(AItem: T; var RArray: TArray<T>);
var
  ArrayInitialLength: Integer;
begin
  ArrayInitialLength := Length(RArray);
  SetLength(RArray, ArrayInitialLength + 1);
  RArray[High(RArray)] := AItem;
end;

class function TXMLUtils.CapitalizeStr(AString: string): string;
var
  FirstCharCode: Integer;
  UpperCaseCode: Integer;
  CopyStr: string;
begin
  CopyStr := AString;
  CopyStr := LowerCase(CopyStr);

  FirstCharCode := Ord(CopyStr[1]);

  if (FirstCharCode >= 96) and (FirstCharCode <= 122) then
  begin
    UpperCaseCode := FirstCharCode - 32;
    CopyStr[1] := chr(UpperCaseCode);
    result := CopyStr;
  end else begin
    result := AString;
  end;

end;

class function TXMLUtils.CleanNewLine(APath: string; ARemoveDirty: Boolean): string;
var
  DirtyFile: TextFile;
  FileContent, Line: string;
  DirtyFileName, DirtyFilePath, FileExtension, CleanFileName, CleanFileFullPath: string;
  StreamWriter: TStreamWriter;
begin
  DirtyFileName := TPath.GetFileNameWithoutExtension(APath);
  FileExtension := TPath.GetExtension(APath);
  DirtyFilePath := ExtractFilePath(APath);
  CleanFileName := DirtyFileName + '__clean__' + FileExtension;
  CleanFileFullPath := DirtyFilePath + CleanFileName;

  result := CleanFileFullPath;

  AssignFile(DirtyFile, APath);
  Reset(DirtyFile);

  FileContent := '';
  // Checa ocorrências onde um atributo pode ficar grudado ao elemento.
  while not Eof(DirtyFile) do
  begin
    ReadLn(DirtyFile, Line);
    if ((Pos('xmlns', LowerCase(Line))) > 0) and (Pos('xmlns', LowerCase(Line)) < 2) then
    begin
      FileContent := FileContent + ' ' + Line;
    end else if (Pos('id', LowerCase(Line)) > 0) and  (Pos('id', LowerCase(Line)) < 2) then
    begin
      FileContent := FileContent + ' ' + Line;
    end else if (Pos('algorithm', LowerCase(Line)) > 0) and  (Pos('algorithm', LowerCase(Line)) < 2) then
    begin
      FileContent := FileContent + ' ' + Line;
    end else if (Pos('uri', LowerCase(Line)) > 0) and  (Pos('uri', LowerCase(Line)) < 2) then
    begin
      FileContent := FileContent + ' ' + Line;
    end else if (Pos('nitem', LowerCase(Line)) > 0) and  (Pos('nitem', LowerCase(Line)) < 2) then
    begin
      FileContent := FileContent + ' ' + Line;
    end else if (Pos('versao', LowerCase(Line)) > 0) and  (Pos('versao', LowerCase(Line)) < 2) then
    begin
      FileContent := FileContent + ' ' + Line;
    end else begin
      FileContent := FileContent + Line;
    end;
  end;

  CloseFile(DirtyFile);
  FileContent := StringReplace(FileContent, #13#10, '', [rfReplaceAll]);

  StreamWriter := TStreamWriter.Create(CleanFileFullPath, False, TEncoding.UTF8);
  try
    try
      StreamWriter.Write(FileContent);

      if ARemoveDirty then
      begin
        DeleteFile(APath);
      end;

    except on E: Exception do
      result := ''
    end;
  finally
    StreamWriter.Free;
  end;
end;


constructor TXMLUtils.Create;
begin

end;

class function TXMLUtils.UFCodeToStr(AUFCode: Integer): string;
begin
  case AUFCode of
    11: result := 'RO';
    12: result := 'AC';
    13: result := 'AM';
    14: result := 'RR';
    15: result := 'PA';
    16: result := 'AP';
    17: result := 'TO';
    21: result := 'MA';
    22: result := 'PI';
    23: result := 'CE';
    24: result := 'RN';
    25: result := 'PB';
    26: result := 'PE';
    27: result := 'AL';
    28: result := 'SE';
    29: result := 'BA';
    31: result := 'MG';
    32: result := 'ES';
    33: result := 'RJ';
    35: result := 'SP';
    41: result := 'PR';
    42: result := 'SC';
    43: result := '43';
    50: result := '50';
    51: result := 'MT';
    52: result := 'GO';
    53: result := 'DF';
    else begin
      result := 'ERRO';
    end;
  end;
end;

end.
