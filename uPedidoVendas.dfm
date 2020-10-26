object FormPedidoVendas: TFormPedidoVendas
  Left = 0
  Top = 0
  Caption = 'Pedido de Vendas'
  ClientHeight = 473
  ClientWidth = 727
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 49
    Width = 727
    Height = 97
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 740
    object Label1: TLabel
      Left = 13
      Top = 44
      Width = 41
      Height = 13
      Caption = 'N'#250'mero:'
    end
    object Label2: TLabel
      Left = 197
      Top = 44
      Width = 68
      Height = 13
      Caption = 'Data Emiss'#227'o:'
    end
    object Label3: TLabel
      Left = 13
      Top = 70
      Width = 37
      Height = 13
      Caption = 'Cliente:'
    end
    object LabelClie: TLabel
      Left = 119
      Top = 70
      Width = 12
      Height = 13
      Caption = '...'
    end
    object StaticText1: TStaticText
      Left = 1
      Top = 1
      Width = 725
      Height = 36
      Align = alTop
      Alignment = taCenter
      Caption = 'Pedido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Arial Rounded MT Bold'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      ExplicitWidth = 738
    end
    object MaskEditDataEmis: TMaskEdit
      Left = 280
      Top = 41
      Width = 73
      Height = 21
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
    end
    object EditCodClie: TEdit
      Left = 56
      Top = 64
      Width = 49
      Height = 21
      Alignment = taRightJustify
      TabOrder = 2
      OnChange = EditCodClieChange
      OnKeyPress = EditCodClieKeyPress
    end
    object btnSalvar: TBitBtn
      Left = 556
      Top = 66
      Width = 75
      Height = 25
      Caption = 'Confirmar'
      TabOrder = 3
      OnClick = btnSalvarClick
    end
    object btnCancelar: TBitBtn
      Left = 635
      Top = 66
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 4
      OnClick = btnCancelarClick
    end
    object btnExcluir: TBitBtn
      Left = 398
      Top = 66
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 5
      Visible = False
      OnClick = btnExcluirClick
    end
    object btnAlterar: TBitBtn
      Left = 479
      Top = 66
      Width = 75
      Height = 25
      Caption = 'Alterar'
      TabOrder = 6
      Visible = False
      OnClick = btnAlterarClick
    end
    object StaticTextNPed: TStaticText
      Left = 60
      Top = 43
      Width = 16
      Height = 17
      Caption = '...'
      TabOrder = 7
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 146
    Width = 727
    Height = 280
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 2
    ExplicitWidth = 740
    object Label5: TLabel
      Left = 16
      Top = 44
      Width = 38
      Height = 13
      Caption = 'Produto'
    end
    object LabelProd: TLabel
      Left = 77
      Top = 64
      Width = 12
      Height = 13
      Caption = '...'
    end
    object Label7: TLabel
      Left = 328
      Top = 44
      Width = 56
      Height = 13
      Caption = 'Quantidade'
    end
    object Label8: TLabel
      Left = 408
      Top = 44
      Width = 64
      Height = 13
      Caption = 'Valor Unit'#225'rio'
    end
    object StaticText2: TStaticText
      Left = 2
      Top = 2
      Width = 723
      Height = 36
      Align = alTop
      Alignment = taCenter
      Caption = 'Itens'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Arial Rounded MT Bold'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      ExplicitWidth = 736
    end
    object btnConfirmar: TBitBtn
      Left = 504
      Top = 59
      Width = 75
      Height = 25
      Caption = 'Confirmar'
      TabOrder = 3
      Visible = False
      OnClick = btnConfirmarClick
    end
    object DBGrid1: TDBGrid
      Left = 16
      Top = 90
      Width = 694
      Height = 161
      DataSource = DMVendas.dtsPedido_Itens
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnKeyDown = DBGrid1KeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'sequencial'
          Title.Caption = 'Sequencial'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'numero_pedido'
          ReadOnly = True
          Title.Caption = 'N'#186' Pedido'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'codigo_produto'
          ReadOnly = True
          Title.Caption = 'C'#243'digo Produto'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Title.Caption = 'Produto'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantidade'
          ReadOnly = True
          Title.Caption = 'Quantidade'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor_unitario'
          ReadOnly = True
          Title.Caption = 'Valor  Unit'#225'rio'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor_total'
          ReadOnly = True
          Title.Caption = 'Valor Total'
          Width = 64
          Visible = True
        end>
    end
    object EditCodProd: TEdit
      Left = 13
      Top = 63
      Width = 49
      Height = 21
      Alignment = taRightJustify
      TabOrder = 0
      OnChange = EditCodProdChange
      OnExit = EditCodProdExit
      OnKeyPress = EditCodProdKeyPress
    end
    object EditQuant: TEdit
      Left = 328
      Top = 63
      Width = 56
      Height = 21
      Alignment = taRightJustify
      TabOrder = 1
      OnKeyPress = EditQuantKeyPress
    end
    object EditValUni: TEdit
      Left = 408
      Top = 63
      Width = 64
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      NumbersOnly = True
      ReadOnly = True
      TabOrder = 2
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 426
    Width = 727
    Height = 47
    Align = alBottom
    TabOrder = 3
    ExplicitWidth = 740
    object Label4: TLabel
      Left = 518
      Top = 19
      Width = 90
      Height = 13
      Caption = 'Valor Total Pedido:'
    end
    object EditTotPed: TEdit
      Left = 619
      Top = 15
      Width = 89
      Height = 21
      Alignment = taRightJustify
      TabOrder = 0
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 727
    Height = 49
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 740
    object LabelPesquisa: TLabel
      Left = 184
      Top = 18
      Width = 76
      Height = 13
      Caption = 'N'#250'mero Pedido:'
      Visible = False
    end
    object btnIncluir: TBitBtn
      Left = 13
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Incluir'
      TabOrder = 0
      OnClick = btnIncluirClick
    end
    object btnConsultar: TBitBtn
      Left = 94
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Consultar'
      TabOrder = 1
      OnClick = btnConsultarClick
    end
    object btnPesquisar: TBitBtn
      Left = 321
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 3
      Visible = False
      OnClick = btnPesquisarClick
    end
    object EditPesq: TEdit
      Left = 266
      Top = 14
      Width = 49
      Height = 21
      Alignment = taRightJustify
      TabOrder = 2
      Visible = False
      OnChange = EditCodClieChange
      OnKeyPress = EditPesqKeyPress
    end
  end
end
