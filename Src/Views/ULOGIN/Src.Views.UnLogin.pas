{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N-,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN SYMBOL_EXPERIMENTAL ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN UNIT_EXPERIMENTAL ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
{$WARN OPTION_TRUNCATED ON}
{$WARN WIDECHAR_REDUCED ON}
{$WARN DUPLICATES_IGNORED ON}
{$WARN UNIT_INIT_SEQ ON}
{$WARN LOCAL_PINVOKE ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN TYPEINFO_IMPLICITLY_ADDED ON}
{$WARN RLINK_WARNING ON}
{$WARN IMPLICIT_STRING_CAST ON}
{$WARN IMPLICIT_STRING_CAST_LOSS ON}
{$WARN EXPLICIT_STRING_CAST OFF}
{$WARN EXPLICIT_STRING_CAST_LOSS OFF}
{$WARN CVT_WCHAR_TO_ACHAR ON}
{$WARN CVT_NARROWING_STRING_LOST ON}
{$WARN CVT_ACHAR_TO_WCHAR ON}
{$WARN CVT_WIDENING_STRING_LOST ON}
{$WARN NON_PORTABLE_TYPECAST ON}
{$WARN XML_WHITESPACE_NOT_ALLOWED ON}
{$WARN XML_UNKNOWN_ENTITY ON}
{$WARN XML_INVALID_NAME_START ON}
{$WARN XML_INVALID_NAME ON}
{$WARN XML_EXPECTED_CHARACTER ON}
{$WARN XML_CREF_NO_RESOLVE ON}
{$WARN XML_NO_PARM ON}
{$WARN XML_NO_MATCHING_PARM ON}
{$WARN IMMUTABLE_STRINGS OFF}
unit Src.Views.UnLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Src.DataAcess.dmPrincipal,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, Vcl.Buttons, Data.DB, Src.Utils.UnUtils, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmLogin = class(TForm)
    pnlFundo: TPanel;
    pnlLeft: TPanel;
    lblWelcome: TLabel;
    lblNameSystem: TLabel;
    lblDireitosAutorais: TLabel;
    lblVersion: TLabel;
    imgLogo: TImage;
    pnlRight: TPanel;
    pnlPass: TPanel;
    lblPass: TLabel;
    pnlUser: TPanel;
    lblUser: TLabel;
    pnlUserPass: TPanel;
    lblUserPass: TLabel;
    edtUser: TEdit;
    edtPass: TEdit;
    pnlLineBaixo: TPanel;
    pnlButton: TPanel;
    btnLogin: TSpeedButton;
    btnClose: TSpeedButton;
    pnlLine: TPanel;
    pnlLinePass: TPanel;
    pnlLineUser: TPanel;
    FDLogin: TFDQuery;
    procedure btnCloseClick(Sender: TObject);
    procedure edtUserKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPassKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnLoginClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure edtUserEnter(Sender: TObject);
    procedure edtPassEnter(Sender: TObject);
    procedure edtUserExit(Sender: TObject);
    procedure edtPassExit(Sender: TObject);
  private
    FErroUser, FErroPass: Boolean;
    FErros: Integer;
    FUsuario: string;
    procedure SetError;
    function ValidaUsuario: Boolean;
    function ValidaPass: Boolean;
    function GetSQLPadrao(Usuario: string): string;
    function GetSQLPass(Senha: string): string;
    function GetSQLVariaveis: string;
    function ValidaErros: Boolean;
    function LoginIn: Boolean;
  public
    FLogou: Boolean;
    procedure SetDimForm;
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses Src.View.unMensagens, Src.Views.UnPrincipal;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
begin
  FLogou := False;
  if LoginIn then
  begin
    FLogou := True;
    ModalResult := mrOk;
  end;
end;

procedure TfrmLogin.edtPassEnter(Sender: TObject);
begin
  edtPass.Color := $00FFD9C1;
end;

procedure TfrmLogin.edtPassExit(Sender: TObject);
begin
  edtPass.Color := clWindow;
end;

procedure TfrmLogin.edtPassKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btnLoginClick(Sender);

  if FErroPass then
    if Length(edtPass.Text) > 0 then
      edtPass.Color := clWindow;
end;

procedure TfrmLogin.edtUserEnter(Sender: TObject);
begin
  edtUser.Color := $00FFD9C1;
end;

procedure TfrmLogin.edtUserExit(Sender: TObject);
begin
  edtUser.Color := clWindow;
end;

procedure TfrmLogin.edtUserKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if FErroUser then
  begin
    if Length(edtUser.Text) > 0 then
      edtUser.Color := clWindow;
  end;
end;

procedure TfrmLogin.FormResize(Sender: TObject);
begin
  SetDimForm;
end;

function TfrmLogin.GetSQLPadrao(Usuario: string): string;
begin
  Result := 'SELECT USULOGIN FROM LOGIN WHERE UPPER(USUARIO) = ' +
    QuotedStr(UpperCase((Usuario)));
end;

function TfrmLogin.GetSQLPass(Senha: string): string;
begin
  Result := 'SELECT COUNT(1) AS OK FROM LOGIN WHERE ATIVO = ''S'' AND USULOGIN = '
    + QuotedStr(FUsuario) + ' AND SENHA = ' + QuotedStr(Senha);
end;

function TfrmLogin.GetSQLVariaveis: string;
begin
  Result := 'SELECT LOGIN.USULOGIN, LOGIN.USUARIO, LOGIN.ATIVO FROM LOGIN ' +
    ' WHERE LOGIN.USULOGIN = ' + QuotedStr(FUsuario);
end;

function TfrmLogin.LoginIn: Boolean;
begin
  Result := False;
  if ValidaUsuario then
  begin
    if ValidaPass then
      Result := True;
  end;
end;

procedure TfrmLogin.SetDimForm;
begin
  pnlFundo.Left := (ClientWidth - pnlFundo.Width) div 2;
  pnlFundo.Top := (ClientHeight - pnlFundo.Height) div 2;
end;

procedure TfrmLogin.SetError;
begin
  edtPass.Clear;
  edtPass.SetFocus;
  edtPass.Color := $008080FF;
end;

function TfrmLogin.ValidaErros: Boolean;
begin
  Result := False;
  FErros := FErros + 1;
  if FErros in [0, 1, 2] then
  begin
    SetError;
    TfrmMensagens.ShowMessage('9');
  end
  else if FErros = 3 then
  begin
    SetError;
    TfrmMensagens.ShowMessage('6');
  end
  else if FErros = 3 then
  begin
    SetError;
    TfrmMensagens.ShowMessage('9');
  end
  else if FErros = 5 then
  begin
    TfrmMensagens.ShowMessage('7');
    Application.Terminate;
  end;
  Result := True;
end;

function TfrmLogin.ValidaPass: Boolean;
begin
  if edtPass.Text = '' then
  begin
    TfrmMensagens.ShowMessage('8');
    edtPass.SetFocus;
    edtPass.Color := $008080FF;
    FErroPass := True;
    Result := False;
    Exit;
  end;

  if FDLogin.Active then
    FDLogin.Close;

  FDLogin.SQL.Clear;
  FDLogin.SQL.Add(GetSQLPass(edtPass.Text));
  FDLogin.Open;
  if FDLogin.FieldByName('OK').AsString = '1' then
    Result := True
  else
    ValidaErros;
end;

function TfrmLogin.ValidaUsuario: Boolean;
begin
  if edtUser.Text = '' then
  begin
    TfrmMensagens.ShowMessage('5');
    edtUser.SetFocus;
    edtUser.Color := $008080FF;
    FErroUser := True;
    Result := False;
    Exit;
  end;

  if FDLogin.Active then
    FDLogin.Close;

  FDLogin.SQL.Clear;
  FDLogin.SQL.Add(GetSQLPadrao(edtUser.Text));
  FDLogin.Open;
  FUsuario := FDLogin.FieldByName('USULOGIN').AsString;
  if not FUsuario.IsEmpty then
    Result := True;
end;

procedure TfrmLogin.btnCloseClick(Sender: TObject);
begin
  FLogou := False;
  Close;
end;

end.
