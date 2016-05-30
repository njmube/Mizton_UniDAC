object FrmMaterialesxFolios: TFrmMaterialesxFolios
  Left = 0
  Top = 0
  Caption = 'Materiales usados en actividades'
  ClientHeight = 743
  ClientWidth = 1454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dxDockSite1: TdxDockSite
    Left = 301
    Top = 131
    Width = 1153
    Height = 612
    Align = alClient
    ExplicitWidth = 1034
    ExplicitHeight = 544
    DockingType = 5
    OriginalWidth = 1153
    OriginalHeight = 612
    object dxLayoutDockSite1: TdxLayoutDockSite
      Left = 0
      Top = 0
      Width = 763
      Height = 612
      DockingType = 0
      OriginalWidth = 300
      OriginalHeight = 200
      object dxlytdckst1: TdxLayoutDockSite
        Left = 0
        Top = 0
        Width = 763
        Height = 612
        DockingType = 0
        OriginalWidth = 300
        OriginalHeight = 200
      end
      object dxDockGrid: TdxDockPanel
        Left = 0
        Top = 0
        Width = 763
        Height = 612
        AllowFloating = False
        AutoHide = False
        Caption = 'Actividades realizadas'
        CaptionButtons = []
        CustomCaptionButtons.Buttons = <>
        TabsProperties.CustomButtons.Buttons = <>
        DockingType = 0
        OriginalWidth = 185
        OriginalHeight = 140
        object cxGridGral: TcxGrid
          AlignWithMargins = True
          Left = 3
          Top = 49
          Width = 751
          Height = 527
          Align = alClient
          TabOrder = 0
          RootLevelOptions.DetailTabsPosition = dtpTop
          OnActiveTabChanged = cxGridGralActiveTabChanged
          ExplicitWidth = 632
          ExplicitHeight = 459
          object cxGridDatos: TcxGridDBTableView
            PopupMenu = dxPopupGrid
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dsDatos
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            FilterRow.InfoText = '< Clic aqu'#237' para definir un filtro >'
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsView.NoDataToDisplayInfoText = '<No hay informaci'#243'n disponible>'
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            OptionsView.GroupRowHeight = 25
            OptionsView.GroupRowStyle = grsOffice11
            OptionsView.Indicator = True
            Styles.Content = UDMConection.cxstylContent
            Styles.OnGetContentStyle = cxGridDatosStylesGetContentStyle
            Styles.Header = UDMConection.cxstylHeader
            object cxColFolioPrincipal: TcxGridDBColumn
              Caption = 'Folio Maestro'
              DataBinding.FieldName = 'FolioPrincipal'
              Visible = False
              GroupIndex = 0
              Width = 117
            end
            object cxColCreado: TcxGridDBColumn
              Caption = 'Fecha y Hora Creaci'#243'n'
              DataBinding.FieldName = 'FechaCreacion'
              PropertiesClassName = 'TcxDateEditProperties'
              Properties.ReadOnly = True
              Width = 141
            end
            object cxColFolio: TcxGridDBColumn
              DataBinding.FieldName = 'Folio'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.ReadOnly = True
              Width = 117
            end
            object cxColTelefono: TcxGridDBColumn
              Caption = 'Tel'#233'fono'
              DataBinding.FieldName = 'Telefono'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.ReadOnly = True
              Width = 123
            end
            object cxColPrincipal: TcxGridDBColumn
              DataBinding.FieldName = 'Principal'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.ReadOnly = True
              Width = 85
            end
            object cxColSecundario: TcxGridDBColumn
              DataBinding.FieldName = 'Secundario'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.ReadOnly = True
              Width = 87
            end
            object cxColContratista: TcxGridDBColumn
              DataBinding.FieldName = 'Contratista'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.ReadOnly = True
              Width = 125
            end
            object cxColNoVale: TcxGridDBColumn
              Caption = 'No. Vale'
              DataBinding.FieldName = 'NoVale'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.ReadOnly = True
              Width = 151
            end
            object cxColEstatus: TcxGridDBColumn
              Caption = 'Estatus'
              DataBinding.FieldName = 'estatus'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.ReadOnly = True
              Width = 115
            end
            object cxColTipoInstalacion: TcxGridDBColumn
              Caption = 'Tipo Instalaci'#243'n'
              DataBinding.FieldName = 'TipoInstalacion'
              Visible = False
              GroupIndex = 1
            end
            object cxColTipo: TcxGridDBColumn
              Caption = 'Tipo'
              DataBinding.FieldName = 'tipoOrden'
              Width = 93
            end
            object cxColCostoCobrar: TcxGridDBColumn
              Caption = 'Pago T'#233'cnico'
              DataBinding.FieldName = 'CostoCobrar'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.ReadOnly = True
              Width = 103
            end
            object cxColestatusCobro: TcxGridDBColumn
              Caption = 'Estatus Cobro'
              DataBinding.FieldName = 'estatusCobro'
              Width = 102
            end
          end
          object cxChartProductividad: TcxGridDBChartView
            DataController.DataSource = dsDatos
            DiagramPie.Active = True
            DiagramPie.SeriesSites = True
            DiagramPie.Values.CaptionPosition = pdvcpOutsideEndWithLeaderLines
            DiagramPie.Values.CaptionItems = [pdvciCategory, pdvciValue, pdvciPercentage]
            ToolBox.DiagramSelector = True
            object cxDataEstatus: TcxGridDBChartDataGroup
              DataBinding.FieldName = 'estatus'
            end
            object cxSerieProductividad: TcxGridDBChartSeries
              DataBinding.FieldName = 'productividad'
            end
          end
          object GridLevel1: TcxGridLevel
            Caption = 'Informaci'#243'n detallada por '#243'rden'
            GridView = cxGridDatos
          end
          object cxLvlGrafico: TcxGridLevel
            Caption = 'Gr'#225'fico de productividad semanal'
            GridView = cxChartProductividad
          end
        end
        object cxGboxLeyendas: TcxGroupBox
          Left = 0
          Top = 0
          Align = alTop
          Caption = 'Informaci'#243'n de apoyo'
          TabOrder = 1
          Height = 46
          Width = 757
          object Panel1: TPanel
            AlignWithMargins = True
            Left = 92
            Top = 18
            Width = 19
            Height = 21
            Align = alLeft
            BevelOuter = bvNone
            Color = 3054090
            ParentBackground = False
            TabOrder = 0
          end
          object LblSinpago: TcxLabel
            Left = 114
            Top = 15
            Align = alLeft
            Caption = 'Autorizada(Solo Lectura)'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            Transparent = True
            ExplicitLeft = 173
            ExplicitTop = 4
            ExplicitHeight = 40
          end
          object LblLeyendaVale: TcxLabel
            Left = 421
            Top = 15
            Align = alRight
            Caption = '*El vale est'#225' cerrado no se puede realizar ninguna edici'#243'n.'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold, fsItalic]
            Style.IsFontAssigned = True
            Transparent = True
            ExplicitLeft = 634
            ExplicitTop = 4
            ExplicitHeight = 40
          end
          object Panel2: TPanel
            AlignWithMargins = True
            Left = 6
            Top = 18
            Width = 19
            Height = 21
            Align = alLeft
            BevelOuter = bvNone
            Color = 8421631
            ParentBackground = False
            TabOrder = 3
          end
          object cxLabel1: TcxLabel
            Left = 28
            Top = 15
            Align = alLeft
            Caption = 'Pendiente'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            Transparent = True
            ExplicitLeft = 27
            ExplicitTop = 4
            ExplicitHeight = 40
          end
        end
      end
    end
    object dxDockDatos: TdxDockPanel
      Left = 763
      Top = 0
      Width = 390
      Height = 612
      AllowFloating = True
      AutoHide = False
      Caption = 'Materiales asignados a cada Orden'
      CaptionButtons = [cbHide]
      CustomCaptionButtons.Buttons = <>
      TabsProperties.CustomButtons.Buttons = <>
      ExplicitLeft = 644
      ExplicitHeight = 544
      DockingType = 3
      OriginalWidth = 390
      OriginalHeight = 140
      object cxPageDatos: TcxPageControl
        Left = 0
        Top = 58
        Width = 384
        Height = 521
        Align = alClient
        TabOrder = 0
        Properties.ActivePage = cxTsDatos
        Properties.CustomButtons.Buttons = <>
        Properties.NavigatorPosition = npRightBottom
        ExplicitHeight = 453
        ClientRectBottom = 515
        ClientRectLeft = 2
        ClientRectRight = 382
        ClientRectTop = 31
        object cxTsDatos: TcxTabSheet
          Caption = 'Materiales por Orden'
          ImageIndex = 0
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 416
          object dxLYCDatos: TdxLayoutControl
            Left = 0
            Top = 468
            Width = 380
            Height = 16
            Align = alBottom
            TabOrder = 0
            Visible = False
            LayoutLookAndFeel = UDMConection.dxStyleForms
            ExplicitTop = 400
            object dxLyDatos: TdxLayoutGroup
              AlignHorz = ahLeft
              AlignVert = avTop
              ButtonOptions.Buttons = <>
              Hidden = True
              ShowBorder = False
              Index = -1
            end
          end
          object CxGrdMat: TcxGrid
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 374
            Height = 424
            Align = alClient
            TabOrder = 1
            ExplicitHeight = 356
            object cxGridMateriales: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              OnEditKeyDown = cxGridMaterialesEditKeyDown
              DataController.DataSource = dsMaterial
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              FilterRow.InfoText = '< Clic aqu'#237' para definir un filtro >'
              OptionsData.CancelOnExit = False
              OptionsView.NoDataToDisplayInfoText = '<No hay informaci'#243'n disponible>'
              OptionsView.ColumnAutoWidth = True
              OptionsView.GroupByBox = False
              Styles.Content = UDMConection.cxstylContent
              Styles.Header = UDMConection.cxstylHeader
              object cxColCantidad: TcxGridDBColumn
                DataBinding.FieldName = 'Cantidad'
                PropertiesClassName = 'TcxSpinEditProperties'
                Properties.ImmediatePost = True
                Properties.ValueType = vtFloat
                Width = 65
              end
              object cxColmaterial: TcxGridDBColumn
                DataBinding.FieldName = 'Material'
                PropertiesClassName = 'TcxLabelProperties'
                Width = 221
              end
              object cxColUMedida: TcxGridDBColumn
                Caption = 'U. Medida'
                DataBinding.FieldName = 'UnidadMedida'
                PropertiesClassName = 'TcxLabelProperties'
                Width = 80
              end
            end
            object cxLvl1: TcxGridLevel
              GridView = cxGridMateriales
            end
          end
          object pnl1: TPanel
            Left = 0
            Top = 430
            Width = 380
            Height = 38
            Align = alBottom
            TabOrder = 2
            Visible = False
            ExplicitTop = 362
            object btnSaveChanges: TcxButton
              AlignWithMargins = True
              Left = 262
              Top = 4
              Width = 114
              Height = 30
              Align = alRight
              Caption = 'Guardar Cambios'
              TabOrder = 0
            end
          end
        end
      end
      object dxDockBar1: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 384
        Height = 58
        Align = dalTop
        BarManager = dxBarManager1
      end
    end
  end
  object pnlFiltro: TPanel
    Left = 0
    Top = 131
    Width = 295
    Height = 612
    Align = alLeft
    TabOrder = 1
    object cxGboxFiltro: TcxGroupBox
      AlignWithMargins = True
      Left = 11
      Top = 11
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alTop
      Caption = 'Semana de trabajo:'
      TabOrder = 0
      Height = 142
      Width = 273
      object dxLayControl1: TdxLayoutControl
        Left = 3
        Top = 15
        Width = 267
        Height = 123
        Align = alClient
        TabOrder = 0
        LayoutLookAndFeel = UDMConection.dxStyleForms
        object cxDateDesde: TcxDateEdit
          Left = 57
          Top = 11
          Properties.OnChange = cxDateDesdePropertiesChange
          Style.HotTrack = False
          TabOrder = 0
          Width = 184
        end
        object cxDateHasta: TcxDateEdit
          Left = 57
          Top = 38
          Style.HotTrack = False
          TabOrder = 1
          Width = 121
        end
        object btnAplicar: TcxButton
          Left = 11
          Top = 65
          Width = 75
          Height = 25
          Caption = '&Mostrar '#211'rdenes'
          TabOrder = 2
          OnClick = btnAplicarClick
        end
        object dxLayControl1Group_Root: TdxLayoutGroup
          AlignHorz = ahLeft
          AlignVert = avTop
          ButtonOptions.Buttons = <>
          Hidden = True
          ShowBorder = False
          Index = -1
        end
        object lyLayControl1Item1: TdxLayoutItem
          Parent = dxLayControl1Group_Root
          CaptionOptions.Text = 'Desde:'
          Control = cxDateDesde
          ControlOptions.ShowBorder = False
          Index = 0
        end
        object lyHasta: TdxLayoutItem
          Parent = dxLayControl1Group_Root
          CaptionOptions.Text = 'Hasta:'
          Control = cxDateHasta
          ControlOptions.ShowBorder = False
          Index = 1
        end
        object lyAplicar: TdxLayoutItem
          Parent = dxLayControl1Group_Root
          CaptionOptions.Text = 'cxButton1'
          CaptionOptions.Visible = False
          Control = btnAplicar
          ControlOptions.ShowBorder = False
          Index = 2
        end
      end
    end
    object cxGroupBox1: TcxGroupBox
      AlignWithMargins = True
      Left = 11
      Top = 173
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alClient
      Caption = 'Informaci'#243'n del t'#233'cnico'
      TabOrder = 1
      Height = 428
      Width = 273
      object dxLayoutControl1: TdxLayoutControl
        Left = 3
        Top = 15
        Width = 267
        Height = 409
        Align = alClient
        TabOrder = 0
        LayoutLookAndFeel = UDMConection.dxStyleForms
        ExplicitLeft = 2
        ExplicitTop = 4
        ExplicitWidth = 269
        ExplicitHeight = 422
        object imgFoto: TcxDBImage
          Left = 11
          Top = 11
          DataBinding.DataField = 'Imagen'
          DataBinding.DataSource = dsPersonal
          Properties.GraphicClassName = 'TdxSmartImage'
          Style.HotTrack = False
          TabOrder = 0
          Height = 129
          Width = 230
        end
        object LblCodigo: TcxDBLabel
          Left = 84
          Top = 146
          DataBinding.DataField = 'CodigoPersonal'
          DataBinding.DataSource = dsPersonal
          Style.HotTrack = False
          Height = 21
          Width = 121
        end
        object LblApMat: TcxDBLabel
          Left = 84
          Top = 227
          DataBinding.DataField = 'AMaterno'
          DataBinding.DataSource = dsPersonal
          Style.HotTrack = False
          Height = 21
          Width = 121
        end
        object LblNombre: TcxDBLabel
          Left = 84
          Top = 173
          DataBinding.DataField = 'Nombre'
          DataBinding.DataSource = dsPersonal
          Style.HotTrack = False
          Height = 21
          Width = 121
        end
        object LblApPat: TcxDBLabel
          Left = 84
          Top = 200
          DataBinding.DataField = 'APaterno'
          DataBinding.DataSource = dsPersonal
          Style.HotTrack = False
          Height = 21
          Width = 121
        end
        object LblNoCarro: TcxDBLabel
          Left = 84
          Top = 254
          DataBinding.DataField = 'NoCarro'
          DataBinding.DataSource = dsPersonal
          Style.HotTrack = False
          Height = 21
          Width = 121
        end
        object DbLblTelefono: TcxDBLabel
          Left = 84
          Top = 308
          DataBinding.DataField = 'Telefono'
          DataBinding.DataSource = dsPersonal
          Style.HotTrack = False
          Height = 21
          Width = 121
        end
        object DbLblCorreo: TcxDBLabel
          Left = 84
          Top = 281
          DataBinding.DataField = 'CorreoElectronico'
          DataBinding.DataSource = dsPersonal
          Style.HotTrack = False
          Height = 21
          Width = 121
        end
        object dxLayoutGroup1: TdxLayoutGroup
          AlignHorz = ahLeft
          AlignVert = avTop
          ButtonOptions.Buttons = <>
          Hidden = True
          ShowBorder = False
          Index = -1
        end
        object lyFoto: TdxLayoutItem
          Parent = dxLayoutGroup1
          CaptionOptions.Text = 'cxDBImage1'
          CaptionOptions.Visible = False
          Control = imgFoto
          ControlOptions.ShowBorder = False
          Index = 0
        end
        object dxLayoutControl1Item1: TdxLayoutItem
          Parent = dxLayoutGroup1
          CaptionOptions.Text = 'Expediente:'
          Control = LblCodigo
          ControlOptions.ShowBorder = False
          Index = 1
        end
        object lyApMat: TdxLayoutItem
          Parent = dxLayoutGroup1
          AlignHorz = ahClient
          CaptionOptions.Text = 'Ap. Materno:'
          Control = LblApMat
          ControlOptions.ShowBorder = False
          Index = 4
        end
        object lyNombre: TdxLayoutItem
          Parent = dxLayoutGroup1
          CaptionOptions.Text = 'Nombre(s):'
          Control = LblNombre
          ControlOptions.ShowBorder = False
          Index = 2
        end
        object lyApPat: TdxLayoutItem
          Parent = dxLayoutGroup1
          CaptionOptions.Text = 'Ap. Paterno:'
          Control = LblApPat
          ControlOptions.ShowBorder = False
          Index = 3
        end
        object lyBNocarro: TdxLayoutItem
          Parent = dxLayoutGroup1
          CaptionOptions.Text = 'No. Carro:'
          Control = LblNoCarro
          ControlOptions.ShowBorder = False
          Index = 5
        end
        object lyTelefono: TdxLayoutItem
          Parent = dxLayoutGroup1
          CaptionOptions.Text = 'Tel'#233'fono:'
          Control = DbLblTelefono
          ControlOptions.ShowBorder = False
          Index = 7
        end
        object lyCorreo: TdxLayoutItem
          Parent = dxLayoutGroup1
          CaptionOptions.Text = 'Correo:'
          Control = DbLblCorreo
          ControlOptions.ShowBorder = False
          Index = 6
        end
      end
    end
  end
  object dxRibbon1: TdxRibbon
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 1448
    Height = 125
    BarManager = dxBarManager1
    Style = rs2013
    ColorSchemeName = 'UserSkin'
    SupportNonClientDrawing = True
    Contexts = <>
    TabOrder = 6
    TabStop = False
    ExplicitWidth = 1329
    object dxRibbon1Tab1: TdxRibbonTab
      Active = True
      Caption = 'Inicio'
      Groups = <
        item
        end
        item
          ToolbarName = 'dxbrManager1Bar'
        end>
      Index = 0
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 295
    Top = 131
    Width = 6
    Height = 612
    Hint = 'Mostrar/Ocultar datos del empleado y semana de trabajo'
    HotZoneClassName = 'TcxMediaPlayer9Style'
    ShowHint = True
    ParentShowHint = False
    ExplicitHeight = 544
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = UDMConection.cxMizton16
    ImageOptions.LargeImages = UDMConection.cxMizton32
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 592
    Top = 504
    DockControlHeights = (
      0
      0
      0
      0)
    object dxbrManager1Bar: TdxBar
      Caption = 'Opciones'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 664
      FloatTop = 8
      FloatClientWidth = 153
      FloatClientHeight = 307
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxButtonNuevo'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBButtonEditar'
        end
        item
          Visible = True
          ItemName = 'dxBButtonBuscar'
        end
        item
          Visible = True
          ItemName = 'dxBButtonEliminar'
        end
        item
          Visible = True
          ItemName = 'dxButtonDetalle'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxButtonGuardar'
        end
        item
          Visible = True
          ItemName = 'dxButtonCancelar'
        end
        item
          Visible = True
          ItemName = 'dxButtonActualizar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxButtonExportar'
        end
        item
          Visible = True
          ItemName = 'btnParElectricos'
        end
        item
          Visible = True
          ItemName = 'btnDatosGrales'
        end
        item
          Visible = True
          ItemName = 'btnExport2'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxbrMateriales: TdxBar
      Caption = 'Materiales'
      CaptionButtons = <>
      DockControl = dxDockBar1
      DockedDockControl = dxDockBar1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1156
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btnadd'
        end
        item
          Visible = True
          ItemName = 'btnEdit'
        end
        item
          Visible = True
          ItemName = 'btnDelete'
        end
        item
          Visible = True
          ItemName = 'btnRefresh'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      ShowMark = False
      SizeGrip = False
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = False
    end
    object dxButtonNuevo: TdxBarLargeButton
      Caption = '&Nueva Orden'
      Category = 0
      Hint = 'Nueva Orden'
      Visible = ivAlways
      ButtonStyle = bsDropDown
      DropDownMenu = dxPopupTipo
      LargeImageIndex = 4
      ShortCut = 16462
      OnClick = dxButtonNuevoClick
    end
    object dxBButtonEditar: TdxBarButton
      Caption = '&Editar Orden'
      Category = 0
      Hint = 'Editar Orden'
      Visible = ivAlways
      ImageIndex = 3
      LargeImageIndex = 3
      ShortCut = 16453
      OnClick = dxBButtonEditarClick
    end
    object dxBButtonBuscar: TdxBarButton
      Caption = '&Buscar Orden'
      Category = 0
      Hint = 'Buscar Orden'
      Visible = ivAlways
      ImageIndex = 10
      ShortCut = 16450
      OnClick = dxBButtonBuscarClick
    end
    object dxBButtonEliminar: TdxBarButton
      Caption = 'Eli&minar Orden'
      Category = 0
      Hint = 'Eliminar Orden'
      Visible = ivAlways
      ImageIndex = 11
      LargeImageIndex = 11
      ShortCut = 46
      OnClick = dxBButtonEliminarClick
    end
    object dxButtonGuardar: TdxBarLargeButton
      Caption = '&Guardar Orden'
      Category = 0
      Hint = 'Guardar Orden'
      Visible = ivNever
      LargeImageIndex = 9
      ShortCut = 16455
      SyncImageIndex = False
      ImageIndex = 8
    end
    object dxButtonActualizar: TdxBarLargeButton
      Caption = '&Actualizar'
      Category = 0
      Hint = 'Actualizar'
      Visible = ivAlways
      LargeImageIndex = 12
      ShortCut = 116
      OnClick = dxButtonActualizarClick
    end
    object dxButtonCancelar: TdxBarLargeButton
      Caption = '&Cancelar'
      Category = 0
      Hint = 'Cancelar'
      Visible = ivNever
      LargeImageIndex = 14
      ShortCut = 115
    end
    object dxButtonSalir: TdxBarLargeButton
      Caption = '&Salir'
      Category = 0
      Hint = 'Salir'
      Visible = ivAlways
      LargeImageIndex = 15
      ShortCut = 16499
    end
    object dxButton2: TdxBarLargeButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxButtonExportar: TdxBarLargeButton
      Caption = '&Generar reporte de Materiales'
      Category = 0
      Hint = 'Generar reporte de Materiales'
      Visible = ivAlways
      LargeImageIndex = 15
      ShortCut = 16464
      OnClick = dxButtonExportarClick
    end
    object dxButtonOpcional: TdxBarLargeButton
      Caption = 'Opcional'
      Category = 0
      Hint = 'Opcional'
      Visible = ivNever
    end
    object dxButtonDetalle: TdxBarLargeButton
      Caption = '&Ver materiales'
      Category = 0
      Hint = 'Ver materiales'
      Visible = ivNever
      LargeImageIndex = 13
    end
    object btnadd: TdxBarLargeButton
      Caption = 'A'#241'adir'
      Category = 0
      Hint = 'A'#241'adir'
      Visible = ivAlways
      LargeImageIndex = 4
      OnClick = btnaddClick
      AutoGrayScale = False
    end
    object btnDelete: TdxBarLargeButton
      Caption = 'Quitar'
      Category = 0
      Hint = 'Quitar'
      Visible = ivAlways
      LargeImageIndex = 11
      OnClick = btnDeleteClick
      AutoGrayScale = False
    end
    object btnEdit: TdxBarLargeButton
      Caption = 'Editar'
      Category = 0
      Hint = 'Editar'
      Visible = ivAlways
      LargeImageIndex = 3
      OnClick = btnEditClick
      AutoGrayScale = False
    end
    object btnRefresh: TdxBarLargeButton
      Caption = 'Actualizar'
      Category = 0
      Hint = 'Actualizar'
      Visible = ivAlways
      LargeImageIndex = 12
      OnClick = btnRefreshClick
      AutoGrayScale = False
    end
    object btnExport2: TdxBarLargeButton
      Caption = '&Exportar Grilla a Excel'
      Category = 0
      Hint = 'Exportar Grilla a Excel'
      Visible = ivAlways
      LargeImageIndex = 15
      OnClick = btnExport2Click
      SyncImageIndex = False
      ImageIndex = 15
    end
    object btnParElectricos: TdxBarLargeButton
      Caption = '&Generar plantilla Par'#225'metros El'#233'ctricos'
      Category = 0
      Hint = 'Generar plantilla Par'#225'metros El'#233'ctricos'
      Visible = ivAlways
      LargeImageIndex = 15
      OnClick = btnParElectricosClick
    end
    object dxButtonCObre: TdxBarButton
      Caption = '&Cobre'
      Category = 0
      Hint = 'Cobre'
      Visible = ivAlways
      OnClick = dxButtonCObreClick
    end
    object dxButtonFIBRa: TdxBarButton
      Caption = 'Fibra '#243'ptica'
      Category = 0
      Hint = 'Fibra '#243'ptica'
      Visible = ivAlways
      OnClick = dxButtonFIBRaClick
    end
    object btnDatosGrales: TdxBarLargeButton
      Caption = 'Generar plantilla Datos Generales'
      Category = 0
      Hint = 'Generar plantilla Datos Generales'
      Visible = ivAlways
      LargeImageIndex = 15
      OnClick = btnDatosGralesClick
    end
  end
  object dsDatos: TDataSource
    DataSet = zDatos
    Left = 440
    Top = 432
  end
  object zDatos: TUniQuery
    ReadOnly = True
    AfterScroll = zDatosAfterScroll
    Left = 440
    Top = 376
  end
  object dxPopupGrid: TdxRibbonPopupMenu
    BarManager = dxBarManager1
    ItemLinks = <
      item
        Visible = True
        ItemName = 'dxButtonNuevo'
      end
      item
        Visible = True
        ItemName = 'dxBButtonEditar'
      end
      item
        Visible = True
        ItemName = 'dxBButtonEliminar'
      end>
    Ribbon = dxRibbon1
    UseOwnFont = False
    Left = 352
    Top = 568
  end
  object dlgSave1: TSaveDialog
    Filter = 'Documento de Microsoft Excel|*.xls'
    Left = 384
    Top = 504
  end
  object dxDockingManager1: TdxDockingManager
    Color = clBtnFace
    DefaultHorizContainerSiteProperties.CustomCaptionButtons.Buttons = <>
    DefaultHorizContainerSiteProperties.Dockable = True
    DefaultHorizContainerSiteProperties.ImageIndex = -1
    DefaultVertContainerSiteProperties.CustomCaptionButtons.Buttons = <>
    DefaultVertContainerSiteProperties.Dockable = True
    DefaultVertContainerSiteProperties.ImageIndex = -1
    DefaultTabContainerSiteProperties.CustomCaptionButtons.Buttons = <>
    DefaultTabContainerSiteProperties.Dockable = True
    DefaultTabContainerSiteProperties.ImageIndex = -1
    DefaultTabContainerSiteProperties.TabsProperties.CustomButtons.Buttons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Left = 344
    Top = 384
    PixelsPerInch = 96
  end
  object cxHintStyleController: TcxHintStyleController
    HintStyleClassName = 'TdxScreenTipStyle'
    HintStyle.ScreenTipLinks = <
      item
      end>
    HintStyle.ScreenTipActionLinks = <>
    HintHidePause = 10000
    Left = 496
    Top = 504
  end
  object zPersonal: TUniQuery
    Left = 320
    Top = 504
  end
  object dsPersonal: TDataSource
    DataSet = zPersonal
    Left = 328
    Top = 448
  end
  object dsMaterial: TDataSource
    DataSet = zMaterial
    Left = 1184
    Top = 336
  end
  object zUMateriales: TUniQuery
    Left = 1080
    Top = 296
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 664
    Top = 344
    PixelsPerInch = 96
    object cxstylSPago: TcxStyle
      AssignedValues = [svColor]
      Color = 13553407
    end
  end
  object cxStyleRepository2: TcxStyleRepository
    Left = 440
    Top = 296
    PixelsPerInch = 96
    object cxstylPendiente: TcxStyle
      AssignedValues = [svColor]
      Color = 8421631
    end
    object cxstylAutorizada: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 3054090
      TextColor = clWhite
    end
  end
  object dxPopupTipo: TdxBarPopupMenu
    BarManager = dxBarManager1
    ItemLinks = <
      item
        Visible = True
        ItemName = 'dxButtonCObre'
      end
      item
        Visible = True
        ItemName = 'dxButtonFIBRa'
      end>
    UseOwnFont = False
    Left = 320
    Top = 304
  end
  object zConceptos: TUniQuery
    Left = 648
    Top = 416
  end
  object zDeleteFolio: TUniQuery
    Connection = UDMConection.conBd
    SQL.Strings = (
      'DELETE FROM mt_materialxfolio WHERE IdFolio = :IdFolio;'
      'DELETE FROM mt_foliosxtecnicos WHERE IdFolio = :IdFolio;')
    Left = 784
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IdFolio'
      end>
  end
  object zUptMateriales: TUniUpdateSQL
    ModifySQL.Strings = (
      'update '
      '  mt_materialxfolio'
      'set '
      '  cantidad=:cantidad'
      'where idMaterialxfolio=:IdMaterialxfolio')
    Left = 1112
    Top = 392
  end
  object zMaterial: TUniQuery
    UpdateObject = zUptMateriales
    Left = 1112
    Top = 448
  end
end
