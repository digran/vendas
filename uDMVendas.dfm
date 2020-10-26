object DMVendas: TDMVendas
  OldCreateOrder = False
  Height = 330
  Width = 479
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=vendas'
      'User_Name=root'
      'Password=26081971'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 8
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 152
    Top = 8
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Program Files (x86)\MySQL\MySQL Server 5.7\lib\libmysql.dll'
    Left = 272
    Top = 8
  end
  object qryConsultaCliente: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from clientes'
      'where codigo = :codigo')
    Left = 48
    Top = 80
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftString
        ParamType = ptInput
        Value = '%%'
      end>
    object qryConsultaClientecodigo: TFDAutoIncField
      FieldName = 'codigo'
      Origin = 'codigo'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryConsultaClientenome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object qryConsultaClientecidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cidade'
      Origin = 'cidade'
      Size = 50
    end
    object qryConsultaClienteuf: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'uf'
      Origin = 'uf'
      FixedChar = True
      Size = 2
    end
  end
  object qryConsultaProduto: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from produtos'
      'where codigo = :codigo')
    Left = 280
    Top = 80
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftString
        ParamType = ptInput
        Value = '%%'
      end>
    object qryConsultaProdutocodigo: TFDAutoIncField
      FieldName = 'codigo'
      Origin = 'codigo'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryConsultaProdutodescricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 100
    end
    object qryConsultaProdutopreco_venda: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'preco_venda'
      Origin = 'preco_venda'
      Precision = 15
      Size = 2
    end
  end
  object qryPedido: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from pedidos'
      'where numero_pedido = :pnumero_pedido')
    Left = 40
    Top = 144
    ParamData = <
      item
        Name = 'PNUMERO_PEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryPedidonumero_pedido: TFDAutoIncField
      FieldName = 'numero_pedido'
      Origin = 'numero_pedido'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryPedidodata_emissao: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'data_emissao'
      Origin = 'data_emissao'
    end
    object qryPedidocodigo_cliente: TIntegerField
      FieldName = 'codigo_cliente'
      Origin = 'codigo_cliente'
      Required = True
    end
    object qryPedidovalor_total: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valor_total'
      Origin = 'valor_total'
      Precision = 15
      Size = 2
    end
  end
  object qryPedido_Itens: TFDQuery
    MasterSource = dtsPedido
    MasterFields = 'numero_pedido'
    Connection = FDConnection1
    SQL.Strings = (
      'select pedidos_itens.*, produtos.descricao from pedidos_itens'
      
        'inner join produtos on (pedidos_itens.codigo_produto = produtos.' +
        'codigo)'
      'where numero_pedido = :pnumero_pedido')
    Left = 248
    Top = 144
    ParamData = <
      item
        Name = 'PNUMERO_PEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryPedido_Itenssequencial: TFDAutoIncField
      FieldName = 'sequencial'
      Origin = 'sequencial'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryPedido_Itensnumero_pedido: TIntegerField
      FieldName = 'numero_pedido'
      Origin = 'numero_pedido'
      Required = True
    end
    object qryPedido_Itenscodigo_produto: TIntegerField
      FieldName = 'codigo_produto'
      Origin = 'codigo_produto'
      Required = True
    end
    object qryPedido_Itensdescricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryPedido_Itensquantidade: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'quantidade'
      Origin = 'quantidade'
    end
    object qryPedido_Itensvalor_unitario: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valor_unitario'
      Origin = 'valor_unitario'
      Precision = 15
      Size = 2
    end
    object qryPedido_Itensvalor_total: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valor_total'
      Origin = 'valor_total'
      Precision = 15
      Size = 2
    end
  end
  object dtsConsultaCliente: TDataSource
    DataSet = qryConsultaCliente
    Left = 144
    Top = 80
  end
  object dtsConsultaProduto: TDataSource
    DataSet = qryConsultaProduto
    Left = 384
    Top = 80
  end
  object dtsPedido: TDataSource
    DataSet = qryPedido
    Left = 112
    Top = 144
  end
  object dtsPedido_Itens: TDataSource
    DataSet = qryPedido_Itens
    OnDataChange = dtsPedido_ItensDataChange
    Left = 328
    Top = 144
  end
  object FDStoredProcPedido: TFDStoredProc
    Connection = FDConnection1
    StoredProcName = 'vendas.pedido'
    Left = 48
    Top = 216
    ParamData = <
      item
        Position = 1
        Name = 'pnumero_pedido'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'pdata_emissao'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'pcodigo_cliente'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'pvalor_total'
        DataType = ftBCD
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'pacao'
        DataType = ftFixedChar
        ParamType = ptInput
        Size = 1
      end>
  end
  object qryUltimoPedido: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select max(numero_pedido) as ultimopedido from pedidos'
      '')
    Left = 208
    Top = 216
    object qryUltimoPedidoultimopedido: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ultimopedido'
      Origin = 'ultimopedido'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object qryUltimoItemPedido: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select max(sequencial) as ultimoitempedido from pedidos_itens'
      'where numero_pedido = :pnumero_pedido '
      '')
    Left = 304
    Top = 216
    ParamData = <
      item
        Name = 'PNUMERO_PEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryUltimoItemPedidoultimoitempedido: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ultimoitempedido'
      Origin = 'ultimoitempedido'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object FDStoredProcPedido_Itens: TFDStoredProc
    Connection = FDConnection1
    StoredProcName = 'vendas.pedido_itens'
    Left = 64
    Top = 280
    ParamData = <
      item
        Position = 1
        Name = 'psequencial'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'pnumero_pedido'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'pcodigo_produto'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'pquantidade'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'pvalor_unitario'
        DataType = ftBCD
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'pvalor_total'
        DataType = ftBCD
        Precision = 15
        NumericScale = 2
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'pacaod'
        DataType = ftFixedChar
        ParamType = ptInput
        Size = 1
      end>
  end
  object qryValorTotalPedido: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select sum(valor_total) as valor_total_pedido from pedidos_itens'
      'where numero_pedido = :pnumero_pedido ')
    Left = 240
    Top = 272
    ParamData = <
      item
        Name = 'PNUMERO_PEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryValorTotalPedidovalor_total_pedido: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valor_total_pedido'
      Origin = 'valor_total_pedido'
      ProviderFlags = []
      ReadOnly = True
      Precision = 37
      Size = 2
    end
  end
end
