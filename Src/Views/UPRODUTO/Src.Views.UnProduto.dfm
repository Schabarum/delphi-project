inherited frmProduto: TfrmProduto
  Caption = 'frmProduto'
  PixelsPerInch = 96
  TextHeight = 15
  inherited pgPrincipal: TPageControl
    inherited tsPadrao: TTabSheet
      inherited pnlCadastro: TPanel
        ExplicitLeft = 16
        ExplicitTop = -26
        object Label2: TLabel
          Left = 24
          Top = 16
          Width = 102
          Height = 15
          Caption = 'C'#243'digo do produto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 24
          Top = 66
          Width = 51
          Height = 15
          Caption = 'Descri'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 24
          Top = 116
          Width = 26
          Height = 15
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object edtCodigo: TDBEdit
          Left = 24
          Top = 37
          Width = 121
          Height = 23
          DataField = 'CODPRODUTO'
          DataSource = dsPadrao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object edtDescricao: TDBEdit
          Left = 24
          Top = 87
          Width = 361
          Height = 23
          DataField = 'DESCRICAO'
          DataSource = dsPadrao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object edtValor: TDBEdit
          Left = 24
          Top = 137
          Width = 121
          Height = 23
          DataField = 'VALOR'
          DataSource = dsPadrao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
      end
    end
    inherited tsListagem: TTabSheet
      inherited dbgPadrao: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'CODPRODUTO'
            Title.Caption = 'C'#243'digo do produto'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'Descri'#231#227'o'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR'
            Title.Caption = 'Valor'
            Visible = True
          end>
      end
      inherited pnlNavigator: TPanel
        inherited btnBusca: TSpeedButton
          OnClick = btnBuscaClick
          ExplicitLeft = 391
          ExplicitTop = -6
          ExplicitHeight = 25
        end
        inherited edtBusca: TLabeledEdit
          OnKeyDown = edtBuscaKeyDown
        end
      end
    end
  end
  inherited pnlTop: TPanel
    inherited Label1: TLabel
      Width = 113
      Caption = 'Cadastro de produto'
      ExplicitWidth = 113
    end
  end
  inherited dsPadrao: TDataSource
    DataSet = nil
  end
end
