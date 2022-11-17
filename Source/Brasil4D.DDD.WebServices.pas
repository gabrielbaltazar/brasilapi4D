unit Brasil4D.DDD.WebServices;

interface

uses
  Brasil4D.Core.WebServices,
  Brasil4D.Core.Constants,
  Brasil4D.Core.Exceptions,
  Brasil4D.Rest.Base,
  Brasil4D.Rest.RestClient,
  Brasil4D.DDD.Schemas,
  Brasil4D.Helper.JSON,
  System.DateUtils,
  System.JSON,
  System.SysUtils,
  System.Generics.Collections;

type
  TBrasil4DDDDWebServices = class(TBrasil4DCoreWebServices)
  private
    FDDD: Integer;
    FRetorno: TBrasil4DDDDSchema;
    function GetRetorno: TBrasil4DDDDSchema;
  public
    constructor Create; override;
    destructor Destroy; override;

    procedure Executar;

    property DDD: Integer read FDDD write FDDD;
    property Retorno: TBrasil4DDDDSchema read GetRetorno;
  end;

implementation

{ TBrasil4DDDDWebServices }

constructor TBrasil4DDDDWebServices.Create;
begin
  inherited;
  FResource := DDD_RESOURCE;
end;

destructor TBrasil4DDDDWebServices.Destroy;
begin
  FreeAndNil(FRetorno);
  inherited;
end;

procedure TBrasil4DDDDWebServices.Executar;
var
  LResource: string;
  LErro: string;
  LJSON: TJSONObject;
begin
  LResource := FResource + '/' + FDDD.ToString;
  FreeAndNil(FRetorno);
  FRequest
    .GET
    .BaseUrl(FBaseUrl)
    .Resource(LResource);

  EnviarRequest;
  LJSON := FResponse.GetJSONObject;
  LErro := LJSON.ValueAsString('message');
  if LErro <> EmptyStr then
    raise EBrasil4DDDDException.Create(FDDD, LErro);
  FRetorno := TBrasil4DDDDSchema.Create;
  FRetorno.FromJSONObject(LJSON);
end;

function TBrasil4DDDDWebServices.GetRetorno: TBrasil4DDDDSchema;
begin
  if not Assigned(FRetorno) then
    FRetorno := TBrasil4DDDDSchema.Create;
  Result := FRetorno;
end;

end.
