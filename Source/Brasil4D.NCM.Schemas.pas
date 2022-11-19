unit Brasil4D.NCM.Schemas;

interface

uses
  Brasil4D.Schemas,
  Brasil4D.Helper.JSON,
  System.JSON,
  System.SysUtils;

type
  TBrasil4DNCMSchema = class(TBrasil4DSchema)
  private
    FCodigo: string;
    FDescricao: string;
    FDataInicio: TDateTime;
    FDataFim: TDateTime;
    FTipoAto: string;
    FNumeroAto: string;
    FAnoAto: string;
  public
    procedure FromJSONObject(AJSONObject: TJSONObject); override;

    property Codigo: string read FCodigo write FCodigo;
    property Descricao: string read FDescricao write FDescricao;
    property DataInicio: TDateTime read FDataInicio write FDataInicio;
    property DataFim: TDateTime read FDataFim write FDataFim;
    property TipoAto: string read FTipoAto write FTipoAto;
    property NumeroAto: string read FNumeroAto write FNumeroAto;
    property AnoAto: string read FAnoAto write FAnoAto;
  end;

implementation

{ TBrasil4DNCMSchema }

procedure TBrasil4DNCMSchema.FromJSONObject(AJSONObject: TJSONObject);
begin
  FCodigo := AJSONObject.ValueAsString('codigo');
  FDescricao := AJSONObject.ValueAsString('descricao');
  FDataInicio := AJSONObject.ValueAsDateTime('data_inicio');
  FDataFim := AJSONObject.ValueAsDateTime('data_fim');
  FTipoAto := AJSONObject.ValueAsString('tipo_ato');
  FNumeroAto := AJSONObject.ValueAsString('numero_ato');
  FAnoAto := AJSONObject.ValueAsString('ano_ato');
end;

end.
