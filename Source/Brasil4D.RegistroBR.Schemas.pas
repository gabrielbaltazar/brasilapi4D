unit Brasil4D.RegistroBR.Schemas;

interface

uses
  Brasil4D.Schemas,
  Brasil4D.Helper.JSON,
  System.Generics.Collections,
  System.JSON,
  System.SysUtils;

type
  TBrasil4DRegistroBRSchema = class(TBrasil4DSchema)
  private
    FStatusCode: Integer;
    FStatus: string;
    FFqdn: string;
    FPublicationStatus: string;
    FExpiresAt: TDateTime;
    FHosts: TList<string>;
    FSuggestions: TList<string>;
  public
    constructor Create;
    destructor Destroy; override;

    procedure FromJSONObject(AJSONObject: TJSONObject); override;

    property StatusCode: Integer read FStatusCode write FStatusCode;
    property Status: string read FStatus write FStatus;
    property Fqdn: string read FFqdn write FFqdn;
    property PublicationStatus: string read FPublicationStatus write FPublicationStatus;
    property ExpiresAt: TDateTime read FExpiresAt write FExpiresAt;
    property Hosts: TList<string> read FHosts write FHosts;
    property Suggestions: TList<string> read FSuggestions write FSuggestions;
  end;

implementation

{ TBrasil4DRegistroBRSchema }

constructor TBrasil4DRegistroBRSchema.Create;
begin
  FHosts := TList<string>.Create;
  FSuggestions := TList<string>.Create;
end;

destructor TBrasil4DRegistroBRSchema.Destroy;
begin
  FHosts.Free;
  FSuggestions.Free;
  inherited;
end;

procedure TBrasil4DRegistroBRSchema.FromJSONObject(AJSONObject: TJSONObject);
var
  LJSONArray: TJSONArray;
  I: Integer;
begin
  FHosts.Clear;
  FSuggestions.Clear;
  FStatusCode := AJSONObject.ValueAsInteger('status_code');
  FStatus := AJSONObject.ValueAsString('status');
  FFqdn := AJSONObject.ValueAsString('fqdn');
  FPublicationStatus := AJSONObject.ValueAsString('publication-status');
  FExpiresAt := AJSONObject.ValueAsDateTime('expires-at');

  LJSONArray := AJSONObject.ValueAsJSONArray('hosts');
  if Assigned(LJSONArray) then
  begin
    for I := 0 to Pred(LJSONArray.Count) do
      FHosts.Add(LJSONArray.Items[I].Value);
  end;

  LJSONArray := AJSONObject.ValueAsJSONArray('suggestions');
  if Assigned(LJSONArray) then
  begin
    for I := 0 to Pred(LJSONArray.Count) do
      FSuggestions.Add(LJSONArray.Items[I].Value);
  end;
end;

end.
