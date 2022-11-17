unit Brasil4D;

interface

uses
  System.Classes,
  System.SysUtils,
  Brasil4D.Bank.WebServices,
  Brasil4D.CEP.WebServices,
  Brasil4D.CEPV2.WebServices,
  Brasil4D.FeriadosNacionais.WebServices;

type
  TBrasil4D = class(TComponent)
  private
    FFeriadosNacionais: TBrasil4DFeriadosNacionaisWebServices;
    FBaseUrl: string;
    FBank: TBrasil4DBankWebSerices;
    FCep: TBrasil4DCEPWebSerices;
    FCEPV2: TBrasil4DCEPV2WebSerices;
    function GetFeriadosNacionais: TBrasil4DFeriadosNacionaisWebServices;
    function GetBank: TBrasil4DBankWebSerices;
    function GetCep: TBrasil4DCEPWebSerices;
    function GetCepV2: TBrasil4DCEPV2WebSerices;
  published
    property BaseUrl: string read FBaseUrl write FBaseUrl;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    property Bank: TBrasil4DBankWebSerices read GetBank;
    property CEP: TBrasil4DCEPWebSerices read GetCep;
    property CEPV2: TBrasil4DCEPV2WebSerices read GetCepV2;
    property FeriadosNacionais: TBrasil4DFeriadosNacionaisWebServices read GetFeriadosNacionais;
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
  FreeAndNil(FFeriadosNacionais);
  inherited;
end;

function TBrasil4D.GetBank: TBrasil4DBankWebSerices;
begin
  if not Assigned(FBank) then
    FBank := TBrasil4DBankWebSerices.Create;
  Result := FBank;
end;

function TBrasil4D.GetCep: TBrasil4DCEPWebSerices;
begin
  if not Assigned(FCep) then
    FCep := TBrasil4DCEPWebSerices.Create;
  Result := FCep;
end;

function TBrasil4D.GetCepV2: TBrasil4DCEPV2WebSerices;
begin
  if not Assigned(FCEPV2) then
    FCEPV2 := TBrasil4DCEPV2WebSerices.Create;
  Result := FCEPV2;
end;

function TBrasil4D.GetFeriadosNacionais: TBrasil4DFeriadosNacionaisWebServices;
begin
  if not Assigned(FFeriadosNacionais) then
    FFeriadosNacionais := TBrasil4DFeriadosNacionaisWebServices.Create;
  Result := FFeriadosNacionais;
end;

end.
