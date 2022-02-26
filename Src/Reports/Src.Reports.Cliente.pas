unit Src.Reports.Cliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  Src.DataAcess.dmPrincipal, RLReport, RLXLSFilter, RLFilters, RLPDFFilter;

type
  TfrmClienteReport = class(TForm)
    dsReport: TDataSource;
    procedure rptMainBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClienteReport: TfrmClienteReport;

implementation

{$R *.dfm}

procedure TfrmClienteReport.rptMainBeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  zqReport.Active := True;
end;

end.
