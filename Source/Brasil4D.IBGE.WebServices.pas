unit Brasil4D.IBGE.WebServices;

interface

uses
  Brasil4D.Core.WebServices,
  Brasil4D.Core.Constants,
  Brasil4D.Core.Exceptions,
  Brasil4D.Rest.Base,
  Brasil4D.Rest.RestClient,
  Brasil4D.IBGE.Schemas,
  Brasil4D.Helper.JSON,
  System.DateUtils,
  System.JSON,
  System.SysUtils,
  System.Generics.Collections;

type
  TBrasil4DIBGEWebServicesMunicipios = class;
  TBrasil4DIBGEWebServicesEstadoBusca = class;
  TBrasil4DIBGEWebServicesEstadoLista = class;

  TBrasil4DIBGEWebServices = class
  private
    FMunicipios: TBrasil4DIBGEWebServicesMunicipios;
    FEstadoBusca: TBrasil4DIBGEWebServicesEstadoBusca;
    FEstadosLista: TBrasil4DIBGEWebServicesEstadoLista;
    function GetEstadosBusca: TBrasil4DIBGEWebServicesEstadoBusca;
    function GetMunicipios: TBrasil4DIBGEWebServicesMunicipios;
    function GetEstadosLista: TBrasil4DIBGEWebServicesEstadoLista;
  public
    destructor Destroy; override;

    property Municipios: TBrasil4DIBGEWebServicesMunicipios read GetMunicipios;
    property EstadosBusca: TBrasil4DIBGEWebServicesEstadoBusca read GetEstadosBusca;
    property EstadosLista: TBrasil4DIBGEWebServicesEstadoLista read GetEstadosLista;
  end;

  TBrasil4DIBGEWebServicesMunicipios = class(TBrasil4DCoreWebServices)
  private
    FRetorno: TObjectList<TBrasil4DIBGESchemaMunicipio>;
    FSiglaUF: string;
    function GetRetorno: TObjectList<TBrasil4DIBGESchemaMunicipio>;
  public
    constructor Create; override;
    destructor Destroy; override;

    procedure Executar;

    property SiglaUF: string read FSiglaUF write FSiglaUF;
    property Retorno: TObjectList<TBrasil4DIBGESchemaMunicipio> read GetRetorno;
  end;

  TBrasil4DIBGEWebServicesEstadoLista = class(TBrasil4DCoreWebServices)
  private
    FRetorno: TObjectList<TBrasil4DIBGESchemaEstado>;
    function GetRetorno: TObjectList<TBrasil4DIBGESchemaEstado>;
  public
    constructor Create; override;
    destructor Destroy; override;

    procedure Executar;

    property Retorno: TObjectList<TBrasil4DIBGESchemaEstado> read GetRetorno;
  end;

  TBrasil4DIBGEWebServicesEstadoBusca = class(TBrasil4DCoreWebServices)
  private
    FRetorno: TBrasil4DIBGESchemaEstado;
    FSiglaUF: string;
    function GetRetorno: TBrasil4DIBGESchemaEstado;
  public
    constructor Create; override;
    destructor Destroy; override;

    procedure Executar;

    property SiglaUF: string read FSiglaUF write FSiglaUF;
    property Retorno: TBrasil4DIBGESchemaEstado read GetRetorno;
  end;

implementation

{ TBrasil4DIBGEWebServicesMunicipios }

constructor TBrasil4DIBGEWebServicesMunicipios.Create;
begin
  inherited;
  FResource := IBGE_RESOURCE;
end;

destructor TBrasil4DIBGEWebServicesMunicipios.Destroy;
begin
  FreeAndNil(FRetorno);
  inherited;
end;

procedure TBrasil4DIBGEWebServicesMunicipios.Executar;
var
  LJSONArray: TJSONArray;
  LJSON: TJSONObject;
  LResource: string;
  LErro: string;
begin
  FreeAndNil(FRetorno);
  ValidarArgumento('Sigla UF', FSiglaUF);
  LResource := FResource +
    Format('/municipios/v1/%s?providers=dados-abertos-br,gov,wikipedia', [FSiglaUF]);
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
      raise EBrasil4DIBGEException.Create(FSiglaUF, LErro);
  end;
  LJSONArray := FResponse.GetJSONArray;
  FRetorno := TBrasil4DIBGESchemaMunicipio
    .FromJSONArray<TBrasil4DIBGESchemaMunicipio>(LJSONArray);
end;

function TBrasil4DIBGEWebServicesMunicipios.GetRetorno: TObjectList<TBrasil4DIBGESchemaMunicipio>;
begin
  if not Assigned(FRetorno) then
    FRetorno := TObjectList<TBrasil4DIBGESchemaMunicipio>.Create;
  Result := FRetorno;
end;

{ TBrasil4DIBGEWebServicesEstadoBusca }

constructor TBrasil4DIBGEWebServicesEstadoBusca.Create;
begin
  inherited;
  FResource := IBGE_RESOURCE;
end;

destructor TBrasil4DIBGEWebServicesEstadoBusca.Destroy;
begin
  FreeAndNil(FRetorno);
  inherited;
end;

procedure TBrasil4DIBGEWebServicesEstadoBusca.Executar;
var
  LJSON: TJSONObject;
  LResource: string;
  LErro: string;
begin
  FreeAndNil(FRetorno);
  ValidarArgumento('Sigla UF', FSiglaUF);
  LResource := FResource + '/uf/v1/' + FSiglaUF;
  FRequest
    .GET
    .BaseUrl(FBaseUrl)
    .Resource(LResource);

  EnviarRequest;
  LJSON := FResponse.GetJSONObject;
  LErro := LJSON.ValueAsString('message');
  if LErro <> EmptyStr then
    raise EBrasil4DIBGEException.Create(FSiglaUF, LErro);
  FRetorno := TBrasil4DIBGESchemaEstado.Create;
  FRetorno.FromJSONObject(LJSON);
end;

function TBrasil4DIBGEWebServicesEstadoBusca.GetRetorno: TBrasil4DIBGESchemaEstado;
begin
  if not Assigned(FRetorno) then
    FRetorno := TBrasil4DIBGESchemaEstado.Create;
  Result := FRetorno;
end;

{ TBrasil4DIBGEWebServices }

destructor TBrasil4DIBGEWebServices.Destroy;
begin
  FreeAndNil(FEstadoBusca);
  FreeAndNil(FEstadosLista);
  FreeAndNil(FMunicipios);
  inherited;
end;

function TBrasil4DIBGEWebServices.GetEstadosBusca: TBrasil4DIBGEWebServicesEstadoBusca;
begin
  if not Assigned(FEstadoBusca) then
    FEstadoBusca := TBrasil4DIBGEWebServicesEstadoBusca.Create;
  Result := FEstadoBusca;
end;

function TBrasil4DIBGEWebServices.GetEstadosLista: TBrasil4DIBGEWebServicesEstadoLista;
begin
  if not Assigned(FEstadosLista) then
    FEstadosLista := TBrasil4DIBGEWebServicesEstadoLista.Create;
  Result := FEstadosLista;
end;

function TBrasil4DIBGEWebServices.GetMunicipios: TBrasil4DIBGEWebServicesMunicipios;
begin
  if not Assigned(FMunicipios) then
    FMunicipios := TBrasil4DIBGEWebServicesMunicipios.Create;
  Result := FMunicipios;
end;

{ TBrasil4DIBGEWebServicesEstadoLista }

constructor TBrasil4DIBGEWebServicesEstadoLista.Create;
begin
  inherited;
  FResource := IBGE_RESOURCE;
end;

destructor TBrasil4DIBGEWebServicesEstadoLista.Destroy;
begin
  FreeAndNil(FRetorno);
  inherited;
end;

procedure TBrasil4DIBGEWebServicesEstadoLista.Executar;
var
  LJSONArray: TJSONArray;
  LResource: string;
begin
  FreeAndNil(FRetorno);
  LResource := FResource + '/uf/v1';
  FRequest
    .GET
    .BaseUrl(FBaseUrl)
    .Resource(LResource);

  EnviarRequest;
  LJSONArray := FResponse.GetJSONArray;
  FRetorno := TBrasil4DIBGESchemaEstado.FromJSONArray<TBrasil4DIBGESchemaEstado>(LJSONArray);
end;

function TBrasil4DIBGEWebServicesEstadoLista.GetRetorno: TObjectList<TBrasil4DIBGESchemaEstado>;
begin
  if not Assigned(FRetorno) then
    FRetorno := TObjectList<TBrasil4DIBGESchemaEstado>.Create;
  Result := FRetorno;
end;

end.
