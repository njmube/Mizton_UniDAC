
unit UConection;

interface

uses
  SysUtils, Classes, ZAbstractConnection, ZConnection, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Variants, Windows, Messages, DateUtils, ImgList,
  Controls, cxGraphics, dxLayoutLookAndFeels, cxClasses, Forms, dxRibbon,
  cxStyles, cxDBEdit, StrUtils, Graphics, cxImage, dxGDIPlusClasses, ExtCtrls,
  Dialogs, cxDBLookupComboBox,  dxScreenTip, dxCustomHint, cxHint, MemDS,
  DBAccess, Uni, UniProvider, MySQLUniProvider, MemData, CRAccess, UniDacVcl;

type
  //Clase para asignar el set focus automatico
  THackHintStyle = class(TcxHintStyleController);
  THackDBTextEditDataBinging = Class(TcxDBTextEditDataBinding);
  THackWinControl = class(TWinControl);
  THackForm = class(TForm);

  TVarGlobal = Class
      sNombre: String;
      sTipo: String;
    Private
      vValor: Variant;
    Public
      function AsString: String;
      function AsInteger: Integer;
      function AsFloat: Extended;
      function AsDate: TDate;
      function AsDateTime: TDateTime;
      function AsVariant: Variant;
  End;

  TGlobales = Class
    private
      ListaGlobal: TStringList;
    public
      Constructor Create;
      Destructor Destroy;

    function Elemento(Nombre: String): TVarGlobal;
    procedure SetValue(Nombre: String; Valor: Variant);
  End;

  eWarning = class(Exception);
  eException = class(Exception);

  TUDMConection = class(TDataModule)
    dxLAFLayout: TdxLayoutLookAndFeelList;
    dxStyleForms: TdxLayoutCxLookAndFeel;
    cxStyleGrid: TcxStyleRepository;
    cxstylHeader: TcxStyle;
    cxstylContent: TcxStyle;
    cxImageIconos: TcxImageList;
    cxStyleRepository1: TcxStyleRepository;
    cxstylFocus: TcxStyle;
    cxstylError: TcxStyle;
    cxImageList1: TcxImageList;
    dxSTRValida: TdxScreenTipRepository;
    stError: TdxScreenTip;
    stWarning: TdxScreenTip;
    stInfo: TdxScreenTip;
    stCustom: TdxScreenTip;
    cxMizton32: TcxImageList;
    cxMizton16: TcxImageList;
    conBd: TUniConnection;
    mysqlProvider1: TMySQLUniProvider;
    zConsultasSQL: TUniQuery;
    zValidacion: TUniQuery;
    zVerificaExiste: TUniQuery;
    zLastID: TUniQuery;
    zAdministraID: TUniQuery;
    conAnsi: TUniConnection;
    UniConnectDialog1: TUniConnectDialog;
    cxImgListFlat16: TcxImageList;
    cxImgListFlat32: TcxImageList;
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure conBdConnectionLost(Sender: TObject; Component: TComponent;
      ConnLostCause: TConnLostCause; var RetryMode: TRetryMode);
    procedure conAnsiConnectionLost(Sender: TObject; Component: TComponent;
      ConnLostCause: TConnLostCause; var RetryMode: TRetryMode);

  private
    { Private declarations }

    procedure gBeforePost(gDataset: TDataSet);
    procedure gBeforeOpen(gDataset: TDataset);
    procedure gBeforeRefresh(gDataset: TDataSet);

    procedure SetAutoFocus(Sender: TObject; var Key: Word;
          Shift: TShiftState);
    procedure SetEnterAutoColorFocus(Sender: TObject);
    procedure setExitAutoColorFocus(Sender: TObject);
    procedure WithOutTilde(Sender: TObject; var Key: Char);
  public
    LastId: LongInt;
    procedure inicializaConAnsi;
    procedure reconectarConn;
    function CGetId(Tabla:String) :LongInt;
    function imgToStream(Img: String;var Dataset: TUniQuery): TdxSmartImage;
    function ReloadQuerys: Boolean;
    Function setSQL(var Dataset: TUniQuery; QueryName: String; Option: string): Boolean;overload;
    Function setSQL(var Dataset: TUniQuery; QueryName: String; Option: string; Codificacion: String): Boolean;Overload;
    function setParams(var Dataset: TUniQuery; params: string; Values: array of Variant): Boolean;
    function DateToSqlFormat(vDate: TDate): string;
    Function getLastId: Integer;
    Function DeleteReg(Var Data: TUniQuery; Valor:String = 'No'): Boolean;
    Function ExistInTable(Table: String; Fields, Values: String; var Reactivado: Boolean): Integer;
    Function AutoFill(gDataset: TUniQuery): Boolean;

    { Public declarations }
  protected

  end;

var
  UDMConection: TUDMConection;
  varGlobal: TGlobales;
const

  pReadOnly: string = 'READONLY';
  pUpdate: string = 'UPDATE';
  pMensajeError: String = 'Ha ocurrido un error, informe a su administrador de sistema de lo siguiente: ';
  pErrorConsulta: string = 'No se ha encontrado la consulta SQL en la base de datos ';
  pErrorFiltrar: string = 'Error al filtrar en la consulta SQL ';
  pANSI: String = 'ANSI';

  procedure reconectar;
  Procedure LeerPermisos(FormName: String; Var insert:Boolean; var Edit:Boolean; var Delete:Boolean);
  procedure AplicarTema(var Ventana: TForm);
  Function GetUltimoId: Integer;
  function AsignarSQL(var Dataset: TUniQuery; QueryName: String; Option: string): Boolean;Overload;
  function AsignarSQL(var Dataset: TUniQuery; QueryName: String; Option: string; Codificacion: String): Boolean;Overload;
  function FiltrarDataset(var Dataset: TUniQuery; params: string; Values: array of Variant): Boolean;
  function RecargarConsultasSQL: Boolean;
  function fechaSQL(Fecha: TDate): string;
  function UltimaPK: Integer;
  function imagenAStream(Img: String; var Dataset: TUniQuery): TdxSmartImage;
  procedure AutoFocus(var Form: TForm);
  procedure LlamarSubForm(clase: TComponentClass; formulario: TForm; var Dataset: TUniQuery; var DatasetUpt: TUniQuery; Campo: String; QuitarModal: Boolean = False);
  function encriptar(aStr: String; aKey: Integer): String;
  function desencriptar(aStr: String; aKey: Integer): String;
  function EnDeCrypt(const Value, Key : String) : String;
  Function BorrarRegistro(var Data: TUniQuery): Boolean;
  Function VerificarExiste(tabla: string; Campos, Valores: String; Var Reactivado: Boolean): Integer;
  Function CreateDialog(Var Dialog, FrmPadre: TForm; Var pnl: TPanel; Caption: String): Integer;
  function CantidadALetra(Valor: Real; Prefijo: String; Sufijo: String; NumDec: Integer): String;
implementation

{$R *.dfm}

Uses
  UFrmInicio, UMsgBox;
{ TDataModule2 }

function TUDMConection.DeleteReg(Var Data: TUniQuery; Valor:String = 'No'): Boolean;
var
  QueryName: string;
  FieldName: string;
begin
  try
    Result := False;
    FieldName := 'Activo';
    QueryName := TCRFieldDesc(data.GetFieldDesc(data.Fields[0].FieldNo)).TableInfo.TableName;
    //QueryName := String(Data.Properties.Objects[0]);   //getTableName
    if zValidacion.Active and (zValidacion.RecordCount > 0) then
    begin //En caso de encontrar el campo activo, el sistema tomar� la decisi�n de hacer un borrado l�gico
      if zValidacion.Locate('TABLE_NAME;COLUMN_NAME', VarArrayOf([QueryName, FieldName]), []) then
      begin
        Data.Edit;
        Data.FieldByName(FieldName).AsString := Valor;
        Data.Post;
      end
      else // Caso contrario, procede a hacer un borrado f�sico.
      begin
        Data.Delete;
      end;
      Result := True;
    end;
  except
    raise;
  end;
end;

function TUDMConection.ExistInTable(Table: string; Fields, Values: String; var Reactivado: Boolean): Integer;
var
  SQL: string;
  Where: string;
  Cond: string;
  Cad: string;
  CamposSQL, QueryName, FieldName: string;
  LocMostrar: string;
  ListaPar, ListaCampos: TStringList;
  i, PosField,PosIni, ctaChar: Integer;
  zTemp: TUniQuery;
  Cancelado: Boolean;
begin
  Try
    Cancelado := False;
    ListaPar := TStringList.Create;
    ListaCampos := TStringList.Create;
    SQL := 'Select Count(*) as Cont From ' + Table;
    Where := ' Where ';

    ListaPar.Delimiter := ',';
    ListaPar.QuoteChar := '#';
    ListaPar.DelimitedText := Values;

    i := 0;
    PosIni := 0;
    PosField := 0;
    CtaChar := -1;
    CamposSQL := '';
    while i < Length(Fields) do
    begin
      If (i = Length(Fields) -1 ) then
      begin
        Cad := Copy(Fields ,posIni, i);

        if Cad[Length(Cad)] = ')' then
        begin
          Cond := Cond + Copy(Cad , 0, Length(Cad)-1) + ' = ' + QuotedStr(ListaPar[PosField]) + ')';
          CamposSQL := CamposSQL + Copy(Cad , 0, Length(Cad)-1);
        end
        else
        begin
          Cond := Cond + Cad + ' = ' + QuotedStr(ListaPar[PosField]) + ';';
          CamposSQL := camposSQL + Cad;
        end;
      end;

      if (Fields[i] = '&') or (Fields[i] = '|') or (Fields[i] = ')')   then
      begin
        Cad := Copy(Fields ,posIni, ctaChar);
        PosIni := i + 1;

        case Fields[i] of
          '&':
          begin
            Cond := Cond + Cad + ' and ';
            CamposSQL := CamposSQL + Cad + ',';
           // Inc(PosField);
          end;
          '|':
          begin
            Cond := Cond + Cad + ' = ' + QuotedStr(ListaPar[PosField-1]) + ' or ';
            CamposSQL := CamposSQL + Cad + ',';
            Inc(PosField);
          end;
           ')':
          begin
            Cond := Cond + Copy(Cad , 0, Length(Cad)) + ' = '+ QuotedStr(ListaPar[PosField]) +  ')';
            CamposSQL := CamposSQL + Copy(Cad , 0, Length(Cad));
            Inc(PosField);
          end;
        end;
        CtaChar := -1;
      end;
      inc(ctaChar);
      Inc(i);
    end;

    Cond := StringReplace(Cond, '~', ' NOT',[rfReplaceAll, rfIgnoreCase]);
    CamposSQL := StringReplace(CamposSQL, '~', '',[rfReplaceAll, rfIgnoreCase]);
    CamposSQL := StringReplace(CamposSQL, '(', '',[rfReplaceAll, rfIgnoreCase]);
    CamposSQL := StringReplace(CamposSQL, ')', '',[rfReplaceAll, rfIgnoreCase]);

    //Verificar si esta tabla contiene el campo activo
    //En caso de tenerlo lo asignamos a la columna de la consulta
    if zValidacion.Locate('TABLE_NAME;COLUMN_NAME', VarArrayOf([Table, 'Activo']), []) then
      SQL := 'Select Count(*) as Cont,' + CamposSQL + ',Activo From ' + Table
    else
      SQL := 'Select Count(*) as Cont,' + CamposSQL + ' From ' + Table;


    Sql := Sql + Where + Cond;

    zVerificaExiste.Active := False;
    zVerificaExiste.SQL.Text := SQL;
    zVerificaExiste.BeforeOpen := gBeforeOpen;
    zVerificaExiste.BeforeRefresh := gBeforeRefresh;
    zVerificaExiste.open;

    Result := zVerificaExiste.FieldByName('Cont').AsInteger;

    ListaCampos.Delimiter := ',';
    ListaCampos.DelimitedText := CamposSQL;

    //Funcion de reactivar registro
    if zVerificaExiste.FieldByName('Cont').AsInteger > 0 then
    try
      zTemp := TUniQuery.Create(nil);
      FieldName := 'Activo';
      QueryName := Table;
      if zValidacion.Active and (zValidacion.RecordCount > 0) then
      begin
        if zValidacion.Locate('TABLE_NAME;COLUMN_NAME', VarArrayOf([QueryName, FieldName]), []) then
        begin
          //Solo aceptar los que estan en activo no
          if (UPPERCASE(zVerificaExiste.FieldByName('Activo').AsString) = 'NO')  then
            If (MsgBox.ShowModal('Confirmar acci�n.', 'El registro que deseas dar de alta se encuentra desactivado, �Deseas reactivarlo?', cmtConfirmation, [cMbReactivate, cmbNo]) = mrYes) then
            begin
              zTemp.Connection := conBD;
              zTemp.SQL.Text := 'UPDATE ' + QueryName + ' SET Activo = ' + QuotedStr('Si') + ' Where ' + Cond;
              zTemp.BeforeOpen := gBeforeOpen;
              zTemp.BeforeRefresh := gBeforeRefresh;
              zTemp.ExecSQL;
              Reactivado := True;
            end else Cancelado := True;
        end
      end;
    finally
      zTemp.Free;
    end;

    If Cancelado then raise eWarning.Create('***');

    if not Reactivado then
    begin
      i := 0;
      while i < ListaPar.count do
      begin
        If zVerificaExiste.Locate(ListaCampos[i],ListaPar[i], [loCaseInsensitive]) then
          LocMostrar := LocMostrar + ListaCampos[i] + ' = ' + ListaPar[i] + ' ';
        Inc(i);
      end;

      if  zVerificaExiste.FieldByName('Cont').AsInteger > 0  then
        raise eWarning.Create('El registro que intentas dar de alta con ' + LocMostrar + ' ya se encuentra registrado en la base de datos.');
    end;
  except
    raise;
    Result := 0;
  End;
end;

function TUDMConection.AutoFill(gDataset: TUniQuery): Boolean;
var
  TableName: string;
begin
  try
    if zValidacion.Active then
    begin
      TableName := TCRFieldDesc(gDataSet.GetFieldDesc(gDataSet.Fields[0].FieldNo)).TableInfo.TableName;
      //TableName:= string(gDataset.Properties.Objects[0]);  getTableName
      zValidacion.Filtered := False;
      zValidacion.Filter := 'TABLE_NAME = ' + QuotedStr(TableName);
      zValidacion.Filtered := True;

      zValidacion.First;
      while Not zValidacion.Eof do
      begin
        if gDataset.Fields.FindField(zValidacion.FieldByName('COLUMN_NAME').AsString) <> Nil then
        begin
          if gDataset.State in [dsInsert] then
          begin
            if gDataset.FieldByName(zValidacion.FieldByName('COLUMN_NAME').AsString).IsNull then
            begin
              if zValidacion.FieldByName('DATA_TYPE').AsString = 'datetime' then
              begin
                gDataset.FieldByName(zValidacion.FieldByName('COLUMN_NAME').AsString).AsDateTime := Now;
              end
              else
              begin
                gDataset.FieldByName(zValidacion.FieldByName('COLUMN_NAME').AsString).AsVariant := zValidacion.FieldByName('COLUMN_DEFAULT').AsVariant;
              end;
            end;
          end;
        end;

        zValidacion.Next;
      end;
    end;
  finally
    zValidacion.Filtered := False;
  end;
end;

function TUDMConection.CGetId(Tabla:String): LongInt;
begin
  Try
    zLastId.Active :=False;
    zLastId.SQL.Text := 'SELECT AUTO_INCREMENT FROM information_schema.TABLES  ' +
                        ' WHERE TABLE_SCHEMA = :Db' +
                        ' AND TABLE_NAME = :Tabla' ;
    zLastId.ParamByName('Tabla').AsString := Tabla;
    zLastId.ParamByName('Db').AsString := conBD.Database;
    zLastId.BeforeOpen := gBeforeOpen;
    zLastId.BeforeRefresh := gBeforeRefresh;
    zLastId.Open;
   if (zLastId.RecordCount > 0) then
     Result :=zLastId.FieldByName('AUTO_INCREMENT').AsInteger
   else
     Result := -1;
  except
    on e:exception do
    begin
      raise Exception.Create('No se pudo obtener el Id de la tabla: '+Tabla+' debido al siguiente error: ' + e.Message);
    end;
  End;
end;

procedure TUDMConection.conAnsiConnectionLost(Sender: TObject;
  Component: TComponent; ConnLostCause: TConnLostCause;
  var RetryMode: TRetryMode);
begin
  RetryMode := rmReconnectExecute;
end;

procedure TUDMConection.conBdConnectionLost(Sender: TObject;
  Component: TComponent; ConnLostCause: TConnLostCause;
  var RetryMode: TRetryMode);
begin
  RetryMode := rmReconnectExecute;
end;



procedure TUDMConection.DataModuleCreate(Sender: TObject);
begin
  //ReloadQuerys;
end;

procedure TUDMConection.DataModuleDestroy(Sender: TObject);
begin
  if conBD.Connected then
    conBD.Disconnect;
end;

function TUDMConection.DateToSqlFormat(vDate: TDate): string;
begin
  Result := IntToStr(YearOf(vDate)) + '-' + IntToStr(MonthOf(vDate)) + '-' + IntToStr(DayOf(vDate));
end;

function TUDMConection.ReloadQuerys: Boolean;
begin
  try
    Result := False;
    zConsultasSQL.Active := False;
    zConsultasSQL.SQL.Text := 'Select * from master_consultassql';
    zConsultasSQL.BeforeOpen := gBeforeOpen;
    zConsultasSQL.BeforeRefresh := gBeforeRefresh;
    zConsultasSQL.Open;

    zValidacion.Active := False;
    zValidacion.ParamByName('pBd').AsString := conBD.Database;
    zConsultasSQL.BeforeOpen := gBeforeOpen;
    zConsultasSQL.BeforeRefresh := gBeforeRefresh;
    zValidacion.Open;

    Result := True;
  except
    on e: Exception do
    begin
      raise Exception.Create('No se pudo recargar el conjunto de consultas SQL debido al siguiente error:  ' + e.Message);
    end;
  end;
end;

procedure TUDMConection.SetEnterAutoColorFocus(Sender: TObject);
begin
  THackWinControl(sender).Color := UDMConection.cxstylFocus.Color;
end;

procedure TUDMConection.setExitAutoColorFocus(Sender: TObject);
begin
  THackWinControl(sender).Color := clWindow;
end;

function TUDMConection.setParams(var Dataset: TUniQuery; params: string;
  Values: array of Variant): Boolean;
var
  i,j: Integer;
  ParamList: TStringList;
begin
  try
    Result := False;

    ParamList := TStringList.Create;
    ParamList.Delimiter := ',';
    ParamList.DelimitedText := params;

    if (Length(Trim(Dataset.SQL.Text)) <> 0) and (Dataset.Params.Count > 0) then
    begin
      //Inicializar todos los par�metros con -1
      for i := 0 to Dataset.Params.Count - 1 do
      begin
        //Dataset.Params.FindParam(Dataset.Params.Items[i].Name)
//        for j := 0 to ParamList.Count-1 do
//        begin

//          if Dataset.Params.Items[i].Name = ParamList[j]  then
//            Dataset.ParamByName(Dataset.Params.Items[i].Name).AsString := Values[j]
//          else

//            Dataset.ParamByName(Dataset.Params.Items[i].Name).AsString := '-1';
//        end;
        Dataset.ParamByName(Dataset.Params.Items[i].Name).AsString := '-1';
      end;

      for j := 0 to ParamList.Count-1 do
        begin
          //if Not Dataset.Params.FindParam(ParamList[j]).IsNull then
            Dataset.ParamByName(Dataset.Params.FindParam(ParamList[j]).Name).AsString := Values[j];
        end;
    end;
    Result := True;
  except
    raise;
  end;
end;

function TUDMConection.setSQL(var Dataset: TUniQuery; QueryName, Option, Codificacion: String): Boolean;
begin
  try
    Result := False;
    if Not Assigned(Dataset) then
      raise Exception.Create('El componente no se encuentra creado.');

    if (Not zConsultasSQL.Active) then
      ReloadQuerys;

    if (Not zConsultasSQL.Active) or (zConsultasSQL.Active and (zConsultasSQL.RecordCount = 0)) then
      raise Exception.Create('No se encuentra consultas SQL definidas dentro de la tabla master_ConsultasSql');

    if zConsultasSQL.Locate('NombreConsulta;Tipo', varArrayOf([QueryName,Option]), []) then
    begin
      if Dataset.Active then
        Dataset.Close;


      QueryName := TCRFieldDesc(Dataset.GetFieldDesc(Dataset.Fields[0].FieldNo)).TableInfo.TableName;
      {if Dataset.Properties.Count > 0 then
        Dataset.Properties.Delete(0);

      Dataset.Properties.AddObject(QueryName, TObject(QueryName));}//gettablename
      Dataset.SQL.Text := zConsultasSQL.FieldByName('SQL').AsString;

      if Codificacion = pANSI then
        Dataset.Connection := conANSI
      else
        Dataset.Connection := conBD;

      //En caso de ser tipo update le asignar� el procedimiento Befores post
      //Para manejar el autoincrementable
      if Option = pUpdate then
        Dataset.BeforePost := gBeforePost
      else If Option = pUpdate then
      begin
        Dataset.BeforePost := nil;
        Dataset.ReadOnly := True;
      end;
      Dataset.BeforeOpen := gBeforeOpen;
      Dataset.BeforeRefresh := gBeforeRefresh;

      Result := True;
    end;
  except
    raise; //Que el programador lo atrape y haga lo que se le antoje
  end;
end;

procedure TUDMConection.WithOutTilde(Sender: TObject; var Key: Char);
var
  Component: TWinControl;
begin
  if StrScan('����������""!@#$%^&*()_+-=][}{;:/?.>,<\|~�`� '+#39+#128+#129+#130+#131+#132+#133+#134+#135+#136+#137+#138+#139+#140+#141+#142+#143+#144+#145+#146+#147+#148+#149+#150+#151+#152+#153+#154+#155+#156+#157+#158+#159+#160+#161+#162+#163+#164+#165+#166+#167+#168+#169+#170+#171+#172+#173+#174+#175+#176+#177+#178+#179+#180+#181+#182+#183+#184+#185+#186+#187+#188+#189+#190+#191+#192+#193+#194+#195+#196+#197+#198+#199+#200+#201+#202+#203+#204+#205+#206+#207+#208+#209+#210+#211+#212+#213+#214+#215+#216+#217+#218+#219+#220+#221+#222+#223+#224+#225+#226+#227+#228+#229+#230+#231+#232+#233+#234+#235+#236+#237+#238+#239+#240+#241+#242+#243+#244+#245+#246+#247+#248+#249+#250+#251+#252+#253+#254+#255, (Key))<>nil then
    Key:=#0;
end;

procedure TUDMConection.gBeforeOpen(gDataset: TDataset);
begin
  reconectarConn;
end;

procedure TUDMConection.gBeforePost(gDataset: TDataSet);
var
  zMaxId: TUniQuery;
  QueryName, FieldName: string;
  I: Integer;
begin
  try
    reconectarConn;
    //Aqui tiene que validar a huevos sea inserci�n o edici�n
    if zValidacion.Active and (zValidacion.RecordCount > 0) then
    begin
      i := 0;
      QueryName := TCRFieldDesc(TUniQuery(gDataset).GetFieldDesc(gDataset.Fields[0].FieldNo)).TableInfo.TableName;
      //QueryName := String(TUniQuery(gDataset).Properties.Objects[0]);   getTableName
      while i < gDataset.FieldCount do
      begin
        FieldName := gDataset.Fields.Fields[i].FieldName;
        if (UpperCase(FieldName) <> 'ACTIVO') and zValidacion.Locate('TABLE_NAME;COLUMN_NAME', VarArrayOf([QueryName, FieldName]), []) and  ((gDataset.FieldByName(FieldName).IsNull) or (Length(Trim(gDataset.FieldByName(FieldName).asString))= 0)) then
        begin
          if Length(Trim(zValidacion.FieldByName('COLUMN_COMMENT').AsString)) = 0 then
            raise eWarning.Create('Mensaje de autovalidaci�n no establecido para el campo [' + zValidacion.FieldByName('TABLE_NAME').AsString + '.' + zValidacion.FieldByName('COLUMN_NAME').AsString + ']')
          else
            raise eWarning.Create(zValidacion.FieldByName('COLUMN_COMMENT').AsString);
        end;
        inc(i);
      end;
    end;

    if TUniQuery(gDataset).State = dsInsert then
    begin
      LastId := -1;
      QueryName := TCRFieldDesc(TUniQuery(gDataset).GetFieldDesc(TUniQuery(gDataset).Fields[0].FieldNo)).TableInfo.TableName;
      //QueryName := String(TUniQuery(gDataset) .Objects[0]);  //gettablename

      LastId := CGetId(QueryName);
    end;
  except
    raise;
  end;
end;

procedure TUDMConection.gBeforeRefresh(gDataset: TDataSet);
begin
  reconectarConn;
end;

function TUDMConection.getLastId: Integer;
begin
  try
    zAdministraID.Close;
    zAdministraID.Open;
    Result := zAdministraID.FieldByName('inc').AsInteger;
  Except
    raise;
  end;
end;

function TUDMConection.imgToStream(Img: String; var Dataset: TUniQuery): TdxSmartImage;
var
  field: TBlobField;
  Stream: TStream;
  smartImg: TdxSmartImage;
begin
  try
    if (Length(Trim(img)) > 0) and Not Dataset.FieldByName(img).IsNull then
    begin
      try
        smartImg := TdxSmartImage.Create;
        Stream := Dataset.CreateBlobStream(Dataset.FieldByName(img), bmRead);
        smartImg.LoadFromStream(Stream);
        Result := smartImg;
      finally
        Stream.Destroy;
      end;
    end
    else
      Result := nil;
  except
    raise;
  end;
end;

procedure TUDMConection.inicializaConAnsi;
begin
  with conANSI do
  begin
    ProviderName := conbd.ProviderName;
    Server := conBd.server;
    Port := Conbd.Port;
    Database := Conbd.Database;
    UserName := conbd.UserName;
    Password := conbd.Password;
    Connect;
  end;
end;

procedure TUDMConection.reconectarConn;
begin
  try
    conBd.Ping;
  except
    on E: Exception do
    begin
      MsgBox.ShowModal('Auto recuperaci�n de conexi�n al servidor.','Ha ocurrido un error con el conector de datos, para intentar reconectarte presiona [Reconfigurar]', cmtConection, [cMbReconfig]);
      //if MsgBox.ShowModal('�Reconectar?', '�Reconectar?', cmtInformation, [cMbYes, cmbNo]) = mrYes then
      //begin
        try
          conBd.Disconnect;
        except
          ;
        end;
        try
          conBd.close;
        except
          ;
        end;
        try
          conBd.Connect;
        except
          on e:exception do
            ShowMessage(e.Message);
        end;
      //end;
    end;
  end;
end;

function TUDMConection.setSQL(var Dataset: TUniQuery; QueryName, Option: string): Boolean;
begin
  try
    Result := False;
    if Not Assigned(Dataset) then
      raise Exception.Create('El componente no se encuentra creado.');

    if (Not zConsultasSQL.Active) then
      ReloadQuerys;

    if (Not zConsultasSQL.Active) or (zConsultasSQL.Active and (zConsultasSQL.RecordCount = 0)) then
      raise Exception.Create('No se encuentra consultas SQL definidas dentro de la tabla master_ConsultasSql');

    if zConsultasSQL.Locate('NombreConsulta;Tipo', varArrayOf([QueryName,Option]), []) then
    begin
      if Dataset.Active then
        Dataset.Close;


      {
      if Dataset.Properties.Count > 0 then
        Dataset.Properties.Delete(0);

      Dataset.Properties.AddObject(QueryName, TObject(QueryName));} //getTableName
      //TCRFieldDesc(TUniQuery(Dataset).GetFieldDesc(TUniQuery(Dataset).Fields[0].FieldNo)).TableInfo.TableName;
      Dataset.SQL.Text := zConsultasSQL.FieldByName('SQL').AsString;
      Dataset.Connection := conBD;
      //En caso de ser tipo update le asignar� el procedimiento Befores post
      //Para manejar el autoincrementable
      if Option = pUpdate then
        Dataset.BeforePost := gBeforePost
      else If Option = pUpdate then
      begin
        Dataset.BeforePost := nil;
        Dataset.ReadOnly := True;
      end;

      Dataset.BeforeOpen := gBeforeOpen;
      Dataset.BeforeRefresh := gBeforeRefresh;

      Result := True;
    end;
  except
    raise; //Que el programador lo atrape y haga lo que se le antoje
  end;
end;

function AsignarSQL(var Dataset: TUniQuery; QueryName: String; Option: string): Boolean;
begin
  Result := UDMConection.setSQL(Dataset,QueryName,Option);
end;

function AsignarSQL(var Dataset: TUniQuery; QueryName: String; Option: string; Codificacion: String): Boolean;
begin
  Result := UDMConection.setSQL(Dataset,QueryName,Option,codificacion);
end;

function FiltrarDataset(var Dataset: TUniQuery; params: string; Values: array of Variant): Boolean;
begin
  Result := UDMConection.setParams(Dataset,params,Values);
end;

function RecargarConsultasSQL: Boolean;
begin
  try
    Result := UDMConection.ReloadQuerys;
  except
    raise;
  end;
end;


function TVarGlobal.AsString: String;
begin
  if vValor = Null then
    Result := ''
  else
    Result := vValor;
end;

function TVarGlobal.AsInteger: Integer;
begin
  if vValor = Null then
    Result := 0
  else
    Try
      Result := vValor;
    Except
      Result := 0;
    End;
end;

function TVarGlobal.AsFloat: Extended;
begin
  if vValor = Null then
    Result := 0
  else
    Try
      Result := vValor;
    Except
      Result := 0;
    End;
end;

function TVarGlobal.AsDate: TDate;
begin
  if vValor = Null then
    Result := 0
  else
    Try
      Result := Trunc(vValor);
    Except
      Result := 0;
    End;
end;

function TVarGlobal.AsDateTime: TDateTime;
begin
  if vValor = Null then
    Result := 0
  else
    Try
      Result := vValor;
    Except
      Result := 0;
    End;
end;

function TVarGlobal.AsVariant: Variant;
begin
  Result := vValor;
end;

function ObtenerElemento(Numero: Integer; Cadena: String): String;
var
  Cuenta, Cta: Integer;
  Found: Boolean;
  Valor, Resultado: String;
begin
  Cuenta := 0;
  Valor := '';
  Cta := 0;
  Cadena := Cadena + '|';
  Resultado := '';
  Found := False;
  while (Cuenta < Length(Cadena)) and Not Found do
  begin
    Inc(Cuenta);
    if Cadena[Cuenta] = '|' then
    begin
      inc(Cta);
      if Cta = Numero then
      begin
        Found := True;
        Resultado := Valor;
      end
      else
        Valor := '';
    end
    else
      Valor := Valor + Cadena[Cuenta];
  end;
  Result := Resultado;
end;

constructor TGlobales.Create;
begin
  ListaGlobal := TStringList.Create;
  ListaGlobal.Clear;
end;

destructor TGlobales.Destroy;
begin
  ListaGlobal.Free;
end;

function TGlobales.Elemento(Nombre: string): TVarGlobal;
var
  Indice: Integer;
  Variable: String;
  Elem: TVarGlobal;
begin
  Indice := ListaGlobal.IndexOf(Nombre);
  if Indice >= 0 then
  begin
    if ((TVarGlobal(ListaGlobal.Objects[Indice]).sTipo = 'INTEGER') or
        (TVarGlobal(ListaGlobal.Objects[Indice]).sTipo = 'FLOAT')) and (String(TVarGlobal(ListaGlobal.Objects[Indice]).vValor) = '') then
      TVarGlobal(ListaGlobal.Objects[Indice]).vValor := 0;

    Result := TVarGlobal(ListaGlobal.Objects[Indice]);
  end
  else
  begin
      Elem := TVarGlobal.Create;
      if Variable <> '' then
      begin
        // Descomponer la variable en sus elementos basicos
        Elem.sNombre := ObtenerElemento(1, Variable);
        Elem.sTipo   := ObtenerElemento(2, Variable);
        Elem.vValor  := ObtenerElemento(2, Variable);
        varGlobal.ListaGlobal.AddObject(ObtenerElemento(1, Variable), Elem);
      end
      else
      begin
        // Descomponer la variable en sus elementos basicos
        Elem.sNombre := '';
        Elem.sTipo   := '';
        Elem.vValor  := '';
      end;
    Result := Elem;
  end;
end;

procedure TGlobales.SetValue(Nombre: String; Valor: Variant);
var
  Indice: Integer;
begin
  // Modificar el valor de la variable de memoria especificada
  Indice := ListaGlobal.IndexOf(Nombre);
  if Indice < 0 then
  begin
    ListaGlobal.AddObject(Nombre, TVarGlobal.Create);
    Indice := ListaGlobal.IndexOf(Nombre);
  end;
  TVarGlobal(ListaGlobal.Objects[Indice]).vValor := Valor;
end;

function fechaSQL(Fecha: TDate): string;
begin
  Result := UDMConection.DateToSqlFormat(Fecha);
end;

function UltimaPK: Integer;
begin
  Result := UDMConection.LastId;
end;

procedure AplicarTema(var Ventana: TForm);
var
  i: Integer;
begin
  try
    if Assigned(FrmInicio) then
    begin
      i := 0;
      while i < Ventana.ComponentCount do
      begin
        If Ventana.Components[i].ClassType = TdxRibbon then
        begin
          TdxRibbon(Ventana.Components[i]).ColorSchemeName := FrmInicio.dxSkinController1.SkinName;
          Break;
        end;
        Inc(i);
      end;
    end;
  Except
    raise;
  end;
end;

Function GetUltimoId: Integer;
begin
  Result := UDMConection.getLastId;
end;

procedure TUDMConection.SetAutoFocus(Sender: TObject; var Key: Word;
          Shift: TShiftState);
var
  ParentClass: TWinControl;
begin
  ParentClass := TControl(Sender).Parent;

  while not (ParentClass is TForm) do
    ParentClass := ParentClass.Parent;

  if (key = VK_RETURN) or (key = VK_DOWN) then
    THackForm(ParentClass).SelectNext(TForm(ParentClass).ActiveControl as TWinControl, True, True);

  if Key = VK_UP then
    THackForm(ParentClass).SelectNext(TForm(ParentClass).ActiveControl as TWinControl, False, True);
end;

procedure AutoFocus(var Form: TForm);
var
 i, j : Integer;
 st,cn,DataField, DataSetName, TableName: string;
 ct: TClass;
 chintStyle: TcxCustomHintStyle ;
 Item: TdxScreenTipLink;
begin
  //Para que el autofocus funciones los componentes deben tener -1 en el tag
  i:=0;
  while i < Form.ComponentCount do
  begin
    //Focus
    if Form.Components[i].tag = -1 then
      THackWinControl(Form.Components[i]).onKeyDown := UDMConection.SetAutoFocus; //Esta madre la mand� al FrmInicio

    //Focus sin aceptar acentos
    if Form.Components[i].Tag = -2 then
    begin
      THackWinControl(Form.Components[i]).onKeyDown := UDMConection.SetAutoFocus;
      THackWinControl(Form.Components[i]).OnKeyPress := UDMConection.WithOutTilde;
    end;

    if Form.Components[i].Tag < 0  then
    begin
      THackWinControl(Form.Components[i]).OnEnter := UDMConection.SetEnterAutoColorFocus;
      THackWinControl(Form.Components[i]).OnExit := UDMConection.setExitAutoColorFocus;
    end;

    try
      if Form.Components[i].tag = -1 then
      begin
        cn := form.findComponent(Form.Components[i].name).ClassName;
        case  AnsiIndexStr(cn,['TcxDBTextEdit', 'TcxDBSpinEdit', 'TcxDBMaskEdit', 'TcxDBImage', 'TcxDBHyperLinkEdit', 'TcxDBMemo',
              'TcxDBCurrencyEdit', 'TcxDBComboBox', 'TcxDBMemo', 'TcxDBLookupComboBox', 'TcxDBDateEdit']) of
          0:
          begin
            DataField := TcxDBTextEdit(form.findComponent(Form.Components[i].name)).DataBinding.DataField;
            TableName := TCRFieldDesc(TUniQuery((TcxDBTextEdit(form.findComponent(Form.Components[i].name)).DataBinding.DataSource.DataSet)).GetFieldDesc(TUniQuery(TZQuery(TcxDBTextEdit(form.findComponent(Form.Components[i].name)).DataBinding.DataSource.DataSet)).Fields[0].FieldNo)).TableInfo.TableName;
            //TableName := String(TZQuery(TcxDBTextEdit(form.findComponent(Form.Components[i].name)).DataBinding.DataSource.DataSet).Properties.Objects[0]);;  //getTableName
          end;
          1: DataField := TcxDBSpinEdit(form.findComponent(Form.Components[i].name)).DataBinding.DataField;
          2: DataField := TcxDBMaskEdit(form.findComponent(Form.Components[i].name)).DataBinding.DataField;
          3: DataField := TcxDBImage(form.findComponent(Form.Components[i].name)).DataBinding.DataField;
          4: DataField := TcxDBHyperLinkEdit(form.findComponent(Form.Components[i].name)).DataBinding.DataField;
          5: DataField := TcxDBCurrencyEdit(form.findComponent(Form.Components[i].name)).DataBinding.DataField;
          6: DataField := TcxDBComboBox(form.findComponent(Form.Components[i].name)).DataBinding.DataField;
          7: DataField := TcxDBMemo(form.findComponent(Form.Components[i].name)).DataBinding.DataField;
          8: DataField := TcxDBLookupComboBox(form.findComponent(Form.Components[i].name)).DataBinding.DataField;
          9: DataField := TcxDBDateEdit(form.findComponent(Form.Components[i].name)).DataBinding.DataField;
        end;

//        if UDMConection.zValidacion.Active and (UDMConection.zValidacion.Locate('TABLE_NAME;COLUMN_NAME', VarArrayOf([TableName, DataField]), [])) then
//          if True then
//          begin
//            j:=0;
//            while j < Form.ComponentCount do
//            begin
//              if form.findComponent(Form.Components[j].name).ClassNameIs('TcxHintStyleController') then
//              begin
//                chintStyle := (TcxHintStyleController(form.findComponent(Form.Components[j].name)).HintStyle);
//                Item := TdxScreenTipLinks(TdxScreenTipStyle(TcxHintStyleController(form.findComponent(Form.Components[j].name)).HintStyle)).Add;
//                Item.Control := TControl(form.findComponent(Form.Components[j].name));
//                Item.ScreenTip := UDMConection.stError;
//                Break;
//              end;
//              Inc(j);
//            end;
//          end;
      end;
    except
      ;
    end;
    inc(i);
  end;
end;

function imagenAStream(Img: String; var Dataset: TUniQuery): TdxSmartImage;
begin
  Result := UDMConection.imgToStream(img,Dataset);
end;

procedure LlamarSubForm(clase: TComponentClass; formulario: TForm; var Dataset: TUniQuery; var DatasetUpt: TUniQuery; Campo: String; QuitarModal: Boolean = False);
var Cursor: TCursor;
begin
  Cursor := Screen.Cursor;
  try
    Screen.Cursor := crAppStart;

    if not QuitarModal then
      Application.CreateForm(clase, formulario);

    formulario.FormStyle := fsNormal;
    formulario.Tag := 1111;

    if formulario.FormStyle = fsMDIChild then
    begin
      formulario.FormStyle := fsNormal;
      formulario.Show;
    end
    else
      formulario.ShowModal;
  finally
    if formulario.Tag = 1112 then
    begin
      if Dataset.Active then
      begin
        Dataset.Refresh;
        if DatasetUpt.Active and (DatasetUpt.State in [dsInsert, dsEdit]) then
        begin
          Dataset.Last;
          DatasetUpt.FieldByName(Campo).AsVariant := Dataset.FieldByName(Campo).AsVariant;
        end;
      end;
    end;

    formulario.Tag := 0;
    Screen.Cursor := Cursor;
  end;
end;

//encriptar datos
function encriptar(aStr: String; aKey: Integer): String;
begin
  Result:='';
  RandSeed:=aKey;
  for aKey:=1 to Length(aStr) do
    //Result:=Result+AnsiChar(ord(aStr[aKey]) xor (random(254)+1));
     Result:=Result+Chr(Byte(aStr[aKey]) xor random(256));
end;

//desencriptar datos
function desencriptar(aStr: String; aKey: Integer): String;
begin
  Result:='';
  RandSeed:=aKey;
  for aKey:=1 to Length(aStr) do
  //    Result:=Result+AnsiChar(ord(aStr[aKey]) xor (random(254)+1));
  Result:=Result+Chr(Byte(aStr[aKey]) xor random(256));
end;

function EnDeCrypt(const Value, Key : String) : String;
var
   i : Integer;
   KeyAlt : Integer;

begin
   KeyAlt := Length(Key);
   for i := 1 to Length(Key) do
      KeyAlt := KeyAlt xor Ord(Key[i]);

   Result := Value;
   for i := 1 to Length(Value) do
   begin
      Result[i] := chr(not(ord(Value[i]) xor Ord(KeyAlt)));
   end
end;

Function BorrarRegistro(var Data: TUniQuery): Boolean;
begin
  UDMConection.DeleteReg(Data);
end;

Function VerificarExiste(tabla: string; Campos, Valores: String;var Reactivado: Boolean): Integer;
begin
  Result := UDMConection.ExistInTable(tabla, Campos, Valores, Reactivado);
end;

Function CreateDialog(Var Dialog, FrmPadre: TForm; Var pnl: TPanel; Caption: String): Integer;
var
  oldWidth, OldHeight: Integer;
  OldAlign: TAlign;
  OldParent: TWinControl;
begin
  try
    OldAlign := pnl.Align;
    oldWidth := pnl.Width;
    OldHeight := pnl.Height;
    OldParent := pnl.Parent;

    if not Assigned(Dialog) then
      Dialog := TForm.Create(OldParent);

    with Dialog do
    begin
      FormStyle := fsNormal;
      BorderStyle := bsDialog;
      Position := poScreenCenter;
      Dialog.Caption := Caption;
      Width := oldWidth + 23;
      Height := OldHeight + 27;
    end;

    with pnl do
    begin
      Parent := Dialog;
      Align := alClient;
      Visible := True;
    end;

    Result := Dialog.ShowModal;
  finally
    if pnl.Parent <> OldParent then
    begin
      pnl.Align := OldAlign;
      pnl.Height := OldHeight;
      pnl.Width := oldWidth;
      pnl.Visible := False;
      pnl.Parent := FrmPadre;
    end;

//    if Assigned(Dialog) then
//      Dialog.Free;
  end;
end;

function CantidadALetra(Valor: Real; Prefijo: String; Sufijo: String; NumDec: Integer): String;
const
  vecNum: Array[1..15] of string = ('un', 'dos', 'tres', 'cuatro', 'cinco', 'seis', 'siete', 'ocho', 'nueve', 'diez', 'once', 'doce', 'trece', 'catorce', 'quince');
  vecDec: Array[1..9] of string = ('diez', 'veinti', 'treinta', 'cuarenta', 'cincuenta', 'sesenta', 'setenta', 'ochenta', 'noventa');
  vecCen: Array[1..9] of string = ('ciento', 'doscientos', 'trescientos', 'cuatrocientos', 'quinientos', 'seiscientos', 'setecientos', 'ochocientos', 'novecientos');
  vecLey: Array[1..7] of String = ('', 'mil', 'millon', 'mil', 'billon', 'mil', 'trillon');
var
  CadValor,Decimales: String;
  i: Integer;
  vNum,
  vDec,
  vCen,
  Segmento: Integer;
  SubResult,
  Resultado,
  Agrega, OldResult: String;
begin
  Resultado := '';
  Agrega := '';
  OldResult := '';
  CadValor := FloatToStrF(Trunc(Valor),ffGeneral,16,2);
  Decimales := FloatToStr(Valor);
     ////////////////////////DECIMALES/////////////////////////////////////
    //buscando el los decimales....
  if Pos('.', Decimales) > 0 then
   Decimales := Copy(Decimales, Pos('.', Decimales) + 1, Length(Decimales))
  else
   Decimales := '';
  //llenando con ceros o truncando, los decimales, este es un valor por parametro
  while Length(Decimales) < NumDec do
   Decimales := Decimales + '0';
   Decimales := Copy(Decimales,1,Numdec);

  while Length(CadValor) mod 3 <> 0 do
   CadValor := '0' + CadValor;

  for i := 1 to Trunc(Length(CadValor) / 3) do
  begin
    // Descomponer en dos elementos
    Segmento := StrToInt(Copy(CadValor, Length(CadValor) - ((i * 3) - 1), 3));
    SubResult := '';

    // Obtener el primer elemento de la izquierda
    vCen := Trunc((Segmento - (Segmento Mod 100)) / 100);
    vNum := Segmento - (vCen * 100);
    vDec := 0;

    if (vNum > High(vecNum)) then
    begin
      vDec := Trunc((vNum - (vNum Mod 10)) / 10);
      vNum := vNum Mod 10;
    end;

    if (vNum > 0) and (vNum <= High(VecNum)) then
      if SubResult <> '' then
        SubResult := SubResult + ' ' + VecNum[vNum]
      else
        SubResult := VecNum[vNum];

    if vDec > 0 then
    begin
      if SubResult <> '' then SubResult := ' ' + SubResult;
      if vDec = 2 then
        if vNum = 0 then
          SubResult := 'veinte'
        else
          SubResult := VecDec[vDec] + Copy(SubResult,2,length(SubResult))
      else
      begin
        if vNum <> 0 then SubResult := ' y' + SubResult;
        SubResult := VecDec[vDec] + SubResult
      end;
    end;

    if vCen > 0 then
    begin
      if SubResult <> '' then SubResult := ' ' + SubResult;
      if vCen = 1 then
        if vDec + vNum = 0 then
          SubResult := 'cien'
        else
          SubResult := VecCen[vCen] + SubResult
      else
        SubResult := VecCen[vCen] + SubResult
    end;

    if SubResult <> '' then
    begin
      if i > 1 then
      begin
        SubResult := SubResult + ' ' + VecLey[i];
        if Agrega <> '' then
          SubResult := SubResult + ' ' + Agrega;
        if ((i = 3) or (i = 5) or (i = 7)) and (Segmento > 1) then
          SubResult := SubResult + 'es';
      end;
      if Resultado <> '' then
        Resultado := SubResult + ' ' + Resultado
      else
        Resultado := SubResult;
    end
    else
      if ((i = 3) or (i = 5) or (i = 7)) then
      begin
        if (i +1 <= Trunc(Length(CadValor) / 3)) and (StrToInt(Copy(CadValor, Length(CadValor) - (((i + 1) * 3) - 1), 3)) > 0) then
        begin
          SubResult := SubResult + VecLey[i] + 'es';
          if Resultado <> '' then
            Resultado := SubResult + ' ' + Resultado
          else
            Resultado := SubResult;
        end;
      end;
    OldResult := SubResult;
  end;

  if Prefijo + Decimales + Sufijo <> '' then
    if Decimales + Sufijo <> '' then
      Result := Resultado + ' ' + Prefijo + ' ' + Decimales + Sufijo
    else
      Result := Resultado + ' ' + Prefijo;
  //Result := Resultado;
end;

Procedure LeerPermisos(FormName: String; Var insert:Boolean; var Edit:Boolean; var Delete:Boolean);
var
  zMod: TUniQuery;
begin
  if Assigned(FrmInicio.zModulos) and (UPPERCASE(Varglobal.Elemento('usuario').AsString) <> 'ADMIN') then
  begin
    zMod := FrmInicio.zModulos;

    insert := zMod.FieldByName('insertar').AsString = 'Si';
    edit := zMod.FieldByName('Editar').AsString = 'Si';
    Delete := zMod.FieldByName('Eliminar').AsString = 'Si';
    FrmInicio.zModulos.Filtered := false;
  end
  else
  begin
    insert := true;
    edit := True;
    Delete := True;
  end;
end;

procedure reconectar;
begin
  UDMConection.reconectarConn;
end;

end.
