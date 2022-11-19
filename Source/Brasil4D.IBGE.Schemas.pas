unit Brasil4D.IBGE.Schemas;

interface

uses
  Brasil4D.Schemas,
  Brasil4D.Helper.JSON,
  System.JSON,
  System.SysUtils;

type
  TBrasil4DIBGESchemaEstado = class(TBrasil4DSchema)
  private
    FId: Integer;
    FSigla: string;
    FIdRegiao: Integer;
    FSiglaRegiao: string;
    FNomeRegiao: string;
    FNome: string;
  public
    procedure FromJSONObject(AJSONObject: TJSONObject); override;

    property Id: Integer read FId write FId;
    property Sigla: string read FSigla write FSigla;
    property Nome: string read FNome write FNome;
    property IdRegiao: Integer read FIdRegiao write FIdRegiao;
    property SiglaRegiao: string read FSiglaRegiao write FSiglaRegiao;
    property NomeRegiao: string read FNomeRegiao write FNomeRegiao;
  end;

  TBrasil4DIBGESchemaMunicipio = class(TBrasil4DSchema)
  private
    FNome: string;
    FCodigoIBGE: string;
  public
    procedure FromJSONObject(AJSONObject: TJSONObject); override;

    property Nome: string read FNome write FNome;
    property CodigoIBGE: string read FCodigoIBGE write FCodigoIBGE;
  end;

implementation

{ TBrasil4DIBGESchemaEstado }

procedure TBrasil4DIBGESchemaEstado.FromJSONObject(AJSONObject: TJSONObject);
var
  LJSON: TJSONObject;
begin
  FId := AJSONObject.ValueAsInteger('id');
  FSigla := AJSONObject.ValueAsString('sigla');
  FNome := AJSONObject.ValueAsString('nome');
  LJSON := AJSONObject.ValueAsJSONObject('regiao');
  if Assigned(LJSON) then
  begin
    FIdRegiao := LJSON.ValueAsInteger('id');
    FSiglaRegiao := LJSON.ValueAsString('sigla');
    FNomeRegiao := LJSON.ValueAsString('nome');
  end;
end;

{ TBrasil4DIBGESchemaMunicipio }

procedure TBrasil4DIBGESchemaMunicipio.FromJSONObject(AJSONObject: TJSONObject);
begin
  FNome := AJSONObject.ValueAsString('nome');
  FCodigoIBGE := AJSONObject.ValueAsString('codigo_ibge');
end;

end.
