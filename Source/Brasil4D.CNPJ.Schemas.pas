unit Brasil4D.CNPJ.Schemas;

interface

uses
  Brasil4D.Schemas,
  Brasil4D.Helper.JSON,
  System.JSON,
  System.Generics.Collections,
  System.SysUtils;

type
  TBrasil4DCNPJSchemaCnae = class;
  TBrasil4DCNPJSchemaQSA = class;

  TBrasil4DCNPJSchema = class(TBrasil4DSchema)
  private
    FCNPJ: string;
    FIdentificadorMatrizFilial: Integer;
    FDescricaoMatrizFilial: string;
    FRazaoSocial: string;
    FNomeFantasia: string;
    FSituacaoCadastral: Integer;
    FDescricaoSituacaoCadastral: string;
    FDataSituacaoCadastral: TDateTime;
    FMotivoSituacaoCadastral: Integer;
    FNomeCidadeExterior: string;
    FCodigoNaturezaJuridica: Integer;
    FDataInicioAtividade: TDateTime;
    FCnaeFiscal: Integer;
    FCnaeFiscalDescricao: string;
    FDescricaoTipoLogradouro: string;
    FLogradouro: string;
    FNumero: string;
    FComplemento: string;
    FBairro: string;
    FCep: string;
    FUF: string;
    FCodigoMunicipio: string;
    FMunicipio: string;
    FDDDTelefone1: string;
    FDDDTelefone2: string;
    FDDDFax: string;
    FQualificacaoDoResponsavel: Integer;
    FCapitalSocial: Double;
    FPorte: Integer;
    FDescricaoPorte: string;
    FOpcaoPeloSimples: Boolean;
    FDataOpcaoPeloSimples: TDateTime;
    FDataExclusaoDoSimples: TDateTime;
    FOpcaoPeloMei: Boolean;
    FSituacaoEspecial: string;
    FDataSituacaoEspecial: TDateTime;
    FCnaesSecundarios: TObjectList<TBrasil4DCNPJSchemaCnae>;
    FQSA: TObjectList<TBrasil4DCNPJSchemaQSA>;
    FCodigoMunicipioIBGE: String;
  public
    constructor Create;
    destructor Destroy; override;

    procedure FromJSONObject(AJSONObject: TJSONObject); override;

    property CNPJ: string read FCNPJ write FCNPJ;
    property IdentificadorMatrizFilial: Integer read FIdentificadorMatrizFilial write FIdentificadorMatrizFilial;
    property DescricaoMatrizFilial: string read FDescricaoMatrizFilial write FDescricaoMatrizFilial;
    property RazaoSocial: string read FRazaoSocial write FRazaoSocial;
    property NomeFantasia: string read FNomeFantasia write FNomeFantasia;
    property SituacaoCadastral: Integer read FSituacaoCadastral write FSituacaoCadastral;
    property DescricaoSituacaoCadastral: string read FDescricaoSituacaoCadastral write FDescricaoSituacaoCadastral;
    property DataSituacaoCadastral: TDateTime read FDataSituacaoCadastral write FDataSituacaoCadastral;
    property MotivoSituacaoCadastral: Integer read FMotivoSituacaoCadastral write FMotivoSituacaoCadastral;
    property NomeCidadeExterior: string read FNomeCidadeExterior write FNomeCidadeExterior;
    property CodigoNaturezaJuridica: Integer read FCodigoNaturezaJuridica write FCodigoNaturezaJuridica;
    property DataInicioAtividade: TDateTime read FDataInicioAtividade write FDataInicioAtividade;
    property CnaeFiscal: Integer read FCnaeFiscal write FCnaeFiscal;
    property CnaeFiscalDescricao: string read FCnaeFiscalDescricao write FCnaeFiscalDescricao;
    property DescricaoTipoLogradouro: string read FDescricaoTipoLogradouro write FDescricaoTipoLogradouro;
    property Logradouro: string read FLogradouro write FLogradouro;
    property Numero: string read FNumero write FNumero;
    property Complemento: string read FComplemento write FComplemento;
    property Bairro: string read FBairro write FBairro;
    property Cep: string read FCep write FCep;
    property UF: string read FUF write FUF;
    property CodigoMunicipio: string read FCodigoMunicipio write FCodigoMunicipio;
    property Municipio: string read FMunicipio write FMunicipio;
    property DDDTelefone1: string read FDDDTelefone1 write FDDDTelefone1;
    property DDDTelefone2: string read FDDDTelefone2 write FDDDTelefone2;
    property DDDFax: string read FDDDFax write FDDDFax;
    property QualificacaoDoResponsavel: Integer read FQualificacaoDoResponsavel write FQualificacaoDoResponsavel;
    property CapitalSocial: Double read FCapitalSocial write FCapitalSocial;
    property Porte: Integer read FPorte write FPorte;
    property DescricaoPorte: string read FDescricaoPorte write FDescricaoPorte;
    property OpcaoPeloSimples: Boolean read FOpcaoPeloSimples write FOpcaoPeloSimples;
    property DataOpcaoPeloSimples: TDateTime read FDataOpcaoPeloSimples write FDataOpcaoPeloSimples;
    property DataExclusaoDoSimples: TDateTime read FDataExclusaoDoSimples write FDataExclusaoDoSimples;
    property OpcaoPeloMei: Boolean read FOpcaoPeloMei write FOpcaoPeloMei;
    property SituacaoEspecial: string read FSituacaoEspecial write FSituacaoEspecial;
    property DataSituacaoEspecial: TDateTime read FDataSituacaoEspecial write FDataSituacaoEspecial;
    property CnaesSecundarios: TObjectList<TBrasil4DCNPJSchemaCnae> read FCnaesSecundarios write FCnaesSecundarios;
    property QSA: TObjectList<TBrasil4DCNPJSchemaQSA> read FQSA write FQSA;
    property CodigoMunicipioIBGE : String Read FCodigoMunicipioIBGE Write FCodigoMunicipioIBGE;
  end;

  TBrasil4DCNPJSchemaCnae = class(TBrasil4DSchema)
  private
    FCodigo: Integer;
    FDescricao: string;
  public
    procedure FromJSONObject(AJSONObject: TJSONObject); override;

    property Codigo: Integer read FCodigo write FCodigo;
    property Descricao: string read FDescricao write FDescricao;
  end;

  TBrasil4DCNPJSchemaQSA = class(TBrasil4DSchema)
  private
    FIdentificadorDeSocio: Integer;
    FNomeSocio: string;
    FCNPJCPFDoSocio: string;
    FCodigoQualificacaoSocio: Integer;
    FPercentualCapitalSocial: Double;
    FDataEntradaSociedade: TDateTime;
    FCPFRepresentanteLegal: string;
    FNomeRepresentanteLegal: string;
    FCodigoQualificacaoRepresentanteLegal: string;
  public
    procedure FromJSONObject(AJSONObject: TJSONObject); override;

    property IdentificadorDeSocio: Integer read FIdentificadorDeSocio write FIdentificadorDeSocio;
    property NomeSocio: string read FNomeSocio write FNomeSocio;
    property CNPJCPFDoSocio: string read FCNPJCPFDoSocio write FCNPJCPFDoSocio;
    property CodigoQualificacaoSocio: Integer read FCodigoQualificacaoSocio write FCodigoQualificacaoSocio;
    property PercentualCapitalSocial: Double read FPercentualCapitalSocial write FPercentualCapitalSocial;
    property DataEntradaSociedade: TDateTime read FDataEntradaSociedade write FDataEntradaSociedade;
    property CPFRepresentanteLegal: string read FCPFRepresentanteLegal write FCPFRepresentanteLegal;
    property NomeRepresentanteLegal: string read FNomeRepresentanteLegal write FNomeRepresentanteLegal;
    property CodigoQualificacaoRepresentanteLegal: string read FCodigoQualificacaoRepresentanteLegal write FCodigoQualificacaoRepresentanteLegal;
  end;

implementation

{ TBrasil4DCNPJSchemaCnae }

procedure TBrasil4DCNPJSchemaCnae.FromJSONObject(AJSONObject: TJSONObject);
begin
  FCodigo := AJSONObject.ValueAsInteger('codigo');
  FDescricao := AJSONObject.ValueAsString('descricao');
end;

{ TBrasil4DCNPJSchemaQSA }

procedure TBrasil4DCNPJSchemaQSA.FromJSONObject(AJSONObject: TJSONObject);
begin
  FIdentificadorDeSocio := AJSONObject.ValueAsInteger('identificador_de_socio');
  FNomeSocio := AJSONObject.ValueAsString('nome_socio');
  FCNPJCPFDoSocio := AJSONObject.ValueAsString('cnpj_cpf_do_socio');
  FCodigoQualificacaoSocio := AJSONObject.ValueAsInteger('codigo_qualificacao_socio');
  FPercentualCapitalSocial := AJSONObject.ValueAsFloat('percentual_capital_social');
  FDataEntradaSociedade := AJSONObject.ValueAsDateTime('data_entrada_sociedade');
  FCPFRepresentanteLegal := AJSONObject.ValueAsString('cpf_representante_legal');
  FNomeRepresentanteLegal := AJSONObject.ValueAsString('nome_representante_legal');
  FCodigoQualificacaoRepresentanteLegal := AJSONObject.ValueAsString('codigo_qualificacao_representante_legal');
end;

{ TBrasil4DCNPJSchema }

constructor TBrasil4DCNPJSchema.Create;
begin
  FCnaesSecundarios := TObjectList<TBrasil4DCNPJSchemaCnae>.Create;
  FQSA := TObjectList<TBrasil4DCNPJSchemaQSA>.Create;
end;

destructor TBrasil4DCNPJSchema.Destroy;
begin
  FreeAndNil(FCnaesSecundarios);
  FreeAndNil(FQSA);
  inherited;
end;

procedure TBrasil4DCNPJSchema.FromJSONObject(AJSONObject: TJSONObject);
begin
  FCNPJ := AJSONObject.ValueAsString('cnpj');
  FIdentificadorMatrizFilial := AJSONObject.ValueAsInteger('identificador_matriz_filial');
  FDescricaoMatrizFilial := AJSONObject.ValueAsString('descricao_matriz_filial');
  FRazaoSocial := AJSONObject.ValueAsString('razao_social');
  FNomeFantasia := AJSONObject.ValueAsString('nome_fantasia');
  FSituacaoCadastral := AJSONObject.ValueAsInteger('situacao_cadastral');
  FDescricaoSituacaoCadastral := AJSONObject.ValueAsString('descricao_situacao_cadastral');
  FDataSituacaoCadastral := AJSONObject.ValueAsDateTime('data_situacao_cadastral');
  FMotivoSituacaoCadastral := AJSONObject.ValueAsInteger('motivo_situacao_cadastral');
  FNomeCidadeExterior := AJSONObject.ValueAsString('nome_cidade_exterior');
  FCodigoNaturezaJuridica := AJSONObject.ValueAsInteger('codigo_natureza_juridica');
  FDataInicioAtividade := AJSONObject.ValueAsDateTime('data_inicio_atividade');
  FCnaeFiscal := AJSONObject.ValueAsInteger('cnae_fiscal');
  FCnaeFiscalDescricao := AJSONObject.ValueAsString('cnae_fiscal_descricao');
  FDescricaoTipoLogradouro := AJSONObject.ValueAsString('descricao_tipo_logradouro');
  FLogradouro := AJSONObject.ValueAsString('logradouro');
  FNumero := AJSONObject.ValueAsString('numero');
  FComplemento := AJSONObject.ValueAsString('complemento');
  FBairro := AJSONObject.ValueAsString('bairro');
  FCep := AJSONObject.ValueAsString('cep');
  FUF := AJSONObject.ValueAsString('uf');
  FCodigoMunicipio := AJSONObject.ValueAsString('codigo_municipio');
  FMunicipio := AJSONObject.ValueAsString('municipio');
  FDDDTelefone1 := AJSONObject.ValueAsString('ddd_telefone_1');
  FDDDTelefone2 := AJSONObject.ValueAsString('ddd_telefone_2');
  FDDDFax := AJSONObject.ValueAsString('ddd_fax');
  FQualificacaoDoResponsavel := AJSONObject.ValueAsInteger('qualificacao_do_responsavel');
  FCapitalSocial := AJSONObject.ValueAsFloat('capital_social');
  FPorte := AJSONObject.ValueAsInteger('porte');
  FDescricaoPorte := AJSONObject.ValueAsString('descricao_porte');
  FOpcaoPeloSimples := AJSONObject.ValueAsBoolean('opcao_pelo_simples');
  FDataOpcaoPeloSimples := AJSONObject.ValueAsDateTime('data_opcao_pelo_simples');
  FDataExclusaoDoSimples := AJSONObject.ValueAsDateTime('data_exclusao_do_simples');
  FOpcaoPeloMei := AJSONObject.ValueAsBoolean('opcao_pelo_mei');
  FSituacaoEspecial := AJSONObject.ValueAsString('situacao_especial');
  FDataSituacaoEspecial := AJSONObject.ValueAsDateTime('data_situacao_especial');
  FCodigoMunicipioIBGE := AJSONObject.ValueAsString('codigo_municipio_ibge');

  FreeAndNil(FCnaesSecundarios);
  FreeAndNil(FQSA);

  FCnaesSecundarios := TBrasil4DCNPJSchemaCnae
    .FromJSONArray<TBrasil4DCNPJSchemaCnae>(AJSONObject.ValueAsJSONArray('cnaes_secundarios'));

  FQSA := TBrasil4DCNPJSchemaQSA
    .FromJSONArray<TBrasil4DCNPJSchemaQSA>(AJSONObject.ValueAsJSONArray('qsa'));
end;

end.
