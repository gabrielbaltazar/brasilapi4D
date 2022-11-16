program ExemploFeriadosNacionais;

uses
  Vcl.Forms,
  FExemploFeriadosNacionais in 'FExemploFeriadosNacionais.pas' {frmFeriadosNacionais},
  Brasil4D.Helper.DateTime in '..\..\Source\Core\Brasil4D.Helper.DateTime.pas',
  Brasil4D.Helper.JSON in '..\..\Source\Core\Brasil4D.Helper.JSON.pas',
  Brasil4D.Rest.Base in '..\..\Source\Core\Brasil4D.Rest.Base.pas',
  Brasil4D.Rest.RestClient in '..\..\Source\Core\Brasil4D.Rest.RestClient.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmFeriadosNacionais, frmFeriadosNacionais);
  Application.Run;
end.
