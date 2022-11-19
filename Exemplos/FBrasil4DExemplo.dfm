object frmBrasil4DExemplo: TfrmBrasil4DExemplo
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Brasil 4D'
  ClientHeight = 424
  ClientWidth = 992
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
    Width = 992
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Brasil API 4 Delphi'
    TabOrder = 0
    ExplicitWidth = 988
  end
  object pgcBrasilAPI: TPageControl
    Left = 0
    Top = 41
    Width = 992
    Height = 383
    ActivePage = tsFIPE
    Align = alClient
    TabOrder = 1
    object tsBank: TTabSheet
      Caption = 'Bank'
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 984
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
        Width = 984
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
        Width = 984
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
        Width = 984
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
        Width = 984
        Height = 72
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
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
        Width = 984
        Height = 275
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
    object tsDDD: TTabSheet
      Caption = 'DDD'
      ImageIndex = 4
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 984
        Height = 72
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
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
        Width = 984
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
        Width = 984
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
        Width = 984
        Height = 275
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
    object tsFIPE: TTabSheet
      Caption = 'FIPE'
      ImageIndex = 10
      object Panel12: TPanel
        Left = 0
        Top = 0
        Width = 984
        Height = 72
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitTop = 8
        object Label12: TLabel
          Left = 16
          Top = 11
          Width = 83
          Height = 21
          Caption = 'C'#243'digo FIPE'
        end
        object edtFipeCodigo: TEdit
          Left = 16
          Top = 34
          Width = 145
          Height = 29
          TabOrder = 0
          Text = '001004-9'
        end
        object btnFipePrecoVeiculos: TButton
          Left = 318
          Top = 34
          Width = 137
          Height = 29
          Caption = 'Pre'#231'o Ve'#237'culos'
          TabOrder = 2
          OnClick = btnFipePrecoVeiculosClick
        end
        object btnFipeListarMarcas: TButton
          Left = 175
          Top = 34
          Width = 137
          Height = 29
          Caption = 'Listar Marcas'
          TabOrder = 1
          OnClick = btnFipeListarMarcasClick
        end
        object btnFipeTabelas: TButton
          Left = 461
          Top = 34
          Width = 137
          Height = 29
          Caption = 'Tabelas Referencia'
          TabOrder = 3
          OnClick = btnFipeTabelasClick
        end
      end
      object mmoFIPEResponse: TMemo
        Left = 0
        Top = 72
        Width = 984
        Height = 275
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
    object tsIBGE: TTabSheet
      Caption = 'IBGE'
      ImageIndex = 9
      object Panel11: TPanel
        Left = 0
        Top = 0
        Width = 984
        Height = 72
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label11: TLabel
          Left = 16
          Top = 11
          Width = 46
          Height = 21
          Caption = 'Estado'
        end
        object edtIBGEEstado: TEdit
          Left = 16
          Top = 34
          Width = 145
          Height = 29
          TabOrder = 0
          Text = 'RJ'
        end
        object btnIBGEListarEstados: TButton
          Left = 318
          Top = 34
          Width = 137
          Height = 29
          Caption = 'Listar Estados'
          TabOrder = 2
          OnClick = btnIBGEListarEstadosClick
        end
        object btnIBGEListarMunicipios: TButton
          Left = 175
          Top = 34
          Width = 137
          Height = 29
          Caption = 'Listar Munic'#237'pios'
          TabOrder = 1
          OnClick = btnIBGEListarMunicipiosClick
        end
        object btnIBGEBuscaEstado: TButton
          Left = 461
          Top = 34
          Width = 137
          Height = 29
          Caption = 'Buscar Estado'
          TabOrder = 3
          OnClick = btnIBGEBuscaEstadoClick
        end
      end
      object mmoIBGEResponse: TMemo
        Left = 0
        Top = 72
        Width = 984
        Height = 275
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
    object tsISBN: TTabSheet
      Caption = 'ISBN'
      ImageIndex = 6
      object Panel8: TPanel
        Left = 0
        Top = 0
        Width = 984
        Height = 72
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label7: TLabel
          Left = 16
          Top = 11
          Width = 34
          Height = 21
          Caption = 'ISBN'
        end
        object edtISBN: TEdit
          Left = 16
          Top = 34
          Width = 194
          Height = 29
          TabOrder = 0
          Text = '9788545702870'
        end
        object btnISBN: TButton
          Left = 216
          Top = 34
          Width = 137
          Height = 29
          Caption = 'Buscar'
          TabOrder = 1
          OnClick = btnISBNClick
        end
      end
      object mmoISBNResponse: TMemo
        Left = 0
        Top = 72
        Width = 984
        Height = 275
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
    object tsNCM: TTabSheet
      Caption = 'NCM'
      ImageIndex = 8
      object Panel10: TPanel
        Left = 0
        Top = 0
        Width = 984
        Height = 72
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitWidth = 980
        object Label9: TLabel
          Left = 16
          Top = 11
          Width = 50
          Height = 21
          Caption = 'Codigo'
        end
        object Label10: TLabel
          Left = 176
          Top = 11
          Width = 67
          Height = 21
          Caption = 'Descri'#231#227'o'
        end
        object edtNCMCodigo: TEdit
          Left = 16
          Top = 34
          Width = 145
          Height = 29
          TabOrder = 0
          Text = '03061790'
        end
        object btnNCMListarTodos: TButton
          Left = 334
          Top = 34
          Width = 137
          Height = 29
          Caption = 'Listar Todos'
          TabOrder = 2
          OnClick = btnNCMListarTodosClick
        end
        object btnNCMListaPeloCodigo: TButton
          Left = 477
          Top = 34
          Width = 137
          Height = 29
          Caption = 'Lista Por Codigo'
          TabOrder = 1
          OnClick = btnNCMListaPeloCodigoClick
        end
        object edtNCMDescricao: TEdit
          Left = 176
          Top = 34
          Width = 145
          Height = 29
          TabOrder = 3
          Text = 'Outros'
        end
        object btnNCMListaPorDescricao: TButton
          Left = 620
          Top = 34
          Width = 137
          Height = 29
          Caption = 'Lista Por Descri'#231#227'o'
          TabOrder = 4
          OnClick = btnNCMListaPorDescricaoClick
        end
        object btnNCMBusca: TButton
          Left = 763
          Top = 34
          Width = 137
          Height = 29
          Caption = 'Busca'
          TabOrder = 5
          OnClick = btnNCMBuscaClick
        end
      end
      object mmoNCMResponse: TMemo
        Left = 0
        Top = 72
        Width = 984
        Height = 275
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 1
        ExplicitWidth = 980
        ExplicitHeight = 274
      end
    end
    object tsRegistroBR: TTabSheet
      Caption = 'RegistroBR'
      ImageIndex = 5
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 984
        Height = 72
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label6: TLabel
          Left = 16
          Top = 11
          Width = 60
          Height = 21
          Caption = 'Dom'#237'nio'
        end
        object edtDominio: TEdit
          Left = 16
          Top = 34
          Width = 194
          Height = 29
          TabOrder = 0
          Text = 'google'
        end
        object btnRegistroBR: TButton
          Left = 216
          Top = 34
          Width = 137
          Height = 29
          Caption = 'Buscar'
          TabOrder = 1
          OnClick = btnRegistroBRClick
        end
      end
      object mmoRegistroBRResponse: TMemo
        Left = 0
        Top = 72
        Width = 984
        Height = 275
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
    object tsTaxas: TTabSheet
      Caption = 'Taxas'
      ImageIndex = 7
      object Panel9: TPanel
        Left = 0
        Top = 0
        Width = 984
        Height = 72
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label8: TLabel
          Left = 16
          Top = 11
          Width = 43
          Height = 21
          Caption = 'Nome'
        end
        object edtTaxasNome: TEdit
          Left = 16
          Top = 34
          Width = 145
          Height = 29
          TabOrder = 0
          Text = 'CDI'
        end
        object btnTaxasLista: TButton
          Left = 318
          Top = 34
          Width = 137
          Height = 29
          Caption = 'Listar Todos'
          TabOrder = 2
          OnClick = btnTaxasListaClick
        end
        object btnTaxasBusca: TButton
          Left = 175
          Top = 34
          Width = 137
          Height = 29
          Caption = 'Buscar Pelo Nome'
          TabOrder = 1
          OnClick = btnTaxasBuscaClick
        end
      end
      object mmoTaxasResponse: TMemo
        Left = 0
        Top = 72
        Width = 984
        Height = 275
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
  end
  object Brasil4D1: TBrasil4D
    BaseUrl = 'https://brasilapi.com.br/api'
    Left = 840
    Top = 25
  end
end
