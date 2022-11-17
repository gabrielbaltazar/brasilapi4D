unit Brasil4D.DDD.Schemas;

interface

uses
  Brasil4D.Schemas,
  Brasil4D.Helper.JSON,
  System.Generics.Collections,
  System.JSON,
  System.SysUtils;

type
  TBrasil4DDDDSchemaRegiao = class;

  TBrasil4DDDDSchema = class(TBrasil4DSchema)
  private
    FState: string;
    FNome: string;
    FCities: TList<string>;
    FRegiao: TBrasil4DDDDSchemaRegiao;
  public
    constructor Create;
    destructor Destroy; override;

    procedure FromJSONObject(AJSONObject: TJSONObject); override;

    property State: string read FState write FState;
    property Nome: string read FNome write FNome;
    property Cities: TList<string> read FCities write FCities;
    property Regiao: TBrasil4DDDDSchemaRegiao read FRegiao write FRegiao;
  end;

  TBrasil4DDDDSchemaRegiao = class(TBrasil4DSchema)
  private
    FId: Integer;
    FSigla: string;
    FNome: string;
  public
    procedure FromJSONObject(AJSONObject: TJSONObject); override;
    procedure Clear;

    property Id: Integer read FId write FId;
    property Sigla: string read FSigla write FSigla;
    property Nome: string read FNome write FNome;
  end;

implementation

{ TBrasil4DDDDSchemaRegiao }

procedure TBrasil4DDDDSchemaRegiao.Clear;
begin
  FId := 0;
  FSigla := EmptyStr;
  FNome := EmptyStr;
end;

procedure TBrasil4DDDDSchemaRegiao.FromJSONObject(AJSONObject: TJSONObject);
begin
  if Assigned(AJSONObject) then
  begin
    FId := AJSONObject.ValueAsInteger('id');
    FSigla := AJSONObject.ValueAsString('sigla');
    FNome := AJSONObject.ValueAsString('nome');
  end;
end;

{ TBrasil4DDDDSchema }

constructor TBrasil4DDDDSchema.Create;
begin
  FCities := TList<string>.Create;
  FRegiao := TBrasil4DDDDSchemaRegiao.Create;
end;

destructor TBrasil4DDDDSchema.Destroy;
begin
  FreeAndNil(FCities);
  FreeAndNil(FRegiao);
  inherited;
end;

procedure TBrasil4DDDDSchema.FromJSONObject(AJSONObject: TJSONObject);
var
  LJSONArray: TJSONArray;
  I: Integer;
begin
  FCities.Clear;
  FState := AJSONObject.ValueAsString('state');
  FNome := AJSONObject.ValueAsString('nome');
  FRegiao.FromJSONObject(AJSONObject.ValueAsJSONObject('regiao'));

  LJSONArray := AJSONObject.ValueAsJSONArray('cities');
  if Assigned(LJSONArray) then
  begin
    for I := 0 to Pred(LJSONArray.Count) do
      FCities.Add(LJSONArray.Items[I].Value);
  end;
end;

end.
