object frmFeriadosNacionais: TfrmFeriadosNacionais
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'frmFeriadosNacionais'
  ClientHeight = 424
  ClientWidth = 825
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
    Width = 825
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Brasil API 4 Delphi'
    TabOrder = 0
    ExplicitWidth = 821
  end
  object pgcBrasilAPI: TPageControl
    Left = 0
    Top = 41
    Width = 825
    Height = 383
    ActivePage = tsDDD
    Align = alClient
    TabOrder = 1
    object tsBank: TTabSheet
      Caption = 'Bank'
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 817
        Height = 72
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label2: TLabel
          Left = 16
          Top = 11
          Width = 36
          Height = 21
          Caption = 'Code'
        end
        object edtBankCode: TEdit
          Left = 16
          Top = 34
          Width = 89
          Height = 29
          TabOrder = 0
        end
        object btnBankListar: TButton
          Left = 254
          Top = 34
          Width = 137
          Height = 29
          Caption = 'Listar Todos'
          TabOrder = 2
          OnClick = btnBankListarClick
        end
        object btnBankBuscar: TButton
          Left = 111
          Top = 34
          Width = 137
          Height = 29
          Caption = 'Buscar Pelo C'#243'digo'
          TabOrder = 1
          OnClick = btnBankBuscarClick
        end
      end
      object mmoBankResponse: TMemo
        Left = 0
        Top = 72
        Width = 817
        Height = 275
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
    object tsFeriadosNacionais: TTabSheet
      Caption = 'Feriados Nacionais'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 817
        Height = 72
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
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
          Top = 37
          Width = 137
          Height = 29
          Caption = 'Listar Feriados'
          TabOrder = 1
          OnClick = btnListarClick
        end
      end
      object mmoResponse: TMemo
        Left = 0
        Top = 72
        Width = 817
        Height = 275
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
    object tsCEP: TTabSheet
      Caption = 'CEP'
      ImageIndex = 2
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 817
        Height = 72
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label3: TLabel
          Left = 16
          Top = 11
          Width = 27
          Height = 21
          Caption = 'CEP'
        end
        object edtCep: TEdit
          Left = 16
          Top = 34
          Width = 153
          Height = 29
          TabOrder = 0
        end
        object btnCEP: TButton
          Left = 175
          Top = 34
          Width = 114
          Height = 29
          Caption = 'CEP'
          TabOrder = 1
          OnClick = btnCEPClick
        end
        object btnCepV2: TButton
          Left = 303
          Top = 34
          Width = 114
          Height = 29
          Caption = 'CEP V2'
          TabOrder = 2
          OnClick = btnCepV2Click
        end
      end
      object mmoCepResponse: TMemo
        Left = 0
        Top = 72
        Width = 817
        Height = 275
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
    object tsCNPJ: TTabSheet
      Caption = 'CNPJ'
      ImageIndex = 3
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 817
        Height = 72
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitWidth = 813
        object Label4: TLabel
          Left = 16
          Top = 11
          Width = 36
          Height = 21
          Caption = 'CNPJ'
        end
        object edtCNPJ: TEdit
          Left = 16
          Top = 34
          Width = 194
          Height = 29
          TabOrder = 0
        end
        object btnCNPJ: TButton
          Left = 216
          Top = 34
          Width = 137
          Height = 29
          Caption = 'Buscar'
          TabOrder = 1
          OnClick = btnCNPJClick
        end
      end
      object mmoCNPJResponse: TMemo
        Left = 0
        Top = 72
        Width = 817
        Height = 275
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 1
        ExplicitWidth = 813
        ExplicitHeight = 274
      end
    end
    object tsDDD: TTabSheet
      Caption = 'DDD'
      ImageIndex = 4
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 817
        Height = 72
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitTop = 8
        object Label5: TLabel
          Left = 16
          Top = 11
          Width = 33
          Height = 21
          Caption = 'DDD'
        end
        object edtDDD: TEdit
          Left = 16
          Top = 34
          Width = 194
          Height = 29
          TabOrder = 0
          Text = '21'
        end
        object btnDDD: TButton
          Left = 216
          Top = 34
          Width = 137
          Height = 29
          Caption = 'Buscar'
          TabOrder = 1
          OnClick = btnDDDClick
        end
      end
      object mmoDDDResponse: TMemo
        Left = 0
        Top = 72
        Width = 817
        Height = 275
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 1
        ExplicitWidth = 813
        ExplicitHeight = 274
      end
    end
  end
  object Brasil4D1: TBrasil4D
    BaseUrl = 'https://brasilapi.com.br/api'
    Left = 424
    Top = 49
  end
end
