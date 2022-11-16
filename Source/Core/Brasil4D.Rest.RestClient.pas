unit Brasil4D.Rest.RestClient;

interface

uses
  Brasil4D.Rest.Base,
  Brasil4D.Helper.JSON,
  Brasil4D.Helper.DateTime,
  IPPeerCommon,
  IPPeerAPI,
  IPPeerClient,
  REST.Client,
  REST.Types,
  REST.Json,
  System.SysUtils,
  System.Classes,
  System.JSON;

type
  TBrasil4DRestRequestClient = class(TBrasil4DRestRequestBase)
  private
    FRestClient: TRestClient;
    FRestRequest: TRESTRequest;
    FRestResponse: TRESTResponse;
    FResponse: TBrasil4DRestResponseBase;

    procedure PrepareRequest;
    procedure PrepareRequestProxy;
    procedure PrepareRequestHeaders;
    procedure PrepareRequestQueries;
    procedure PrepareRequestBody;
    procedure PrepareRequestAuth;
  public
    constructor Create; override;
    destructor Destroy; override;

    function Send: TBrasil4DRestResponseBase; override;
  end;

  TBrasil4DRestResponseClient = class(TBrasil4DRestResponseBase)
  public
    constructor Create(ARestResponse: TRESTResponse);
  end;

implementation

{ TBrasil4DRestRequestClient }

constructor TBrasil4DRestRequestClient.Create;
begin
  inherited;
  FRestResponse := TRESTResponse.Create(nil);
  FRestClient := TRESTClient.Create(nil);
  FRestClient.SynchronizedEvents := False;
  FRestClient.RaiseExceptionOn500 := False;

  FRestRequest := TRESTRequest.Create(nil);
  FRestRequest.SynchronizedEvents := False;

  FRestRequest.Client := FRestClient;
  FRestRequest.Response := FRestResponse;
end;

destructor TBrasil4DRestRequestClient.Destroy;
begin
  FreeAndNil(FRestResponse);
  FreeAndNil(FRestRequest);
  FreeAndNil(FRestClient);
  FreeAndNil(FResponse);
  inherited;
end;

procedure TBrasil4DRestRequestClient.PrepareRequest;
begin
  FreeAndNil(FResponse);
  FRestClient.BaseURL := FBaseUrl;
  FRestRequest.Resource := FResource;
  FRestRequest.Timeout := FTimeOut;

  case FMethodType of
    mtGET: FRestRequest.Method := rmGET;
    mtPOST: FRestRequest.Method := rmPOST;
    mtPUT: FRestRequest.Method := rmPUT;
    mtDELETE: FRestRequest.Method := rmDELETE;
    mtPATCH: FRestRequest.Method := rmPATCH;
  end;

  PrepareRequestProxy;
  PrepareRequestHeaders;
  PrepareRequestQueries;
  PrepareRequestBody;
  PrepareRequestAuth;
end;

procedure TBrasil4DRestRequestClient.PrepareRequestAuth;
begin
end;

procedure TBrasil4DRestRequestClient.PrepareRequestBody;
begin
  FRestRequest.AddBody(FBody, FContentType)
end;

procedure TBrasil4DRestRequestClient.PrepareRequestHeaders;
var
  I: Integer;
  LParameter: TRESTRequestParameter;
begin
  for I := 0 to Pred(FHeaders.Count) do
  begin
    LParameter := FRestRequest.Params.AddItem;
    LParameter.Kind := pkHTTPHEADER;
    LParameter.name := FHeaders.Names[I];
    LParameter.Value := FHeaders.ValueFromIndex[I];
  end;
end;

procedure TBrasil4DRestRequestClient.PrepareRequestProxy;
begin
end;

procedure TBrasil4DRestRequestClient.PrepareRequestQueries;
var
  I: Integer;
  LOptions: TRESTRequestParameterOptions;
begin
  for I := 0 to Pred(FQuery.Count) do
  begin
    LOptions := [];
    {$IF COMPILERVERSION < 33}
    FRestRequest.AddParameter(FQuery.Names[I], FQuery.ValueFromIndex[I], pkGETorPOST, options);
    {$ELSE}
    FRestRequest.AddParameter(FQuery.Names[I], FQuery.ValueFromIndex[I], pkQuery, LOptions);
    {$ENDIF}
  end;
end;

function TBrasil4DRestRequestClient.Send: TBrasil4DRestResponseBase;
begin
  PrepareRequest;
  FRestRequest.Execute;
  FResponse := TBrasil4DRestResponseClient.Create(FRestResponse);
  Result := FResponse;
end;

{ TBrasil4DRestResponseClient }

constructor TBrasil4DRestResponseClient.Create(ARestResponse: TRESTResponse);
begin
  FStatusCode := ARestResponse.StatusCode;
  FStatusText := ARestResponse.StatusText;
  FBodyText := ARestResponse.Content;
  FHeaders := TStringList.Create;
  FHeaders.Text := ARestResponse.Headers.Text;
end;

end.
