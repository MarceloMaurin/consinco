unit modelos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, Forms, Controls, Graphics, Dialogs, DBCtrls,
  DBGrids, StdCtrls, ZDataset;

type

  { TfrmModelos }

  TfrmModelos = class(TForm)
    btInsere: TButton;
    btEdita: TButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    SQLQuery1: TSQLQuery;
    qryaux: TSQLQuery;
    procedure btInsereClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
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

procedure TfrmModelos.FormDestroy(Sender: TObject);
begin

end;

procedure TfrmModelos.SQLQuery1AfterDelete(DataSet: TDataSet);
begin

end;

procedure TfrmModelos.SQLQuery1AfterPost(DataSet: TDataSet);
begin
  SQLQuery1.ApplyUpdates(-1);
end;

procedure TfrmModelos.SQLQuery1AfterRefresh(DataSet: TDataSet);
begin


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

procedure TfrmModelos.btInsereClick(Sender: TObject);
begin

    try
      qryaux.close;
      qryaux.SQL.text := 'select max(idmodelo) + 1 as chave from modelo';
      qryaux.open;
      SQLQuery1.Insert;
      SQLQuery1.FieldByName('idmodelo').asinteger := qryaux.FieldByName('chave').asinteger;
    finally
      qryaux.close;
    end;


end;

end.

