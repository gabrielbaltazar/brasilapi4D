program ExemploBrasil4D;

uses
  Vcl.Forms,
  FBrasil4DExemplo in 'FBrasil4DExemplo.pas' {frmBrasil4DExemplo};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmBrasil4DExemplo, frmBrasil4DExemplo);
  Application.Run;
end.
