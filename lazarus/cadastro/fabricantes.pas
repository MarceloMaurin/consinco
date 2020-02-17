unit fabricantes;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, Forms, Controls, Graphics, Dialogs, DBCtrls,
  DBGrids, StdCtrls;

type

  { TfrmFabricantes }

  TfrmFabricantes = class(TForm)
    btEdita: TButton;
    btInsere: TButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    qryaux: TSQLQuery;
    SQLQuery1: TSQLQuery;
    SQLQuery1idmodelo1: TLongintField;
    SQLQuery1modelo1: TStringField;
    procedure btEditaClick(Sender: TObject);
    procedure btInsereClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SQLQuery1AfterPost(DataSet: TDataSet);
    procedure SQLQuery1BeforeDelete(DataSet: TDataSet);
    procedure SQLQuery1BeforeInsert(DataSet: TDataSet);
    procedure SQLQuery1BeforePost(DataSet: TDataSet);
  private

  public

  end;

var
  frmFabricantes: TfrmFabricantes;

implementation

{$R *.lfm}

{ TfrmFabricantes }

procedure TfrmFabricantes.FormCreate(Sender: TObject);
begin

  SQLQuery1.open;
end;

procedure TfrmFabricantes.btInsereClick(Sender: TObject);
begin
      try
      qryaux.close;
      qryaux.SQL.text := 'select max(idfabricante) + 1 as chave from fabricante';
      qryaux.open;
      SQLQuery1.Insert;
      SQLQuery1.FieldByName('idfabricante').asinteger := qryaux.FieldByName('chave').asinteger;
    finally
      qryaux.close;
    end;

end;

procedure TfrmFabricantes.btEditaClick(Sender: TObject);
begin
  SQLQuery1.Edit;
end;

procedure TfrmFabricantes.FormDestroy(Sender: TObject);
begin

end;

procedure TfrmFabricantes.SQLQuery1AfterPost(DataSet: TDataSet);
begin
   SQLQuery1.ApplyUpdates(-1);
end;

procedure TfrmFabricantes.SQLQuery1BeforeDelete(DataSet: TDataSet);
begin

end;

procedure TfrmFabricantes.SQLQuery1BeforeInsert(DataSet: TDataSet);
begin

end;

procedure TfrmFabricantes.SQLQuery1BeforePost(DataSet: TDataSet);
begin

end;

end.

