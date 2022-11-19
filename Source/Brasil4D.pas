unit Brasil4D;

interface

uses
  System.Classes,
  System.SysUtils,
  Brasil4D.Bank.WebServices,
  Brasil4D.CEP.WebServices,
  Brasil4D.CEPV2.WebServices,
  Brasil4D.CNPJ.WebServices,
  Brasil4D.DDD.WebServices,
  Brasil4D.FeriadosNacionais.WebServices,
  Brasil4D.FIPE.WebServices,
  Brasil4D.IBGE.WebServices,
  Brasil4D.ISBN.WebServices,
  Brasil4D.NCM.WebServices,
  Brasil4D.RegistroBR.WebServices,
  Brasil4D.Taxas.WebServices;

type
  TBrasil4D = class(TComponent)
  private
    FFeriadosNacionais: TBrasil4DFeriadosNacionaisWebServices;
    FBaseUrl: string;
    FBank: TBrasil4DBankWebServices;
    FCep: TBrasil4DCEPWebServices;
    FCEPV2: TBrasil4DCEPV2WebServices;
    FCNPJ: TBrasil4DCNPJWebServices;
    FDDD: TBrasil4DDDDWebServices;
    FRegistroBR: TBrasil4DRegistroBRWebServices;
    FISBN: TBrasil4DISBNWebServices;
    FTaxas: TBrasil4DTaxasWebServices;
    FNCM: TBrasil4DNCMWebServices;
    FIBGE: TBrasil4DIBGEWebServices;
    FFIPE: TBrasil4DFIPEWebServices;
    function GetFeriadosNacionais: TBrasil4DFeriadosNacionaisWebServices;
    function GetBank: TBrasil4DBankWebServices;
    function GetCep: TBrasil4DCEPWebServices;
    function GetCepV2: TBrasil4DCEPV2WebServices;
    function GetCNPJ: TBrasil4DCNPJWebServices;
    function GetDDD: TBrasil4DDDDWebServices;
    function GetRegistroBR: TBrasil4DRegistroBRWebServices;
    function GetISBN: TBrasil4DISBNWebServices;
    function GetTaxas: TBrasil4DTaxasWebServices;
    function GetNCM: TBrasil4DNCMWebServices;
    function GetIBGE: TBrasil4DIBGEWebServices;
    function GetFIPE: TBrasil4DFIPEWebServices;
  published
    property BaseUrl: string read FBaseUrl write FBaseUrl;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    property Bank: TBrasil4DBankWebServices read GetBank;
    property CEP: TBrasil4DCEPWebServices read GetCep;
    property CEPV2: TBrasil4DCEPV2WebServices read GetCepV2;
    property CNPJ: TBrasil4DCNPJWebServices read GetCNPJ;
    property DDD: TBrasil4DDDDWebServices read GetDDD;
    property FeriadosNacionais: TBrasil4DFeriadosNacionaisWebServices read GetFeriadosNacionais;
    property FIPE: TBrasil4DFIPEWebServices read GetFIPE;
    property IBGE: TBrasil4DIBGEWebServices read GetIBGE;
    property ISBN: TBrasil4DISBNWebServices read GetISBN;
    property NCM: TBrasil4DNCMWebServices read GetNCM;
    property RegistroBR: TBrasil4DRegistroBRWebServices read GetRegistroBR;
    property Taxas: TBrasil4DTaxasWebServices read GetTaxas;
  end;

implementation

{ TBrasil4D }

constructor TBrasil4D.Create(AOwner: TComponent);
begin
  inherited;
  FBaseUrl := 'https://brasilapi.com.br/api';
end;

destructor TBrasil4D.Destroy;
begin
  FreeAndNil(FBank);
  FreeAndNil(FCEP);
  FreeAndNil(FCEPV2);
  FreeAndNil(FCNPJ);
  FreeAndNil(FDDD);
  FreeAndNil(FFeriadosNacionais);
  FreeAndNil(FFipe);
  FreeAndNil(FIBGE);
  FreeAndNil(FISBN);
  FreeAndNil(FNCM);
  FreeAndNil(FRegistroBR);
  FreeAndNil(FTaxas);
  inherited;
end;

function TBrasil4D.GetBank: TBrasil4DBankWebServices;
begin
  if not Assigned(FBank) then
    FBank := TBrasil4DBankWebServices.Create;
  Result := FBank;
end;

function TBrasil4D.GetCep: TBrasil4DCEPWebServices;
begin
  if not Assigned(FCep) then
    FCep := TBrasil4DCEPWebServices.Create;
  Result := FCep;
end;

function TBrasil4D.GetCepV2: TBrasil4DCEPV2WebServices;
begin
  if not Assigned(FCEPV2) then
    FCEPV2 := TBrasil4DCEPV2WebServices.Create;
  Result := FCEPV2;
end;

function TBrasil4D.GetCNPJ: TBrasil4DCNPJWebServices;
begin
  if not Assigned(FCNPJ) then
    FCNPJ := TBrasil4DCNPJWebServices.Create;
  Result := FCNPJ;
end;

function TBrasil4D.GetDDD: TBrasil4DDDDWebServices;
begin
  if not Assigned(FDDD) then
    FDDD := TBrasil4DDDDWebServices.Create;
  Result := FDDD;
end;

function TBrasil4D.GetFeriadosNacionais: TBrasil4DFeriadosNacionaisWebServices;
begin
  if not Assigned(FFeriadosNacionais) then
    FFeriadosNacionais := TBrasil4DFeriadosNacionaisWebServices.Create;
  Result := FFeriadosNacionais;
end;

function TBrasil4D.GetFIPE: TBrasil4DFIPEWebServices;
begin
  if not Assigned(FFIPE) then
    FFIPE := TBrasil4DFIPEWebServices.Create;
  Result := FFIPE;
end;

function TBrasil4D.GetIBGE: TBrasil4DIBGEWebServices;
begin
  if not Assigned(FIBGE) then
    FIBGE := TBrasil4DIBGEWebServices.Create;
  Result := FIBGE;
end;

function TBrasil4D.GetISBN: TBrasil4DISBNWebServices;
begin
  if not Assigned(FISBN) then
    FISBN := TBrasil4DISBNWebServices.Create;
  Result := FISBN;
end;

function TBrasil4D.GetNCM: TBrasil4DNCMWebServices;
begin
  if not Assigned(FNCM) then
    FNCM := TBrasil4DNCMWebServices.Create;
  Result := FNCM;
end;

function TBrasil4D.GetRegistroBR: TBrasil4DRegistroBRWebServices;
begin
  if not Assigned(FRegistroBR) then
    FRegistroBR := TBrasil4DRegistroBRWebServices.Create;
  Result := FRegistroBR;
end;

function TBrasil4D.GetTaxas: TBrasil4DTaxasWebServices;
begin
  if not Assigned(FTaxas) then
    FTaxas := TBrasil4DTaxasWebServices.Create;
  Result := FTaxas;
end;

end.
