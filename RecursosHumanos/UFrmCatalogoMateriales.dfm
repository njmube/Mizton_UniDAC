inherited FrmCatalogoMateriales: TFrmCatalogoMateriales
  Caption = 'Cat'#225'logo de Materiales'
  ClientWidth = 524
  OnCreate = FormCreate
  ExplicitWidth = 530
  ExplicitHeight = 603
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxRibbon1: TdxRibbon
    Width = 524
    ExplicitWidth = 524
    inherited dxRibbon1Tab1: TdxRibbonTab
      Caption = 'Inicio'
      Index = 0
    end
  end
  inherited cxGridGral: TcxGrid
    Width = 512
    Height = 272
    ExplicitWidth = 512
    ExplicitHeight = 272
    inherited cxGridDatos: TcxGridDBTableView
      DataController.DataSource = dsDatos
      object cxColCodigo: TcxGridDBColumn
        DataBinding.FieldName = 'Codigo'
        Width = 76
      end
      object cxColMaterial: TcxGridDBColumn
        Caption = 'Material'
        DataBinding.FieldName = 'Servicio'
        Width = 183
      end
      object cxColUMedida: TcxGridDBColumn
        DataBinding.FieldName = 'Unidad'
        Width = 114
      end
      object cxColFecha: TcxGridDBColumn
        DataBinding.FieldName = 'FechaRegistro'
        Width = 126
      end
    end
  end
  inherited pnlDatos: TPanel
    Top = 400
    Width = 524
    Height = 174
    ExplicitTop = 400
    ExplicitWidth = 524
    ExplicitHeight = 174
    inherited cxPageDatos: TcxPageControl
      Width = 520
      Height = 170
      ExplicitWidth = 520
      ExplicitHeight = 170
      ClientRectBottom = 164
      ClientRectRight = 518
      inherited cxTsDatos: TcxTabSheet
        ExplicitWidth = 516
        ExplicitHeight = 133
        inherited dxLYCDatos: TdxLayoutControl
          Width = 516
          Height = 133
          ExplicitWidth = 516
          ExplicitHeight = 133
          object cxTextCodigo: TcxDBTextEdit [0]
            Tag = -1
            Left = 72
            Top = 38
            DataBinding.DataField = 'Codigo'
            DataBinding.DataSource = dsDatosUpt
            Style.HotTrack = False
            TabOrder = 1
            Width = 425
          end
          object cxTextMaterial: TcxDBTextEdit [1]
            Tag = -1
            Left = 72
            Top = 65
            DataBinding.DataField = 'Servicio'
            DataBinding.DataSource = dsDatosUpt
            Style.HotTrack = False
            TabOrder = 2
            Width = 121
          end
          object cbbUMedida: TcxDBLookupComboBox [2]
            Tag = -1
            Left = 72
            Top = 92
            DataBinding.DataField = 'IdUnidadMedida'
            DataBinding.DataSource = dsDatosUpt
            Properties.KeyFieldNames = 'IdUnidadMedida'
            Properties.ListColumns = <
              item
                FieldName = 'Unidad'
              end>
            Properties.ListSource = dsUMedida
            Style.HotTrack = False
            TabOrder = 3
            Width = 145
          end
          object cxDateFecha: TcxDBDateEdit [3]
            Left = 72
            Top = 11
            DataBinding.DataField = 'FechaRegistro'
            DataBinding.DataSource = dsDatosUpt
            Enabled = False
            Style.HotTrack = False
            TabOrder = 0
            Width = 121
          end
          inherited dxLyDatos: TdxLayoutGroup
            Index = -1
          end
          object lyCodigo: TdxLayoutItem
            Parent = dxLyDatos
            CaptionOptions.Text = 'C'#243'digo:'
            Control = cxTextCodigo
            ControlOptions.ShowBorder = False
            Index = 1
          end
          object lyMaterial: TdxLayoutItem
            Parent = dxLyDatos
            CaptionOptions.Text = 'Material:'
            Control = cxTextMaterial
            ControlOptions.ShowBorder = False
            Index = 2
          end
          object lyUMedida: TdxLayoutItem
            Parent = dxLyDatos
            CaptionOptions.Text = 'U. Medida'
            Control = cbbUMedida
            ControlOptions.ShowBorder = False
            Index = 3
          end
          object lyFecha: TdxLayoutItem
            Parent = dxLyDatos
            CaptionOptions.Text = 'Registro:'
            Control = cxDateFecha
            ControlOptions.ShowBorder = False
            Enabled = False
            Index = 0
          end
        end
      end
    end
  end
  inherited cxSplitter1: TcxSplitter
    Height = 278
    ExplicitHeight = 278
  end
  inherited dxBarManager1: TdxBarManager
    LookAndFeel.SkinName = ''
    DockControlHeights = (
      0
      0
      0
      0)
    inherited dxbrManager1Bar: TdxBar
      FloatClientWidth = 97
      FloatClientHeight = 307
    end
    inherited dxButtonGuardar: TdxBarLargeButton
      ImageIndex = 9
    end
  end
  inherited dsDatos: TDataSource
    DataSet = zDatos
  end
  object zUMedida: TUniQuery
    Left = 248
    Top = 288
  end
  object dsUMedida: TDataSource
    DataSet = zUMedida
    Left = 288
    Top = 288
  end
end
