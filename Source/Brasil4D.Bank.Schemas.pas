unit Brasil4D.Bank.Schemas;

interface

uses
  Brasil4D.Schemas,
  Brasil4D.Helper.JSON,
  System.JSON,
  System.SysUtils;

type
  TBrasil4DBankSchema = class(TBrasil4DSchema)
  private
    FISPB: string;
    FName: string;
    FCode: Integer;
    FFullName: string;
  public
    procedure FromJSONObject(AJSONObject: TJSONObject); override;

    property ISPB: string read FISPB write FISPB;
    property Name: string read FName write FName;
    property Code: Integer read FCode write FCode;
    property FullName: string read FFullName write FFullName;
  end;

implementation

{ TBrasil4DBankSchema }

procedure TBrasil4DBankSchema.FromJSONObject(AJSONObject: TJSONObject);
begin
  FISPB := AJSONObject.ValueAsString('ispb');
  FName := AJSONObject.ValueAsString('name');
  FCode := AJSONObject.ValueAsInteger('code');
  FFullName := AJSONObject.ValueAsString('fullName');
end;

end.
