unit equipamentos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqlite3conn, sqldb, db, Forms, Controls, Graphics, Dialogs,
  DBCtrls, DBGrids, StdCtrls, ComCtrls, DBExtCtrls;

type

  { TfrmEquipamentos }

  TfrmEquipamentos = class(TForm)
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    DBEdit1: TDBEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    dscategoria: TDataSource;
    dsmodelo: TDataSource;
    dsfabricante: TDataSource;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    DBGrid1: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    PageControl1: TPageControl;
    qrycategoria: TSQLQuery;
    SQLQuery1: TSQLQuery;
    SQLQuery1descricao: TStringField;
    SQLQuery1dtentrada: TDateTimeField;
    SQLQuery1dtsaida: TDateTimeField;
    SQLQuery1fabricante: TStringField;
    SQLQuery1idcadmaq: TLongintField;
    SQLQuery1idcategoria: TLongintField;
    SQLQuery1idcategoria_1: TLongintField;
    SQLQuery1idfabricante: TLongintField;
    SQLQuery1idfabricante_1: TLongintField;
    SQLQuery1idmodelo: TLongintField;
    SQLQuery1idmodelo_1: TLongintField;
    SQLQuery1modelo: TStringField;
    SQLQuery1nroserie: TStringField;
    qryModelo: TSQLQuery;
    qryFabricante: TSQLQuery;
    tsPesquisa: TTabSheet;
    tsEdit: TTabSheet;
    procedure Button1Click(Sender: TObject);
    procedure DataSource1StateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
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
  SQLQuery1.open;
  qrycategoria.open;
  qryFabricante.open;
  qryModelo.open;
end;

procedure TfrmEquipamentos.Button1Click(Sender: TObject);
begin
  if ((DataSource1.State = dsEdit) or (DataSource1.State = dsNewValue)) then
  begin
      SQLQuery1.ApplyUpdates(-1);
  end;



end;

procedure TfrmEquipamentos.DataSource1StateChange(Sender: TObject);
begin
  if (DataSource1.State = dsInsert) then
  begin
     PageControl1.ActivePage :=  tsEdit;
     tsEdit.SetFocus;
  end;
  if (DataSource1.State = dsEdit) then
  begin
     tsEdit.Visible:=true;
     PageControl1.ActivePage :=  tsEdit;
  end;
  if (DataSource1.State = dsBrowse) then
  begin
     PageControl1.ActivePage :=  tsPesquisa;
     tsEdit.Visible:=false;

  end;

end;

procedure TfrmEquipamentos.FormDestroy(Sender: TObject);
begin

end;

end.

