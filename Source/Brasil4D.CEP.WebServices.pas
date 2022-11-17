unit Brasil4D.CEP.WebServices;

interface

uses
  Brasil4D.Core.WebServices,
  Brasil4D.Core.Constants,
  Brasil4D.Core.Exceptions,
  Brasil4D.Rest.Base,
  Brasil4D.Rest.RestClient,
  Brasil4D.CEP.Schemas,
  Brasil4D.Helper.JSON,
  System.DateUtils,
  System.JSON,
  System.SysUtils,
  System.Generics.Collections;

type
  TBrasil4DCEPWebSerices = class(TBrasil4DCoreWebServices)
  private
    FCep: string;
    FRetorno: TBrasil4DCEPSchema;
    function GetRetorno: TBrasil4DCEPSchema;
  public
    constructor Create; override;
    destructor Destroy; override;

    procedure Executar;

    property Cep: string read FCep write FCep;
    property Retorno: TBrasil4DCEPSchema read GetRetorno;
  end;

implementation

{ TBrasil4DCEPWebSerices }

constructor TBrasil4DCEPWebSerices.Create;
begin
  inherited;
  FResource := CEP_RESOURCE;
end;

destructor TBrasil4DCEPWebSerices.Destroy;
begin
  FreeAndNil(FRetorno);
  inherited;
end;

procedure TBrasil4DCEPWebSerices.Executar;
var
  LResource: string;
  LErro: string;
  LJSON: TJSONObject;
begin
  LResource := FResource + '/' + FCep;
  FreeAndNil(FRetorno);
  FRequest
    .GET
    .BaseUrl(FBaseUrl)
    .Resource(LResource);

  EnviarRequest;
  LJSON := FResponse.GetJSONObject;
  LErro := LJSON.ValueAsString('message');
  if LErro <> EmptyStr then
    raise EBrasil4DCepException.Create(FCep, LErro);
  FRetorno := TBrasil4DCEPSchema.Create;
  FRetorno.FromJSONObject(LJSON);
end;

function TBrasil4DCEPWebSerices.GetRetorno: TBrasil4DCEPSchema;
begin
  if not Assigned(FRetorno) then
    FRetorno := TBrasil4DCEPSchema.Create;
  Result := FRetorno;
end;

end.
