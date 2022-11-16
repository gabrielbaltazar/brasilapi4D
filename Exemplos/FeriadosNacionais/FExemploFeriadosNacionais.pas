unit FExemploFeriadosNacionais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.DateUtils,
  Brasil4D;

type
  TfrmFeriadosNacionais = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    edtAno: TEdit;
    btnListar: TButton;
    mmoResponse: TMemo;
    Brasil4D1: TBrasil4D;
    procedure FormCreate(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
  private
    { Private declarations }
  public
    destructor Destroy; override;
    { Public declarations }
  end;

var
  frmFeriadosNacionais: TfrmFeriadosNacionais;

implementation

{$R *.dfm}

procedure TfrmFeriadosNacionais.btnListarClick(Sender: TObject);
var
  I: Integer;
begin
  Brasil4D1.FeriadosNacionais.Lista.Ano := StrToIntDef(edtAno.Text, YearOf(Now));
  Brasil4D1.FeriadosNacionais.Lista.Executar;
  mmoResponse.Lines.Clear;
  for I := 0 to Pred(Brasil4D1.FeriadosNacionais.Lista.Retorno.Count) do
  begin
    mmoResponse.Lines.Add(EmptyStr);
    mmoResponse.Lines.Add('Data: ' + FormatDateTime('dd/MM/yyyy', Brasil4D1.FeriadosNacionais.Lista.Retorno[I].Date));
    mmoResponse.Lines.Add('Name: ' + Brasil4D1.FeriadosNacionais.Lista.Retorno[I].Name);
    mmoResponse.Lines.Add('Type: ' + Brasil4D1.FeriadosNacionais.Lista.Retorno[I].&Type);
  end;
end;

destructor TfrmFeriadosNacionais.Destroy;
begin
  inherited;
end;

procedure TfrmFeriadosNacionais.FormCreate(Sender: TObject);
begin
  edtAno.Text := IntToStr(YearOf(Now));
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

end.
