unit Src.Views.UnMunicipio;

interface

uses
  Winapi.Windows, Winapi.Messages, Vcl.Graphics, System.Classes,
  System.SysUtils, Vcl.Forms, Vcl.Mask, Vcl.Controls, System.Variants,
  Vcl.StdCtrls, Data.DB, Vcl.Imaging.jpeg,
  Src.Views.TemplateCadastro, Vcl.Grids, Vcl.ExtCtrls, Vcl.DBGrids, Vcl.Buttons,
  Vcl.ComCtrls, Vcl.Dialogs, Vcl.DBCtrls, Src.DataAcess.dmPrincipal,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmMunicipio = class(TfrmTemplate)
    lblCodigo: TLabel;
    lblMunicipio: TLabel;
    lblUF: TLabel;
    cbbUF: TDBComboBox;
    edtCodigo: TDBEdit;
    edtNome: TDBEdit;
    procedure btnInserirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure edtBuscaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnBuscaClick(Sender: TObject);
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
  frmMunicipio: TfrmMunicipio;

implementation

{$R *.dfm}

uses Src.Utils.UnUtils;

procedure TfrmMunicipio.btnBuscaClick(Sender: TObject);
begin
  inherited;
  Filter;
end;

procedure TfrmMunicipio.btnEditarClick(Sender: TObject);
begin
  inherited;
  edtCodigo.Enabled := False;
  edtNome.SetFocus;
end;

procedure TfrmMunicipio.btnInserirClick(Sender: TObject);
begin
  inherited;
  edtCodigo.Enabled := True;
  edtCodigo.SetFocus;
end;

procedure TfrmMunicipio.edtBuscaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    Filter;
end;

procedure TfrmMunicipio.Filter;
begin
  if edtBusca.Text <> '' then
  begin
    FDPadrao.Filter := ' CODMUNICIPIO = ' + edtBusca.Text;
    FDPadrao.Filtered := True;
  end
  else
  begin
    FDPadrao.Filtered := False;
    FDPadrao.Refresh;
  end;
end;

function TfrmMunicipio.GetSQLPadrao: string;
begin
  Result := 'SELECT MUNICIPIO.CODMUNICIPIO, MUNICIPIO.NOME, MUNICIPIO.UF ' +
    ' FROM MUNICIPIO';
end;

procedure TfrmMunicipio.InitializeForm;
begin
  inherited;
  FDPadrao.SQL.Add(GetSQLPadrao);
  FDPadrao.Open;
end;

procedure TfrmMunicipio.InserirRegistro;
begin
  inherited;
  FDPadrao.FieldByName('CODMUNICIPIO').AsFloat :=
    dmPrincipal.GetSequence('SEQ_MUNICIPIO');
end;

end.
