unit Brasil4D.FIPE.Schemas;

interface

uses
  Brasil4D.Schemas,
  Brasil4D.Helper.JSON,
  System.JSON,
  System.SysUtils;

type
  TBrasil4DFIPETipoVeiculo = (tvCaminhoes, tvCarros, tvMotos);

  TBrasil4DFIPESchemaMarca = class(TBrasil4DSchema)
  private
    FNome: string;
    FValor: string;
  public
    procedure FromJSONObject(AJSONObject: TJSONObject); override;

    property Nome: string read FNome write FNome;
    property Valor: string read FValor write FValor;
  end;

  TBrasil4DFIPESchemaTabela = class(TBrasil4DSchema)
  private
    FCodigo: Integer;
    FMes: string;
  public
    procedure FromJSONObject(AJSONObject: TJSONObject); override;

    property Codigo: Integer read FCodigo write FCodigo;
    property Mes: string read FMes write FMes;
  end;

  TBrasil4DFIPESchemaVeiculo = class(TBrasil4DSchema)
  private
    FValor: string;
    FMarca: string;
    FModelo: string;
    FAnoModelo: Integer;
    FCombustivel: string;
    FCodigoFipe: string;
    FMesReferencia: string;
    FTipoVeiculo: TBrasil4DFIPETipoVeiculo;
    FSiglaCombustivel: string;
    FDataConsulta: string;
  public
    procedure FromJSONObject(AJSONObject: TJSONObject); override;

    property Valor: string read FValor write FValor;
    property Marca: string read FMarca write FMarca;
    property Modelo: string read FModelo write FModelo;
    property AnoModelo: Integer read FAnoModelo write FAnoModelo;
    property Combustivel: string read FCombustivel write FCombustivel;
    property CodigoFipe: string read FCodigoFipe write FCodigoFipe;
    property MesReferencia: string read FMesReferencia write FMesReferencia;
    property TipoVeiculo: TBrasil4DFIPETipoVeiculo read FTipoVeiculo write FTipoVeiculo;
    property SiglaCombustivel: string read FSiglaCombustivel write FSiglaCombustivel;
    property DataConsulta: string read FDataConsulta write FDataConsulta;
  end;

  TBrasil4DFIPETipoVeiculoHelper = record helper for TBrasil4DFIPETipoVeiculo
  public
    function ToString: string;
  end;

implementation

{ TBrasil4DFIPESchemaMarca }

procedure TBrasil4DFIPESchemaMarca.FromJSONObject(AJSONObject: TJSONObject);
begin
  FNome := AJSONObject.ValueAsString('nome');
  FValor := AJSONObject.ValueAsString('valor');
end;

{ TBrasil4DFIPESchemaVeiculo }

procedure TBrasil4DFIPESchemaVeiculo.FromJSONObject(AJSONObject: TJSONObject);
begin
  FValor := AJSONObject.ValueAsString('valor');
  FMarca := AJSONObject.ValueAsString('marca');
  FModelo := AJSONObject.ValueAsString('modelo');
  FAnoModelo := AJSONObject.ValueAsInteger('anoModelo');
  FCombustivel := AJSONObject.ValueAsString('combustivel');
  FCodigoFipe := AJSONObject.ValueAsString('codigoFipe');
  FMesReferencia := AJSONObject.ValueAsString('mesReferencia');
  FTipoVeiculo := TBrasil4DFIPETipoVeiculo(AJSONObject.ValueAsInteger('tipoVeiculo'));
  FSiglaCombustivel := AJSONObject.ValueAsString('siglaCombustivel');
  FDataConsulta := AJSONObject.ValueAsString('dataConsulta');
end;

{ TBrasil4DFIPESchemaTabela }

procedure TBrasil4DFIPESchemaTabela.FromJSONObject(AJSONObject: TJSONObject);
begin
  FCodigo := AJSONObject.ValueAsInteger('codigo');
  FMes := AJSONObject.ValueAsString('mes');
end;

{ TBrasil4DFIPETipoVeiculoHelper }

function TBrasil4DFIPETipoVeiculoHelper.ToString: string;
begin
  Result := EmptyStr;
  case Self of
    tvCaminhoes: Result := 'caminhoes';
    tvCarros: Result := 'carros';
    tvMotos: Result := 'motos';
  end;
end;

end.
