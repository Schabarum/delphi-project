unit Src.Views.UnPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, Vcl.Forms,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.Imaging.jpeg, Src.Views.UnVendas;

type
  TfrmPrincipal = class(TForm)
    pnlBase: TPanel;
    pnlButtons: TPanel;
    pnlImage: TPanel;
    pnlVerticalLine: TPanel;
    pnlTelas: TPanel;
    imgHorusIcon: TImage;
    lblSelecao: TLabel;
    lblMarket: TLabel;
    pnlIconMarket: TPanel;
    btnMarket: TSpeedButton;
    pnlCliente: TPanel;
    shpCliente: TShape;
    btnClientes: TSpeedButton;
    pnlProduto: TPanel;
    shpProduto: TShape;
    btnProduto: TSpeedButton;
    pnlMunicipio: TPanel;
    shpMunicipio: TShape;
    btnMunicipio: TSpeedButton;
    pnlLineCima: TPanel;
    pnlBaixo: TPanel;
    pnlLineBaixo: TPanel;
    lblDesenv: TLabel;
    pnlRightBoard: TPanel;
    pnlCenterBoard: TPanel;
    pnlLeftBoard: TPanel;
    btnClose: TSpeedButton;
    btnMaximize: TSpeedButton;
    btnMinimize: TSpeedButton;
    procedure btnCloseClick(Sender: TObject);
    procedure btnMinimizeClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnClientesClick(Sender: TObject);
    procedure btnMunicipioClick(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
    procedure btnMarketClick(Sender: TObject);
  private
    { Private declarations }
  public
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses Src.Views.UnCliente, Src.Views.UnMunicipio, Src.Views.UnProduto;

procedure TfrmPrincipal.btnClientesClick(Sender: TObject);
begin
  frmCliente := TfrmCliente.Create(Self);
  frmCliente.Parent := pnlTelas;
  frmCliente.Show;
end;

procedure TfrmPrincipal.btnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmPrincipal.btnMarketClick(Sender: TObject);
var
  vForm: TfrmVendas;
begin
  vForm := TfrmVendas.Create(nil);
  try
    vForm.ShowModal;
  finally
    vForm.free;
  end;
end;

procedure TfrmPrincipal.btnMinimizeClick(Sender: TObject);
begin
  Application.Minimize;
end;

procedure TfrmPrincipal.btnMunicipioClick(Sender: TObject);
begin
  frmMunicipio := tfrmMunicipio.Create(Self);
  frmMunicipio.Parent := pnlTelas;
  frmMunicipio.Show;
end;

procedure TfrmPrincipal.btnProdutoClick(Sender: TObject);
begin
  frmProduto := TfrmProduto.Create(Self);
  frmProduto.Parent := pnlTelas;
  frmProduto.Show;
end;

procedure TfrmPrincipal.FormResize(Sender: TObject);
begin
  inherited;
  pnlBase.Left := (ClientWidth - pnlBase.Width) div 2;
  pnlBase.Top := (ClientHeight - pnlBase.Height) div 2;
end;

end.
