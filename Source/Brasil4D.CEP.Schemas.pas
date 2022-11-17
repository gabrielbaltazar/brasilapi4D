unit Brasil4D.CEP.Schemas;

interface

uses
  Brasil4D.Schemas,
  Brasil4D.Helper.JSON,
  System.JSON,
  System.SysUtils;

type
  TBrasil4DCEPSchema = class(TBrasil4DSchema)
  private
    FCep: string;
    FState: string;
    FCity: string;
    FNeighborhood: string;
    FStreet: string;
    FService: string;
  public
    procedure FromJSONObject(AJSONObject: TJSONObject); override;

    property Cep: string read FCep write FCep;
    property State: string read FState write FState;
    property City: string read FCity write FCity;
    property Neighborhood: string read FNeighborhood write FNeighborhood;
    property Street: string read FStreet write FStreet;
    property Service: string read FService write FService;
  end;

implementation

{ TBrasil4DCEPSchema }

procedure TBrasil4DCEPSchema.FromJSONObject(AJSONObject: TJSONObject);
begin
  FCep := AJSONObject.ValueAsString('cep');
  FState := AJSONObject.ValueAsString('state');
  FCity := AJSONObject.ValueAsString('city');
  FNeighborhood := AJSONObject.ValueAsString('neighborhood');
  FStreet := AJSONObject.ValueAsString('street');
  FService := AJSONObject.ValueAsString('service');
end;

end.
