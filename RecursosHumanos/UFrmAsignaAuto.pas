unit UFrmAsignaAuto;

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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxContainer, cxEdit,
  dxLayoutcxEditAdapters, dxLayoutContainer, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  dxLayoutControl, Menus, StdCtrls, cxButtons, ExtCtrls, cxImage, cxDBEdit,
  cxLabel, cxDBLabel, DB, uconection, umsgbox, cxMemo , uni, MemDS, DBAccess;

type
  TFrmAsignaAuto = class(TForm)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    cbbAutomoviles: TcxDBLookupComboBox;
    lyAutomoviles: TdxLayoutItem;
    Panel1: TPanel;
    btnAsignar: TcxButton;
    btnCancelar: TcxButton;
    zAutomovil: TUniQuery;
    zupt: TUniQuery;
    dsAutomovil: TDataSource;
    dsUpt: TDataSource;
    cxMemoComentarios: TcxDBMemo;
    lyComentarios: TdxLayoutItem;
    dxLayoutControl1Item1: TdxLayoutItem;
    cxDBImage1: TcxDBImage;
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAsignarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    Quitar: Boolean;
    idPersonal: integer;
    idAuto : Integer;
    { Public declarations }
  end;

var
  FrmAsignaAuto: TFrmAsignaAuto;

implementation

{$R *.dfm}

procedure TFrmAsignaAuto.btnAsignarClick(Sender: TObject);
var
  cursor: tCursor;
begin
  try
    Cursor := Screen.Cursor;
    try
      Screen.Cursor := CrAppStart;

      if not Quitar then
        zupt.fieldbyName('TipoMovimiento').AsString := 'Asignar'
      else
      begin
        zupt.fieldbyName('TipoMovimiento').AsString := 'Remover';
        zupt.FieldByName('IdAuto').AsInteger := IdAuto;
      end;

      zupt.fieldbyName('IdMovimiento').asInteger := 0;
      zupt.fieldbyName('IdPersonal').asInteger := IdPersonal;
      zUpt.fieldbyName('fechaMovimiento').asDateTime := Now;
      zupt.post;
      Close;
    finally
      Screen.Cursor := Cursor;
    end;
  Except
    on e: exception do
    begin
      msgbox.ShowModal('Error', pmensajeError +  ' ' + e.message, cmtError,[cmbOK]);
      PostMessage(self.handle, WM_CLOSE, 0, 0);
    end;
  end;
end;

procedure TFrmAsignaAuto.btnCancelarClick(Sender: TObject);
begin
  self.close;
end;

procedure TFrmAsignaAuto.FormCreate(Sender: TObject);
begin
  QUitar := False;
  IdAuto := -9;
end;

procedure TFrmAsignaAuto.FormShow(Sender: TObject);
var
  cursor: tCursor;
  libres: String;
begin
  try
    Cursor := Screen.Cursor;
    try
      Screen.Cursor := CrAppStart;
      Libres := 'Si';
      if Quitar then
      begin
        Self.Caption := '�Remover?';
        btnAsignar.Caption := 'Remover';
        cbbAutomoviles.Enabled := False;
        Libres := '-1';
      end;

      if not AsignarSQL(zAutomovil, 'mt_automovil',  pReadOnly) then
        raise exception.Create('No se encuentra la consulta mt_automovil');

      if not FiltrarDataset(zAutomovil, 'IdAuto,Libres', ['-1', Libres]) then
        raise exception.Create(pErrorFiltrar + ' mt_automovil');

      if zAutomovil.active then
        zAutomovil.refresh
      else
        zAutomovil.Open;


      if not AsignarSQL(zUpt, 'mt_movimientos_axp',  pUpdate) then
        raise exception.Create('No se encuentra la consulta mt_automovil');

      if not FiltrarDataset(zUpt, 'IdMovimiento', ['-9']) then
        raise exception.Create(pErrorFiltrar + ' mt_automovil');

      if zUpt.active then
        zUpt.refresh
      else
        zUpt.Open;

      zupt.append;

      if idAuto <> -9 then
      begin
        zAutomovil.Locate('IdAuto', idAuto, []);
      end
      else
        if zAutomovil.RecordCount > 0 then
          cbbAutomoviles.ItemIndex := 0;

    finally
      Screen.Cursor := Cursor;
    end;
  Except
    on e: exception do
    begin
      msgbox.ShowModal('Error', pmensajeError +  ' ' + e.message, cmtError,[cmbOK]);
      PostMessage(self.handle, WM_CLOSE, 0, 0);
    end;
  end;
end;

end.
