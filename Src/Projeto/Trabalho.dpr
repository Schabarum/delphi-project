program Trabalho;

uses
  Vcl.Forms,
  Src.DataAcess.dmPrincipal in '..\DataAcess\Src.DataAcess.dmPrincipal.pas' {dmPrincipal: TDataModule},
  Src.Views.UnCliente in '..\Views\UCLIENTE\Src.Views.UnCliente.pas' {frmCliente},
  Src.Views.UnMunicipio in '..\Views\UMUNICIPIO\Src.Views.UnMunicipio.pas' {frmMunicipio},
  Src.Views.UnProduto in '..\Views\UPRODUTO\Src.Views.UnProduto.pas' {frmProduto},
  Src.View.unMensagens in '..\Views\UMENSAGENS\Src.View.unMensagens.pas' {frmMensagens},
  Src.Views.TemplateCadastro in '..\Views\UTEMPLATE\Src.Views.TemplateCadastro.pas' {frmTemplate},
  Src.Views.UnLogin in '..\Views\ULOGIN\Src.Views.UnLogin.pas' {frmLogin},
  Src.Views.UnPrincipal in '..\Views\UPRINCIPAL\Src.Views.UnPrincipal.pas' {frmPrincipal},
  Src.Utils.UnUtils in '..\Utils\Src.Utils.UnUtils.pas' {frmUtils},
  Src.Utils.UtilsLogin in '..\Utils\Src.Utils.UtilsLogin.pas',
  Src.Views.UnVendas in '..\Views\UVENDAS\Src.Views.UnVendas.pas' {frmVendas};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  if TSistema.Iniciou then
    Application.Run
  else
    TfrmMensagens.ShowMessage('2');

end.
