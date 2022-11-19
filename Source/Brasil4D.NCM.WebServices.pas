unit Brasil4D.NCM.WebServices;

interface

uses
  Brasil4D.Core.WebServices,
  Brasil4D.Core.Constants,
  Brasil4D.Core.Exceptions,
  Brasil4D.Rest.Base,
  Brasil4D.Rest.RestClient,
  Brasil4D.NCM.Schemas,
  Brasil4D.Helper.JSON,
  System.DateUtils,
  System.JSON,
  System.SysUtils,
  System.Generics.Collections;

type
  TBrasil4DNCMWebServicesLista = class;
  TBrasil4DNCMWebServicesBusca = class;

  TBrasil4DNCMWebServices = class
  private
    FLista: TBrasil4DNCMWebServicesLista;
    FBusca: TBrasil4DNCMWebServicesBusca;
    function GetBusca: TBrasil4DNCMWebServicesBusca;
    function GetLista: TBrasil4DNCMWebServicesLista;
  public
    destructor Destroy; override;

    property Lista: TBrasil4DNCMWebServicesLista read GetLista;
    property Busca: TBrasil4DNCMWebServicesBusca read GetBusca;
  end;

  TBrasil4DNCMWebServicesLista = class(TBrasil4DCoreWebServices)
  private
    FRetorno: TObjectList<TBrasil4DNCMSchema>;
    FCodigo: string;
    FDescricao: string;
    function GetRetorno: TObjectList<TBrasil4DNCMSchema>;
  public
    constructor Create; override;
    destructor Destroy; override;

    procedure Executar;

    property Codigo: string read FCodigo write FCodigo;
    property Descricao: string read FDescricao write FDescricao;
    property Retorno: TObjectList<TBrasil4DNCMSchema> read GetRetorno;
  end;

  TBrasil4DNCMWebServicesBusca = class(TBrasil4DCoreWebServices)
  private
    FRetorno: TBrasil4DNCMSchema;
    FCodigo: string;
    function GetRetorno: TBrasil4DNCMSchema;
  public
    constructor Create; override;
    destructor Destroy; override;

    procedure Executar;

    property Codigo: string read FCodigo write FCodigo;
    property Retorno: TBrasil4DNCMSchema read GetRetorno;
  end;

implementation

{ TBrasil4DNCMWebServices }

constructor TBrasil4DNCMWebServicesLista.Create;
begin
  inherited;
  FResource := NCM_RESOURCE;
end;

destructor TBrasil4DNCMWebServicesLista.Destroy;
begin
  FreeAndNil(FRetorno);
  inherited;
end;

procedure TBrasil4DNCMWebServicesLista.Executar;
var
  LJSONArray: TJSONArray;
  LResource: string;
begin
  FreeAndNil(FRetorno);
  try
    LResource := FResource;
    if FCodigo <> EmptyStr then
      LResource := LResource + '?search=' + FCodigo;
    if FDescricao <> EmptyStr then
      LResource := LResource + '?search=' + FDescricao;
    FRequest
      .GET
      .BaseUrl(FBaseUrl)
      .Resource(LResource);

    EnviarRequest;
    LJSONArray := FResponse.GetJSONArray;
    FRetorno := TBrasil4DNCMSchema.FromJSONArray<TBrasil4DNCMSchema>(LJSONArray);
  finally
    FCodigo := EmptyStr;
    FDescricao := EmptyStr;
  end;
end;

function TBrasil4DNCMWebServicesLista.GetRetorno: TObjectList<TBrasil4DNCMSchema>;
begin
  if not Assigned(FRetorno) then
    FRetorno := TObjectList<TBrasil4DNCMSchema>.Create;
  Result := FRetorno;
end;

{ TBrasil4DNCMWebServicesBusca }

constructor TBrasil4DNCMWebServicesBusca.Create;
begin
  inherited;
  FResource := NCM_RESOURCE;
end;

destructor TBrasil4DNCMWebServicesBusca.Destroy;
begin
  FreeAndNil(FRetorno);
  inherited;
end;

procedure TBrasil4DNCMWebServicesBusca.Executar;
var
  LJSON: TJSONObject;
  LResource: string;
  LErro: string;
begin
  FreeAndNil(FRetorno);
  LResource := FResource + '/' + FCodigo;
  FRequest
    .GET
    .BaseUrl(FBaseUrl)
    .Resource(LResource);

  EnviarRequest;
  LJSON := FResponse.GetJSONObject;
  LErro := LJSON.ValueAsString('message');
  if LErro <> EmptyStr then
    raise EBrasil4DNCMException.Create(FCodigo, LErro);
  FRetorno := TBrasil4DNCMSchema.Create;
  FRetorno.FromJSONObject(LJSON);
end;

function TBrasil4DNCMWebServicesBusca.GetRetorno: TBrasil4DNCMSchema;
begin
  if not Assigned(FRetorno) then
    FRetorno := TBrasil4DNCMSchema.Create;
  Result := FRetorno;
end;

{ TBrasil4DNCMWebServices }

destructor TBrasil4DNCMWebServices.Destroy;
begin
  FreeAndNil(FLista);
  FreeAndNil(FBusca);
  inherited;
end;

function TBrasil4DNCMWebServices.GetBusca: TBrasil4DNCMWebServicesBusca;
begin
  if not Assigned(FBusca) then
    FBusca := TBrasil4DNCMWebServicesBusca.Create;
  Result := FBusca;
end;

function TBrasil4DNCMWebServices.GetLista: TBrasil4DNCMWebServicesLista;
begin
  if not Assigned(FLista) then
    FLista := TBrasil4DNCMWebServicesLista.Create;
  Result := FLista;
end;

end.
