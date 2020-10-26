unit uPedidoVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls, FireDAC.Stan.Param;

type
  TFormPedidoVendas = class(TForm)
    Panel1: TPanel;
    StaticText1: TStaticText;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LabelClie: TLabel;
    Panel2: TPanel;
    StaticText2: TStaticText;
    Panel3: TPanel;
    Label4: TLabel;
    EditTotPed: TEdit;
    Label5: TLabel;
    LabelProd: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    btnConfirmar: TBitBtn;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    btnIncluir: TBitBtn;
    btnConsultar: TBitBtn;
    LabelPesquisa: TLabel;
    btnPesquisar: TBitBtn;
    MaskEditDataEmis: TMaskEdit;
    EditCodClie: TEdit;
    EditCodProd: TEdit;
    EditQuant: TEdit;
    EditValUni: TEdit;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    btnExcluir: TBitBtn;
    btnAlterar: TBitBtn;
    EditPesq: TEdit;
    StaticTextNPed: TStaticText;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure EditCodClieChange(Sender: TObject);
    procedure EditCodClieKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EditCodProdChange(Sender: TObject);
    procedure EditCodProdKeyPress(Sender: TObject; var Key: Char);
    procedure EditQuantKeyPress(Sender: TObject; var Key: Char);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure EditPesqKeyPress(Sender: TObject; var Key: Char);
    procedure btnConfirmarClick(Sender: TObject);
    procedure EditCodProdExit(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    vAcaoBotao: string[1];
    vAcaoDet: string[1];

  public
    { Public declarations }
    pSeq: integer;
  end;

var
  FormPedidoVendas: TFormPedidoVendas;

implementation

uses uDMVendas;

{$R *.dfm}

procedure TFormPedidoVendas.btnAlterarClick(Sender: TObject);
begin
  // altera dados cabeçalho
  // coloca  label pesquisar, edit pesquisar e botão  pesquisar Visible false
  LabelPesquisa.Visible := False;
  EditPesq.Visible      := False;
  btnPesquisar.Visible  := False;
  btnSalvar.Visible     := True;
  btnCancelar.Visible   := True;
  vAcaoBotao := 'A';
  MaskEditDataEmis.SetFocus;
end;

procedure TFormPedidoVendas.btnCancelarClick(Sender: TObject);
begin
  btnSalvar.Visible   := False;
  btnCancelar.Visible := False;
  btnAlterar.Visible  := True;
  btnExcluir.Visible  := True;
end;

procedure TFormPedidoVendas.btnConfirmarClick(Sender: TObject);
begin
  // passa valores para parametros da procedure do banco

  with DMVendas.FDStoredProcPedido_Itens do
  begin
    ParamByName('pnumero_pedido').AsInteger  := strtoint(StaticTextNPed.Caption);
    ParamByName('pcodigo_produto').AsInteger := strtoint(EditCodProd.Text);
    ParamByName('pquantidade').AsInteger     := strtoint(EditQuant.Text);
    ParamByName('pvalor_unitario').AsBCD     := strtofloat(EditValUni.Text);
    ParamByName('pvalor_total').AsBCD        := strtoint(EditQuant.Text) * strtofloat(EditValUni.Text);
    if vAcaoDet = 'A' then
    begin
      ParamByName('psequencial').AsInteger     := pseq;
      ParamByName('pacaod').AsString           := 'A';
    end
    else
    begin
      ParamByName('psequencial').AsInteger     := 0;
      ParamByName('pacaod').AsString           := 'I';
    end;
    Execute;

  end;

  if vAcaoDet <> 'A' then
  begin
    with DMVendas.qryUltimoItemPedido do
    begin
      close;
      ParamByName('pnumero_pedido').AsInteger  := strtoint(StaticTextNPed.Caption);
      open;
      Last;
    end;
  end;

  with DMVendas.qryPedido_Itens do
  begin
    close;
    ParamByName('pnumero_pedido').AsInteger := strtoint(StaticTextNPed.Caption);
    open;
  end;
  DBGrid1.Repaint;
  if vAcaoDet = 'A' then
  begin
    vAcaoDet := '';
    DBgrid1.Columns[4].ReadOnly := True;
    DBgrid1.Columns[5].ReadOnly := True;
    DBgrid1.Columns[4].Color    := clWhite;
    DBgrid1.Columns[5].Color    := clWhite;
    DBGrid1.Options := DBGrid1.Options - [dgEditing];
  end;
end;

procedure TFormPedidoVendas.btnConsultarClick(Sender: TObject);
begin
  // consultar dados cabeçalho e dados detalhe do pedido
  // coloca  label pesquisar, edit pesquisar e botão  pesquisar Visible true
  LabelPesquisa.Visible := True;
  EditPesq.Visible      := True;
  btnPesquisar.Visible  := True;
  btnSalvar.Visible     := False;
  btnCancelar.Visible   := False;
  vAcaoBotao := 'C';
  EditPesq.SetFocus;
end;

procedure TFormPedidoVendas.btnExcluirClick(Sender: TObject);
begin
  // excluir dados cabeçalho e dados detalhe do pedido
  btnSalvar.Visible     := False;
  btnCancelar.Visible   := False;
  if Application.MessageBox('Confirma Exclusão ?','Cuidado !!!',MB_YESNO +
                           MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES Then
  begin
    vAcaoBotao := 'E';
    // passa valores para parametros da procedure do banco
    with DMVendas.FDStoredProcPedido do
    begin
      ParamByName('pdata_emissao').AsDate      := null;
      ParamByName('pcodigo_cliente').AsInteger := null;
      ParamByName('pvalor_total').AsBCD        := null;
      ParamByName('pnumero_pedido').AsInteger  := strtoint(StaticTextNPed.Caption);
      ParamByName('pacao').AsString            := vAcaoBotao;
      Execute;
    end;
  end;
end;

procedure TFormPedidoVendas.btnIncluirClick(Sender: TObject);
begin
  // incluir dados cabeçalho do pedido
  // coloca  label pesquisar, edit pesquisar e botão  pesquisar Visible false
  LabelPesquisa.Visible := False;
  EditPesq.Visible      := False;
  btnPesquisar.Visible  := False;
  btnSalvar.Visible     := True;
  btnCancelar.Visible   := True;
  vAcaoBotao := 'I';
  MaskEditDataEmis.Text := DateToStr(Date());
  MaskEditDataEmis.setfocus;
end;

procedure TFormPedidoVendas.btnPesquisarClick(Sender: TObject);
begin
  with DMVendas.qryPedido do
  begin
    close;
    ParamByName('pnumero_pedido').AsInteger := strtoint(EditPesq.Text);
    open;
    if RecordCount > 0 then
    begin
      btnExcluir.Visible := True;
      btnAlterar.Visible := True;
      StaticTextNPed.Caption := inttostr(FieldByname('numero_pedido').AsInteger);
      MaskEditDataEmis.Text  := FormatDateTime('DD/MM/YYYY', FieldByname('data_emissao').AsDateTime);
      EditCodClie.Text       := inttostr(FieldByname('codigo_cliente').AsInteger);
      EditCodClie.onChange(self);
      close;
      with DMVendas.qryPedido_Itens do
      begin
        close;
        ParamByName('pnumero_pedido').AsInteger := strtoint(EditPesq.Text);
        open;
      end;
    end
    else
    begin
      btnExcluir.Visible := False;
      btnAlterar.Visible := False;
    end;
  end;
end;

procedure TFormPedidoVendas.btnSalvarClick(Sender: TObject);
begin
  // salva no banco de dados
  // passa valores para parametros da procedure do banco
  with DMVendas.FDStoredProcPedido do
  begin
    ParamByName('pdata_emissao').AsDate       := strtodate(MaskEditDataEmis.Text);
    ParamByName('pcodigo_cliente').AsInteger  := strtoint(EditCodClie.Text);
    if vAcaoBotao = 'A' then
    begin
      ParamByName('pvalor_total').AsBCD       := strtofloat(EditTotPed.Text);
      ParamByName('pnumero_pedido').AsInteger := strtoint(StaticTextNPed.Caption);
    end
    else
    if vAcaoBotao = 'I' then
    begin
      ParamByName('pvalor_total').AsBCD       := 0;
      ParamByName('pnumero_pedido').AsInteger := 0;
    end;
    ParamByName('pacao').AsString             := vAcaoBotao;
    Execute;
  end;

  if vAcaoBotao = 'I' then
  begin
    with DMVendas.qryUltimoPedido do
    begin
      close;
      open;
      Last;
      StaticTextNPed.Caption := inttostr(FieldByname('UltimoPedido').AsInteger);
      StaticTextNPed.Repaint;
    end;
  end;
  btnSalvar.Visible   := False;
  btnCancelar.Visible := False;
  btnAlterar.Visible  := True;
  btnExcluir.Visible  := True;
end;

procedure TFormPedidoVendas.DBGrid1KeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    vAcaoDet := 'A';
    DBGrid1.Options := DBGrid1.Options + [dgEditing];
    DBgrid1.Columns[4].ReadOnly := False;
    DBgrid1.Columns[5].ReadOnly := False;
    DBgrid1.Columns[4].Color    := clTeal;
    DBgrid1.Columns[5].Color    := clTeal;
    btnConfirmar.Visible        := True;
  end
  else
  if Key = VK_DELETE then // del
  begin
    // passa valores para parametros da procedure do banco
    if Application.MessageBox('Confirma Exclusão ?','Cuidado !!!',MB_YESNO +
                             MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES Then
    begin
      with DMVendas.FDStoredProcPedido_Itens do
      begin
        ParamByName('pnumero_pedido').AsInteger  := strtoint(StaticTextNPed.Caption);
        ParamByName('pcodigo_produto').AsInteger := strtoint(EditCodProd.Text);
        ParamByName('pquantidade').AsInteger     := strtoint(EditQuant.Text);
        ParamByName('pvalor_unitario').AsBCD     := strtofloat(EditValUni.Text);
        ParamByName('pvalor_total').AsBCD        := strtoint(EditQuant.Text) * strtofloat(EditValUni.Text);
        ParamByName('psequencial').AsInteger     := pseq;
        ParamByName('pacaod').AsString           := 'E';
        Execute;
      end;
      with DMVendas.qryPedido_Itens do
      begin
        close;
        ParamByName('pnumero_pedido').AsInteger := strtoint(StaticTextNPed.Caption);
        open;
      end;
      DBGrid1.Repaint;
    end;
  end;
end;

procedure TFormPedidoVendas.EditQuantKeyPress(Sender: TObject; var Key: Char);
begin
if not CharInSet(key, ['0'..'9',#8]) then
   key := #0;
end;

procedure TFormPedidoVendas.EditCodClieChange(Sender: TObject);
begin
  // pesquisa nome cliente
  with DMVendas.qryConsultaCliente do
  begin
    close;
    Params.ParamByName('codigo').AsString := EditCodClie.Text;
    open;
    LabelClie.Caption := FieldByName('nome').AsString;
  end;
end;

procedure TFormPedidoVendas.EditCodClieKeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet(key, ['0'..'9',#8]) then
    key := #0;
end;

procedure TFormPedidoVendas.EditCodProdChange(Sender: TObject);
begin
  // pesquisa nome produto
  if trim(EditCodProd.Text) <> '0'  then
  begin
    with DMVendas.qryConsultaProduto do
    begin
      close;
      Params.ParamByName('codigo').AsString := EditCodProd.Text;
      open;
      LabelProd.Caption := FieldByName('descricao').AsString;
      EditValUni.Text := FormatFloat('0.00', (StrToFloat(FieldByname('preco_venda').AsString)));
    end;
  end;
end;

procedure TFormPedidoVendas.EditCodProdExit(Sender: TObject);
begin
  if (trim(EditCodProd.Text) = '') or (trim(EditCodProd.Text) = '0') then
     btnConfirmar.Visible := False
  else
     btnConfirmar.Visible := True;
end;

procedure TFormPedidoVendas.EditCodProdKeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet(key, ['0'..'9',#8]) then
     key := #0;
end;

procedure TFormPedidoVendas.EditPesqKeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet(key, ['0'..'9',#8]) then
     key := #0;
end;

procedure TFormPedidoVendas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

end.
