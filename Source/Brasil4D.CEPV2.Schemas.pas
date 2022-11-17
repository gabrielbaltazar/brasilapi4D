unit Brasil4D.CEPV2.Schemas;

interface

uses
  Brasil4D.Schemas,
  Brasil4D.Helper.JSON,
  System.JSON,
  System.SysUtils;

type
  TBrasil4DCEPV2Schema = class(TBrasil4DSchema)
  private
    FCep: string;
    FState: string;
    FCity: string;
    FNeighborhood: string;
    FStreet: string;
    FService: string;
    FLatitude: Double;
    FLongitude: Double;
  public
    procedure FromJSONObject(AJSONObject: TJSONObject); override;

    property Cep: string read FCep write FCep;
    property State: string read FState write FState;
    property City: string read FCity write FCity;
    property Neighborhood: string read FNeighborhood write FNeighborhood;
    property Street: string read FStreet write FStreet;
    property Service: string read FService write FService;
    property Latitude: Double read FLatitude write FLatitude;
    property Longitude: Double read FLongitude write FLongitude;
  end;

implementation

{ TBrasil4DCEPV2Schema }

procedure TBrasil4DCEPV2Schema.FromJSONObject(AJSONObject: TJSONObject);
var
  LJSON: TJSONObject;
begin
  FCep := AJSONObject.ValueAsString('cep');
  FState := AJSONObject.ValueAsString('state');
  FCity := AJSONObject.ValueAsString('city');
  FNeighborhood := AJSONObject.ValueAsString('neighborhood');
  FStreet := AJSONObject.ValueAsString('street');
  FService := AJSONObject.ValueAsString('service');

  LJSON := AJSONObject.ValueAsJSONObject('location');
  if Assigned(LJSON) then
    LJSON := LJSON.ValueAsJSONObject('coordinates');
  if Assigned(LJSON) then
  begin
    FLatitude := LJSON.ValueAsFloat('latitude');
    FLongitude := LJSON.ValueAsFloat('longitude');
  end;
end;

end.
