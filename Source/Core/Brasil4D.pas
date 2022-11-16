unit Brasil4D;

interface

uses
  System.Classes,
  System.SysUtils,
  Brasil4D.FeriadosNacionais.WebServices;

type
  TBrasil4D = class(TComponent)
  private
    FFeriadosNacionais: TBrasil4DFeriadosNacionaisWebServices;
    FBaseUrl: string;
    function GetFeriadosNacionais: TBrasil4DFeriadosNacionaisWebServices;
  published
    property BaseUrl: string read FBaseUrl write FBaseUrl;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

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
  FFeriadosNacionais.Free;
  inherited;
end;

function TBrasil4D.GetFeriadosNacionais: TBrasil4DFeriadosNacionaisWebServices;
begin
  if not Assigned(FFeriadosNacionais) then
    FFeriadosNacionais := TBrasil4DFeriadosNacionaisWebServices.Create;
  Result := FFeriadosNacionais;
end;

end.
