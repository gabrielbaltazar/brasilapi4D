unit Brasil4D.Bank.WebServices;

interface

uses
  Brasil4D.Core.WebServices,
  Brasil4D.Core.Constants,
  Brasil4D.Core.Exceptions,
  Brasil4D.Rest.Base,
  Brasil4D.Rest.RestClient,
  Brasil4D.Bank.Schemas,
  Brasil4D.Helper.JSON,
  System.DateUtils,
  System.JSON,
  System.SysUtils,
  System.Generics.Collections;

type
  TBrasil4DBankWebServicesLista = class;
  TBrasil4DBankWebServicesBusca = class;

  TBrasil4DBankWebServices = class
  private
    FLista: TBrasil4DBankWebServicesLista;
    FBusca: TBrasil4DBankWebServicesBusca;
    function GetBusca: TBrasil4DBankWebServicesBusca;
    function GetLista: TBrasil4DBankWebServicesLista;
  public
    destructor Destroy; override;

    property Lista: TBrasil4DBankWebServicesLista read GetLista;
    property Busca: TBrasil4DBankWebServicesBusca read GetBusca;
  end;

  TBrasil4DBankWebServicesLista = class(TBrasil4DCoreWebServices)
  private
    FRetorno: TObjectList<TBrasil4DBankSchema>;
    function GetRetorno: TObjectList<TBrasil4DBankSchema>;
  public
    constructor Create; override;
    destructor Destroy; override;

    procedure Executar;

    property Retorno: TObjectList<TBrasil4DBankSchema> read GetRetorno;
  end;

  TBrasil4DBankWebServicesBusca = class(TBrasil4DCoreWebServices)
  private
    FRetorno: TBrasil4DBankSchema;
    FCode: Integer;
    function GetRetorno: TBrasil4DBankSchema;
  public
    constructor Create; override;
    destructor Destroy; override;

    procedure Executar;

    property Code: Integer read FCode write FCode;
    property Retorno: TBrasil4DBankSchema read GetRetorno;
  end;

implementation

{ TBrasil4DBankWebServices }

constructor TBrasil4DBankWebServicesLista.Create;
begin
  inherited;
  FResource := BANK_RESOURCE;
end;

destructor TBrasil4DBankWebServicesLista.Destroy;
begin
  FreeAndNil(FRetorno);
  inherited;
end;

procedure TBrasil4DBankWebServicesLista.Executar;
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
  FRetorno := TBrasil4DBankSchema.FromJSONArray<TBrasil4DBankSchema>(LJSONArray);
end;

function TBrasil4DBankWebServicesLista.GetRetorno: TObjectList<TBrasil4DBankSchema>;
begin
  if not Assigned(FRetorno) then
    FRetorno := TObjectList<TBrasil4DBankSchema>.Create;
  Result := FRetorno;
end;

{ TBrasil4DBankWebServicesBusca }

constructor TBrasil4DBankWebServicesBusca.Create;
begin
  inherited;
  FResource := BANK_RESOURCE;
end;

destructor TBrasil4DBankWebServicesBusca.Destroy;
begin
  FreeAndNil(FRetorno);
  inherited;
end;

procedure TBrasil4DBankWebServicesBusca.Executar;
var
  LJSON: TJSONObject;
  LResource: string;
  LErro: string;
begin
  FreeAndNil(FRetorno);
  LResource := FResource + '/' + FCode.ToString;
  FRequest
    .GET
    .BaseUrl(FBaseUrl)
    .Resource(LResource);

  EnviarRequest;
  LJSON := FResponse.GetJSONObject;
  LErro := LJSON.ValueAsString('message');
  if LErro <> EmptyStr then
    raise EBrasil4DBankException.Create(FCode, LErro);
  FRetorno := TBrasil4DBankSchema.Create;
  FRetorno.FromJSONObject(LJSON);
end;

function TBrasil4DBankWebServicesBusca.GetRetorno: TBrasil4DBankSchema;
begin
  if not Assigned(FRetorno) then
    FRetorno := TBrasil4DBankSchema.Create;
  Result := FRetorno;
end;

{ TBrasil4DBankWebServices }

destructor TBrasil4DBankWebServices.Destroy;
begin
  FreeAndNil(FLista);
  FreeAndNil(FBusca);
  inherited;
end;

function TBrasil4DBankWebServices.GetBusca: TBrasil4DBankWebServicesBusca;
begin
  if not Assigned(FBusca) then
    FBusca := TBrasil4DBankWebServicesBusca.Create;
  Result := FBusca;
end;

function TBrasil4DBankWebServices.GetLista: TBrasil4DBankWebServicesLista;
begin
  if not Assigned(FLista) then
    FLista := TBrasil4DBankWebServicesLista.Create;
  Result := FLista;
end;

end.
