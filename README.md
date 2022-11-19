# BrasilAPI4D

Esse é um componente que consome de forma bem simples os endpoints da [BrasilAPI](https://brasilapi.com.br/docs#) . Os Serviços implementados são:

* [Bank - Informações sobre sistema bancário](https://brasilapi.com.br/docs#tag/BANKS)
* [CEP - Busca por CEP com múltiplos providers de fallback.](https://brasilapi.com.br/docs#tag/CEP)
* [CNPJ - Busca por CNPJ na API Minha Receita.](https://brasilapi.com.br/docs#tag/CNPJ)
* [DDD - Retorna estado e lista de cidades por DDD](https://brasilapi.com.br/docs#tag/DDD)
* [Feriados Nacionais - Lista os feriados nacionais de determinado ano.](https://brasilapi.com.br/docs#tag/Feriados-Nacionais)
* [FIPE - Lista as marcas de veículos referente ao tipo de veículo](https://brasilapi.com.br/docs#tag/FIPE)
* [IBGE - Retorna os municípios da unidade federativa](https://brasilapi.com.br/docs#tag/IBGE)
* [ISBN - Informações sobre o livro a partir do ISBN](https://brasilapi.com.br/docs#tag/ISBN)
* [NCM - Retorna informações de todos os NCMs](https://brasilapi.com.br/docs#tag/NCM)
* [Registros de Domínio BR - Avalia o status de um dominio .br](https://brasilapi.com.br/docs#tag/REGISTRO-BR)
* [Taxas - Retorna as taxas de juros e alguns índices oficiais do Brasil](https://brasilapi.com.br/docs#tag/TAXAS)

## ⚙️ Instalação 

### Instalação do projeto via [boss](https://github.com/HashLoad/boss): 
``` sh  
 $ boss install github.com/gabrielbaltazar/brasilapi4D
 ```

## Declaração de Uses
``` pascal 
uses 
    Brasil4D;
```


## ⚡️ Exemplo Bank 

### Listar Todos
``` pascal  
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
```

### Buscar Pelo Codigo
``` pascal  
Brasil4D1.Bank.Busca.Code := 1;
Brasil4D1.Bank.Busca.Executar;

mmoBankResponse.Lines.Clear;
mmoBankResponse.Lines.Add('ISPB: ' + Brasil4D1.Bank.Busca.Retorno.ISPB);
mmoBankResponse.Lines.Add('Name: ' + Brasil4D1.Bank.Busca.Retorno.Name);
mmoBankResponse.Lines.Add('Code: ' + Brasil4D1.Bank.Busca.Retorno.Code.ToString);
mmoBankResponse.Lines.Add('Full Name: ' + Brasil4D1.Bank.Busca.Retorno.FullName);
```

## ⚡️ Exemplo CEP

``` pascal
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
```

## ⚡️ Exemplo CNPJ
``` pascal
Brasil4D1.CNPJ.CNPJ := edtCNPJ.Text;
Brasil4D1.CNPJ.Executar;

mmoCNPJResponse.Clear;
mmoCNPJResponse.Lines.Add('CNPJ: ' + Brasil4D1.CNPJ.Retorno.CNPJ);
mmoCNPJResponse.Lines.Add('Razão Social: ' + Brasil4D1.CNPJ.Retorno.RazaoSocial);
mmoCNPJResponse.Lines.Add('Nome Fantasia: ' + Brasil4D1.CNPJ.Retorno.NomeFantasia);
mmoCNPJResponse.Lines.Add('Cnae Descrição: ' + Brasil4D1.CNPJ.Retorno.CnaeFiscalDescricao);
```

## ⚡️ Exemplo DDD
``` pascal
var
  I: Integer;
begin
  mmoDDDResponse.Clear;
  Brasil4D1.DDD.DDD := 21;
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
```

## ⚡️ Exemplo Feriados Nacionais
``` pascal
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
```

## ⚡️ Exemplo FIPE
### Marcas
``` pascal
var
  I: Integer;
begin
  mmoFIPEResponse.Clear;
  Brasil4D1.FIPE.Marca.TipoVeiculo := tvCarros;
  Brasil4D1.FIPE.Marca.Executar;

  for I := 0 to Pred(Brasil4D1.FIPE.Marca.Retorno.Count) do
  begin
    mmoFIPEResponse.Lines.Add('Nome: ' + Brasil4D1.FIPE.Marca.Retorno[I].Nome);
    mmoFIPEResponse.Lines.Add('Valor: ' + Brasil4D1.FIPE.Marca.Retorno[I].Valor);
    mmoFIPEResponse.Lines.Add(EmptyStr);
  end;
end;
```

### Preços Veículos
``` pascal
var
  I: Integer;
begin
  mmoFIPEResponse.Clear;
  Brasil4D1.FIPE.Veiculo.CodigoFipe := edtFipeCodigo.Text;
  Brasil4D1.FIPE.Veiculo.Executar;

  for I := 0 to Pred(Brasil4D1.FIPE.Veiculo.Retorno.Count) do
  begin
    mmoFIPEResponse.Lines.Add('Modelo: ' + Brasil4D1.FIPE.Veiculo.Retorno[I].Modelo);
    mmoFIPEResponse.Lines.Add('Valor: ' + Brasil4D1.FIPE.Veiculo.Retorno[I].Valor);
    mmoFIPEResponse.Lines.Add('Marca: ' + Brasil4D1.FIPE.Veiculo.Retorno[I].Marca);
    mmoFIPEResponse.Lines.Add('Ano: ' + Brasil4D1.FIPE.Veiculo.Retorno[I].AnoModelo.ToString);
    mmoFIPEResponse.Lines.Add('Combustivel: ' + Brasil4D1.FIPE.Veiculo.Retorno[I].Combustivel);
    mmoFIPEResponse.Lines.Add('MesReferencia: ' + Brasil4D1.FIPE.Veiculo.Retorno[I].MesReferencia);
    mmoFIPEResponse.Lines.Add('Tipo Veículo: ' + Brasil4D1.FIPE.Veiculo.Retorno[I].TipoVeiculo.ToString);
    mmoFIPEResponse.Lines.Add(EmptyStr);
  end;
end;
```

### Tabelas Referencia
``` pascal
var
  I: Integer;
begin
  mmoFIPEResponse.Clear;
  Brasil4D1.FIPE.Tabela.Executar;

  for I := 0 to Pred(Brasil4D1.FIPE.Tabela.Retorno.Count) do
  begin
    mmoFIPEResponse.Lines.Add('Codigo: ' + Brasil4D1.FIPE.Tabela.Retorno[I].Codigo.ToString);
    mmoFIPEResponse.Lines.Add('Mes: ' + Brasil4D1.FIPE.Tabela.Retorno[I].Mes);
    mmoFIPEResponse.Lines.Add(EmptyStr);
  end;
end;
```

## ⚡️ Exemplo IBGE
### Listar Municípios
``` pascal
var
  I: Integer;
begin
  mmoIBGEResponse.Clear;
  Brasil4D1.IBGE.Municipios.SiglaUF := edtIBGEEstado.Text;
  Brasil4D1.IBGE.Municipios.Executar;

  for I := 0 to Pred(Brasil4D1.IBGE.Municipios.Retorno.Count) do
  begin
    mmoIBGEResponse.Lines.Add('Nome: ' + Brasil4D1.IBGE.Municipios.Retorno[I].Nome);
    mmoIBGEResponse.Lines.Add('Codigo IBGE: ' + Brasil4D1.IBGE.Municipios.Retorno[I].CodigoIBGE);
    mmoIBGEResponse.Lines.Add(EmptyStr);
  end;
end;
```

### Listar Estados
``` pascal
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
```

### Buscar Estado
``` pascal
mmoIBGEResponse.Clear;
Brasil4D1.IBGE.EstadosBusca.SiglaUF := edtIBGEEstado.Text;
Brasil4D1.IBGE.EstadosBusca.Executar;
mmoIBGEResponse.Lines.Add('Nome: ' + Brasil4D1.IBGE.EstadosBusca.Retorno.Nome);
mmoIBGEResponse.Lines.Add('Sigla: ' + Brasil4D1.IBGE.EstadosBusca.Retorno.Sigla);
mmoIBGEResponse.Lines.Add('Nome Região: ' + Brasil4D1.IBGE.EstadosBusca.Retorno.NomeRegiao);
mmoIBGEResponse.Lines.Add('Sigla Região: ' + Brasil4D1.IBGE.EstadosBusca.Retorno.SiglaRegiao);
```

## ⚡️ Exemplo ISBN
``` pascal
Brasil4D1.ISBN.ISBN := edtISBN.Text;
Brasil4D1.ISBN.Executar;

mmoISBNResponse.Lines.Add('ISBN: ' + Brasil4D1.ISBN.Retorno.ISBN);
mmoISBNResponse.Lines.Add('Title: ' + Brasil4D1.ISBN.Retorno.Title);
mmoISBNResponse.Lines.Add('Subtitle: ' + Brasil4D1.ISBN.Retorno.Subtitle);
```

## ⚡️ Exemplo NCM
### Listar Todos
``` pascal
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
```

### Listar Por Codigo
``` pascal
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
```

### Listar Por Descricao
``` pascal
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
```

### Buscar NCM
``` pascal
mmoNCMResponse.Clear;
Brasil4D1.NCM.Busca.Codigo := edtNCMDescricao.Text;
Brasil4D1.NCM.Lista.Executar;

mmoNCMResponse.Lines.Add('Código: ' + Brasil4D1.NCM.Busca.Retorno.Codigo);
mmoNCMResponse.Lines.Add('Descrição: ' + Brasil4D1.NCM.Busca.Retorno.Descricao);
mmoNCMResponse.Lines.Add('Número Ato: ' + Brasil4D1.NCM.Busca.Retorno.NumeroAto);
mmoNCMResponse.Lines.Add('Ano Ato: ' + Brasil4D1.NCM.Busca.Retorno.AnoAto);
```

## ⚡️ Exemplo Registro BR
``` pascal
mmoRegistroBRResponse.Clear;
Brasil4D1.RegistroBR.Domain := edtDominio.Text;
Brasil4D1.RegistroBR.Executar;

mmoRegistroBRResponse.Lines.Add('Fqdn: ' + Brasil4D1.RegistroBR.Retorno.Fqdn);
mmoRegistroBRResponse.Lines.Add('Status Code: ' + Brasil4D1.RegistroBR.Retorno.StatusCode.ToString);
mmoRegistroBRResponse.Lines.Add('Status: ' + Brasil4D1.RegistroBR.Retorno.Status);
mmoRegistroBRResponse.Lines.Add('Publication Status: ' + Brasil4D1.RegistroBR.Retorno.PublicationStatus);
```

## ⚡️ Exemplo Taxas
### Buscar Por Nome
``` pascal
mmoTaxasResponse.Clear;
Brasil4D1.Taxas.Busca.Nome := edtTaxasNome.Text;
Brasil4D1.Taxas.Busca.Executar;

mmoTaxasResponse.Lines.Add('Nome: ' + Brasil4D1.Taxas.Busca.Retorno.Nome);
mmoTaxasResponse.Lines.Add('Valor: ' + Brasil4D1.Taxas.Busca.Retorno.Valor.ToString);
```

### Listar Todos
``` pascal
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
```
