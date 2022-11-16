object frmFeriadosNacionais: TfrmFeriadosNacionais
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'frmFeriadosNacionais'
  ClientHeight = 424
  ClientWidth = 577
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 21
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 577
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Feriados Nacionais'
    TabOrder = 0
    ExplicitLeft = 208
    ExplicitTop = 208
    ExplicitWidth = 185
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 577
    Height = 72
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 11
      Width = 28
      Height = 21
      Caption = 'Ano'
    end
    object edtAno: TEdit
      Left = 16
      Top = 34
      Width = 89
      Height = 29
      TabOrder = 0
    end
    object btnListar: TButton
      Left = 120
      Top = 34
      Width = 137
      Height = 29
      Caption = 'Listar Feriados'
      TabOrder = 1
    end
  end
  object mmoResponse: TMemo
    Left = 0
    Top = 113
    Width = 577
    Height = 311
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 208
    ExplicitTop = 184
    ExplicitWidth = 185
    ExplicitHeight = 89
  end
end
