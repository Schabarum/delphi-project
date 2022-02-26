unit Src.Views.UnProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, Vcl.Graphics, System.Classes,
  System.SysUtils, Vcl.Forms, Vcl.Mask, Vcl.Controls, System.Variants,
  Vcl.StdCtrls, Data.DB, Vcl.Imaging.jpeg,
  Src.Views.TemplateCadastro, Vcl.Grids, Vcl.ExtCtrls, Vcl.DBGrids, Vcl.Buttons,
  Vcl.ComCtrls, Vcl.Dialogs, Vcl.DBCtrls, Src.DataAcess.dmPrincipal,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmProduto = class(TfrmTemplate)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtCodigo: TDBEdit;
    edtDescricao: TDBEdit;
    edtValor: TDBEdit;
    procedure btnInserirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
    procedure edtBuscaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    function GetSQLPadrao: string;
    procedure Filter;
  public
    { Public declarations }
  protected
    procedure InitializeForm; override;
    procedure InserirRegistro; override;
  end;

var
  frmProduto: TfrmProduto;

implementation

{$R *.dfm}

uses Src.Utils.UnUtils;

procedure TfrmProduto.btnBuscaClick(Sender: TObject);
begin
  inherited;
  Filter;
end;

procedure TfrmProduto.btnEditarClick(Sender: TObject);
begin
  inherited;
  edtCodigo.Enabled := False;
  edtDescricao.SetFocus;
end;

procedure TfrmProduto.btnInserirClick(Sender: TObject);
begin
  inherited;
  edtCodigo.Enabled := True;
  edtCodigo.SetFocus;
end;

procedure TfrmProduto.edtBuscaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    Filter;
end;

procedure TfrmProduto.Filter;
begin
  if edtBusca.Text <> '' then
  begin
    FDPadrao.Filter := ' CODPRODUTO = ' + edtBusca.Text;
    FDPadrao.Filtered := True;
  end
  else
  begin
    FDPadrao.Filtered := False;
    FDPadrao.Refresh;
  end;
end;

function TfrmProduto.GetSQLPadrao: string;
begin
  Result := 'SELECT PRODUTO.CODPRODUTO, PRODUTO.DESCRICAO, PRODUTO.VALOR ' +
    ' FROM PRODUTO';
end;

procedure TfrmProduto.InitializeForm;
begin
  inherited;
  FDPadrao.SQL.Add(GetSQLPadrao);
  FDPadrao.Open;
end;

procedure TfrmProduto.InserirRegistro;
begin
  inherited;
  FDPadrao.FieldByName('CODPRODUTO').AsFloat :=
    dmPrincipal.GetSequence('SEQ_PRODUTO');
end;

end.
