unit UDashboard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, uconection,
  ExtCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, cxDBData, cxContainer, Grids, DBGrids, cxDBLabel, cxLabel,
  dxGDIPlusClasses, cxImage, cxGroupBox, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxGridChartView, cxGridDBChartView, TeEngine, Series, TeeProcs, Chart,
  TeeData, DBChart, AdvChartView, DBAdvChartView, AdvChartTypeSelector,
  cxSplitter, Uni, MemDS, DBAccess, NxColumns, NxDBColumns, NxScrollControl,
  NxCustomGridControl, NxCustomGrid, NxDBGrid;

type
  ClaseHila = Class(TThread)
  private
    { Private delcarations}
    CancelarHilo: Boolean;
  protected
    Procedure Execute; Override;
    Function LeerFolios:Integer; Virtual; Abstract;
  Public
    Constructor Create;
  End;

  THilo = Class(ClaseHila)
  Protected
    Function LeerFolios:Integer;  Override;
  End;

  TFrmDashboard = class(TForm)
    zHiloFolio: tuniquery;
    dsHiloFolio: TDataSource;
    tmr1: TTimer;
    dschart: TDataSource;
    zchart: TUniQuery;
    pnl1: TPanel;
    DBAdvChartView1: TDBAdvChartView;
    cxspltr1: TcxSplitter;
    cxGboxDatos: TcxGroupBox;
    dbGridDatos: TDBGrid;
    NextDBGrid1: TNextDBGrid;
    ColPersonal: TNxDBTextColumn;
    ColFolio: TNxDBTextColumn;
    ColTipoInstalacion: TNxDBTextColumn;
    ColEstatus: TNxDBTextColumn;
    ColHora: TNxDBTextColumn;
    cxGboxTotal: TcxGroupBox;
    img4: TcxImage;
    Lbl4: TcxLabel;
    DbLblTotal: TcxDBLabel;
    Panel2: TPanel;
    Panel1: TPanel;
    cxGboxRetornadas: TcxGroupBox;
    Lbl5: TcxLabel;
    img5: TcxImage;
    DbLbl1: TcxDBLabel;
    cxGboxLiquidadas: TcxGroupBox;
    img2: TcxImage;
    Lbl1: TcxLabel;
    DbLblLiquidadas: TcxDBLabel;
    pnl3: TPanel;
    cxGboxQuejas: TcxGroupBox;
    Lbl3: TcxLabel;
    img3: TcxImage;
    DbLblQuejas: TcxDBLabel;
    cxGboxObjetadas: TcxGroupBox;
    img1: TcxImage;
    Lbl2: TcxLabel;
    DbLblObjetadas: TcxDBLabel;
    procedure zHiloFolioAfterOpen(DataSet: TDataSet);
    procedure zHiloFolioAfterRefresh(DataSet: TDataSet);
    procedure zHiloFolioBeforeOpen(DataSet: TDataSet);
    procedure zHiloFolioBeforeRefresh(DataSet: TDataSet);
    procedure tmr1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    Procedure actualizarFolios;
    procedure reconectar;

    { Public declarations }
  end;

var
  FrmDashboard: TFrmDashboard;

implementation

{$R *.dfm}

{ TForm1 }

procedure TFrmDashboard.actualizarFolios;
begin
  try
    try
      DBAdvChartView1.BeginUpdate;

      if zHiloFolio.Active then
        zHiloFolio.Refresh
      else
        zHiloFolio.Open;

      if zchart.Active then
        zchart.Refresh
      else
        zchart.Open;
      DBAdvChartView1.LoadData;
    finally
      DBAdvChartView1.EndUpdate;
    end;
  except
    on e: exception do
      ;
  end;
end;

procedure TFrmDashboard.FormShow(Sender: TObject);
begin
  actualizarFolios;
end;

procedure TFrmDashboard.reconectar;
begin
  UDMConection.reconectarConn;
end;



procedure TFrmDashboard.tmr1Timer(Sender: TObject);
var
  hiloEjecucion: THilo;
begin
  hiloEjecucion := THilo.Create;
end;

procedure TFrmDashboard.zHiloFolioAfterOpen(DataSet: TDataSet);
begin
  reconectar;
end;

procedure TFrmDashboard.zHiloFolioAfterRefresh(DataSet: TDataSet);
begin
  reconectar;
end;

procedure TFrmDashboard.zHiloFolioBeforeOpen(DataSet: TDataSet);
begin
  reconectar;
end;

procedure TFrmDashboard.zHiloFolioBeforeRefresh(DataSet: TDataSet);
begin
  reconectar;
end;

{ THilo }

function THilo.LeerFolios: Integer;
begin
  try
    FrmDashboard.actualizarFolios;
  Except
    ON E: exception do
      ;
  end;
end;

{ ClaseHila }

constructor ClaseHila.Create;
begin
  CancelarHilo := False;
  FreeOnTerminate := true;
  inherited Create(False);
end;

procedure ClaseHila.Execute;
begin
  LeerFolios;
end;

end.
