unit Brasil4D.CNPJ.WebServices;

interface

uses
  Brasil4D.Core.WebServices,
  Brasil4D.Core.Constants,
  Brasil4D.Core.Exceptions,
  Brasil4D.Rest.Base,
  Brasil4D.Rest.RestClient,
  Brasil4D.CNPJ.Schemas,
  Brasil4D.Helper.JSON,
  System.DateUtils,
  System.JSON,
  System.SysUtils,
  System.Generics.Collections;

type
  TBrasil4DCNPJWebServices = class(TBrasil4DCoreWebServices)
  private
    FCNPJ: string;
    FRetorno: TBrasil4DCNPJSchema;
    function GetRetorno: TBrasil4DCNPJSchema;
  public
    constructor Create; override;
    destructor Destroy; override;

    procedure Executar;

    property CNPJ: string read FCNPJ write FCNPJ;
    property Retorno: TBrasil4DCNPJSchema read GetRetorno;
  end;

implementation

{ TBrasil4DCNPJWebServices }

constructor TBrasil4DCNPJWebServices.Create;
begin
  inherited;
  FResource := CNPJ_RESOURCE;
end;

destructor TBrasil4DCNPJWebServices.Destroy;
begin
  FreeAndNil(FRetorno);
  inherited;
end;

procedure TBrasil4DCNPJWebServices.Executar;
var
  LResource: string;
  LErro: string;
  LJSON: TJSONObject;
begin
  LResource := FResource + '/' + FCNPJ.Replace('/', EmptyStr);
  FreeAndNil(FRetorno);
  FRequest
    .GET
    .BaseUrl(FBaseUrl)
    .Resource(LResource);

  EnviarRequest;
  LJSON := FResponse.GetJSONObject;
  LErro := LJSON.ValueAsString('message');
  if LErro <> EmptyStr then
    raise EBrasil4DCNPJException.Create(FCNPJ, LErro);
  FRetorno := TBrasil4DCNPJSchema.Create;
  FRetorno.FromJSONObject(LJSON);
end;

function TBrasil4DCNPJWebServices.GetRetorno: TBrasil4DCNPJSchema;
begin
  if not Assigned(FRetorno) then
    FRetorno := TBrasil4DCNPJSchema.Create;
  Result := FRetorno;
end;

end.
