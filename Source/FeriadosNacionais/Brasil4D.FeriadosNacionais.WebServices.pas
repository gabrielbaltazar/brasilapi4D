unit Brasil4D.FeriadosNacionais.WebServices;

interface

uses
  Brasil4D.Rest.Base,
  Brasil4D.Rest.RestClient,
  Brasil4D.FeriadosNacionais.Schemas,
  System.DateUtils,
  System.JSON,
  System.SysUtils,
  System.Generics.Collections;

type
  TBrasil4DFeriadosNacionaisWebServiceLista = class;

  TBrasil4DFeriadosNacionaisWebServices = class
  private
    FLista: TBrasil4DFeriadosNacionaisWebServiceLista;
    function GetLista: TBrasil4DFeriadosNacionaisWebServiceLista;
  public
    destructor Destroy; override;

    property Lista: TBrasil4DFeriadosNacionaisWebServiceLista read GetLista;
  end;

  TBrasil4DFeriadosNacionaisWebServiceLista = class
  private
    FRequest: TBrasil4DRestRequestBase;
    FResponse: TBrasil4DRestResponseBase;
    FAno: Integer;
    FRetorno: TObjectList<TBrasil4DFeriadosNacionaisSchemaData>;
    function GetRetorno: TObjectList<TBrasil4DFeriadosNacionaisSchemaData>;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Executar;

    property Ano: Integer read FAno write FAno;
    property Retorno: TObjectList<TBrasil4DFeriadosNacionaisSchemaData> read GetRetorno;
  end;

implementation

{ TBrasil4DFeriadosNacionaisWebServiceLista }

constructor TBrasil4DFeriadosNacionaisWebServiceLista.Create;
begin
  FRequest := TBrasil4DRestRequestClient.Create;
end;

destructor TBrasil4DFeriadosNacionaisWebServiceLista.Destroy;
begin
  FreeAndNil(FRequest);
  FreeAndNil(FRetorno);
  inherited;
end;

procedure TBrasil4DFeriadosNacionaisWebServiceLista.Executar;
var
  LUrl: string;
  LJSONArray: TJSONArray;
begin
  FreeAndNil(FRetorno);
  if FAno <= 0 then
    FAno := YearOf(Now);
  LUrl := 'https://brasilapi.com.br/api/feriados/v1/' + FAno.ToString;
  FResponse := FRequest.GET.BaseURL(LUrl).Send;
  LJSONArray := FResponse.GetJSONArray;
  FRetorno := TBrasil4DFeriadosNacionaisSchemaData
    .FromJSONArray<TBrasil4DFeriadosNacionaisSchemaData>(LJSONArray);
end;

function TBrasil4DFeriadosNacionaisWebServiceLista.GetRetorno: TObjectList<TBrasil4DFeriadosNacionaisSchemaData>;
begin
  if not Assigned(FRetorno) then
    FRetorno := TObjectList<TBrasil4DFeriadosNacionaisSchemaData>.Create;
  Result := FRetorno;
end;

{ TBrasil4DFeriadosNacionaisWebServices }

destructor TBrasil4DFeriadosNacionaisWebServices.Destroy;
begin
  FLista.Free;
  inherited;
end;

function TBrasil4DFeriadosNacionaisWebServices.GetLista: TBrasil4DFeriadosNacionaisWebServiceLista;
begin
  if not Assigned(FLista) then
    FLista := TBrasil4DFeriadosNacionaisWebServiceLista.Create;
  Result := FLista;
end;

end.
