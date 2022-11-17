unit Brasil4D.ISBN.WebServices;

interface

uses
  Brasil4D.Core.WebServices,
  Brasil4D.Core.Constants,
  Brasil4D.Core.Exceptions,
  Brasil4D.Rest.Base,
  Brasil4D.Rest.RestClient,
  Brasil4D.ISBN.Schemas,
  Brasil4D.Helper.JSON,
  System.DateUtils,
  System.JSON,
  System.SysUtils,
  System.Generics.Collections;

type
  TBrasil4DISBNWebServices = class(TBrasil4DCoreWebServices)
  private
    FISBN: string;
    FProviders: TList<TBrasil4DISBNProvider>;
    FRetorno: TBrasil4DISBNSchema;
    function GetRetorno: TBrasil4DISBNSchema;
  public
    constructor Create; override;
    destructor Destroy; override;

    procedure Executar;

    property ISBN: string read FISBN write FISBN;
    property Providers: TList<TBrasil4DISBNProvider> read  FProviders;
    property Retorno: TBrasil4DISBNSchema read GetRetorno;
  end;

implementation

{ TBrasil4DISBNWebServices }

constructor TBrasil4DISBNWebServices.Create;
begin
  inherited;
  FResource := ISBN_RESOURCE;
  FProviders := TList<TBrasil4DISBNProvider>.Create;
end;

destructor TBrasil4DISBNWebServices.Destroy;
begin
  FreeAndNil(FRetorno);
  FreeAndNil(FProviders);
  inherited;
end;

procedure TBrasil4DISBNWebServices.Executar;
var
  LResource: string;
  LErro: string;
  LQuery: string;
  I: Integer;
  LJSON: TJSONObject;
begin
  FreeAndNil(FRetorno);
  for I := 0 to Pred(FProviders.Count) do
  begin
    if I = 0 then
      LQuery := '?providers=' + FProviders[I].ToString
    else
      LQuery := LQuery + ',' + FProviders[I].ToString;
  end;
  LResource := FResource + '/' + FISBN + LQuery;
  FRequest
    .GET
    .BaseUrl(FBaseUrl)
    .Resource(LResource);

  EnviarRequest;
  LJSON := FResponse.GetJSONObject;
  LErro := LJSON.ValueAsString('message');
  if LErro <> EmptyStr then
    raise EBrasil4DISBNException.Create(FISBN, LErro);
  FRetorno := TBrasil4DISBNSchema.Create;
  FRetorno.FromJSONObject(LJSON);
end;

function TBrasil4DISBNWebServices.GetRetorno: TBrasil4DISBNSchema;
begin
  if not Assigned(FRetorno) then
    FRetorno := TBrasil4DISBNSchema.Create;
  Result := FRetorno;
end;

end.
