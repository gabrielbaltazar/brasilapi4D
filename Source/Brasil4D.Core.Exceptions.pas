unit Brasil4D.Core.Exceptions;

interface

uses
  System.SysUtils;

type
  EBrasil4DException = class(Exception);

  EBrasil4DCepException = class(EBrasil4DException)
  private
    FCep: string;
  public
    constructor Create(ACep: string; AMessage: string); reintroduce;
    property Cep: string read FCep;
  end;

  EBrasil4DCNPJException = class(EBrasil4DException)
  private
    FCNPJ: string;
  public
    constructor Create(ACNPJ: string; AMessage: string); reintroduce;
    property Cep: string read FCNPJ;
  end;

  EBrasil4DDDDException = class(EBrasil4DException)
  private
    FDDD: Integer;
  public
    constructor Create(ADDD: Integer; AMessage: string); reintroduce;
    property DDD: Integer read FDDD;
  end;

  EBrasil4DIBGEException = class(EBrasil4DException)
  private
    FUF: string;
  public
    constructor Create(AUF: string; AMessage: string); reintroduce;
    property UF: string read FUF;
  end;

  EBrasil4DNCMException = class(EBrasil4DException)
  private
    FCodigo: string;
  public
    constructor Create(ACodigo: string; AMessage: string); reintroduce;
    property Codigo: string read FCodigo;
  end;

  EBrasil4DRegistroBRException = class(EBrasil4DException)
  private
    FDomain: string;
  public
    constructor Create(ADomain: string; AMessage: string); reintroduce;
    property Domain: string read FDomain;
  end;

  EBrasil4DISBNException = class(EBrasil4DException)
  private
    FISBN: string;
  public
    constructor Create(AISBN: string; AMessage: string); reintroduce;
    property ISBN: string read FISBN;
  end;

  EBrasil4DTaxasException = class(EBrasil4DException)
  private
    FNome: string;
  public
    constructor Create(ANome: string; AMessage: string); reintroduce;
    property Nome: string read FNome;
  end;

implementation

{ EBrasil4DCepException }

constructor EBrasil4DCepException.Create(ACep, AMessage: string);
begin
  inherited Create(AMessage);
  FCep := ACep;
end;

{ EBrasil4DCNPJException }

constructor EBrasil4DCNPJException.Create(ACNPJ, AMessage: string);
begin
  inherited Create(AMessage);
  FCNPJ := ACNPJ;
end;

{ EBrasil4DDDDException }

constructor EBrasil4DDDDException.Create(ADDD: Integer; AMessage: string);
begin
  inherited Create(AMessage);
  FDDD := ADDD;
end;

{ EBrasil4DRegistroBRException }

constructor EBrasil4DRegistroBRException.Create(ADomain, AMessage: string);
begin
  inherited Create(AMessage);
  FDomain := ADomain;
end;

{ EBrasil4DISBNException }

constructor EBrasil4DISBNException.Create(AISBN, AMessage: string);
begin
  inherited Create(AMessage);
  FISBN := AISBN;
end;

{ EBrasil4DTaxasException }

constructor EBrasil4DTaxasException.Create(ANome, AMessage: string);
begin
  inherited Create(AMessage);
  FNome := ANome;
end;

{ EBrasil4DNCMException }

constructor EBrasil4DNCMException.Create(ACodigo, AMessage: string);
begin
  inherited Create(AMessage);
  FCodigo := ACodigo;
end;

{ EBrasil4DIBGEException }

constructor EBrasil4DIBGEException.Create(AUF, AMessage: string);
begin
  inherited Create(AMessage);
  FUF := AUF;
end;

end.
