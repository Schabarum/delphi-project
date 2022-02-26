unit Src.DataAcess.dmPrincipal;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FireDAC.Phys.FB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmPrincipal = class(TDataModule)
    FDConnection1: TFDConnection;
    FDQuery: TFDQuery;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
  public
    function GetSequence(Nome: string): integer;
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

function TdmPrincipal.GetSequence(Nome: string): integer;
begin
  if FDQuery.Active then
    FDQuery.Close;

  FDQuery.SQL.Text := 'SELECT GEN_ID(' + Nome + ', 1) AS SEQ FROM RDB$DATABASE';
  FDQuery.Open;
  Result := FDQuery.FieldByName('SEQ').AsInteger;
end;

end.
