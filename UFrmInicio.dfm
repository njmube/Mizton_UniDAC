object FrmInicio: TFrmInicio
  Left = 0
  Top = 0
  Caption = 'Mizton Construcciones S.A. de C.V.'
  ClientHeight = 787
  ClientWidth = 1297
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnDragDrop = FormDragDrop
  OnDragOver = FormDragOver
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    1297
    787)
  PixelsPerInch = 96
  TextHeight = 13
  object dxStatusBarInicio: TdxRibbonStatusBar
    Left = 0
    Top = 764
    Width = 1297
    Height = 23
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Bevel = dxpbNone
        Text = 'Usuario:'
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Bevel = dxpbNone
        Width = 150
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Text = 'Ubicaci'#243'n:'
        Width = 50
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 200
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Text = 'Base de Datos:'
        Width = 80
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 150
      end
      item
        PanelStyleClassName = 'TdxStatusBarKeyboardStatePanelStyle'
        PanelStyle.CapsLockKeyAppearance.ActiveFontColor = clDefault
        PanelStyle.CapsLockKeyAppearance.ActiveCaption = 'CAPS'
        PanelStyle.CapsLockKeyAppearance.InactiveCaption = 'CAPS'
        PanelStyle.NumLockKeyAppearance.ActiveFontColor = clDefault
        PanelStyle.NumLockKeyAppearance.ActiveCaption = 'NUM'
        PanelStyle.NumLockKeyAppearance.InactiveCaption = 'NUM'
        PanelStyle.ScrollLockKeyAppearance.ActiveFontColor = clDefault
        PanelStyle.ScrollLockKeyAppearance.ActiveCaption = 'SCRL'
        PanelStyle.ScrollLockKeyAppearance.InactiveCaption = 'SCRL'
        PanelStyle.InsertKeyAppearance.ActiveFontColor = clDefault
        PanelStyle.InsertKeyAppearance.ActiveCaption = 'OVR'
        PanelStyle.InsertKeyAppearance.InactiveCaption = 'INS'
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taRightJustify
        Text = 'Empresa:'
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 250
      end
      item
      end
      item
        PanelStyleClassName = 'TdxStatusBarContainerPanelStyle'
        PanelStyle.Container = dxStatusBarInicioContainer10
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clDefault
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ExplicitTop = 768
    ExplicitWidth = 1306
    object dxStatusBarInicioContainer10: TdxStatusBarContainerControl
      Left = 1203
      Top = 0
      Width = 75
      Height = 23
      object btnLogin: TcxButton
        Left = 3
        Top = 0
        Width = 72
        Height = 23
        Align = alRight
        Caption = 'Cerrar Sesi'#243'n'
        TabOrder = 0
        Visible = False
        OnClick = btnLoginClick
      end
    end
  end
  object cxspltrMenu: TcxSplitter
    Left = 185
    Top = 0
    Width = 5
    Height = 764
    HotZoneClassName = 'TcxMediaPlayer9Style'
  end
  object navMenu: TdxNavBar
    Left = 0
    Top = 0
    Width = 185
    Height = 764
    Align = alLeft
    PopupMenu = dxPopup1
    ActiveGroupIndex = 0
    TabOrder = 3
    View = 15
    ViewStyle.SkinName = 'VS2010'
    ViewStyle.SkinNameAssigned = True
    OptionsImage.LargeImages = UDMConection.cxImgListFlat32
    OptionsImage.SmallImages = UDMConection.cxImgListFlat16
    OptionsView.NavigationPane.ShowActiveGroupCaptionWhenCollapsed = True
    object ItemRh: TdxNavBarGroup
      Caption = 'Recursos Humanos'
      LargeImageIndex = 26
      LinksUseSmallImages = False
      SelectedLinkIndex = -1
      SmallImageIndex = 0
      TopVisibleLinkIndex = 0
      UseRestSpace = True
      UseSmallImages = False
      Links = <
        item
          Item = LinkAutos
        end
        item
          Item = LinkTipoOrden
        end
        item
          Item = LinkCostos
        end
        item
          Item = LinkPersonal
        end
        item
          Item = LinkCargos
        end
        item
          Item = LinkMateriales
        end
        item
          Item = LinkSalarios
        end
        item
          Item = LinkVales
        end
        item
          Item = LinkFolios
        end
        item
          Item = LinkConsultaOrdenes
        end>
    end
    object ItemConfiguracion: TdxNavBarGroup
      Caption = 'Configuraci'#243'n de Sistema'
      LargeImageIndex = 20
      LinksUseSmallImages = False
      SelectedLinkIndex = -1
      SmallImageIndex = 5
      TopVisibleLinkIndex = 0
      UseSmallImages = False
      Links = <
        item
          Item = LinkPais
        end
        item
          Item = LinkEstado
        end
        item
          Item = LinkCiudad
        end
        item
          Item = sepConfig
        end
        item
          Item = LinkUMedida
        end
        item
          Item = LinkUsuarios
        end
        item
          Item = LinkPerfiles
        end>
    end
    object LinkPersonal: TdxNavBarItem
      Action = actPersonal
    end
    object LinkCargos: TdxNavBarItem
      Action = actPuestos
      LargeImageIndex = 10
      SmallImageIndex = 10
    end
    object LinkSalarios: TdxNavBarItem
      Caption = 'Salarios'
      Visible = False
    end
    object LinkFolios: TdxNavBarItem
      Action = actFolios
      Caption = 'Actividades (O.T. por Expediente)'
      LargeImageIndex = 22
      SmallImageIndex = 22
    end
    object LinkCiudad: TdxNavBarItem
      Action = actCiudad
      LargeImageIndex = 31
      SmallImageIndex = 7
    end
    object LinkPais: TdxNavBarItem
      Action = actPais
      LargeImageIndex = 33
      SmallImageIndex = 6
    end
    object LinkEstado: TdxNavBarItem
      Action = actEstado
      LargeImageIndex = 32
      SmallImageIndex = 7
    end
    object LinkUMedida: TdxNavBarItem
      Action = actUnidadMedida
      LargeImageIndex = 28
      SmallImageIndex = 8
    end
    object sepConfig: TdxNavBarSeparator
      Caption = 'sepConfig'
    end
    object LinkVales: TdxNavBarItem
      Action = actVales
      LargeImageIndex = 13
      SmallImageIndex = 13
    end
    object LinkUsuarios: TdxNavBarItem
      Action = actUsuarios
      LargeImageIndex = 27
      SmallImageIndex = 0
    end
    object LinkAutos: TdxNavBarItem
      Action = actAutomoviles
      LargeImageIndex = 14
      SmallImageIndex = 14
    end
    object LinkMateriales: TdxNavBarItem
      Action = actMateriales
      LargeImageIndex = 2
      SmallImageIndex = 2
    end
    object LinkTipoOrden: TdxNavBarItem
      Action = actTipoOrden
    end
    object LinkCostos: TdxNavBarItem
      Action = actAdminCostos
      LargeImageIndex = 0
      SmallImageIndex = 0
    end
    object LinkConsultaOrdenes: TdxNavBarItem
      Action = actConsultarOrd
      LargeImageIndex = 21
      SmallImageIndex = 21
    end
    object LinkPerfiles: TdxNavBarItem
      Action = actPerfiles
      LargeImageIndex = 12
      SmallImageIndex = 5
    end
  end
  object cxLabel2: TcxLabel
    Left = 962
    Top = 767
    Anchors = [akRight, akBottom]
    Caption = 'Activar Avisos'
    ParentColor = False
    ParentFont = False
    Style.Color = clWhite
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.LookAndFeel.NativeStyle = True
    Style.TextColor = clBlack
    Style.TextStyle = [fsBold]
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    Transparent = True
    Visible = False
  end
  object advAviso1: TAdvSmoothSlider
    Left = 1067
    Top = 767
    Width = 80
    Height = 20
    AppearanceOn.Fill.Color = 11196927
    AppearanceOn.Fill.ColorTo = 7257087
    AppearanceOn.Fill.ColorMirror = 4370174
    AppearanceOn.Fill.ColorMirrorTo = 8053246
    AppearanceOn.Fill.GradientType = gtVertical
    AppearanceOn.Fill.GradientMirrorType = gtVertical
    AppearanceOn.Fill.BorderColor = 4370174
    AppearanceOn.Fill.Rounding = 4
    AppearanceOn.Fill.RoundingType = rtLeft
    AppearanceOn.Fill.ShadowOffset = 0
    AppearanceOn.Fill.Glow = gmNone
    AppearanceOn.FillDisabled.ColorMirror = clNone
    AppearanceOn.FillDisabled.ColorMirrorTo = clNone
    AppearanceOn.FillDisabled.GradientType = gtVertical
    AppearanceOn.FillDisabled.GradientMirrorType = gtSolid
    AppearanceOn.FillDisabled.BorderColor = clNone
    AppearanceOn.FillDisabled.Rounding = 0
    AppearanceOn.FillDisabled.ShadowOffset = 0
    AppearanceOn.FillDisabled.Glow = gmNone
    AppearanceOn.Caption = 'On'
    AppearanceOn.Font.Charset = DEFAULT_CHARSET
    AppearanceOn.Font.Color = clWindowText
    AppearanceOn.Font.Height = -11
    AppearanceOn.Font.Name = 'Tahoma'
    AppearanceOn.Font.Style = []
    AppearanceOff.Fill.Color = 16773091
    AppearanceOff.Fill.ColorTo = 16768452
    AppearanceOff.Fill.ColorMirror = 16765357
    AppearanceOff.Fill.ColorMirrorTo = 16767936
    AppearanceOff.Fill.GradientType = gtVertical
    AppearanceOff.Fill.GradientMirrorType = gtVertical
    AppearanceOff.Fill.BorderColor = clNone
    AppearanceOff.Fill.Rounding = 4
    AppearanceOff.Fill.RoundingType = rtRight
    AppearanceOff.Fill.ShadowOffset = 0
    AppearanceOff.Fill.Glow = gmNone
    AppearanceOff.FillDisabled.ColorMirror = clNone
    AppearanceOff.FillDisabled.ColorMirrorTo = clNone
    AppearanceOff.FillDisabled.GradientType = gtVertical
    AppearanceOff.FillDisabled.GradientMirrorType = gtSolid
    AppearanceOff.FillDisabled.BorderColor = clNone
    AppearanceOff.FillDisabled.Rounding = 0
    AppearanceOff.FillDisabled.ShadowOffset = 0
    AppearanceOff.FillDisabled.Glow = gmNone
    AppearanceOff.Caption = 'Off'
    AppearanceOff.Font.Charset = DEFAULT_CHARSET
    AppearanceOff.Font.Color = clWindowText
    AppearanceOff.Font.Height = -11
    AppearanceOff.Font.Name = 'Tahoma'
    AppearanceOff.Font.Style = []
    ButtonAppearance.Fill.Color = 16773091
    ButtonAppearance.Fill.ColorTo = 16765615
    ButtonAppearance.Fill.ColorMirror = clNone
    ButtonAppearance.Fill.ColorMirrorTo = clNone
    ButtonAppearance.Fill.GradientType = gtVertical
    ButtonAppearance.Fill.GradientMirrorType = gtSolid
    ButtonAppearance.Fill.BorderColor = 16765615
    ButtonAppearance.Fill.Rounding = 4
    ButtonAppearance.Fill.ShadowOffset = 0
    ButtonAppearance.Fill.Glow = gmNone
    ButtonAppearance.FillDisabled.ColorMirror = clNone
    ButtonAppearance.FillDisabled.ColorMirrorTo = clNone
    ButtonAppearance.FillDisabled.GradientType = gtVertical
    ButtonAppearance.FillDisabled.GradientMirrorType = gtSolid
    ButtonAppearance.FillDisabled.BorderColor = clNone
    ButtonAppearance.FillDisabled.Rounding = 0
    ButtonAppearance.FillDisabled.ShadowOffset = 0
    ButtonAppearance.FillDisabled.Glow = gmNone
    Fill.ColorMirror = clNone
    Fill.ColorMirrorTo = clNone
    Fill.GradientType = gtVertical
    Fill.GradientMirrorType = gtSolid
    Fill.BorderColor = clNone
    Fill.Rounding = 4
    Fill.ShadowOffset = 0
    Fill.Glow = gmNone
    FillDisabled.ColorMirror = clNone
    FillDisabled.ColorMirrorTo = clNone
    FillDisabled.GradientType = gtVertical
    FillDisabled.GradientMirrorType = gtSolid
    FillDisabled.BorderColor = clNone
    FillDisabled.Rounding = 0
    FillDisabled.ShadowOffset = 0
    FillDisabled.Glow = gmNone
    Anchors = [akRight, akBottom]
    TabOrder = 5
    OnClick = advAviso1Click
    Visible = False
  end
  object cxspltr1: TcxSplitter
    Left = 1292
    Top = 0
    Width = 5
    Height = 764
    HotZoneClassName = 'TcxSimpleStyle'
    AlignSplitter = salRight
  end
  object cxspltr2: TcxSplitter
    Left = 1287
    Top = 0
    Width = 5
    Height = 764
    HotZoneClassName = 'TcxSimpleStyle'
    AlignSplitter = salRight
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
    FlatCloseButton = True
    MenuAnimations = maSlide
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 664
    Top = 296
    DockControlHeights = (
      0
      0
      0
      0)
    object dxBarManager1Bar1: TdxBar
      Caption = 'Quick Access Toolbar'
      CaptionButtons = <>
      DockedDockingStyle = dsNone
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsNone
      FloatLeft = 0
      FloatTop = 0
      FloatClientWidth = 51
      FloatClientHeight = 22
      ItemLinks = <>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = False
      WholeRow = False
    end
    object dxbrManager1Bar: TdxBar
      Caption = 'Selecci'#243'n de Apariencia'
      CaptionButtons = <>
      DockedDockingStyle = dsNone
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsNone
      FloatLeft = 1192
      FloatTop = 8
      FloatClientWidth = 161
      FloatClientHeight = 21
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxSkingallery1'
        end>
      OneOnRow = False
      Row = 2
      UseOwnFont = False
      Visible = False
      WholeRow = False
    end
    object dxbrGeneral: TdxBar
      Caption = 'Custom 1'
      CaptionButtons = <>
      DockedDockingStyle = dsNone
      DockedLeft = 132
      DockedTop = 0
      DockingStyle = dsNone
      FloatLeft = 1089
      FloatTop = 8
      FloatClientWidth = 169
      FloatClientHeight = 284
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxButtonEmpresa'
        end
        item
          Visible = True
          ItemName = 'dxButtonMonedas'
        end
        item
          Visible = True
          ItemName = 'dxButtonUMedida'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxButtonPaises'
        end
        item
          Visible = True
          ItemName = 'dxButtonEstados'
        end
        item
          Visible = True
          ItemName = 'dxButtonCiudad'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxButtonUsuarios'
        end
        item
          Visible = True
          ItemName = 'btnConfigCorreo'
        end>
      OneOnRow = True
      Row = 1
      UseOwnFont = False
      Visible = False
      WholeRow = False
    end
    object dxbrManager1Bar1: TdxBar
      Caption = 'Inicio'
      CaptionButtons = <>
      DockedDockingStyle = dsNone
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsNone
      FloatLeft = 1192
      FloatTop = 8
      FloatClientWidth = 127
      FloatClientHeight = 399
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxButtonAbirEmpresa'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxButtonProveedores'
        end
        item
          Visible = True
          ItemName = 'dxButtonClientes'
        end
        item
          Visible = True
          ItemName = 'dxButtonProductos'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxButtonBancos'
        end
        item
          Visible = True
          ItemName = 'dxButtonCuentasBancarias'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxButtonFacturas'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = False
      WholeRow = False
    end
    object dxbrManager1Bar2: TdxBar
      Caption = 'Configuraci'#243'n del M'#243'dulo'
      CaptionButtons = <>
      DockedDockingStyle = dsNone
      DockedLeft = 481
      DockedTop = 0
      DockingStyle = dsNone
      FloatLeft = 1192
      FloatTop = 8
      FloatClientWidth = 107
      FloatClientHeight = 162
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxButtonGiroProveedor'
        end
        item
          Visible = True
          ItemName = 'dxButtonFormaPago'
        end
        item
          Visible = True
          ItemName = 'dxButtonImpuesto'
        end>
      OneOnRow = True
      Row = 4
      UseOwnFont = False
      Visible = False
      WholeRow = False
    end
    object dxbrManager1Bar3: TdxBar
      Caption = 'Custom 2'
      CaptionButtons = <>
      DockedDockingStyle = dsNone
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsNone
      FloatLeft = 1054
      FloatTop = 8
      FloatClientWidth = 109
      FloatClientHeight = 42
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btn1'
        end>
      OneOnRow = False
      Row = 2
      UseOwnFont = False
      Visible = False
      WholeRow = False
    end
    object dxbrProductos: TdxBar
      Caption = 'Productos'
      CaptionButtons = <>
      DockedDockingStyle = dsNone
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsNone
      FloatLeft = 1054
      FloatTop = 8
      FloatClientWidth = 127
      FloatClientHeight = 96
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxButtonProductos'
        end
        item
          Visible = True
          ItemName = 'btnInventario'
        end>
      OneOnRow = True
      Row = 3
      UseOwnFont = False
      Visible = False
      WholeRow = False
    end
    object dxButtonUsuarios: TdxBarLargeButton
      Caption = '&Usuarios'
      Category = 0
      Hint = 'Usuarios'
      Visible = ivAlways
      LargeImageIndex = 8
      OnClick = dxButtonUsuariosClick
    end
    object dxSkingallery1: TdxSkinChooserGalleryItem
      Caption = 'Selecciona un nuevo tema'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
      OnSkinChanged = dxSkingallery1SkinChanged
    end
    object dxButtonAbirEmpresa: TdxBarLargeButton
      Caption = '&Abrir Empresa'
      Category = 0
      Hint = 'Abrir Empresa'
      Visible = ivAlways
      LargeImageIndex = 0
      OnClick = dxButtonAbirEmpresaClick
    end
    object dxButtonEmpresa: TdxBarLargeButton
      Caption = '&Empresas'
      Category = 0
      Hint = 'Empresas'
      Visible = ivAlways
      LargeImageIndex = 12
      OnClick = dxButtonEmpresaClick
    end
    object dxButtonCiudad: TdxBarLargeButton
      Caption = '&Ciudades'
      Category = 0
      Hint = 'Ciudades'
      Visible = ivAlways
      LargeImageIndex = 4
      OnClick = dxButtonCiudadClick
    end
    object dxButtonPaises: TdxBarLargeButton
      Caption = '&Paises'
      Category = 0
      Hint = 'Paises'
      Visible = ivAlways
      LargeImageIndex = 26
      OnClick = dxButtonPaisesClick
    end
    object dxButtonEstados: TdxBarLargeButton
      Caption = '&Estados'
      Category = 0
      Hint = 'Estados'
      Visible = ivAlways
      LargeImageIndex = 13
      OnClick = dxButtonEstadosClick
    end
    object dxButtonCondicionPago: TdxBarLargeButton
      Caption = 'Condiciones de Pago'
      Category = 0
      Hint = 'Condiciones de Pago'
      Visible = ivAlways
      LargeImageIndex = 9
      OnClick = dxButtonCondicionPagoClick
    end
    object dxButtonFormaPago: TdxBarLargeButton
      Caption = 'Forma de Pago'
      Category = 0
      Hint = 'Forma de Pago'
      Visible = ivAlways
      LargeImageIndex = 17
      OnClick = dxButtonFormaPagoClick
    end
    object dxButtonGiroProveedor: TdxBarLargeButton
      Caption = 'Giros de Empresa'
      Category = 0
      Hint = 'Giros de Empresa'
      Visible = ivAlways
      LargeImageIndex = 25
      OnClick = dxButtonGiroProveedorClick
    end
    object dxButtonProveedores: TdxBarLargeButton
      Caption = '&Proveedores'
      Category = 0
      Hint = 'Proveedores'
      Visible = ivAlways
      LargeImageIndex = 6
      OnClick = dxButtonProveedoresClick
    end
    object dxButtonClientes: TdxBarLargeButton
      Caption = '&Clientes'
      Category = 0
      Hint = 'Clientes'
      Visible = ivAlways
      LargeImageIndex = 11
      OnClick = dxButtonClientesClick
    end
    object dxButtonMonedas: TdxBarLargeButton
      Caption = '&Monedas'
      Category = 0
      Hint = 'Monedas'
      Visible = ivAlways
      LargeImageIndex = 10
      OnClick = dxButtonMonedasClick
    end
    object dxButtonCuentasBancarias: TdxBarLargeButton
      Caption = '&Cuentas Bancarias'
      Category = 0
      Hint = 'Cuentas Bancarias'
      Visible = ivAlways
      LargeImageIndex = 3
      OnClick = dxButtonCuentasBancariasClick
    end
    object dxButtonBancos: TdxBarLargeButton
      Caption = '&Bancos'
      Category = 0
      Hint = 'Bancos'
      Visible = ivAlways
      LargeImageIndex = 1
      OnClick = dxButtonBancosClick
    end
    object dxButtonFacturas: TdxBarLargeButton
      Caption = '&Facturas'
      Category = 0
      Hint = 'Facturas'
      Visible = ivAlways
      LargeImageIndex = 19
      OnClick = dxButtonFacturasClick
    end
    object dxButtonUMedida: TdxBarLargeButton
      Caption = '&Unidades de Medida'
      Category = 0
      Hint = 'Unidades de Medida'
      Visible = ivAlways
      LargeImageIndex = 16
      OnClick = dxButtonUMedidaClick
    end
    object dxButtonProductos: TdxBarLargeButton
      Caption = '&Productos / Servicios'
      Category = 0
      Hint = 'Productos / Servicios'
      Visible = ivAlways
      LargeImageIndex = 14
      OnClick = dxButtonProductosClick
    end
    object dxButtonImpuesto: TdxBarLargeButton
      Caption = '&Impuestos'
      Category = 0
      Hint = 'Impuestos'
      Visible = ivAlways
      LargeImageIndex = 32
      OnClick = dxButtonImpuestoClick
    end
    object btnConfigCorreo: TdxBarLargeButton
      Caption = '&Config. Cuenta de Correo'
      Category = 0
      Hint = 'Config. Cuenta de Correo'
      Visible = ivAlways
      LargeImageIndex = 33
      OnClick = btnConfigCorreoClick
    end
    object btnEnviarCorreo: TdxBarLargeButton
      Caption = '&Enviar Correo'
      Category = 0
      Hint = 'Enviar Correo'
      Visible = ivAlways
      LargeGlyph.Data = {
        36100000424D3610000000000000360000002800000020000000200000000100
        2000000000000010000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0001000000010000000100000001000000010000000100000001000000010000
        0001000000010000000100000000000000000000000000000000000000000000
        0001000000020000000400000004000000040000000500000005000000050000
        0005000000050000000500000005000000050000000500000005000000050000
        0005000000050000000500000005000000050000000500000005000000050000
        0005000000040000000200000001000000010000000000000000000000010000
        0003000000080000000D00000010000000110000001100000011000000110000
        0012000000120000001200000012000000120000001200000012000000130000
        0013000000130000001300000013000000130000001300000013000000130000
        00130000000F0000000900000003000000010000000000000000000000020000
        0007312F69A28F7079EDB18574FFA96F4BFFA7683DFFA86A42FFAE806DFFAA81
        79FF4B49ADFF2C37BDFF373DB5FF9B777FFFAF8270FFA86D49FFA5653CFFA668
        40FFAD7D6AFFA87D75FF4846AAFF2933BBFF363AB3FF9A747DFFAD7F6EFFA66B
        47FF8A4926FF593423A300000009000000020000000000000000000000030000
        000C303CC1FF4149C2FFCEC7D7FFE9DBD5FFB88665FFA7693FFFAF764EFFE5D3
        CAFFE7DEE2FF5C62C8FF2D39BEFF4049C2FFD4CEE0FFEEE3DEFFB88666FFA667
        3DFFAD734DFFE6D4CBFFE7DFE2FF585FC5FF2A35BCFF3C45BEFFCFC7D9FFE8DA
        D4FFA16A4EFF8C4B28FF0000000E000000040000000000000000000000030000
        000E4F4EAFFF323FC3FFEFE7E3FFEDE3DEFFEDE4DFFFEEE5E1FFF0E6E3FFF0E7
        E4FFF1E8E5FFF2E9E6FFF2EAE6FFF3EAE7FFF3ECE7FFF3ECE8FFF3EBE8FFF2EA
        E7FFF2EAE7FFF2EAE6FFF1E8E5FFF0E7E4FFEFE6E3FFEEE5E1FFEEE3E0FFF0E8
        E4FFEDE4DFFF9F6952FF00000011000000040000000000000000000000030000
        000EA87E76FF595BBCFFF6F0EEFFF0E8E4FFEEE5E1FFEFE6E3FFF0E7E4FFF1E9
        E5FFF1EAE6FFF2EBE7FFF3ECE8FFF4EDE9FFF5EEEBFFF5EEEBFFF4EDE9FFF4ED
        E9FFF3ECE8FFF3EBE8FFF2E9E6FFF1E8E5FFF1E7E4FFEFE6E3FFF2E9E6FFF6F1
        EFFFB49BA5FFA97B6BFF00000011000000040000000000000000000000030000
        000DB0816EFFD8C9C8FFCFB2A6FFF7F3F0FFF1E8E5FFF0E6E4FFF1E9E6FFF3EC
        E9FFF6F0EDFFF6F2EFFFF8F3F1FFF8F4F1FFF8F4F2FFF8F4F2FFF7F4F2FFF8F3
        F1FFF7F1EFFFF6F0EDFFF4EDE9FFF2EAE6FFF1E9E6FFF1E9E6FFF7F3F1FFD3B6
        ADFF3239B0FF957077FF00000010000000040000000000000000000000030000
        000CB0774FFFDCC5BBFFE1D1CBFFD2B4AAFFF9F5F4FFF5EFEDFFF7F2F0FFF8F3
        F2FFF8F4F1FFF8F4F2FFF9F5F3FFF9F6F3FFF9F5F3FFF9F6F3FFF9F5F2FFF8F4
        F3FFF8F4F2FFF7F3F1FFF7F2EFFFF6F1EEFFF5EEECFFF9F5F4FFD6BCB3FFE1D0
        CBFF222BB0FF2F33AAFF0000000F000000040000000000000000000000030000
        000BB1774EFFB5805AFFE5D8D2FFE2D1CAFFDAC1B8FFFCFAF9FFF9F4F2FFF8F4
        F2FFF9F5F3FFF9F5F4FFFAF6F4FFF9F6F4FFEEE4E0FFE5D7D1FFEEE4E0FFF9F6
        F4FFF9F5F3FFF8F4F2FFF8F3F1FFF7F2F0FFFBF9F7FFDFC9C1FFE2D0CAFFE6D8
        D2FF5256BAFF242DB3FF0000000F000000040000000000000000000000030000
        000BB37F5BFFB27B51FFE8DAD5FFE8DAD5FFE3D2CBFFDFC7BFFFFCFAFAFFF9F6
        F4FFF9F6F4FFFAF6F5FFF8F4F3FFE3D5D0FFD2C1BBFFD3C1BCFFDCCCC5FFEADF
        DAFFF9F5F4FFF9F5F3FFF9F4F2FFFCFAF9FFE4CFCAFFE3D1CCFFE7D9D5FFE7DA
        D5FFDED1D3FF7C648BFF0000000E000000030000000000000000000000020000
        000AB88D7EFFC09373FFE9DCD8FFE9DCD8FFE9DCD8FFE3D1CCFFE4D1CAFFFCFB
        FAFFFAF7F5FFF5EFEEFFD9C7C2FFBCA49CFF9A7063FF906659FFBCA39DFFD4C1
        BAFFE4D6D1FFF9F5F3FFFCFAF9FFEFE4DFFFE8DBD7FFEEE4E1FFE9DCD8FFE9DC
        D8FFEEE4E1FFC3A398FF0000000E000000030000000000000000000000020000
        0009A7878EFFE9DBD4FFEBDFDAFFEBE0DAFFEBDFDAFFEBE0DAFFE5D3CCFFEEE3
        DFFFEFE8E5FFD0BBB5FFAB8981FFA87F73FFF0E9E7FFEEE7E4FF9D7468FFA685
        7DFFCEB8B2FFE2D3CFFFEDE0DBFFEFE6E3FF84A8CDFFF0EAE8FFEFE6E2FFEFE7
        E3FFEFE9E7FF7591B4FF00000010000000030000000000000000000000020000
        0009535ECBFFD2CCDAFFECE1DDFFEBE2DCFFECE1DCFFEBE1DCFFEADFDAFFD6BC
        B4FFAD8173FF9D6F61FFD0B9B1FFFBF9F8FFF9F6F4FFF9F6F4FFFBF9F8FFCBB4
        ADFF936658FFAC8174FFC6A79CFFEEE7E5FF216EB9FF7B97BFFFF0EAE8FFF0EA
        E8FF7B96BEFF206AB8FF00000012000000030000000000000000000000020000
        00084B5DD5FF5969D5FFEEE4DFFFEEE3E0FFECE2DFFFEBDFDBFFD3BEB7FFAC85
        7AFFB28C7FFFF2EBE9FFFCFAF9FFF8F4F1FFF7F3F0FFF7F2F0FFF8F4F1FFFCFA
        F9FFF0E9E7FFA78074FFA98277FFDECFCBFF2472BCFF3183C9FF7C98C1FF7C97
        C0FF2B7FC7FF226EBAFF00000012000000030000000000000000000000020000
        0007686CC4FF4D5FD6FFF0E5E1FFEEE3E0FFEADFD9FFC9ACA3FFAD8376FFD7C3
        BBFFFCFAF9FFF9F6F4FFF7F3F1FFF7F3F1FFF8F4F1FFF8F3F1FFF7F3F1FFF8F5
        F3FFF9F8F7FFF8F8F7FFE4DAD7FFCAB6B0FF2775C0FF56B9EEFF2575C1FF216E
        BAFF3DAAEBFF2472BCFF00000015000000090000000600000003000000020000
        0007BC9991FF7582DAFFEEE5E1FFE8DDD7FFBF9D92FFBF9D93FFF4EEEDFFFCFB
        FAFFF8F5F3FFF8F5F2FFF8F5F2FFF8F5F2FFF8F5F3FFF8F5F2FFF8F5F3FFF8F6
        F4FF91B8DCFF2B7BC5FF2A7BC4FF2A7AC3FF297AC3FF45AFEDFF43AFEDFF43AE
        ECFF42ADECFF2776C0FF2675BFFF2775BFFF2674BFFF12395D83000000010000
        0006C29C8BFFE8E0E1FFE2D2CBFFBE988CFFDFCDC7FFFCFBFAFFFAF8F6FFF9F6
        F3FFF9F6F3FFF9F6F3FFF9F6F4FFF9F6F3FFF9F6F4FFF9F6F5FFF9F6F4FFFAF8
        F7FFF9F8F6FF91B9DCFF5DAADEFF81CFF5FF5FBFF1FF49B3EEFF48B2EEFF48B1
        EEFF47B1EDFF46B0EDFF55B8EFFF499EDAFF143B608500000005000000010000
        0005C1936EFFD4BBADFFCDAEA4FFF7F2F0FFFCFBFBFFF9F8F5FFF9F6F4FFF9F7
        F5FFF9F7F5FFF9F7F6FFF9F7F6FFFAF7F6FFFBF9F9FFFBF9F9FFFAF8F7FFFAF7
        F7FFFAF9F8FFF8F7F6FF92BADDFF53A1DBFF66C4F2FF4FB7EFFF4EB6EEFF4DB5
        EFFF4CB5EEFF4BB4EEFF3E95D6FF153D62860000000500000001000000010000
        0005C3956CFFC69B76FFFDFCFBFFFBF9F8FFFAF8F5FFFAF8F5FFFAF8F6FFFBFA
        F9FFFDFCFCFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFEFEFEFFFBFBFBFF87ACD5FF3C8BCFFF69C4F2FF73CAF4FF7BCFF5FF7BCD
        F5FF71C9F4FF66C2F2FF3182CAFF0E315A880000000400000001000000010000
        0003B39288E8F2EAE6FFFAF9F7FFFAF8F7FFFBFAF9FFFDFDFCFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFCFCFCFF8AB0DAFF6DAADCFFC6EDFBFFC7EDFBFFABE3F9FF85D3F5FF84D3
        F6FF83D3F5FFA4E0F9FFB8E7FAFF61A2D7FF0F325C8600000004000000000000
        0002342C2942A68C83CAD0B2A6FFD1B1A6FFD0B1A5FFD0B1A4FFCFAFA3FFCFAE
        A2FFCEAEA2FFCEADA1FFCEACA0FFCDACA0FFCDAB9EFFCBAB9DFFCBAA9DFFD7BE
        B4FF8CB0D0FF398FD4FF398ED4FF388ED3FF378ED2FFB4E7FAFFA5E1F9FFB7E7
        FAFFA4E0F9FF358AD0FF358ACFFF3489CFFF3488CEFF1A446884000000000000
        0001000000010000000300000003000000040000000400000004000000040000
        0004000000040000000400000004000000040000000400000004000000050000
        00050000000600000007000000080000000A3A91D6FFCBEFFCFF6FB3E3FF73B4
        E3FFC7EDFBFF378ED3FF00000008000000040000000300000002000000000000
        0000000000000000000100000001000000010000000100000001000000010000
        0001000000010000000100000001000000010000000100000001000000010000
        0001000000010000000100000001000000043C95D9FF8CC4EAFF1E486A831D48
        6A838AC3EAFF3B92D6FF00000003000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000023E98DBFF1F4B6C81000000020000
        00021F4A6B813D95D9FF00000003000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000001204D6E8000000002000000000000
        0000000000021F4B6D8000000001000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000100000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      OnClick = btnEnviarCorreoClick
    end
    object btn1: TdxBarLargeButton
      Caption = '&Lector de n'#243'mina'
      Category = 0
      Hint = 'Lector de n'#243'mina'
      Visible = ivAlways
    end
    object btnInventario: TdxBarLargeButton
      Caption = '&Inventario'
      Category = 0
      Hint = 'Inventario'
      Visible = ivAlways
    end
  end
  object dxSkinController1: TdxSkinController
    Kind = lfOffice11
    NativeStyle = False
    SkinName = 'DevExpressStyle'
    UseImageSet = imsOriginal
    Left = 728
    Top = 232
  end
  object cxlkndflcntrlr1: TcxLookAndFeelController
    Kind = lfOffice11
    NativeStyle = False
    SkinName = 'DevExpressStyle'
    Left = 664
    Top = 136
  end
  object dxTabManager1: TdxTabbedMDIManager
    Active = True
    TabProperties.CloseButtonMode = cbmEveryTab
    TabProperties.CloseTabWithMiddleClick = True
    TabProperties.CustomButtons.Buttons = <>
    TabProperties.Focusable = True
    OnPageAdded = dxTabManager1PageAdded
    Left = 680
    Top = 360
  end
  object dxAlertSRV: TdxAlertWindowManager
    OptionsButtons.Buttons = <>
    OptionsMessage.Caption.Font.Charset = DEFAULT_CHARSET
    OptionsMessage.Caption.Font.Color = clWindowText
    OptionsMessage.Caption.Font.Height = -13
    OptionsMessage.Caption.Font.Name = 'Tahoma'
    OptionsMessage.Caption.Font.Style = [fsBold]
    OptionsMessage.Images = UDMConection.cxImageIconos
    OptionsMessage.Text.Font.Charset = DEFAULT_CHARSET
    OptionsMessage.Text.Font.Color = clWindowText
    OptionsMessage.Text.Font.Height = -11
    OptionsMessage.Text.Font.Name = 'Tahoma'
    OptionsMessage.Text.Font.Style = []
    OptionsNavigationPanel.Font.Charset = DEFAULT_CHARSET
    OptionsNavigationPanel.Font.Color = clWindowText
    OptionsNavigationPanel.Font.Height = -11
    OptionsNavigationPanel.Font.Name = 'Tahoma'
    OptionsNavigationPanel.Font.Style = []
    OptionsNavigationPanel.Visibility = awnpvAlways
    OptionsSize.AutoHeight = True
    OptionsSize.AutoWidth = True
    OptionsSize.AutoSizeAdjustment = True
    WindowPosition = awpBottomLeft
    Left = 664
    Top = 80
    PixelsPerInch = 96
  end
  object cxHintStyleController1: TcxHintStyleController
    HintStyleClassName = 'TcxHintStyle'
    HintStyle.Animate = cxhaSlideFromLeft
    HintStyle.CallOutPosition = cxbpLeftBottom
    HintStyle.CaptionFont.Charset = DEFAULT_CHARSET
    HintStyle.CaptionFont.Color = clWindowText
    HintStyle.CaptionFont.Height = -11
    HintStyle.CaptionFont.Name = 'Tahoma'
    HintStyle.CaptionFont.Style = []
    HintStyle.Font.Charset = DEFAULT_CHARSET
    HintStyle.Font.Color = clWindowText
    HintStyle.Font.Height = -11
    HintStyle.Font.Name = 'Tahoma'
    HintStyle.Font.Style = []
    HintStyle.IconSize = cxisSmall
    HintStyle.IconType = cxhiQuestion
    HintStyle.Rounded = True
    UseHintControlLookAndFeel = True
    Left = 664
    Top = 184
  end
  object dxRadial1: TdxRibbonRadialMenu
    ItemLinks = <
      item
        Visible = True
        ItemName = 'dxSkingallery1'
      end>
    UseOwnFont = False
    Left = 664
    Top = 232
  end
  object zImpuestos: TUniQuery
    Left = 800
    Top = 200
  end
  object zEmpresa: TUniQuery
    Left = 808
    Top = 128
  end
  object acListMenu: TActionList
    Images = UDMConection.cxImgListFlat16
    OnExecute = acListMenuExecute
    Left = 704
    Top = 56
    object actPersonal: TAction
      Caption = 'Listado de Personal'
      ImageIndex = 26
      OnExecute = actPersonalExecute
    end
    object actFolios: TAction
      Caption = 'Actividades (Folios por Expediente)'
      ImageIndex = 6
      OnExecute = actFoliosExecute
    end
    object actVales: TAction
      Caption = 'Listado de Vales '
      ImageIndex = 1
      OnExecute = actValesExecute
    end
    object actPais: TAction
      Caption = 'Paises'
      ImageIndex = 6
      OnExecute = actPaisExecute
    end
    object actEstado: TAction
      Caption = 'Estados'
      ImageIndex = 7
      OnExecute = actEstadoExecute
    end
    object actCiudad: TAction
      Caption = 'Ciudades'
      ImageIndex = 7
      OnExecute = actCiudadExecute
    end
    object actUnidadMedida: TAction
      Caption = 'Unidades de Medida'
      ImageIndex = 8
      OnExecute = actUnidadMedidaExecute
    end
    object actUsuarios: TAction
      Caption = 'Usuarios'
      ImageIndex = 0
      OnExecute = actUsuariosExecute
    end
    object actAutomoviles: TAction
      Caption = 'Autom'#243'viles '
      ImageIndex = 18
      OnExecute = actAutomovilesExecute
    end
    object actPuestos: TAction
      Caption = 'Listado de Puestos'
      ImageIndex = 2
      OnExecute = actPuestosExecute
    end
    object actMateriales: TAction
      Caption = 'Listado de Materiales'
      ImageIndex = 17
      OnExecute = actMaterialesExecute
    end
    object actTipoOrden: TAction
      Caption = 'Tipos de Orden'
      ImageIndex = 15
      OnExecute = actTipoOrdenExecute
    end
    object actAdminCostos: TAction
      Caption = 'Administrar Costos'
      ImageIndex = 8
      OnExecute = actAdminCostosExecute
    end
    object actConsultarOrd: TAction
      Caption = 'Consultar Ordenes'
      ImageIndex = 1
      OnExecute = actConsultarOrdExecute
    end
    object actPerfiles: TAction
      Caption = 'Perfiles de Usuario'
      ImageIndex = 5
      OnExecute = actPerfilesExecute
    end
  end
  object dxrbndrpdwnglry1: TdxRibbonDropDownGallery
    BarManager = dxBarManager1
    ItemLinks = <
      item
        Visible = True
        ItemName = 'dxSkingallery1'
      end>
    UseOwnFont = False
    Left = 776
    Top = 336
  end
  object dxPopup1: TdxBarPopupMenu
    BarManager = dxBarManager1
    ItemLinks = <
      item
        Visible = True
        ItemName = 'dxSkingallery1'
      end>
    UseOwnFont = False
    Left = 768
    Top = 80
  end
  object tmr1: TTimer
    Enabled = False
    Interval = 50000
    OnTimer = tmr1Timer
    Left = 736
    Top = 152
  end
  object zHiloFolio: TUniQuery
    SQL.Strings = (
      'Select'
      
        ' (Select Count(*) from mt_foliosxtecnicos where DATE(fechacreaci' +
        'on) =  DATE(NOW()) and estatus = "Liquidada") as liquidadas,'
      
        ' (Select Count(*) from mt_foliosxtecnicos where DATE(fechacreaci' +
        'on) =  DATE(NOW()) and estatus = "Objetada") as Objetadas,'
      
        ' (Select Count(*) from mt_foliosxtecnicos where DATE(fechacreaci' +
        'on) =  DATE(NOW()) and estatus = "Queja") as Quejas,'
      
        ' (Select Count(*) from mt_foliosxtecnicos where DATE(fechacreaci' +
        'on) =  DATE(NOW())) as Total,'
      '  p.CodigoPersonal as Expediente, '
      
        '  concat("[",p.CodigoPersonal,"] ", p.Nombre, " ", p.APaterno, "' +
        ' ", p.AMaterno) as CodigoPersonal,'
      #9'ft.*,'
      '  tr.*,'
      '  c.Codigo,'#9#9#9
      '  0 as CostoCobrar'
      'From mt_foliosxtecnicos as ft'
      ''
      'left join '
      '  mt_central as c'
      'on (c.Codigo = ft.Central) '
      ''
      'left join'
      #9'mt_tipoorden as tr '
      'on (tr.idTipo=ft.IdTipo)'
      ''
      'inner join'
      '  master_personal as p'
      'on (p.IdPersonal = ft.IdPersonal)'
      ''
      ' '
      'where'
      'DATE(ft.fechacreacion) =  DATE(NOW())'
      ''
      'group by ft.IdFolio')
    BeforeOpen = zHiloFolioBeforeOpen
    AfterOpen = zHiloFolioAfterOpen
    AfterRefresh = zHiloFolioAfterRefresh
    BeforeRefresh = zHiloFolioBeforeRefresh
    Left = 800
    Top = 256
  end
  object dsHiloFolio: TDataSource
    DataSet = zHiloFolio
    Left = 744
    Top = 296
  end
  object dxFloatDockSite1: TdxFloatDockSite
    Left = 0
    Top = 0
    Width = 853
    Height = 561
    Visible = False
    FloatLeft = 564
    FloatTop = 236
    DockingType = 0
    OriginalWidth = 853
    OriginalHeight = 561
    object dxDockPanel1: TdxDockPanel
      Left = 0
      Top = 0
      Width = 853
      Height = 561
      Visible = False
      AllowFloating = True
      AutoHide = False
      Caption = 'dxDockPanel1'
      CustomCaptionButtons.Buttons = <>
      TabsProperties.CustomButtons.Buttons = <>
      DockingType = 0
      OriginalWidth = 853
      OriginalHeight = 561
    end
  end
  object zModulos: TUniQuery
    Connection = UDMConection.conBd
    Left = 640
    Top = 400
  end
end
