inherited frmCliente: TfrmCliente
  Caption = 'frmCliente'
  PixelsPerInch = 96
  TextHeight = 15
  inherited pgPrincipal: TPageControl
    inherited tsPadrao: TTabSheet
      inherited pnlCadastro: TPanel
        object lblCodigo: TLabel
          Left = 16
          Top = 11
          Width = 96
          Height = 15
          Caption = 'C'#243'digo do Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object lblNome: TLabel
          Left = 16
          Top = 61
          Width = 71
          Height = 15
          Caption = 'Nome cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object lblCPF: TLabel
          Left = 16
          Top = 117
          Width = 21
          Height = 15
          Caption = 'CPF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object lblMunicipio: TLabel
          Left = 16
          Top = 171
          Width = 54
          Height = 15
          Caption = 'Munic'#237'pio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object lkpMunicipio: TDBLookupComboBox
          Left = 16
          Top = 192
          Width = 145
          Height = 23
          DataField = 'CODMUNICIPIO'
          DataSource = dsPadrao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          KeyField = 'CODMUNICIPIO'
          ListField = 'NOME'
          ListSource = dsLKP
          ParentFont = False
          TabOrder = 0
        end
        object edtCodigo: TDBEdit
          Left = 16
          Top = 32
          Width = 121
          Height = 23
          DataField = 'CODCLIENTE'
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
          Top = 82
          Width = 377
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
        object edtCPF: TDBEdit
          Left = 16
          Top = 138
          Width = 121
          Height = 23
          DataField = 'CPF'
          DataSource = dsPadrao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
      end
    end
    inherited tsListagem: TTabSheet
      inherited dbgPadrao: TDBGrid
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
        Columns = <
          item
            Expanded = False
            FieldName = 'CODCLIENTE'
            ReadOnly = True
            Title.Caption = 'C'#243'digo do Cliente'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            ReadOnly = True
            Title.Caption = 'Nome'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CPF'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODMUNICIPIO'
            Title.Caption = 'C'#243'digo do munic'#237'pio'
            Visible = True
          end>
      end
      inherited pnlNavigator: TPanel
        inherited btnBusca: TSpeedButton
          AlignWithMargins = True
          Left = 383
          Top = 3
          Height = 19
          OnClick = btnBuscaClick
          ExplicitLeft = 383
          ExplicitTop = 3
          ExplicitHeight = 19
        end
        inherited btnExportPDF: TSpeedButton
          ExplicitLeft = 181
          ExplicitTop = -6
        end
        inherited edtBusca: TLabeledEdit
          EditLabel.ExplicitLeft = 224
          EditLabel.ExplicitTop = 3
          EditLabel.ExplicitWidth = 37
          OnKeyDown = edtBuscaKeyDown
        end
      end
    end
  end
  inherited pnlTop: TPanel
    inherited Label1: TLabel
      Width = 106
      Caption = 'Cadastro do cliente'
      ExplicitWidth = 106
    end
  end
  inherited dsPadrao: TDataSource
    Left = 356
  end
  object dsLKP: TDataSource [4]
    DataSet = FDLKP
    Left = 356
    Top = 277
  end
  object FDLKP: TFDQuery [5]
    Connection = dmPrincipal.FDConnection1
    Left = 316
    Top = 270
  end
end
