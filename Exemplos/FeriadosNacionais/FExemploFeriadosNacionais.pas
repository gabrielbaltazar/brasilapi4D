unit FExemploFeriadosNacionais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.DateUtils;

type
  TfrmFeriadosNacionais = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    edtAno: TEdit;
    btnListar: TButton;
    mmoResponse: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFeriadosNacionais: TfrmFeriadosNacionais;

implementation

{$R *.dfm}

procedure TfrmFeriadosNacionais.FormCreate(Sender: TObject);
begin
  edtAno.Text := IntToStr(YearOf(Now));
end;

end.
