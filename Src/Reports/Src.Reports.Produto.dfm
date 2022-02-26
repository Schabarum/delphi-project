object frmProdutoReport: TfrmProdutoReport
  Left = 0
  Top = 0
  Caption = 'frmProdutoReport'
  ClientHeight = 441
  ClientWidth = 794
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 15
  object rptMain: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    DataSource = dsReport
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    BeforePrint = rptMainBeforePrint
    object bndHeader: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 48
      BandType = btHeader
      object lblHeader: TRLLabel
        Left = 280
        Top = 16
        Width = 142
        Height = 16
        Caption = 'Relat'#243'rio de Produtos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object bndColumnHeader: TRLBand
      Left = 38
      Top = 86
      Width = 718
      Height = 36
      BandType = btColumnHeader
      object lblCodigo: TRLLabel
        Left = 16
        Top = 14
        Width = 49
        Height = 16
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblDescricao: TRLLabel
        Left = 104
        Top = 14
        Width = 66
        Height = 16
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblValor: TRLLabel
        Left = 392
        Top = 14
        Width = 38
        Height = 16
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object bndDetail: TRLBand
      Left = 38
      Top = 122
      Width = 718
      Height = 32
      object RLDBText1: TRLDBText
        Left = 16
        Top = 9
        Width = 95
        Height = 16
        DataField = 'CODPRODUTO'
        DataSource = dsReport
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 104
        Top = 10
        Width = 80
        Height = 16
        DataField = 'DESCRICAO'
        DataSource = dsReport
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 392
        Top = 9
        Width = 48
        Height = 16
        DataField = 'VALOR'
        DataSource = dsReport
        Text = ''
      end
    end
    object bndFooter: TRLBand
      Left = 38
      Top = 154
      Width = 718
      Height = 47
      BandType = btFooter
      object sitDate: TRLSystemInfo
        Left = 24
        Top = 16
        Width = 60
        Height = 16
        Info = itFullDate
        Text = ''
      end
      object sitPag: TRLSystemInfo
        Left = 595
        Top = 16
        Width = 39
        Height = 16
        Alignment = taRightJustify
        Text = ''
      end
      object sitLastPage: TRLSystemInfo
        Left = 664
        Top = 16
        Width = 112
        Height = 16
        Info = itLastPageNumber
        Text = ''
      end
      object lblDE: TRLLabel
        Left = 640
        Top = 16
        Width = 18
        Height = 16
        Caption = 'de'
      end
      object lblPagina: TRLLabel
        Left = 537
        Top = 16
        Width = 52
        Height = 16
        Caption = 'P'#225'gina: '
      end
    end
  end
  object zqReport: TZQuery
    Connection = dmPrincipal.ZCPrincipal
    Active = True
    SQL.Strings = (
      'SELECT * FROM PRODUTO ORDER BY CODPRODUTO')
    Params = <>
    Left = 680
    Top = 40
  end
  object dsReport: TDataSource
    DataSet = zqReport
    Left = 608
    Top = 40
  end
end
