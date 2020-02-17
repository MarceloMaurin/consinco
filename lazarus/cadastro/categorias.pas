unit categorias;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, Forms, Controls, Graphics, Dialogs, DBCtrls,
  DBGrids, StdCtrls;

type

  { TfrmCategorias }

  TfrmCategorias = class(TForm)
    btEdita: TButton;
    btInsere: TButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    qryaux: TSQLQuery;
    SQLQuery1: TSQLQuery;
    procedure btEditaClick(Sender: TObject);
    procedure btInsereClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SQLQuery1AfterPost(DataSet: TDataSet);
    procedure SQLQuery1BeforePost(DataSet: TDataSet);
  private

  public

  end;

var
  frmCategorias: TfrmCategorias;

implementation

{$R *.lfm}

{ TfrmCategorias }

procedure TfrmCategorias.FormCreate(Sender: TObject);
begin
  SQLQuery1.open;
end;

procedure TfrmCategorias.btEditaClick(Sender: TObject);
begin
    SQLQuery1.Edit;
end;

procedure TfrmCategorias.btInsereClick(Sender: TObject);
begin
    try
      qryaux.close;
      qryaux.SQL.text := 'select max(idcategoria) + 1 as chave from categoria';
      qryaux.open;
      SQLQuery1.Insert;
      SQLQuery1.FieldByName('idcategoria').asinteger := qryaux.FieldByName('chave').asinteger;
    finally
      qryaux.close;
    end;
end;

procedure TfrmCategorias.FormDestroy(Sender: TObject);
begin

end;

procedure TfrmCategorias.SQLQuery1AfterPost(DataSet: TDataSet);
begin
       SQLQuery1.ApplyUpdates(-1);
end;

procedure TfrmCategorias.SQLQuery1BeforePost(DataSet: TDataSet);
begin

end;

end.

