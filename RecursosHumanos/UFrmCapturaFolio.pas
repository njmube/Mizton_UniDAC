unit UFrmCapturaFolio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, ExtCtrls, dxLayoutContainer,
  dxLayoutControl, cxContainer, cxEdit, dxLayoutcxEditAdapters, cxMaskEdit,
  cxDBEdit, cxTextEdit, cxDropDownEdit, cxCalendar, Menus, StdCtrls, cxButtons,
  DB, UConection, UMsgBox,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxMemo, uni, MemDS, DBAccess;

type
  TFrmCapturaFolio = class(TForm)
    dxLayControl1Group_Root: TdxLayoutGroup;
    dxLayControl1: TdxLayoutControl;
    pnlBotonera: TPanel;
    cxTextFolio: TcxDBTextEdit;
    lyFolio: TdxLayoutItem;
    cxMaskTelefono: TcxDBMaskEdit;
    lyTelefono: TdxLayoutItem;
    cxTextPrincipal: TcxDBTextEdit;
    lyPrincipal: TdxLayoutItem;
    cxTextSecundario: TcxDBTextEdit;
    lySecundario: TdxLayoutItem;
    cxDateFecha: TcxDBDateEdit;
    lyFecha: TdxLayoutItem;
    cbbEstatus: TcxDBComboBox;
    lyEstatus: TdxLayoutItem;
    btnGuardar: TcxButton;
    btnCancelar: TcxButton;
    dsDatos: TDataSource;
    zDatos: TUniquery;
    zMaterial: TUniquery;
    dsMaterial: TDataSource;
    zVales: TUniquery;
    dsVales: TDataSource;
    cbbContratista: TcxDBLookupComboBox;
    lyContratista: TdxLayoutItem;
    cbbTipoOrden: TcxDBLookupComboBox;
    lyTipoOrden: TdxLayoutItem;
    cbbCentral: TcxDBLookupComboBox;
    lyCentral: TdxLayoutItem;
    cxTextDistrito: TcxDBTextEdit;
    lyDistrito: TdxLayoutItem;
    cxMemoComentarios: TcxDBMemo;
    lyComentarios: TdxLayoutItem;
    zContratistas: TUniquery;
    dsContratistas: TDataSource;
    zTipoOrden: TUniquery;
    dsTipoOrden: TDataSource;
    cxTextTerminal: TcxDBTextEdit;
    lyTerminal: TdxLayoutItem;
    cxTextPuerto: TcxDBTextEdit;
    lyPuerto: TdxLayoutItem;
    zCentral: TUniquery;
    dsCentral: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure cbbValePropertiesEditValueChanged(Sender: TObject);
    procedure cbbEstatusPropertiesChange(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
    IdFolio: Integer;
    IdPersonal: Integer;
    TipoInstalacion: Integer;
  end;

var
  FrmCapturaFolio: TFrmCapturaFolio;

implementation

{$R *.dfm}

procedure TFrmCapturaFolio.btnCancelarClick(Sender: TObject);
begin
  zDatos.Cancel;
  Close;
end;

procedure TFrmCapturaFolio.btnGuardarClick(Sender: TObject);
var
  Cursor: TCursor;
begin
  try
    Cursor := Screen.Cursor;
    try
      screen.Cursor := crAppStart;

      zDatos.FieldByName('TipoOS').AsString := zTipoOrden.FieldByName('TipoOrden').AsString;
      zDatos.Post;
      Close;
    finally
      SCreen.Cursor := Cursor;
    end;
  Except
    on e: eWarning do
    begin
      MsgBox.ShowModal('Validación.',e.Message, cmtWarning, [cmbOK]);
    end;

    on e: exception do
    begin
      MsgBox.ShowModal('Error.', pMensajeError + e.Message, cmtError, [cmbOK]);
      postMessage(self.Handle, WM_CLOSE, 0, 0);
    end;
  end;
end;

procedure TFrmCapturaFolio.cbbEstatusPropertiesChange(Sender: TObject);
var
  visible: Boolean;
begin
  visible := cbbEstatus.Text = 'Liquidada';
  lyPrincipal.Visible := visible;
  lySecundario.Visible := visible;
  lyCentral.Visible := visible;
  lyDistrito.Visible := visible;
end;

procedure TFrmCapturaFolio.cbbValePropertiesEditValueChanged(Sender: TObject);
begin
  if zDatos.Active AND zVales.Active then
  begin
    zDatos.FieldByName('FolioPrincipal').AsString := zVales.FieldByName('FolioMaestro').AsString;
    zDatos.FieldByName('Area').AsString := zVales.FieldByName('Area').AsString;
    zDatos.FieldByName('Division').AsString := zVales.FieldByName('Division').AsString;
    zDatos.FieldByName('Contratista').AsString := zVales.FieldByName('Contratista').AsString;
    zDatos.FieldByName('FechaVale').asDateTime := zVales.FieldByName('FechaVale').asDateTime;
  end;
end;

procedure TFrmCapturaFolio.FormCreate(Sender: TObject);
begin
  IdFolio := -9;
  TipoInstalacion := 1; //1 cobre 2 Fibra
  if not AsignarSQL(zDatos, 'mt_foliosxtecnicos', pUpdate) then
    raise Exception.Create(pErrorConsulta + '[mt_foliosxtecnicos]');

//  if not AsignarSQL(zVales, 'mt_vales', pReadOnly) then
//    raise Exception.Create(pErrorConsulta + '[Catálogo de Vales]');
//

  AsignarSQL(zContratistas, 'mt_contratistas', pReadOnly);
  AsignarSQL(zTipoOrden, 'mt_tipoorden', pReadOnly);
  AsignarSQL(zCentral, 'mt_central', pReadOnly);
end;

procedure TFrmCapturaFolio.FormShow(Sender: TObject);
var
  Cursor: TCursor;
begin
  try
    Cursor := Screen.Cursor;
    try
      screen.Cursor := crAppStart;
      if not FiltrarDataset(zDatos, 'IdFolio', [IntToStr(IdFolio)]) then
        raise Exception.Create(pErrorFiltrar + '[mt_foliosxtecnicos]');

      if zDatos.Active then
        zDatos.Refresh
      else
        zDatos.Open;

      if IdFolio = -9 then
      begin
        zDatos.Append;
        zDatos.FieldByName('IdFolio').AsInteger := 0;
        zDatos.FieldByName('IdPersonal').AsInteger := IdPersonal;
        zDatos.FieldByName('Estatus').AsString := 'Liquidada';
      end
      else
        zDatos.Edit;

      FiltrarDataset(zContratistas,'IdContratista', ['-1']);
      FiltrarDataset(zTipoOrden,'IdTipo', ['-1']);
      FiltrarDataset(zCentral,'idCentral', ['-1']);

      zContratistas.Open;
      zTipoOrden.Open;
      zCentral.Open;

      if TipoInstalacion = 1 then
      begin
        lyContratista.Visible := False;
        lyTerminal.Visible := False;
        lyPuerto.Visible := False;
        zTipoOrden.Filtered := False;
        zTipoOrden.Filter := 'TipoInstalacion = ' + QuotedStr('Cobre') ;
        zTipoOrden.Filtered := True;
      end
      else
      begin
        lyContratista.Visible := True;
        lyTerminal.Visible := True;
        lyPuerto.Visible := True;
        lyPrincipal.Visible := False;
        lySecundario.Visible := False;
        zTipoOrden.Filtered := False;
        zTipoOrden.Filter := 'TipoInstalacion = ' + QuotedStr('FO') ;
        zTipoOrden.Filtered := True;
      end;

    finally
      SCreen.Cursor := Cursor;
    end;
  Except
    on e: exception do
    begin
      MsgBox.ShowModal('Error.', pMensajeError + e.Message, cmtError, [cmbOK]);
      postMessage(self.Handle, WM_CLOSE, 0, 0);
    end;
  end;
end;

end.
