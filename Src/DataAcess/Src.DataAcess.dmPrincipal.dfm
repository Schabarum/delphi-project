object dmPrincipal: TdmPrincipal
  OldCreateOrder = True
  Height = 298
  Width = 580
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\dev\Trabalho_Delphi\Src\db\BANCODELPHI.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    Left = 328
    Top = 128
  end
  object FDQuery: TFDQuery
    Connection = FDConnection1
    Left = 456
    Top = 128
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    VendorLib = 'C:\Program Files (x86)\Firebird\Firebird_2_5\bin\fbclient.dll'
    Left = 208
    Top = 128
  end
end
