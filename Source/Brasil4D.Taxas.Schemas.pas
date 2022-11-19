unit Brasil4D.Taxas.Schemas;

interface

uses
  Brasil4D.Schemas,
  Brasil4D.Helper.JSON,
  System.JSON,
  System.SysUtils;

type
  TBrasil4DTaxasSchema = class(TBrasil4DSchema)
  private
    FNome: string;
    FValor: Double;
  public
    procedure FromJSONObject(AJSONObject: TJSONObject); override;

    property Nome: string read FNome write FNome;
    property Valor: Double read FValor write FValor;
  end;

implementation

{ TBrasil4DTaxasSchema }

procedure TBrasil4DTaxasSchema.FromJSONObject(AJSONObject: TJSONObject);
begin
  FNome := AJSONObject.ValueAsString('nome');
  FValor := AJSONObject.ValueAsFloat('valor');
end;

end.
