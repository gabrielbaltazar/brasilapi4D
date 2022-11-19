unit Brasil4D.Taxas.WebServices;

interface

uses
  Brasil4D.Core.WebServices,
  Brasil4D.Core.Constants,
  Brasil4D.Core.Exceptions,
  Brasil4D.Rest.Base,
  Brasil4D.Rest.RestClient,
  Brasil4D.Taxas.Schemas,
  Brasil4D.Helper.JSON,
  System.DateUtils,
  System.JSON,
  System.SysUtils,
  System.Generics.Collections;

type
  TBrasil4DTaxasWebServicesLista = class;
  TBrasil4DTaxasWebServicesBusca = class;

  TBrasil4DTaxasWebServices = class
  private
    FLista: TBrasil4DTaxasWebServicesLista;
    FBusca: TBrasil4DTaxasWebServicesBusca;
    function GetBusca: TBrasil4DTaxasWebServicesBusca;
    function GetLista: TBrasil4DTaxasWebServicesLista;
  public
    destructor Destroy; override;

    property Lista: TBrasil4DTaxasWebServicesLista read GetLista;
    property Busca: TBrasil4DTaxasWebServicesBusca read GetBusca;
  end;

  TBrasil4DTaxasWebServicesLista = class(TBrasil4DCoreWebServices)
  private
    FRetorno: TObjectList<TBrasil4DTaxasSchema>;
    function GetRetorno: TObjectList<TBrasil4DTaxasSchema>;
  public
    constructor Create; override;
    destructor Destroy; override;

    procedure Executar;

    property Retorno: TObjectList<TBrasil4DTaxasSchema> read GetRetorno;
  end;

  TBrasil4DTaxasWebServicesBusca = class(TBrasil4DCoreWebServices)
  private
    FRetorno: TBrasil4DTaxasSchema;
    FNome: string;
    function GetRetorno: TBrasil4DTaxasSchema;
  public
    constructor Create; override;
    destructor Destroy; override;

    procedure Executar;

    property Nome: string read FNome write FNome;
    property Retorno: TBrasil4DTaxasSchema read GetRetorno;
  end;

implementation

{ TBrasil4DTaxasWebServices }

constructor TBrasil4DTaxasWebServicesLista.Create;
begin
  inherited;
  FResource := TAXAS_RESOURCE;
end;

destructor TBrasil4DTaxasWebServicesLista.Destroy;
begin
  FreeAndNil(FRetorno);
  inherited;
end;

procedure TBrasil4DTaxasWebServicesLista.Executar;
var
  LJSONArray: TJSONArray;
begin
  FreeAndNil(FRetorno);
  FRequest
    .GET
    .BaseUrl(FBaseUrl)
    .Resource(FResource);

  EnviarRequest;
  LJSONArray := FResponse.GetJSONArray;
  FRetorno := TBrasil4DTaxasSchema.FromJSONArray<TBrasil4DTaxasSchema>(LJSONArray);
end;

function TBrasil4DTaxasWebServicesLista.GetRetorno: TObjectList<TBrasil4DTaxasSchema>;
begin
  if not Assigned(FRetorno) then
    FRetorno := TObjectList<TBrasil4DTaxasSchema>.Create;
  Result := FRetorno;
end;

{ TBrasil4DTaxasWebServicesBusca }

constructor TBrasil4DTaxasWebServicesBusca.Create;
begin
  inherited;
  FResource := TAXAS_RESOURCE;
end;

destructor TBrasil4DTaxasWebServicesBusca.Destroy;
begin
  FreeAndNil(FRetorno);
  inherited;
end;

procedure TBrasil4DTaxasWebServicesBusca.Executar;
var
  LJSON: TJSONObject;
  LResource: string;
  LErro: string;
begin
  FreeAndNil(FRetorno);
  LResource := FResource + '/' + FNome;
  FRequest
    .GET
    .BaseUrl(FBaseUrl)
    .Resource(LResource);

  EnviarRequest;
  LJSON := FResponse.GetJSONObject;
  LErro := LJSON.ValueAsString('message');
  if LErro <> EmptyStr then
    raise EBrasil4DTaxasException.Create(FNome, LErro);
  FRetorno := TBrasil4DTaxasSchema.Create;
  FRetorno.FromJSONObject(LJSON);
end;

function TBrasil4DTaxasWebServicesBusca.GetRetorno: TBrasil4DTaxasSchema;
begin
  if not Assigned(FRetorno) then
    FRetorno := TBrasil4DTaxasSchema.Create;
  Result := FRetorno;
end;

{ TBrasil4DTaxasWebServices }

destructor TBrasil4DTaxasWebServices.Destroy;
begin
  FreeAndNil(FLista);
  FreeAndNil(FBusca);
  inherited;
end;

function TBrasil4DTaxasWebServices.GetBusca: TBrasil4DTaxasWebServicesBusca;
begin
  if not Assigned(FBusca) then
    FBusca := TBrasil4DTaxasWebServicesBusca.Create;
  Result := FBusca;
end;

function TBrasil4DTaxasWebServices.GetLista: TBrasil4DTaxasWebServicesLista;
begin
  if not Assigned(FLista) then
    FLista := TBrasil4DTaxasWebServicesLista.Create;
  Result := FLista;
end;

end.
