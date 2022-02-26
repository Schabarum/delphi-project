unit Src.Utils.UnUtils;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmUtils = class(TForm)
    FDQuery1: TFDQuery;
  private
    { Private declarations }
  public

  end;

  TExport = class
  public
    class procedure ExportXLS(Query: TFDQuery);
  end;

  TBaseUtils = class
  public
    class function GetSQLPadrao(Table, Field: string): string;
    class function NewMaxValue(Table, Field: string): Double;
  end;

  TConnection = class
    class function ExecuteSQL(SQL: string): string;
  end;

var
  frmUtils: TfrmUtils;

implementation

uses
  System.Win.ComObj, Src.DataAcess.dmPrincipal;

{$R *.dfm}
{ TExport }

class procedure TExport.ExportXLS(Query: TFDQuery);
var
  Linha, Coluna: Integer;
  Planilha: variant;
  FieldValue: string;
begin
  Query.CachedUpdates := True;
  Planilha := CreateOleObject('Excel.Application');
  Planilha.WorkBooks.add(1);
  Planilha.Caption := 'dbgPadrao_records';

  Query.ApplyUpdates;
  Query.First;
  for Linha := 0 to Query.RecordCount - 1 do
  begin
    for Coluna := 1 to Query.FieldCount do
    begin
      FieldValue := Query.Fields[Coluna - 1].AsString;
      Planilha.cells[Linha + 2, Coluna] := FieldValue;
    end;
    Query.Next;
  end;

  for Coluna := 1 to Query.FieldCount do
  begin
    FieldValue := Query.Fields[Coluna - 1].DisplayLabel;
    Planilha.cells[1, Coluna] := FieldValue;
  end;
  Planilha.columns.autofit;
  Planilha.visible := True;
end;

{ TBaseUtils }

class function TBaseUtils.GetSQLPadrao(Table, Field: string): string;
begin
  Result := 'SELECT MAX(' + Field + ' ) + 1 AS CODIGO FROM ' + Table;
end;

class function TBaseUtils.NewMaxValue(Table, Field: string): Double;
var
  vForm: TfrmUtils;
begin
  vForm := TfrmUtils.Create(nil);
  try
    vForm.FDQuery1.SQL.add(GetSQLPadrao(Table, Field));
    vForm.FDQuery1.Open;
    Result := vForm.FDQuery1.FieldByName('CODIGO').AsFloat;
    if Result = 0 then
      Result := 1;
  finally
    vForm.free;
  end;
end;

{ TConnection }

class function TConnection.ExecuteSQL(SQL: string): string;
var
  vForm: TfrmUtils;
begin
  vForm := TfrmUtils.Create(nil);
  try
    vForm.FDQuery1.SQL.add(SQL);
    vForm.FDQuery1.Open;
    Result := vForm.FDQuery1.FieldByName('RESULTADO').AsString;
  finally
    vForm.free;
  end;
end;

end.
