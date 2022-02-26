unit Src.Views.UnVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Forms,
  Vcl.Controls, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.Imaging.jpeg,
  Src.DataAcess.dmPrincipal, Src.Utils.UnUtils, Vcl.Menus, System.Actions,
  Vcl.ActnList, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmVendas = class(TForm)
    pnlBase: TPanel;
    pnlRight: TPanel;
    pnlFundo: TPanel;
    pnlHeader: TPanel;
    pnlProduto: TPanel;
    pnlLogo: TPanel;
    pnlButtons: TPanel;
    pnlItems: TPanel;
    pnlQuantidade: TPanel;
    pnlValor: TPanel;
    pnlHeaderDentro: TPanel;
    lkpProduto: TDBLookupComboBox;
    lblProduto: TLabel;
    lblValor: TLabel;
    lblQtd: TLabel;
    pnlLogoDentro: TPanel;
    pnlButtonsHeader: TPanel;
    pnlTopItens: TPanel;
    pnlGridItens: TPanel;
    pnlBaixoItens: TPanel;
    dbgItem: TDBGrid;
    imgLogo: TImage;
    lkpCliente: TDBLookupComboBox;
    lblCodigoVenda: TLabel;
    lblCliente: TLabel;
    lblTitle: TLabel;
    lblDev: TLabel;
    lblVersion: TLabel;
    dsVenda: TDataSource;
    dsItem: TDataSource;
    dsProduto: TDataSource;
    dsCliente: TDataSource;
    pnlRightButtons: TPanel;
    btnCancelarItem: TSpeedButton;
    btnNovoItem: TSpeedButton;
    pnlLeftButtons: TPanel;
    btnCancelar: TSpeedButton;
    btnVenda: TSpeedButton;
    btnFinalizar: TSpeedButton;
    pnlNavigator: TPanel;
    btnFirstRecord: TSpeedButton;
    btnLeftRecord: TSpeedButton;
    btnRightRecord: TSpeedButton;
    btnLastRecord: TSpeedButton;
    btnRefresh: TSpeedButton;
    btnExport: TSpeedButton;
    btnZebrarGrid: TSpeedButton;
    pmGrid: TPopupMenu;
    ExcluirItem1: TMenuItem;
    lblTotal: TLabel;
    edtValorTOT: TDBEdit;
    ExcluirVenda1: TMenuItem;
    actButtons: TActionList;
    actVenda: TAction;
    actCancelar: TAction;
    actNovoItem: TAction;
    actCancelarItem: TAction;
    actFinalizar: TAction;
    edtVenda: TDBEdit;
    edtQuantidade: TDBEdit;
    edtValor: TDBEdit;
    FDVenda: TFDQuery;
    FDItem: TFDQuery;
    FDProduto: TFDQuery;
    FDCliente: TFDQuery;
    procedure edtVendaChange(Sender: TObject);
    procedure dsVendaStateChange(Sender: TObject);
    procedure btnVendaClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnFirstRecordClick(Sender: TObject);
    procedure btnLeftRecordClick(Sender: TObject);
    procedure btnRightRecordClick(Sender: TObject);
    procedure btnLastRecordClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure btnZebrarGridClick(Sender: TObject);
    procedure dbgItemDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dsItemStateChange(Sender: TObject);
    procedure lkpClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure zqItemNewRecord(DataSet: TDataSet);
    procedure btnNovoItemClick(Sender: TObject);
    procedure btnCancelarItemClick(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure lkpProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtQuantidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ExcluirItem1Click(Sender: TObject);
    procedure ExcluirVenda1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure zqVendaBeforePost(DataSet: TDataSet);
    procedure zqItemBeforePost(DataSet: TDataSet);
  private
    FZebra: Boolean;
    function GetSQLItem: string;
  public
    { Public declarations }
  end;

var
  frmVendas: TfrmVendas;

implementation

{$R *.dfm}

procedure TfrmVendas.btnCancelarClick(Sender: TObject);
begin
  FDVenda.Cancel;
end;

procedure TfrmVendas.btnCancelarItemClick(Sender: TObject);
begin
  FDItem.Cancel;
end;

procedure TfrmVendas.btnExportClick(Sender: TObject);
begin
  TExport.ExportXLS(FDVenda);
end;

procedure TfrmVendas.btnFinalizarClick(Sender: TObject);
begin
  FDItem.Post;
  if lkpProduto.Text = '' then
  begin
    FDItem.Cancel;
    FDItem.Refresh;
  end;
  FDVenda.Refresh;
end;

procedure TfrmVendas.btnFirstRecordClick(Sender: TObject);
begin
  FDVenda.First;
end;

procedure TfrmVendas.btnLastRecordClick(Sender: TObject);
begin
  FDVenda.Last;
end;

procedure TfrmVendas.btnLeftRecordClick(Sender: TObject);
begin
  FDVenda.Prior;
end;

procedure TfrmVendas.btnNovoItemClick(Sender: TObject);
begin
  FDItem.Append;
  lkpProduto.SetFocus;
end;

procedure TfrmVendas.btnRefreshClick(Sender: TObject);
begin
  FDVenda.Refresh;
end;

procedure TfrmVendas.btnRightRecordClick(Sender: TObject);
begin
  FDVenda.Next;
end;

procedure TfrmVendas.btnVendaClick(Sender: TObject);
begin
  FDVenda.Append;
  lkpCliente.SetFocus;
end;

procedure TfrmVendas.btnZebrarGridClick(Sender: TObject);
begin
  if FZebra then
    FZebra := False
  else
    FZebra := True;
  FDItem.Refresh;
end;

procedure TfrmVendas.dbgItemDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if FZebra then
  begin
    with dbgItem do
    begin
      if odd(dsItem.DataSet.RecNo) then
        Canvas.Brush.Color := clMoneyGreen
      else
        Canvas.Brush.Color := clWhite;

      Canvas.FillRect(Rect);
      DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
  end;
end;

procedure TfrmVendas.dsItemStateChange(Sender: TObject);
begin
  pnlLeftButtons.Enabled := not(dsItem.State in [dsEdit, dsInsert]);
  pnlItems.Enabled := dsItem.State in [dsEdit, dsInsert];
  pnlProduto.Enabled := dsItem.State in [dsEdit, dsInsert];
  btnNovoItem.Enabled := not(dsItem.State = dsInsert);
  btnCancelarItem.Enabled := dsItem.State in [dsEdit, dsInsert];
  btnFinalizar.Enabled := dsItem.State in [dsEdit, dsInsert];
end;

procedure TfrmVendas.dsVendaStateChange(Sender: TObject);
begin
  pnlTopItens.Enabled := dsVenda.State = dsInsert;
  pnlRightButtons.Enabled := not(dsVenda.State = dsInsert);
  btnCancelar.Enabled := dsVenda.State = dsInsert;
  btnVenda.Enabled := not(dsVenda.State = dsInsert);
end;

procedure TfrmVendas.edtQuantidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key in [VK_RETURN, VK_TAB] then
    edtValor.SetFocus;
end;

procedure TfrmVendas.edtValorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key in [VK_RETURN, VK_TAB] then
  begin
    FDItem.Post;
    FDItem.Append;
    lkpProduto.SetFocus;
    FDVenda.Refresh;
  end;
end;

procedure TfrmVendas.edtVendaChange(Sender: TObject);
var
  vTeste: string;
begin
  if FDVenda.Active then
  begin
    FDItem.SQL.Clear;
    FDItem.SQL.Add(GetSQLItem);
    FDItem.ParamByName('VENDA').Value :=
      FDVenda.FieldByName('CODVENDA').AsString;
    vTeste := FDItem.SQL.Text;
    FDItem.Open;
  end;
end;

procedure TfrmVendas.ExcluirItem1Click(Sender: TObject);
begin
  FDItem.Delete;
end;

procedure TfrmVendas.ExcluirVenda1Click(Sender: TObject);
var
  vSQL: string;
begin
  vSQL := 'DELETE FROM VENDAITEM WHERE CODVENDA = ' + edtVenda.Text;
  dmPrincipal.FDQuery.SQL.Clear;
  dmPrincipal.FDQuery.SQL.Add(vSQL);
  dmPrincipal.FDQuery.ExecSQL;
  FDVenda.Delete;
end;

procedure TfrmVendas.FormShow(Sender: TObject);
begin
  FDVenda.Open;
  FDCliente.Open;
  FDProduto.Open;
end;

function TfrmVendas.GetSQLItem: string;
begin
  Result := ' SELECT CODVENDAITEM, CODVENDA, CODPRODUTO, QUANTIDADE, VALOR FROM VENDAITEM '
    + ' WHERE CODVENDA = :VENDA';
end;

procedure TfrmVendas.lkpClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key in [VK_RETURN, VK_TAB] then
  begin
    FDVenda.FieldByName('VALORTOTAL').AsString := '0';
    FDVenda.Post;
    FDItem.Append;
    lkpProduto.SetFocus;
  end;
end;

procedure TfrmVendas.lkpProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key in [VK_RETURN, VK_TAB] then
    edtQuantidade.SetFocus;
end;

procedure TfrmVendas.zqItemBeforePost(DataSet: TDataSet);
begin
  FDItem.FieldByName('CODVENDAITEM').AsInteger :=
    dmPrincipal.GetSequence('SEQ_VENDAITEM');
end;

procedure TfrmVendas.zqItemNewRecord(DataSet: TDataSet);
begin
  FDItem.FieldByName('CODVENDA').AsString :=
    FDVenda.FieldByName('CODVENDA').AsString;
end;

procedure TfrmVendas.zqVendaBeforePost(DataSet: TDataSet);
begin
  FDVenda.FieldByName('CODVENDA').AsFloat :=
    dmPrincipal.GetSequence('SEQ_VENDA');
end;

end.
