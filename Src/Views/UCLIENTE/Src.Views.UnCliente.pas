unit Src.Views.UnCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, Vcl.Graphics, System.Classes,
  System.SysUtils, Vcl.Forms, Vcl.Mask, Vcl.Controls, System.Variants,
  Vcl.StdCtrls, Data.DB, Vcl.Imaging.jpeg,
  Src.Views.TemplateCadastro, Vcl.Grids, Vcl.ExtCtrls, Vcl.DBGrids, Vcl.Buttons,
  Vcl.ComCtrls, Vcl.Dialogs, Vcl.DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmCliente = class(TfrmTemplate)
    lkpMunicipio: TDBLookupComboBox;
    lblCodigo: TLabel;
    lblNome: TLabel;
    lblCPF: TLabel;
    lblMunicipio: TLabel;
    dsLKP: TDataSource;
    edtCodigo: TDBEdit;
    edtNome: TDBEdit;
    edtCPF: TDBEdit;
    FDLKP: TFDQuery;
    procedure btnInserirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
    procedure edtBuscaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    function GetSQLPadrao: string;
    function GetSQLLKP: string;
    procedure Filter;
  protected
    procedure InitializeForm; override;
    procedure InserirRegistro; override;
  public
    { Public declarations }
  end;

var
  frmCliente: TfrmCliente;

implementation

{$R *.dfm}

uses Src.DataAcess.dmPrincipal, Src.Utils.UnUtils;
{ TfrmCliente }

procedure TfrmCliente.btnBuscaClick(Sender: TObject);
begin
  inherited;
  Filter;
end;

procedure TfrmCliente.btnEditarClick(Sender: TObject);
begin
  inherited;
  edtNome.SetFocus;
  edtCodigo.Enabled := False;
end;

procedure TfrmCliente.btnInserirClick(Sender: TObject);
begin
  inherited;
  edtCodigo.Enabled := True;
  edtCodigo.SetFocus;
end;

procedure TfrmCliente.edtBuscaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    Filter;
end;

procedure TfrmCliente.Filter;
begin
  if edtBusca.Text <> '' then
  begin
    FDPadrao.Filter := ' CODCLIENTE = ' + edtBusca.Text;
    FDPadrao.Filtered := True;
  end
  else
  begin
    FDPadrao.Filtered := False;
    FDPadrao.Refresh;
  end;
end;

function TfrmCliente.GetSQLLKP: string;
begin
  Result := 'SELECT MUNICIPIO.CODMUNICIPIO, MUNICIPIO.NOME, MUNICIPIO.UF' +
    '  FROM MUNICIPIO';
end;

function TfrmCliente.GetSQLPadrao: string;
begin
  Result := 'SELECT CLIENTE.CODCLIENTE, CLIENTE.NOME, CLIENTE.CPF, ' +
    ' CLIENTE.CODMUNICIPIO FROM CLIENTE ORDER BY CLIENTE.CODCLIENTE';
end;

procedure TfrmCliente.InitializeForm;
begin
  inherited;
  FDPadrao.SQL.Add(GetSQLPadrao);
  FDLKP.SQL.Add(GetSQLLKP);
  FDPadrao.Open;
  FDLKP.Open;
end;

procedure TfrmCliente.InserirRegistro;
begin
  inherited;
  FDPadrao.FieldByName('CODCLIENTE').AsFloat :=
    dmPrincipal.GetSequence('SEQ_CLIENTE');
end;

end.
