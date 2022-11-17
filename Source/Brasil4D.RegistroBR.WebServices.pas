unit Brasil4D.RegistroBR.WebServices;

interface

uses
  Brasil4D.Core.WebServices,
  Brasil4D.Core.Constants,
  Brasil4D.Core.Exceptions,
  Brasil4D.Rest.Base,
  Brasil4D.Rest.RestClient,
  Brasil4D.RegistroBR.Schemas,
  Brasil4D.Helper.JSON,
  System.DateUtils,
  System.JSON,
  System.SysUtils,
  System.Generics.Collections;

type
  TBrasil4DRegistroBRWebServices = class(TBrasil4DCoreWebServices)
  private
    FDomain: string;
    FRetorno: TBrasil4DRegistroBRSchema;
    function GetRetorno: TBrasil4DRegistroBRSchema;
  public
    constructor Create; override;
    destructor Destroy; override;

    procedure Executar;

    property Domain: string read FDomain write FDomain;
    property Retorno: TBrasil4DRegistroBRSchema read GetRetorno;
  end;

implementation

{ TBrasil4DRegistroBRWebServices }

constructor TBrasil4DRegistroBRWebServices.Create;
begin
  inherited;
  FResource := REGISTROBR_RESOURCE;
end;

destructor TBrasil4DRegistroBRWebServices.Destroy;
begin
  FreeAndNil(FRetorno);
  inherited;
end;

procedure TBrasil4DRegistroBRWebServices.Executar;
var
  LResource: string;
  LErro: string;
  LJSON: TJSONObject;
begin
  LResource := FResource + '/' + FDomain;
  FreeAndNil(FRetorno);
  FRequest
    .GET
    .BaseUrl(FBaseUrl)
    .Resource(LResource);

  EnviarRequest;
  LJSON := FResponse.GetJSONObject;
  LErro := LJSON.ValueAsString('message');
  if LErro <> EmptyStr then
    raise EBrasil4DRegistroBRException.Create(FDomain, LErro);
  FRetorno := TBrasil4DRegistroBRSchema.Create;
  FRetorno.FromJSONObject(LJSON);
end;

function TBrasil4DRegistroBRWebServices.GetRetorno: TBrasil4DRegistroBRSchema;
begin
  if not Assigned(FRetorno) then
    FRetorno := TBrasil4DRegistroBRSchema.Create;
  Result := FRetorno;
end;

end.
