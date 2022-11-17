unit Brasil4D.CEPV2.WebServices;

interface

uses
  Brasil4D.Core.WebServices,
  Brasil4D.Core.Constants,
  Brasil4D.Core.Exceptions,
  Brasil4D.Rest.Base,
  Brasil4D.Rest.RestClient,
  Brasil4D.CEPV2.Schemas,
  Brasil4D.Helper.JSON,
  System.DateUtils,
  System.JSON,
  System.SysUtils,
  System.Generics.Collections;

type
  TBrasil4DCEPV2WebServices = class(TBrasil4DCoreWebServices)
  private
    FCep: string;
    FRetorno: TBrasil4DCEPV2Schema;
    function GetRetorno: TBrasil4DCEPV2Schema;
  public
    constructor Create; override;
    destructor Destroy; override;

    procedure Executar;

    property Cep: string read FCep write FCep;
    property Retorno: TBrasil4DCEPV2Schema read GetRetorno;
  end;

implementation

{ TBrasil4DCEPV2WebServices }

constructor TBrasil4DCEPV2WebServices.Create;
begin
  inherited;
  FResource := CEPV2_RESOURCE;
end;

destructor TBrasil4DCEPV2WebServices.Destroy;
begin
  FreeAndNil(FRetorno);
  inherited;
end;

procedure TBrasil4DCEPV2WebServices.Executar;
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
  FRetorno := TBrasil4DCEPV2Schema.Create;
  FRetorno.FromJSONObject(LJSON);
end;

function TBrasil4DCEPV2WebServices.GetRetorno: TBrasil4DCEPV2Schema;
begin
  if not Assigned(FRetorno) then
    FRetorno := TBrasil4DCEPV2Schema.Create;
  Result := FRetorno;
end;

end.
