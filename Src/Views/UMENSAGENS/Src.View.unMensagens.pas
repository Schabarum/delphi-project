unit Src.View.unMensagens;

interface

uses
  Winapi.Windows, Winapi.Messages, Vcl.Imaging.pngimage, System.SysUtils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  System.Classes, Vcl.Graphics, System.Variants, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmMensagens = class(TForm)
    pnlFundo: TPanel;
    shpFundo: TShape;
    Panel1: TPanel;
    lblCaption: TLabel;
    imgIcon: TImage;
    lblTitulo: TLabel;
    lblMensagem: TLabel;
    pnlButtons: TPanel;
    pnlSim: TPanel;
    btnSim: TSpeedButton;
    pnlNao: TPanel;
    btnNao: TSpeedButton;
    FDMensagem: TFDQuery;
    procedure btnSimClick(Sender: TObject);
    procedure btnNaoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure SetMessage(CodigoMessage: string);
    function GetSQLPadrao(CodigoMessage: string): string;
  public
    FCaptionWindow, FTitleMessage, FMessage, FTypeMsg: string;
    FConfirmaOk: Boolean;
    class function ShowMessage(Codigo: string): Boolean;
  end;

var
  frmMensagens: TfrmMensagens;

implementation

{$R *.dfm}

uses Src.DataAcess.dmPrincipal;

procedure TfrmMensagens.btnNaoClick(Sender: TObject);
begin
  FConfirmaOk := False;
  Close;
end;

procedure TfrmMensagens.btnSimClick(Sender: TObject);
begin
  FConfirmaOk := True;
  Close;
end;

procedure TfrmMensagens.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmMensagens.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btnSimClick(Self)
  else if Key = VK_ESCAPE then
    btnNaoClick(Self);
end;

procedure TfrmMensagens.FormShow(Sender: TObject);
begin
  FConfirmaOk := False;

  lblCaption.Caption := FCaptionWindow;
  lblTitulo.Caption := FTitleMessage;
  lblMensagem.Caption := FMessage;

  if FTypeMsg = 'OK' then
  begin
    pnlNao.Visible := False;
    btnSim.Caption := 'OK (ENTER)';
    imgIcon.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) +
      'Icons\OK.png');
  end;

  if FTypeMsg = 'ERRO' then
  begin
    pnlNao.Visible := True;
    btnSim.Caption := 'SIM (ENTER)';
    imgIcon.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) +
      'Icons\Error.png');
  end;

  if FTypeMsg = 'DELETE' then
  begin
    pnlNao.Visible := True;
    btnSim.Caption := 'SIM (ENTER)';
    imgIcon.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) +
      'Icons\Delete.png');
  end;

  if FTypeMsg = 'WARNING' then
  begin
    pnlNao.Visible := False;
    btnSim.Caption := 'OK (ENTER)';
    imgIcon.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) +
      'Icons\Warning.png');
  end;
end;

function TfrmMensagens.GetSQLPadrao(CodigoMessage: string): string;
begin
  Result := 'SELECT TITULO_FRAME, TITULO_MSG, MSGTEXTO, TYPE_MSG  ' +
    ' FROM MENSAGEM WHERE CODMENSAGEM = ' + CodigoMessage;
end;

procedure TfrmMensagens.SetMessage(CodigoMessage: string);
begin
  FDMensagem.SQL.Add(GetSQLPadrao(CodigoMessage));
  FDMensagem.Open;
  FCaptionWindow := FDMensagem.FieldByName('TITULO_FRAME').AsString;
  FTitleMessage := FDMensagem.FieldByName('TITULO_MSG').AsString;
  FMessage := FDMensagem.FieldByName('MSGTEXTO').AsString;
  FTypeMsg := FDMensagem.FieldByName('TYPE_MSG').AsString;
end;

class function TfrmMensagens.ShowMessage(Codigo: string): Boolean;
var
  vForm: TfrmMensagens;
begin
  vForm := TfrmMensagens.Create(nil);
  try
    vForm.SetMessage(Codigo);
    vForm.ShowModal;
    Result := vForm.FConfirmaOk;
  finally
    vForm.free;
  end;
end;

end.
