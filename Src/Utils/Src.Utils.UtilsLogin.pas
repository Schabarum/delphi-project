unit Src.Utils.UtilsLogin;

interface

uses Src.DataAcess.dmPrincipal, Src.Views.UnLogin, Src.View.unMensagens;

type
  TSistema = class
  public
    class function Iniciou: boolean;
  end;

implementation

uses
  Vcl.Controls;

{ TSistema }

class function TSistema.Iniciou: boolean;
var
  vForm: TfrmLogin;
begin
  vForm := TfrmLogin.Create(nil);
  try
    if vForm.ShowModal = mrOk then
      Result := vForm.FLogou;
  finally
    vForm.Free;
  end;
end;

end.
