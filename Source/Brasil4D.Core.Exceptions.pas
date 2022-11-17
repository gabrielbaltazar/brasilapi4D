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

implementation

{ EBrasil4DCepException }

constructor EBrasil4DCepException.Create(ACep, AMessage: string);
begin
  inherited Create(AMessage);
  FCep := ACep;
end;

end.
