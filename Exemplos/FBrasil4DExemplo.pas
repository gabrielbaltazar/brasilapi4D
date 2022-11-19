unit FBrasil4DExemplo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.DateUtils,
  Brasil4D, Vcl.ComCtrls;

type
  TfrmBrasil4DExemplo = class(TForm)
    Panel1: TPanel;
    Brasil4D1: TBrasil4D;
    pgcBrasilAPI: TPageControl;
    tsBank: TTabSheet;
    tsFeriadosNacionais: TTabSheet;
    Panel2: TPanel;
    Label1: TLabel;
    edtAno: TEdit;
    btnListar: TButton;
    mmoResponse: TMemo;
    Panel3: TPanel;
    Label2: TLabel;
    edtBankCode: TEdit;
    btnBankListar: TButton;
    btnBankBuscar: TButton;
    mmoBankResponse: TMemo;
    tsCEP: TTabSheet;
    Panel4: TPanel;
    Label3: TLabel;
    edtCep: TEdit;
    btnCEP: TButton;
    btnCepV2: TButton;
    mmoCepResponse: TMemo;
    tsCNPJ: TTabSheet;
    Panel5: TPanel;
    Label4: TLabel;
    edtCNPJ: TEdit;
    btnCNPJ: TButton;
    mmoCNPJResponse: TMemo;
    tsDDD: TTabSheet;
    Panel6: TPanel;
    Label5: TLabel;
    edtDDD: TEdit;
    btnDDD: TButton;
    mmoDDDResponse: TMemo;
    tsRegistroBR: TTabSheet;
    Panel7: TPanel;
    Label6: TLabel;
    edtDominio: TEdit;
    btnRegistroBR: TButton;
    mmoRegistroBRResponse: TMemo;
    tsISBN: TTabSheet;
    Panel8: TPanel;
    Label7: TLabel;
    edtISBN: TEdit;
    btnISBN: TButton;
    mmoISBNResponse: TMemo;
    tsTaxas: TTabSheet;
    Panel9: TPanel;
    Label8: TLabel;
    edtTaxasNome: TEdit;
    btnTaxasLista: TButton;
    btnTaxasBusca: TButton;
    mmoTaxasResponse: TMemo;
    tsNCM: TTabSheet;
    Panel10: TPanel;
    Label9: TLabel;
    edtNCMCodigo: TEdit;
    btnNCMListarTodos: TButton;
    btnNCMListaPeloCodigo: TButton;
    Label10: TLabel;
    edtNCMDescricao: TEdit;
    btnNCMListaPorDescricao: TButton;
    btnNCMBusca: TButton;
    mmoNCMResponse: TMemo;
    tsIBGE: TTabSheet;
    Panel11: TPanel;
    Label11: TLabel;
    edtIBGEEstado: TEdit;
    btnIBGEListarEstados: TButton;
    btnIBGEListarMunicipios: TButton;
    btnIBGEBuscaEstado: TButton;
    mmoIBGEResponse: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
    procedure btnBankBuscarClick(Sender: TObject);
    procedure btnBankListarClick(Sender: TObject);
    procedure btnCEPClick(Sender: TObject);
    procedure btnCepV2Click(Sender: TObject);
    procedure btnCNPJClick(Sender: TObject);
    procedure btnDDDClick(Sender: TObject);
    procedure btnRegistroBRClick(Sender: TObject);
    procedure btnISBNClick(Sender: TObject);
    procedure btnTaxasListaClick(Sender: TObject);
    procedure btnTaxasBuscaClick(Sender: TObject);
    procedure btnNCMListarTodosClick(Sender: TObject);
    procedure btnNCMListaPeloCodigoClick(Sender: TObject);
    procedure btnNCMListaPorDescricaoClick(Sender: TObject);
    procedure btnNCMBuscaClick(Sender: TObject);
    procedure btnIBGEListarMunicipiosClick(Sender: TObject);
    procedure btnIBGEListarEstadosClick(Sender: TObject);
  private
    { Private declarations }
  public
    destructor Destroy; override;
    { Public declarations }
  end;

var
  frmBrasil4DExemplo: TfrmBrasil4DExemplo;

implementation

{$R *.dfm}

procedure TfrmBrasil4DExemplo.btnBankBuscarClick(Sender: TObject);
begin
  Brasil4D1.Bank.Busca.Code := StrToIntDef(edtBankCode.Text, 1);
  Brasil4D1.Bank.Busca.Executar;

  mmoBankResponse.Lines.Clear;
  mmoBankResponse.Lines.Add('ISPB: ' + Brasil4D1.Bank.Busca.Retorno.ISPB);
  mmoBankResponse.Lines.Add('Name: ' + Brasil4D1.Bank.Busca.Retorno.Name);
  mmoBankResponse.Lines.Add('Code: ' + Brasil4D1.Bank.Busca.Retorno.Code.ToString);
  mmoBankResponse.Lines.Add('Full Name: ' + Brasil4D1.Bank.Busca.Retorno.FullName);
end;

procedure TfrmBrasil4DExemplo.btnBankListarClick(Sender: TObject);
var
  I: Integer;
begin
  Brasil4D1.Bank.Lista.Executar;
  mmoBankResponse.Lines.Clear;

  for I := 0 to Pred(Brasil4D1.Bank.Lista.Retorno.Count) do
  begin
    mmoBankResponse.Lines.Add(EmptyStr);
    mmoBankResponse.Lines.Add('ISPB: ' + Brasil4D1.Bank.Lista.Retorno[I].ISPB);
    mmoBankResponse.Lines.Add('Name: ' + Brasil4D1.Bank.Lista.Retorno[I].Name);
    mmoBankResponse.Lines.Add('Code: ' + Brasil4D1.Bank.Lista.Retorno[I].Code.ToString);
    mmoBankResponse.Lines.Add('Full Name: ' + Brasil4D1.Bank.Lista.Retorno[I].FullName);
  end;
end;

procedure TfrmBrasil4DExemplo.btnCEPClick(Sender: TObject);
begin
  Brasil4D1.CEP.Cep := edtCep.Text;
  Brasil4D1.CEP.Executar;

  mmoCepResponse.Clear;
  mmoCepResponse.Lines.Add('Cep: ' + Brasil4D1.CEP.Retorno.Cep);
  mmoCepResponse.Lines.Add('State: ' + Brasil4D1.CEP.Retorno.State);
  mmoCepResponse.Lines.Add('City: ' + Brasil4D1.CEP.Retorno.City);
  mmoCepResponse.Lines.Add('Neighborhood: ' + Brasil4D1.CEP.Retorno.Neighborhood);
  mmoCepResponse.Lines.Add('Street: ' + Brasil4D1.CEP.Retorno.Street);
  mmoCepResponse.Lines.Add('Service: ' + Brasil4D1.CEP.Retorno.Service);
end;

procedure TfrmBrasil4DExemplo.btnCepV2Click(Sender: TObject);
begin
  Brasil4D1.CEPV2.Cep := edtCep.Text;
  Brasil4D1.CEPV2.Executar;

  mmoCepResponse.Clear;
  mmoCepResponse.Lines.Add('Cep: ' + Brasil4D1.CEPV2.Retorno.Cep);
  mmoCepResponse.Lines.Add('State: ' + Brasil4D1.CEPV2.Retorno.State);
  mmoCepResponse.Lines.Add('City: ' + Brasil4D1.CEPV2.Retorno.City);
  mmoCepResponse.Lines.Add('Neighborhood: ' + Brasil4D1.CEPV2.Retorno.Neighborhood);
  mmoCepResponse.Lines.Add('Street: ' + Brasil4D1.CEPV2.Retorno.Street);
  mmoCepResponse.Lines.Add('Service: ' + Brasil4D1.CEPV2.Retorno.Service);
  mmoCepResponse.Lines.Add('Latitude: ' + Brasil4D1.CEPV2.Retorno.Latitude.ToString);
  mmoCepResponse.Lines.Add('Longitude: ' + Brasil4D1.CEPV2.Retorno.Longitude.ToString);
end;

procedure TfrmBrasil4DExemplo.btnCNPJClick(Sender: TObject);
begin
  Brasil4D1.CNPJ.CNPJ := edtCNPJ.Text;
  Brasil4D1.CNPJ.Executar;

  mmoCNPJResponse.Clear;
  mmoCNPJResponse.Lines.Add('CNPJ: ' + Brasil4D1.CNPJ.Retorno.CNPJ);
  mmoCNPJResponse.Lines.Add('Razão Social: ' + Brasil4D1.CNPJ.Retorno.RazaoSocial);
  mmoCNPJResponse.Lines.Add('Nome Fantasia: ' + Brasil4D1.CNPJ.Retorno.NomeFantasia);
  mmoCNPJResponse.Lines.Add('Cnae Descrição: ' + Brasil4D1.CNPJ.Retorno.CnaeFiscalDescricao);
end;

procedure TfrmBrasil4DExemplo.btnDDDClick(Sender: TObject);
var
  I: Integer;
begin
  mmoDDDResponse.Clear;
  Brasil4D1.DDD.DDD := StrToIntDef(edtDDD.Text, 21);
  Brasil4D1.DDD.Executar;

  mmoDDDResponse.Lines.Add('State: ' + Brasil4D1.DDD.Retorno.State);
  mmoDDDResponse.Lines.Add('Nome: ' + Brasil4D1.DDD.Retorno.Nome);
  mmoDDDResponse.Lines.Add('Id Região: ' + Brasil4D1.DDD.Retorno.Regiao.Id.ToString);
  mmoDDDResponse.Lines.Add('Sigla Região: ' + Brasil4D1.DDD.Retorno.Regiao.Sigla);
  mmoDDDResponse.Lines.Add('Nome Região: ' + Brasil4D1.DDD.Retorno.Regiao.Nome);

  mmoDDDResponse.Lines.Add('Cities');
  for I := 0 to Pred(Brasil4D1.DDD.Retorno.Cities.Count) do
    mmoDDDResponse.Lines.Add('  ' + Brasil4D1.DDD.Retorno.Cities[I]);
end;

procedure TfrmBrasil4DExemplo.btnIBGEListarEstadosClick(Sender: TObject);
var
  I: Integer;
begin
  mmoIBGEResponse.Clear;
  Brasil4D1.IBGE.EstadosLista.Executar;

  for I := 0 to Pred(Brasil4D1.IBGE.EstadosLista.Retorno.Count) do
  begin
    mmoIBGEResponse.Lines.Add('Nome: ' + Brasil4D1.IBGE.EstadosLista.Retorno[I].Nome);
    mmoIBGEResponse.Lines.Add('Sigla: ' + Brasil4D1.IBGE.EstadosLista.Retorno[I].Sigla);
    mmoIBGEResponse.Lines.Add('Nome Região: ' + Brasil4D1.IBGE.EstadosLista.Retorno[I].NomeRegiao);
    mmoIBGEResponse.Lines.Add('Sigla Região: ' + Brasil4D1.IBGE.EstadosLista.Retorno[I].SiglaRegiao);
    mmoIBGEResponse.Lines.Add(EmptyStr);
  end;
end;

procedure TfrmBrasil4DExemplo.btnIBGEListarMunicipiosClick(Sender: TObject);
var
  I: Integer;
begin
  mmoIBGEResponse.Clear;
  Brasil4D1.IBGE.Municipios.UF := edtIBGEEstado.Text;
  Brasil4D1.IBGE.Municipios.Executar;

  for I := 0 to Pred(Brasil4D1.IBGE.Municipios.Retorno.Count) do
  begin
    mmoIBGEResponse.Lines.Add('Nome: ' + Brasil4D1.IBGE.Municipios.Retorno[I].Nome);
    mmoIBGEResponse.Lines.Add('Codigo IBGE: ' + Brasil4D1.IBGE.Municipios.Retorno[I].CodigoIBGE);
    mmoIBGEResponse.Lines.Add(EmptyStr);
  end;
end;

procedure TfrmBrasil4DExemplo.btnISBNClick(Sender: TObject);
begin
  mmoISBNResponse.Clear;
  Brasil4D1.ISBN.ISBN := edtISBN.Text;
  Brasil4D1.ISBN.Executar;

  mmoISBNResponse.Lines.Add('ISBN: ' + Brasil4D1.ISBN.Retorno.ISBN);
  mmoISBNResponse.Lines.Add('Title: ' + Brasil4D1.ISBN.Retorno.Title);
  mmoISBNResponse.Lines.Add('Subtitle: ' + Brasil4D1.ISBN.Retorno.Subtitle);
end;

procedure TfrmBrasil4DExemplo.btnListarClick(Sender: TObject);
var
  I: Integer;
begin
  Brasil4D1.FeriadosNacionais.Lista.Ano := StrToIntDef(edtAno.Text, YearOf(Now));
  Brasil4D1.FeriadosNacionais.Lista.Executar;
  mmoResponse.Lines.Clear;
  for I := 0 to Pred(Brasil4D1.FeriadosNacionais.Lista.Retorno.Count) do
  begin
    mmoResponse.Lines.Add(EmptyStr);
    mmoResponse.Lines.Add('Data: ' + FormatDateTime('dd/MM/yyyy', Brasil4D1.FeriadosNacionais.Lista.Retorno[I].Date));
    mmoResponse.Lines.Add('Name: ' + Brasil4D1.FeriadosNacionais.Lista.Retorno[I].Name);
    mmoResponse.Lines.Add('Type: ' + Brasil4D1.FeriadosNacionais.Lista.Retorno[I].&Type);
  end;
end;

procedure TfrmBrasil4DExemplo.btnNCMBuscaClick(Sender: TObject);
begin
  mmoNCMResponse.Clear;
  Brasil4D1.NCM.Busca.Codigo := edtNCMDescricao.Text;
  Brasil4D1.NCM.Lista.Executar;

  mmoNCMResponse.Lines.Add('Código: ' + Brasil4D1.NCM.Busca.Retorno.Codigo);
  mmoNCMResponse.Lines.Add('Descrição: ' + Brasil4D1.NCM.Busca.Retorno.Descricao);
  mmoNCMResponse.Lines.Add('Número Ato: ' + Brasil4D1.NCM.Busca.Retorno.NumeroAto);
  mmoNCMResponse.Lines.Add('Ano Ato: ' + Brasil4D1.NCM.Busca.Retorno.AnoAto);
end;

procedure TfrmBrasil4DExemplo.btnNCMListaPeloCodigoClick(Sender: TObject);
var
  I: Integer;
begin
  mmoNCMResponse.Clear;
  Brasil4D1.NCM.Lista.Codigo := edtNCMCodigo.Text;
  Brasil4D1.NCM.Lista.Executar;

  for I := 0 to Pred(Brasil4D1.NCM.Lista.Retorno.Count) do
  begin
    mmoNCMResponse.Lines.Add('Código: ' + Brasil4D1.NCM.Lista.Retorno[I].Codigo);
    mmoNCMResponse.Lines.Add('Descrição: ' + Brasil4D1.NCM.Lista.Retorno[I].Descricao);
    mmoNCMResponse.Lines.Add('Número Ato: ' + Brasil4D1.NCM.Lista.Retorno[I].NumeroAto);
    mmoNCMResponse.Lines.Add('Ano Ato: ' + Brasil4D1.NCM.Lista.Retorno[I].AnoAto);
  end;
end;

procedure TfrmBrasil4DExemplo.btnNCMListaPorDescricaoClick(Sender: TObject);
var
  I: Integer;
begin
  mmoNCMResponse.Clear;
  Brasil4D1.NCM.Lista.Descricao := edtNCMDescricao.Text;
  Brasil4D1.NCM.Lista.Executar;

  for I := 0 to Pred(Brasil4D1.NCM.Lista.Retorno.Count) do
  begin
    mmoNCMResponse.Lines.Add('Código: ' + Brasil4D1.NCM.Lista.Retorno[I].Codigo);
    mmoNCMResponse.Lines.Add('Descrição: ' + Brasil4D1.NCM.Lista.Retorno[I].Descricao);
    mmoNCMResponse.Lines.Add('Número Ato: ' + Brasil4D1.NCM.Lista.Retorno[I].NumeroAto);
    mmoNCMResponse.Lines.Add('Ano Ato: ' + Brasil4D1.NCM.Lista.Retorno[I].AnoAto);
  end;
end;

procedure TfrmBrasil4DExemplo.btnNCMListarTodosClick(Sender: TObject);
var
  I: Integer;
begin
  mmoNCMResponse.Clear;
  Brasil4D1.NCM.Lista.Executar;

  for I := 0 to Pred(Brasil4D1.NCM.Lista.Retorno.Count) do
  begin
    mmoNCMResponse.Lines.Add('Código: ' + Brasil4D1.NCM.Lista.Retorno[I].Codigo);
    mmoNCMResponse.Lines.Add('Descrição: ' + Brasil4D1.NCM.Lista.Retorno[I].Descricao);
    mmoNCMResponse.Lines.Add('Número Ato: ' + Brasil4D1.NCM.Lista.Retorno[I].NumeroAto);
    mmoNCMResponse.Lines.Add('Ano Ato: ' + Brasil4D1.NCM.Lista.Retorno[I].AnoAto);
  end;
end;

procedure TfrmBrasil4DExemplo.btnRegistroBRClick(Sender: TObject);
begin
  mmoRegistroBRResponse.Clear;
  Brasil4D1.RegistroBR.Domain := edtDominio.Text;
  Brasil4D1.RegistroBR.Executar;

  mmoRegistroBRResponse.Lines.Add('Fqdn: ' + Brasil4D1.RegistroBR.Retorno.Fqdn);
  mmoRegistroBRResponse.Lines.Add('Status Code: ' + Brasil4D1.RegistroBR.Retorno.StatusCode.ToString);
  mmoRegistroBRResponse.Lines.Add('Status: ' + Brasil4D1.RegistroBR.Retorno.Status);
  mmoRegistroBRResponse.Lines.Add('Publication Status: ' + Brasil4D1.RegistroBR.Retorno.PublicationStatus);
end;

procedure TfrmBrasil4DExemplo.btnTaxasBuscaClick(Sender: TObject);
begin
  mmoTaxasResponse.Clear;
  Brasil4D1.Taxas.Busca.Nome := edtTaxasNome.Text;
  Brasil4D1.Taxas.Busca.Executar;

  mmoTaxasResponse.Lines.Add('Nome: ' + Brasil4D1.Taxas.Busca.Retorno.Nome);
  mmoTaxasResponse.Lines.Add('Valor: ' + Brasil4D1.Taxas.Busca.Retorno.Valor.ToString);
end;

procedure TfrmBrasil4DExemplo.btnTaxasListaClick(Sender: TObject);
var
  I: Integer;
begin
  mmoTaxasResponse.Clear;
  Brasil4D1.Taxas.Lista.Executar;

  for I := 0 to Pred(Brasil4D1.Taxas.Lista.Retorno.Count) do
  begin
    mmoTaxasResponse.Lines.Add('Nome: ' + Brasil4D1.Taxas.Lista.Retorno[I].Nome);
    mmoTaxasResponse.Lines.Add('Valor: ' + Brasil4D1.Taxas.Lista.Retorno[I].Valor.ToString);
    mmoTaxasResponse.Lines.Add(EmptyStr);
  end;
end;

destructor TfrmBrasil4DExemplo.Destroy;
begin
  inherited;
end;

procedure TfrmBrasil4DExemplo.FormCreate(Sender: TObject);
begin
  edtAno.Text := IntToStr(YearOf(Now));
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

end.
