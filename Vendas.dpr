program Vendas;

uses
  Vcl.Forms,
  uPedidoVendas in 'uPedidoVendas.pas' {FormPedidoVendas},
  uDMVendas in 'uDMVendas.pas' {DMVendas: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPedidoVendas, FormPedidoVendas);
  Application.CreateForm(TDMVendas, DMVendas);
  Application.Run;
end.
