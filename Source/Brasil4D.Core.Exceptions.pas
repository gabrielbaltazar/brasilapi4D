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

end.
