unit Src.Views.TemplateCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, Vcl.Grids,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Data.DB, Vcl.Graphics, System.Classes,
  Vcl.DBGrids, Vcl.Imaging.jpeg, ComObj, DBClient, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmTemplate = class(TForm)
    pgPrincipal: TPageControl;
    tsPadrao: TTabSheet;
    tsListagem: TTabSheet;
    pnlCadastro: TPanel;
    dbgPadrao: TDBGrid;
    dsPadrao: TDataSource;
    pnlTop: TPanel;
    imgIcon: TImage;
    Label1: TLabel;
    pnlNavigator: TPanel;
    btnFirstRecord: TSpeedButton;
    btnLeftRecord: TSpeedButton;
    btnRightRecord: TSpeedButton;
    btnLastRecord: TSpeedButton;
    btnRefresh: TSpeedButton;
    btnExport: TSpeedButton;
    btnZebrarGrid: TSpeedButton;
    pnlButtons: TPanel;
    btnSair: TSpeedButton;
    btnEditar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnInserir: TSpeedButton;
    btnSalvar: TSpeedButton;
    edtBusca: TLabeledEdit;
    btnBusca: TSpeedButton;
    btnExportPDF: TSpeedButton;
    FDPadrao: TFDQuery;
    procedure btnInserirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgPadraoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnFirstRecordClick(Sender: TObject);
    procedure btnRightRecordClick(Sender: TObject);
    procedure btnLastRecordClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure dbgPadraoDblClick(Sender: TObject);
    procedure btnZebrarGridClick(Sender: TObject);
    procedure dsPadraoStateChange(Sender: TObject);
    procedure btnLeftRecordClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FZebra: Boolean;
  public
    procedure InitializeForm; virtual;
    procedure InserirRegistro; virtual;
    procedure EditarRegistro; virtual;
    procedure Salvar; virtual;
    procedure Cancelar; virtual;
    procedure Excluir; virtual;
    function GetSQLPadrao: string; virtual;
  end;

var
  frmTemplate: TfrmTemplate;

implementation

{$R *.dfm}

uses Src.DataAcess.dmPrincipal, Src.Views.UnPrincipal, Src.View.unMensagens,
  Src.Utils.UnUtils;

procedure TfrmTemplate.btnCancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TfrmTemplate.btnEditarClick(Sender: TObject);
begin
  EditarRegistro;
end;

procedure TfrmTemplate.btnExcluirClick(Sender: TObject);
begin
  Excluir;
end;

procedure TfrmTemplate.btnExportClick(Sender: TObject);
begin
  TExport.ExportXLS(FDPadrao);
end;

procedure TfrmTemplate.btnFirstRecordClick(Sender: TObject);
begin
  FDPadrao.First;
end;

procedure TfrmTemplate.btnInserirClick(Sender: TObject);
begin
  InserirRegistro;
end;

procedure TfrmTemplate.btnLastRecordClick(Sender: TObject);
begin
  FDPadrao.Last;
end;

procedure TfrmTemplate.btnLeftRecordClick(Sender: TObject);
begin
  FDPadrao.Prior;
end;

procedure TfrmTemplate.btnRefreshClick(Sender: TObject);
begin
  FDPadrao.Refresh;
end;

procedure TfrmTemplate.btnRightRecordClick(Sender: TObject);
begin
  FDPadrao.Next;
end;

procedure TfrmTemplate.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTemplate.btnSalvarClick(Sender: TObject);
begin
  Salvar;
end;

procedure TfrmTemplate.btnZebrarGridClick(Sender: TObject);
begin
  if FZebra then
    FZebra := False
  else
    FZebra := True;
  btnRefreshClick(Self);
end;

procedure TfrmTemplate.Cancelar;
begin
  FDPadrao.Cancel;
end;

procedure TfrmTemplate.dbgPadraoDblClick(Sender: TObject);
begin
  pgPrincipal.ActivePage := tsPadrao;
end;

procedure TfrmTemplate.dbgPadraoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if FZebra then
  begin
    with dbgPadrao do
    begin
      if odd(dsPadrao.DataSet.RecNo) then
        Canvas.Brush.Color := clMoneyGreen
      else
        Canvas.Brush.Color := clSilver;

      Canvas.FillRect(Rect);
      DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
  end;
end;

procedure TfrmTemplate.dsPadraoStateChange(Sender: TObject);
begin
  btnInserir.Enabled := not(dsPadrao.State = dsInsert);
  btnEditar.Enabled := not(dsPadrao.State = dsEdit);
  btnCancelar.Enabled := dsPadrao.State in [dsInsert, dsEdit];
  btnSalvar.Enabled := dsPadrao.State in [dsInsert, dsEdit];
  btnExcluir.Enabled := dsPadrao.State = dsBrowse;
  pnlCadastro.Enabled := dsPadrao.State in [dsInsert, dsEdit];
end;

procedure TfrmTemplate.EditarRegistro;
begin
  FDPadrao.Edit;
  pgPrincipal.ActivePage := tsPadrao;
end;

procedure TfrmTemplate.Excluir;
begin
  if TfrmMensagens.ShowMessage('4') then
    FDPadrao.Delete;
end;

procedure TfrmTemplate.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmTemplate.FormCreate(Sender: TObject);
begin
  InitializeForm;
end;

procedure TfrmTemplate.FormShow(Sender: TObject);
begin
  FDPadrao.Active := True;
end;

function TfrmTemplate.GetSQLPadrao: string;
begin
  Result := '';
end;

procedure TfrmTemplate.InitializeForm;
begin
  //
end;

procedure TfrmTemplate.InserirRegistro;
begin
  FDPadrao.Append;
  pgPrincipal.ActivePage := tsPadrao;
end;

procedure TfrmTemplate.Salvar;
begin
  FDPadrao.Post;
end;

end.
