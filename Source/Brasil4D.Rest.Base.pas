unit Brasil4D.Rest.Base;

interface

uses
  Brasil4D.Helper.JSON,
  System.JSON,
  System.SysUtils,
  System.Classes;

type
  TRestMethodType = (mtGET, mtPOST, mtPUT, mtDELETE, mtPATCH);
  TBrasil4DRestResponseBase = class;

  TBrasil4DRestRequestBase = class
  protected
    FQuery: TStrings;
    FFormUrlEncoded: TStrings;
    FHeaders: TStrings;
    FUsername: string;
    FPassword: string;
    FToken: string;
    FMethodType: TRestMethodType;
    FTimeOut: Integer;
    FAccept: string;
    FContentType: string;
    FBaseURL: string;
    FResource: string;
    FBody: string;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    function POST: TBrasil4DRestRequestBase;
    function PUT: TBrasil4DRestRequestBase;
    function GET: TBrasil4DRestRequestBase;
    function DELETE: TBrasil4DRestRequestBase;
    function PATCH: TBrasil4DRestRequestBase;

    function ContentType(AValue: string): TBrasil4DRestRequestBase;
    function BasicAuth(AUsername, APassword: string): TBrasil4DRestRequestBase;
    function Token(AValue: string): TBrasil4DRestRequestBase;

    function AddOrSetHeader(AName, AValue: string): TBrasil4DRestRequestBase;
    function AddOrSetQuery (AName, AValue: string): TBrasil4DRestRequestBase;
    function AddOrSetUrlEncoded(Name, AValue: string): TBrasil4DRestRequestBase;

    function Body(AValue: TJSONObject; AOwner: Boolean = True): TBrasil4DRestRequestBase; overload;
    function Body(AValue: TJSONArray; AOwner: Boolean = True ): TBrasil4DRestRequestBase; overload;
    function Body(AValue: string): TBrasil4DRestRequestBase; overload;

    function BaseURL(AValue: string): TBrasil4DRestRequestBase;
    function Resource(AValue: string): TBrasil4DRestRequestBase;
    function TimeOut(AValue: Integer): TBrasil4DRestRequestBase;

    function Send: TBrasil4DRestResponseBase; virtual; abstract;

    procedure ClearRequest; virtual;
  end;

  TBrasil4DRestResponseBase = class
  protected
    FStatusCode: Integer;
    FStatusText: string;
    FBodyText: string;
    FJSONObject: TJSONObject;
    FJSONArray: TJSONArray;
    FHeaders: TStrings;
  public
    destructor Destroy; override;

    function StatusCode: Integer;
    function StatusText: string;
    function GetText: string;
    function GetJSONObject: TJSONObject;
    function GetJSONArray: TJSONArray;
    function GetBytes: TBytes;

    function HeaderAsString(AName: string): string;
    function HeaderAsInteger(AName: string): Integer;
    function HeaderAsFloat(AName: string): Double;
    function HeaderAsDateTime(AName: string): TDateTime;
  end;

implementation

{ TBrasil4DRestRequestBase }

function TBrasil4DRestRequestBase.AddOrSetHeader(AName, AValue: string): TBrasil4DRestRequestBase;
begin
  Result := Self;
  FHeaders.Values[AName] := AValue;
end;

function TBrasil4DRestRequestBase.AddOrSetQuery(AName, AValue: string): TBrasil4DRestRequestBase;
begin
  Result := Self;
  FQuery.Add(Format('%s=%s', [AName, AValue]));
end;

function TBrasil4DRestRequestBase.AddOrSetUrlEncoded(Name, AValue: string): TBrasil4DRestRequestBase;
begin
  Result := Self;
  FFormUrlEncoded.Values[Name] := AValue;
  FContentType := 'application/x-www-form-urlencoded';
end;

function TBrasil4DRestRequestBase.BaseURL(AValue: string): TBrasil4DRestRequestBase;
begin
  Result := Self;
  FBaseURL := AValue;
end;

function TBrasil4DRestRequestBase.BasicAuth(AUsername, APassword: string): TBrasil4DRestRequestBase;
begin
  Result := Self;
  FUsername := AUsername;
  FPassword := APassword;
end;

function TBrasil4DRestRequestBase.Body(AValue: TJSONObject; AOwner: Boolean): TBrasil4DRestRequestBase;
var
  LJson: string;
begin
  Result := Self;
  if Assigned(AValue) then
  begin
    LJson := AValue.Encode;
    Body(LJson);
    if AOwner then
      AValue.Free;
  end;
end;

function TBrasil4DRestRequestBase.Body(AValue: string): TBrasil4DRestRequestBase;
begin
  Result := Self;
  FBody := AValue;
end;

function TBrasil4DRestRequestBase.Body(AValue: TJSONArray; AOwner: Boolean): TBrasil4DRestRequestBase;
var
  LJson: string;
begin
  Result := Self;
  if Assigned(AValue) then
  begin
    LJson := AValue.Encode;
    Body(LJson);
    if AOwner then
      AValue.Free;
  end;
end;

procedure TBrasil4DRestRequestBase.ClearRequest;
begin
  FHeaders.Clear;
  FQuery.Clear;
  FBody := EmptyStr;
  FFormUrlEncoded.Clear;
end;

function TBrasil4DRestRequestBase.ContentType(AValue: string): TBrasil4DRestRequestBase;
begin
  Result := Self;
  FContentType := AValue;
end;

constructor TBrasil4DRestRequestBase.Create;
begin
  FQuery := TStringList.Create;
  FFormUrlEncoded := TStringList.Create;
  FHeaders := TStringList.Create;
  FContentType := 'application/json';
  FAccept := 'application/json';
end;

function TBrasil4DRestRequestBase.DELETE: TBrasil4DRestRequestBase;
begin
  Result := Self;
  FMethodType := mtDELETE;
end;

destructor TBrasil4DRestRequestBase.Destroy;
begin
  FQuery.Free;
  FHeaders.Free;
  FFormUrlEncoded.Free;
  inherited;
end;

function TBrasil4DRestRequestBase.GET: TBrasil4DRestRequestBase;
begin
  Result := Self;
  FMethodType := mtGET;
end;

function TBrasil4DRestRequestBase.PATCH: TBrasil4DRestRequestBase;
begin
  Result := Self;
  FMethodType := mtPATCH;
end;

function TBrasil4DRestRequestBase.POST: TBrasil4DRestRequestBase;
begin
  Result := Self;
  FMethodType := mtPOST;
end;

function TBrasil4DRestRequestBase.PUT: TBrasil4DRestRequestBase;
begin
  Result := Self;
  FMethodType := mtPUT;
end;

function TBrasil4DRestRequestBase.Resource(AValue: string): TBrasil4DRestRequestBase;
begin
  Result := Self;
  FResource := AValue;
end;

function TBrasil4DRestRequestBase.TimeOut(AValue: Integer): TBrasil4DRestRequestBase;
begin
  Result := Self;
  FTimeOut := AValue;
end;

function TBrasil4DRestRequestBase.Token(AValue: string): TBrasil4DRestRequestBase;
begin
  Result := Self;
  FToken := AValue;
end;

{ TBrasil4DRestResponseBase }

destructor TBrasil4DRestResponseBase.Destroy;
begin
  FJSONArray.Free;
  FJSONObject.Free;
  FHeaders.Free;
  inherited;
end;

function TBrasil4DRestResponseBase.GetBytes: TBytes;
begin
  raise Exception.Create('Not implemented yet.');
end;

function TBrasil4DRestResponseBase.GetJSONArray: TJSONArray;
begin
  if not Assigned(FJSONArray) then
    FJSONArray := TJSONArray.FromString(FBodyText);
  Result := FJSONArray;
end;

function TBrasil4DRestResponseBase.GetJSONObject: TJSONObject;
begin
  if not Assigned(FJSONObject) then
    FJSONObject := TJSONObject.FromString(FBodyText);
  Result := FJSONObject;
end;

function TBrasil4DRestResponseBase.GetText: string;
begin
  Result := FBodyText;
end;

function TBrasil4DRestResponseBase.HeaderAsDateTime(AName: string): TDateTime;
begin
  raise Exception.CreateFmt('HeaderAsDateTime not implemented yet.', []);
end;

function TBrasil4DRestResponseBase.HeaderAsFloat(AName: string): Double;
begin
  Result := StrToFloat(FHeaders.Values[AName]);
end;

function TBrasil4DRestResponseBase.HeaderAsInteger(AName: string): Integer;
begin
  Result := StrToInt(FHeaders.Values[AName]);
end;

function TBrasil4DRestResponseBase.HeaderAsString(AName: string): string;
begin
  Result := FHeaders.Values[AName];
end;

function TBrasil4DRestResponseBase.StatusCode: Integer;
begin
  Result := FStatusCode;
end;

function TBrasil4DRestResponseBase.StatusText: string;
begin
  Result := FStatusText;
end;

end.

