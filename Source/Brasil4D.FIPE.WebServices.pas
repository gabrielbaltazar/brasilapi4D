unit Brasil4D.FIPE.WebServices;

interface

uses
  Brasil4D.Core.WebServices,
  Brasil4D.Core.Constants,
  Brasil4D.Core.Exceptions,
  Brasil4D.Rest.Base,
  Brasil4D.Rest.RestClient,
  Brasil4D.FIPE.Schemas,
  Brasil4D.Helper.JSON,
  System.DateUtils,
  System.JSON,
  System.SysUtils,
  System.Generics.Collections;

type
  TBrasil4DFIPEWebServicesMarca = class;
  TBrasil4DFIPEWebServicesTabela = class;
  TBrasil4DFIPEWebServicesVeiculo = class;

  TBrasil4DFIPEWebServices = class
  private
    FMarca: TBrasil4DFIPEWebServicesMarca;
    FVeiculo: TBrasil4DFIPEWebServicesTabela;
    FTabela: TBrasil4DFIPEWebServicesVeiculo;
    function GetTabela: TBrasil4DFIPEWebServicesTabela;
    function GetMarca: TBrasil4DFIPEWebServicesMarca;
    function GetVeiculo: TBrasil4DFIPEWebServicesVeiculo;
  public
    destructor Destroy; override;

    property Marca: TBrasil4DFIPEWebServicesMarca read GetMarca;
    property Tabela: TBrasil4DFIPEWebServicesTabela read GetTabela;
    property Veiculo: TBrasil4DFIPEWebServicesVeiculo read GetVeiculo;
  end;

  TBrasil4DFIPEWebServicesMarca = class(TBrasil4DCoreWebServices)
  private
    FRetorno: TObjectList<TBrasil4DFIPESchemaMarca>;
    FTipoVeiculo: TBrasil4DFIPETipoVeiculo;
    function GetRetorno: TObjectList<TBrasil4DFIPESchemaMarca>;
  public
    constructor Create; override;
    destructor Destroy; override;

    procedure Executar;

    property TipoVeiculo: TBrasil4DFIPETipoVeiculo read FTipoVeiculo write FTipoVeiculo;
    property Retorno: TObjectList<TBrasil4DFIPESchemaMarca> read GetRetorno;
  end;

  TBrasil4DFIPEWebServicesVeiculo = class(TBrasil4DCoreWebServices)
  private
    FRetorno: TObjectList<TBrasil4DFIPESchemaVeiculo>;
    FCodigoFipe: string;
    function GetRetorno: TObjectList<TBrasil4DFIPESchemaVeiculo>;
  public
    constructor Create; override;
    destructor Destroy; override;

    procedure Executar;

    property CodigoFipe: string read FCodigoFipe write FCodigoFipe;
    property Retorno: TObjectList<TBrasil4DFIPESchemaVeiculo> read GetRetorno;
  end;

  TBrasil4DFIPEWebServicesTabela = class(TBrasil4DCoreWebServices)
  private
    FRetorno: TObjectList<TBrasil4DFIPESchemaTabela>;
    function GetRetorno: TObjectList<TBrasil4DFIPESchemaTabela>;
  public
    constructor Create; override;
    destructor Destroy; override;

    procedure Executar;

    property Retorno: TObjectList<TBrasil4DFIPESchemaTabela> read GetRetorno;
  end;

implementation

{ TBrasil4DFIPEWebServicesMarca }

constructor TBrasil4DFIPEWebServicesMarca.Create;
begin
  inherited;
  FResource := FIPE_RESOURCE;
  FTipoVeiculo := tvCarros;
end;

destructor TBrasil4DFIPEWebServicesMarca.Destroy;
begin
  FreeAndNil(FRetorno);
  inherited;
end;

procedure TBrasil4DFIPEWebServicesMarca.Executar;
var
  LJSONArray: TJSONArray;
  LResource: string;
begin
  FreeAndNil(FRetorno);
  LResource := FResource +
    Format('/marcas/v1/%s', [FTipoVeiculo.ToString]);
  FRequest
    .GET
    .BaseUrl(FBaseUrl)
    .Resource(LResource);

  EnviarRequest;
  LJSONArray := FResponse.GetJSONArray;
  FRetorno := TBrasil4DFIPESchemaMarca
    .FromJSONArray<TBrasil4DFIPESchemaMarca>(LJSONArray);
end;

function TBrasil4DFIPEWebServicesMarca.GetRetorno: TObjectList<TBrasil4DFIPESchemaMarca>;
begin
  if not Assigned(FRetorno) then
    FRetorno := TObjectList<TBrasil4DFIPESchemaMarca>.Create;
  Result := FRetorno;
end;

{ TBrasil4DFIPEWebServicesTabela }

constructor TBrasil4DFIPEWebServicesTabela.Create;
begin
  inherited;
  FResource := FIPE_RESOURCE;
end;

destructor TBrasil4DFIPEWebServicesTabela.Destroy;
begin
  FreeAndNil(FRetorno);
  inherited;
end;

procedure TBrasil4DFIPEWebServicesTabela.Executar;
var
  LJSONArray: TJSONArray;
  LResource: string;
begin
  FreeAndNil(FRetorno);
  LResource := FResource + '/tabelas/v1';
  FRequest
    .GET
    .BaseUrl(FBaseUrl)
    .Resource(LResource);

  EnviarRequest;
  LJSONArray := FResponse.GetJSONArray;
  FRetorno := TBrasil4DFIPESchemaTabela
    .FromJSONArray<TBrasil4DFIPESchemaTabela>(LJSONArray);
end;

function TBrasil4DFIPEWebServicesTabela.GetRetorno: TObjectList<TBrasil4DFIPESchemaTabela>;
begin
  if not Assigned(FRetorno) then
    FRetorno := TObjectList<TBrasil4DFIPESchemaTabela>.Create;
  Result := FRetorno;
end;

{ TBrasil4DFIPEWebServices }

destructor TBrasil4DFIPEWebServices.Destroy;
begin
  FreeAndNil(FVeiculo);
  FreeAndNil(FTabela);
  FreeAndNil(FMarca);
  inherited;
end;

function TBrasil4DFIPEWebServices.GetTabela: TBrasil4DFIPEWebServicesTabela;
begin
  if not Assigned(FVeiculo) then
    FVeiculo := TBrasil4DFIPEWebServicesTabela.Create;
  Result := FVeiculo;
end;

function TBrasil4DFIPEWebServices.GetVeiculo: TBrasil4DFIPEWebServicesVeiculo;
begin
  if not Assigned(FTabela) then
    FTabela := TBrasil4DFIPEWebServicesVeiculo.Create;
  Result := FTabela;
end;

function TBrasil4DFIPEWebServices.GetMarca: TBrasil4DFIPEWebServicesMarca;
begin
  if not Assigned(FMarca) then
    FMarca := TBrasil4DFIPEWebServicesMarca.Create;
  Result := FMarca;
end;

{ TBrasil4DFIPEWebServicesVeiculo }

constructor TBrasil4DFIPEWebServicesVeiculo.Create;
begin
  inherited;
  FResource := FIPE_RESOURCE;
end;

destructor TBrasil4DFIPEWebServicesVeiculo.Destroy;
begin
  FreeAndNil(FRetorno);
  inherited;
end;

procedure TBrasil4DFIPEWebServicesVeiculo.Executar;
var
  LJSONArray: TJSONArray;
  LJSON: TJSONObject;
  LResource: string;
  LErro: string;
begin
  FreeAndNil(FRetorno);
  ValidarArgumento('Codigo FIPE', FCodigoFipe);
  LResource := FResource + '/preco/v1/' + FCodigoFipe;
  FRequest
    .GET
    .BaseUrl(FBaseUrl)
    .Resource(LResource);

  EnviarRequest;
  LJSON := FResponse.GetJSONObject;
  if Assigned(LJSON) then
  begin
    LErro := LJSON.ValueAsString('message');
    if LErro <> EmptyStr then
      raise EBrasil4DFIPEException.Create(FCodigoFipe, LErro);
  end;
  LJSONArray := FResponse.GetJSONArray;
  FRetorno := TBrasil4DFIPESchemaVeiculo
    .FromJSONArray<TBrasil4DFIPESchemaVeiculo>(LJSONArray);
end;

function TBrasil4DFIPEWebServicesVeiculo.GetRetorno: TObjectList<TBrasil4DFIPESchemaVeiculo>;
begin
  if not Assigned(FRetorno) then
    FRetorno := TObjectList<TBrasil4DFIPESchemaVeiculo>.Create;
  Result := FRetorno;
end;

end.
