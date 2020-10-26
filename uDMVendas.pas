unit uDMVendas;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.UI, Data.DB,
  FireDAC.Stan.Param, FireDAC.Comp.DataSet;

type
  TDMVendas = class(TDataModule)
    FDConnection1: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    qryConsultaCliente: TFDQuery;
    qryConsultaClientecodigo: TFDAutoIncField;
    qryConsultaClientenome: TStringField;
    qryConsultaClientecidade: TStringField;
    qryConsultaClienteuf: TStringField;
    qryConsultaProduto: TFDQuery;
    qryConsultaProdutocodigo: TFDAutoIncField;
    qryConsultaProdutodescricao: TStringField;
    qryConsultaProdutopreco_venda: TBCDField;
    qryPedido: TFDQuery;
    qryPedido_Itens: TFDQuery;
    dtsConsultaCliente: TDataSource;
    dtsConsultaProduto: TDataSource;
    dtsPedido: TDataSource;
    dtsPedido_Itens: TDataSource;
    qryPedidonumero_pedido: TFDAutoIncField;
    qryPedidodata_emissao: TDateField;
    qryPedidocodigo_cliente: TIntegerField;
    qryPedidovalor_total: TBCDField;
    qryPedido_Itenssequencial: TFDAutoIncField;
    qryPedido_Itensnumero_pedido: TIntegerField;
    qryPedido_Itenscodigo_produto: TIntegerField;
    qryPedido_Itensquantidade: TIntegerField;
    qryPedido_Itensvalor_unitario: TBCDField;
    qryPedido_Itensvalor_total: TBCDField;
    FDStoredProcPedido: TFDStoredProc;
    qryUltimoPedido: TFDQuery;
    qryPedido_Itensdescricao: TStringField;
    qryUltimoItemPedido: TFDQuery;
    FDStoredProcPedido_Itens: TFDStoredProc;
    qryValorTotalPedido: TFDQuery;
    qryValorTotalPedidovalor_total_pedido: TFMTBCDField;
    qryUltimoPedidoultimopedido: TIntegerField;
    qryUltimoItemPedidoultimoitempedido: TIntegerField;
    procedure dtsPedido_ItensDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMVendas: TDMVendas;

implementation

uses uPedidoVendas;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMVendas.dtsPedido_ItensDataChange(Sender: TObject; Field: TField);
begin
  with FormPedidoVendas do
  begin
     // sequencia
     if DBgrid1.Fields[0].asInteger > 0 then
        pseq := DBgrid1.Fields[0].asInteger  // sequencia
     else
        pseq := 0;

     if DBgrid1.Fields[2].asInteger > 0 then
        EditCodProd.text := inttostr(DBgrid1.Fields[2].asInteger) // codigo_produto
     else
        EditCodProd.text := '0';

     if DBgrid1.Fields[4].asInteger > 0 then
        EditQuant.text := inttostr(DBgrid1.Fields[4].asInteger) // quantidade
     else
        EditQuant.text := '';

     if DBgrid1.Fields[5].asFloat > 0 then
        EditValUni.text  := floattostr(DBgrid1.Fields[5].asFloat) // valor_unitario
       else
        EditValUni.text := '';
  end;

  with qryValorTotalPedido do
  begin
    close;
    ParamByName('pnumero_pedido').AsInteger := strtoint(FormPedidoVendas.StaticTextNPed.Caption);
    open;
    FormPedidoVendas.EditTotPed.Text := floattostr(FieldByName('valor_total_pedido').AsFloat);
  end;
end;

end.
