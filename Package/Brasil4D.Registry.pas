unit Brasil4D.Registry;

interface

uses
  System.Classes,
  Brasil4D;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Brasil API', [TBrasil4D]);
end;

end.
