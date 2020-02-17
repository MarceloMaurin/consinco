unit equipamentos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqlite3conn, sqldb, db, Forms, Controls, Graphics, Dialogs,
  DBCtrls, DBGrids, StdCtrls, ComCtrls, DBExtCtrls;

type

  { TfrmEquipamentos }

  TfrmEquipamentos = class(TForm)
    btCancelar: TButton;
    btEditar: TButton;
    btSalvar: TButton;
    btInserir: TButton;
    Button1: TButton;
    DataSource1: TDataSource;
    dbcbcategoria: TDBLookupComboBox;
    dbcbfabricante: TDBLookupComboBox;
    dspcategoria: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    dscategoria: TDataSource;
    dsmodelo: TDataSource;
    dsfabricante: TDataSource;
    DBDateEdit1: TDBDateEdit;
    DBGrid1: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBNavigator1: TDBNavigator;
    dspfabricante: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    PageControl1: TPageControl;
    qryaux: TSQLQuery;
    qrypcategoria: TSQLQuery;
    qrycategoria: TSQLQuery;
    qrypfabricante: TSQLQuery;
    SQLQuery1: TSQLQuery;
    qryModelo: TSQLQuery;
    qryFabricante: TSQLQuery;
    SQLQuery1descricao: TStringField;
    SQLQuery1dtentrada: TDateTimeField;
    SQLQuery1dtsaida: TDateTimeField;
    SQLQuery1idcadmaq: TAutoIncField;
    SQLQuery1idcategoria: TLongintField;
    SQLQuery1idfabricante: TLongintField;
    SQLQuery1idmodelo: TLongintField;
    SQLQuery1nroserie: TStringField;
    tsPesquisa: TTabSheet;
    tsEdit: TTabSheet;
    procedure btCancelarClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure btInserirClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DataSource1StateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SQLQuery1AfterRefresh(DataSet: TDataSet);
    procedure SQLQuery1BeforeDelete(DataSet: TDataSet);
    procedure SQLQuery1BeforePost(DataSet: TDataSet);
    procedure SQLQuery1BeforeRefresh(DataSet: TDataSet);
  private

  public

  end;

var
  frmEquipamentos: TfrmEquipamentos;

implementation

{$R *.lfm}

{ TfrmEquipamentos }

procedure TfrmEquipamentos.FormCreate(Sender: TObject);
begin
  qrypcategoria.open;
  qrypfabricante.open;

end;

procedure TfrmEquipamentos.btSalvarClick(Sender: TObject);
begin
  if (sqlquery1.State = dsInsert) then
  begin
       SQLQuery1.post;
       SQLQuery1.ApplyUpdates(-1);
       PageControl1.ActivePage :=  tsPesquisa;
       tsEdit.Visible:=false;

  end;

end;

procedure TfrmEquipamentos.Button1Click(Sender: TObject);
var
  idcategoria : string;
  idfabricante : string;
begin
  SQLQuery1.close;
  SQLQuery1.SQL.Text := '';

  if (dbcbcategoria.ItemIndex <>-1) then
  begin
       idcategoria := dbcbcategoria.KeyValue;
       SQLQuery1.SQL.Text:= 'select * from cadmaq where idcategoria = '
                            +idcategoria;
  end;

  if (dbcbfabricante.ItemIndex <>-1) then
  begin
      idfabricante := dbcbfabricante.KeyValue;
      if (sqlquery1.sql.text = '') then
      begin

       SQLQuery1.SQL.Text:= 'select * from cadmaq where idfabricante = '
                            +idfabricante;
      end
      else
      begin
       SQLQuery1.sql.text := SQLQuery1.sql.text + ' and idfabricante = '
                          +idfabricante;
      end;
  end;


  if (sqlquery1.sql.text = '') then
    begin
        SQLQuery1.SQL.Text:= 'select * from cadmaq '

  end;

  SQLQuery1.open;
  qrycategoria.open;
  qryFabricante.open;
  qryModelo.open;

end;

procedure TfrmEquipamentos.btInserirClick(Sender: TObject);
begin
  SQLQuery1.Insert;
  tsEdit.Visible:=true;
  PageControl1.ActivePage :=  tsEdit;
  try
    qryaux.close;
    qryaux.SQL.text := 'select max(idcadmaq) + 1 as chave from cadmaq';
    qryaux.open;
    SQLQuery1.Insert;
    SQLQuery1.FieldByName('idcadmaq').asinteger := qryaux.FieldByName('chave').asinteger;
    SQLQuery1.FieldByName('dtentrada').AsDateTime := now;
    if (dbcbfabricante.ItemIndex<>-1) then
    begin
        SQLQuery1.FieldByName('idfabricante').asinteger := dbcbfabricante.KeyValue;
    end;
    if (dbcbcategoria.ItemIndex<>-1) then
    begin
        SQLQuery1.FieldByName('idcategoria').asinteger := dbcbcategoria.KeyValue;
    end;

  finally
    qryaux.close;
  end;

end;

procedure TfrmEquipamentos.btEditarClick(Sender: TObject);
begin
  SQLQuery1.Edit;
  tsEdit.Visible:=true;
  PageControl1.ActivePage :=  tsEdit;

end;

procedure TfrmEquipamentos.btCancelarClick(Sender: TObject);
begin
  SQLQuery1.cancel;
  PageControl1.ActivePage :=  tsPesquisa;
  tsEdit.Visible:=false;

end;

procedure TfrmEquipamentos.DataSource1StateChange(Sender: TObject);
begin

end;

procedure TfrmEquipamentos.FormDestroy(Sender: TObject);
begin
  qrypcategoria.close;
  qrypfabricante.close;

  SQLQuery1.close;
  qrycategoria.close;
  qryFabricante.close;
  qryModelo.close;

end;

procedure TfrmEquipamentos.SQLQuery1AfterRefresh(DataSet: TDataSet);
begin


end;

procedure TfrmEquipamentos.SQLQuery1BeforeDelete(DataSet: TDataSet);
begin

end;

procedure TfrmEquipamentos.SQLQuery1BeforePost(DataSet: TDataSet);
begin

end;

procedure TfrmEquipamentos.SQLQuery1BeforeRefresh(DataSet: TDataSet);
begin
    SQLQuery1.ApplyUpdates(-1);
end;

end.

