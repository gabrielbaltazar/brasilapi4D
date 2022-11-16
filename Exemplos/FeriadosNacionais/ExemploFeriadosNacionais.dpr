program ExemploFeriadosNacionais;

uses
  Vcl.Forms,
  FExemploFeriadosNacionais in 'FExemploFeriadosNacionais.pas' {frmFeriadosNacionais};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmFeriadosNacionais, frmFeriadosNacionais);
  Application.Run;
end.
