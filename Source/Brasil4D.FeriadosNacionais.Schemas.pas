unit Brasil4D.FeriadosNacionais.Schemas;

interface

uses
  Brasil4D.Schemas,
  Brasil4D.Helper.JSON,
  System.JSON,
  System.SysUtils;

type
  TBrasil4DFeriadosNacionaisSchemaData = class(TBrasil4DSchema)
  private
    FDate: TDateTime;
    FName: string;
    FType: string;
  public
    procedure FromJSONObject(AJSONObject: TJSONObject); override;

    property Date: TDateTime read FDate write FDate;
    property Name: string read FName write FName;
    property &Type: string read FType write FType;
  end;

  TBrasil4DFeriadosNacionaisSchemaError = class(TBrasil4DSchema)
  private
    FName: string;
    FType: string;
    FMessage: string;
  public
    procedure FromJSONObject(AJSONObject: TJSONObject); override;

    property Message: string read FMessage write FMessage;
    property Name: string read FName write FName;
    property &Type: string read FType write FType;
  end;

implementation

{ TBrasil4DFeriadosNacionaisSchemaData }

procedure TBrasil4DFeriadosNacionaisSchemaData.FromJSONObject(AJSONObject: TJSONObject);
begin
  FDate := AJSONObject.ValueAsDateTime('date');
  FName := AJSONObject.ValueAsString('name');
  FType := AJSONObject.ValueAsString('type');
end;

{ TBrasil4DFeriadosNacionaisSchemaError }

procedure TBrasil4DFeriadosNacionaisSchemaError.FromJSONObject(AJSONObject: TJSONObject);
begin
  FMessage := AJSONObject.ValueAsString('message');
  FName := AJSONObject.ValueAsString('name');
  FType := AJSONObject.ValueAsString('type');
end;

end.
