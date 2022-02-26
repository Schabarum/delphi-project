unit Src.Reports.Produto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Src.DataAcess.dmPrincipal, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TfrmProdutoReport = class(TForm)
    rptMain: TRLReport;
    bndHeader: TRLBand;
    bndColumnHeader: TRLBand;
    bndDetail: TRLBand;
    bndFooter: TRLBand;
    lblHeader: TRLLabel;
    lblCodigo: TRLLabel;
    lblDescricao: TRLLabel;
    lblValor: TRLLabel;
    zqReport: TZQuery;
    dsReport: TDataSource;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    sitDate: TRLSystemInfo;
    sitPag: TRLSystemInfo;
    sitLastPage: TRLSystemInfo;
    lblDE: TRLLabel;
    lblPagina: TRLLabel;
    procedure rptMainBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdutoReport: TfrmProdutoReport;

implementation

{$R *.dfm}

procedure TfrmProdutoReport.rptMainBeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  zqReport.Active := True;
end;

end.
