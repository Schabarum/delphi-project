inherited frmMunicipio: TfrmMunicipio
  Caption = 'frmMunicipio'
  PixelsPerInch = 96
  TextHeight = 15
  inherited pgPrincipal: TPageControl
    inherited tsPadrao: TTabSheet
      inherited pnlCadastro: TPanel
        object lblCodigo: TLabel
          Left = 16
          Top = 16
          Width = 113
          Height = 15
          Caption = 'C'#243'digo do municipio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object lblMunicipio: TLabel
          Left = 16
          Top = 72
          Width = 90
          Height = 15
          Caption = 'Nome municipio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object lblUF: TLabel
          Left = 16
          Top = 128
          Width = 14
          Height = 15
          Caption = 'UF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object cbbUF: TDBComboBox
          Left = 16
          Top = 149
          Width = 145
          Height = 23
          DataField = 'UF'
          DataSource = dsPadrao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Items.Strings = (
            'AC'
            'AL'
            'AP'
            'AM'
            'BA'
            'CE'
            'DF'
            'ES'
            'GO'
            'MA'
            'MT'
            'MS'
            'MG'
            'PA'
            'PB'
            'PR'
            'PE'
            'PI'
            'RJ'
            'RN'
            'RS'
            'RO'
            'RR'
            'SC'
            'SP'
            'SE'
            'TO')
          ParentFont = False
          TabOrder = 0
        end
        object edtCodigo: TDBEdit
          Left = 16
          Top = 37
          Width = 121
          Height = 23
          DataField = 'CODMUNICIPIO'
          DataSource = dsPadrao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object edtNome: TDBEdit
          Left = 16
          Top = 93
          Width = 369
          Height = 23
          DataField = 'NOME'
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
            FieldName = 'CODMUNICIPIO'
            Title.Caption = 'C'#243'digo do municipio'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'Nome'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UF'
            Visible = True
          end>
      end
      inherited pnlNavigator: TPanel
        inherited btnBusca: TSpeedButton
          OnClick = btnBuscaClick
        end
        inherited edtBusca: TLabeledEdit
          OnKeyDown = edtBuscaKeyDown
        end
      end
    end
  end
  inherited pnlTop: TPanel
    inherited Label1: TLabel
      Width = 122
      Caption = 'Cadastro de munic'#237'pio'
      ExplicitWidth = 122
    end
  end
  inherited pnlButtons: TPanel
    inherited btnEditar: TSpeedButton
      ExplicitLeft = 54
    end
  end
  inherited dsPadrao: TDataSource
    DataSet = nil
  end
end
