unit modelos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, Forms, Controls, Graphics, Dialogs, DBCtrls,
  DBGrids, StdCtrls;

type

  { TfrmModelos }

  TfrmModelos = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    SQLQuery1: TSQLQuery;
    SQLQuery1idmodelo: TLongintField;
    SQLQuery1modelo: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SQLQuery1AfterDelete(DataSet: TDataSet);
    procedure SQLQuery1AfterPost(DataSet: TDataSet);
    procedure SQLQuery1AfterRefresh(DataSet: TDataSet);
    procedure SQLQuery1BeforeDelete(DataSet: TDataSet);
    procedure SQLQuery1BeforeEdit(DataSet: TDataSet);
    procedure SQLQuery1BeforeInsert(DataSet: TDataSet);
  private

  public

  end;

var
  frmModelos: TfrmModelos;

implementation

{$R *.lfm}

{ TfrmModelos }

procedure TfrmModelos.FormCreate(Sender: TObject);
begin
  SQLQuery1.open;
end;

procedure TfrmModelos.SQLQuery1AfterDelete(DataSet: TDataSet);
begin

end;

procedure TfrmModelos.SQLQuery1AfterPost(DataSet: TDataSet);
begin

end;

procedure TfrmModelos.SQLQuery1AfterRefresh(DataSet: TDataSet);
begin
  if (SQLQuery1.RowsAffected <> 0) then
  begin
    SQLQuery1.ApplyUpdates;
  end;
end;

procedure TfrmModelos.SQLQuery1BeforeDelete(DataSet: TDataSet);
begin

end;

procedure TfrmModelos.SQLQuery1BeforeEdit(DataSet: TDataSet);
begin
end;

procedure TfrmModelos.SQLQuery1BeforeInsert(DataSet: TDataSet);
begin

end;

procedure TfrmModelos.Button1Click(Sender: TObject);
begin

end;

end.

