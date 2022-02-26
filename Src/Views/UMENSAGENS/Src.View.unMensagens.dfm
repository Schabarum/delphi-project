object frmMensagens: TfrmMensagens
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 297
  ClientWidth = 651
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 651
    Height = 297
    Align = alClient
    TabOrder = 0
    object shpFundo: TShape
      Left = 1
      Top = 1
      Width = 649
      Height = 295
      Align = alClient
      ExplicitHeight = 249
    end
    object lblCaption: TLabel
      Left = 23
      Top = 12
      Width = 93
      Height = 28
      Caption = 'ATEN'#199#195'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object imgIcon: TImage
      Left = 31
      Top = 72
      Width = 178
      Height = 137
      Center = True
    end
    object lblTitulo: TLabel
      Left = 231
      Top = 72
      Width = 69
      Height = 28
      Caption = 'T'#205'TULO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object lblMensagem: TLabel
      Left = 231
      Top = 106
      Width = 157
      Height = 17
      Caption = 'Mensagem para o Usu'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object Panel1: TPanel
      Left = 0
      Top = 49
      Width = 650
      Height = 1
      BevelOuter = bvNone
      Color = -1
      ParentBackground = False
      TabOrder = 0
    end
    object pnlButtons: TPanel
      Left = 384
      Top = 232
      Width = 241
      Height = 41
      BevelOuter = bvNone
      TabOrder = 1
      object pnlSim: TPanel
        Left = 0
        Top = 0
        Width = 121
        Height = 41
        Align = alLeft
        BevelOuter = bvNone
        Color = 16024898
        ParentBackground = False
        TabOrder = 0
        object btnSim: TSpeedButton
          Left = 0
          Top = 0
          Width = 121
          Height = 41
          Cursor = crHandPoint
          Align = alClient
          Caption = 'SIM (ENTER)'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = btnSimClick
          ExplicitLeft = 24
          ExplicitWidth = 129
        end
      end
      object pnlNao: TPanel
        Left = 120
        Top = 0
        Width = 121
        Height = 41
        Align = alRight
        BevelOuter = bvNone
        Color = clSilver
        ParentBackground = False
        TabOrder = 1
        object btnNao: TSpeedButton
          Left = 0
          Top = 0
          Width = 121
          Height = 41
          Cursor = crHandPoint
          Align = alClient
          Caption = 'N'#195'O (ESC)'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = btnNaoClick
          ExplicitLeft = 32
          ExplicitWidth = 125
        end
      end
    end
  end
  object FDMensagem: TFDQuery
    Connection = dmPrincipal.FDConnection1
    Left = 552
    Top = 120
  end
end
